import Data.Kind
foo :: forall (f :: Type -> Type) (a :: Type) (b :: Type) . Functor f => (a -> b) -> f a -> f b
foo = fmap 
