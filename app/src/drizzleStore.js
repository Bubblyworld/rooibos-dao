import { generateStore, EventActions } from "@drizzle/store";
import drizzleOptions from "./drizzleOptions";

// Intercepts contract events and logs them for debugging.
const contractEventNotifier = store => next => action => {
  if (action.type === EventActions.EVENT_FIRED) {
    const metadata = {
      contract: action.name,
      contractEvent: action.event.event,
      event: action.event,
    };

    console.log(metadata);
  }

  return next(action)
}

export default generateStore({
  drizzleOptions,
  appMiddlewares: [ contractEventNotifier ],
  disableReduxDevTools: false, // TODO: remove for production
});
