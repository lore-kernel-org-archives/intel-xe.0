Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A00CA0EE4
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 15:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E17010E97F;
	Fri, 15 Aug 2025 15:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Set0xPgd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C1E10E980
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755270257; x=1786806257;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=96jY1iyYIB8yjhjfgPo1oDYgc4y3S7a7dF4q+sXw2I4=;
 b=Set0xPgd7JjR5ndk1FisikH7djbceJ0/Jv7Jj+eaIiYMTz95nfLvx5+X
 oefPXUwBN+JCVhv2RzxImx12zwLNa6VsDQLW6TvpMaZdLx3BvFvsZaS8O
 olPiVNEUwdQ/7yxZQmsO+Tr3Pa4ElPAmDaVkNlw934l9EF7ByiMQr78n+
 cg7Rfl0Q3hxVy25fMa9tjLpE/jMhKbj2boI4ENrc6mMwtJT64sbLfUX80
 MdhZv05dP0z08AUV4+V/+OMmEzDFJbJ5ibPWXUbg+hl1nU/7VTcFlmkuS
 RVTFAh0FNzVwZ1qD2eBpiJp+Tvw/u1M96ergCgKGH6YbfeN7lsmTnoJLw A==;
X-CSE-ConnectionGUID: ThH8sHQITlOAbPI64uNjhQ==
X-CSE-MsgGUID: o6vlsBHwRLmv32kh6B+eyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="61225218"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="61225218"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 08:04:17 -0700
X-CSE-ConnectionGUID: zGp2oY5XTN63O6WrzrU1xw==
X-CSE-MsgGUID: l7XYM0PqQAuuT8e6y7jqGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="167288587"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.18])
 ([10.245.245.18])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 08:04:15 -0700
Message-ID: <e2748b78c6b129b96ab0c5804dafc64eb2fab107.camel@linux.intel.com>
Subject: Re: [PATCH 05/15] drm/xe: Introduce an xe_validation wrapper around
 drm_exec
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Fri, 15 Aug 2025 17:04:12 +0200
In-Reply-To: <aJzKfYPutxWaObXu@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-6-thomas.hellstrom@linux.intel.com>
 <aJzKfYPutxWaObXu@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 2025-08-13 at 10:25 -0700, Matthew Brost wrote:
> On Wed, Aug 13, 2025 at 12:51:11PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Introduce a validation wrapper xe_validation_guard() as a helper
> > intended to be used around drm_exec transactions what perform
> > validations. Once TTM can handle exhaustive eviction we could
> > remove this wrapper or make it mostly a NO-OP unless other
> > functionality is added to it.
> >=20
> > Currently the wrapper takes a read lock upon entry and if the
> > transaction hits an OOM, all locks are released and the
> > transaction is retried with a write-lock. If all other
> > validations participate in this scheme, the transaction with
> > the write lock will be the only transaction validating and
> > should have access to all available non-pinned memory.
> >=20
> > There is currently a problem in that TTM converts -EDEADLOCKS to
> > -ENOMEM, and with ww_mutex slowpath error injections, we can hit
> > -ENOMEMs without having actually ran out of memory. We abuse
> > ww_mutex internals to detect such situations until TTM is fixes
> > to not convert the error code. In the meantime, injecting
> > ww_mutex slowpath -EDEADLOCKs is a good way to test
> > the implementation in the absence of real OOMs.
> >=20
> > Just introduce the wrapper in this commit. It will be hooked up
> > to the driver in following commits.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_validation.c | 199
> > +++++++++++++++++++++++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_validation.h | 107 ++++++++++++++++
> > =C2=A02 files changed, 306 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_validation.c
> > b/drivers/gpu/drm/xe/xe_validation.c
> > index cc0684d24e02..cd1424f04237 100644
> > --- a/drivers/gpu/drm/xe/xe_validation.c
> > +++ b/drivers/gpu/drm/xe/xe_validation.c
> > @@ -5,6 +5,7 @@
> > =C2=A0#include "xe_bo.h"
> > =C2=A0#include <drm/drm_exec.h>
> > =C2=A0#include <drm/drm_gem.h>
> > +#include <drm/drm_gpuvm.h>
> > =C2=A0
> > =C2=A0#include "xe_assert.h"
> > =C2=A0#include "xe_validation.h"
> > @@ -47,3 +48,201 @@ void xe_validation_assert_exec(const struct
> > xe_device *xe,
> > =C2=A0	}
> > =C2=A0}
> > =C2=A0#endif
> > +
> > +static int xe_validation_lock(struct xe_validation_ctx *ctx)
> > +{
> > +	struct xe_validation_device *val =3D ctx->val;
> > +	int ret =3D 0;
> > +
> > +	if (ctx->flags & DRM_EXEC_INTERRUPTIBLE_WAIT) {
> > +		if (ctx->request_exclusive)
> > +			ret =3D down_write_killable(&val->lock);
> > +		else
> > +			ret =3D down_read_interruptible(&val->lock);
> > +	} else {
> > +		if (ctx->request_exclusive)
> > +			down_write(&val->lock);
> > +		else
> > +			down_read(&val->lock);
> > +	}
> > +
> > +	if (!ret) {
> > +		ctx->lock_held =3D true;
> > +		ctx->lock_held_exclusive =3D ctx->request_exclusive;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static void xe_validation_unlock(struct xe_validation_ctx *ctx)
> > +{
> > +	if (!ctx->lock_held)
> > +		return;
> > +
> > +	if (ctx->lock_held_exclusive)
> > +		up_write(&ctx->val->lock);
> > +	else
> > +		up_read(&ctx->val->lock);
> > +
> > +	ctx->lock_held =3D false;
> > +}
> > +
> > +/**
> > + * xe_validation_ctx_init() - Initialize an xe_validation_ctx
> > + * @ctx: The xe_validation_ctx to initialize.
> > + * @val: The xe_validation_device representing the validation
> > domain.
> > + * @exec: The struct drm_exec to use for the transaction.
> > + * @flags: The flags to use for drm_exec initialization.
> > + * @nr: The number of anticipated buffer object locks. Forwarded
> > to
> > + * drm_exec initialization.
> > + * @exclusive: Whether to use exclusive locking already on first
> > validation.
> > + *
> > + * Initialize and lock a an xe_validation transaction using the
> > validation domain
> > + * represented by @val. Also initialize the drm_exec object
> > forwarding
> > + * @flags and @nr to the drm_exec initialization. The @exclusive
> > parameter should
> > + * typically be set to false to avoid locking out other validators
> > from the
> > + * domain until an OOM is hit. For testing- or final attempt
> > purposes it can,
> > + * however, be set to true.
> > + *
> > + * Return: %0 on success, %-EINTR if interruptible initial locking
> > failed with a
> > + * signal pending.
> > + */
> > +int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct
> > xe_validation_device *val,
> > +			=C2=A0=C2=A0 struct drm_exec *exec, u32 flags,
> > unsigned int nr,
> > +			=C2=A0=C2=A0 bool exclusive)
> > +{
> > +	int ret;
> > +
> > +	ctx->exec =3D exec;
> > +	ctx->val =3D val;
> > +	ctx->lock_held =3D false;
> > +	ctx->lock_held_exclusive =3D false;
> > +	ctx->request_exclusive =3D exclusive;
> > +	ctx->flags =3D flags;
> > +	ctx->nr =3D nr;
> > +
> > +	ret =3D xe_validation_lock(ctx);
> > +	if (ret)
> > +		return ret;
> > +
> > +	drm_exec_init(exec, flags, nr);
> > +
> > +	return 0;
> > +}
> > +
> > +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> > +/*
> > + * This abuses both drm_exec and ww_mutex internals and should be
> > + * replaced by checking for -EDEADLK when we can make TTM
> > + * stop converting -EDEADLK to -ENOMEM.
> > + * An alternative is to not have exhaustive eviction with
> > + * CONFIG_DEBUG_WW_MUTEX_SLOWPATH until that happens.
> > + */
>=20
> I vote to keep this the way you have it and live with the abuse until
> TTM is updated.
>=20
> > +static bool xe_validation_contention_injected(struct drm_exec
> > *exec)
> > +{
> > +	return !!exec->ticket.contending_lock;
> > +}
> > +
> > +#else
> > +
> > +static bool xe_validation_contention_injected(struct drm_exec
> > *exec)
> > +{
> > +	return false;
> > +}
> > +
> > +#endif
> > +
> > +static bool __xe_validation_should_retry(struct xe_validation_ctx
> > *ctx, int ret)
> > +{
> > +	if (ret =3D=3D -ENOMEM &&
> > +	=C2=A0=C2=A0=C2=A0 ((ctx->request_exclusive &&
> > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_validation_contention_injected(ctx-=
>exec)) ||
> > +	=C2=A0=C2=A0=C2=A0=C2=A0 !ctx->request_exclusive)) {
> > +		ctx->request_exclusive =3D true;
>=20
> Can the locking across multiple GPUs fall when request_exclusive is
> held
> and the GPUs are sharing dma-buffers? I suppose we'd need true WW
> locking throughout the stack (TTM) and a ticketed retry to guarantee
> foward progress.

Yes. Either that or widen the validation domain to be per driver rather
than per device.
With the drm_exec retry, in addition dma-buf needs to support passing a
drm_exec, but that otoh would be a layering violation. So I have
historically advocated for abstracting the ww mutex transaction with a
dma-buf locking context with callbacks rather than a drm_exec. Then
drm_exec could derive from that and keep its functionality for gem
objects.

>=20
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +/**
> > + * xe_validation_exec_lock() - Perform drm_gpuvm_exec_lock within
> > a validation
> > + * transaction.
> > + * @ctx: An uninitialized xe_validation_ctx.
> > + * @vm_exec: An initialized struct vm_exec.
> > + * @val: The validation domain.
> > + *
> > + * The drm_gpuvm_exec_lock() function internally initializes its
> > drm_exec
> > + * transaction and therefore doesn't lend itself very well to be
> > using
> > + * xe_validation_ctx_init(). Provide a helper that takes an
> > uninitialized
> > + * xe_validation_ctx and calls drm_gpuvm_exec_lock() with OOM
> > retry.
> > + *
> > + * Return: %0 on success, negative error code on failure.
> > + */
> > +int xe_validation_exec_lock(struct xe_validation_ctx *ctx,
> > +			=C2=A0=C2=A0=C2=A0 struct drm_gpuvm_exec *vm_exec,
> > +			=C2=A0=C2=A0=C2=A0 struct xe_validation_device *val)
> > +{
> > +	int ret;
> > +
> > +	memset(ctx, 0, sizeof(*ctx));
> > +	ctx->exec =3D &vm_exec->exec;
> > +	ctx->flags =3D vm_exec->flags;
> > +	ctx->val =3D val;
> > +retry:
> > +	ret =3D xe_validation_lock(ctx);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D drm_gpuvm_exec_lock(vm_exec);
> > +	if (ret) {
> > +		xe_validation_unlock(ctx);
> > +		if (__xe_validation_should_retry(ctx, ret))
> > +			goto retry;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_validation_ctx_fini() - Finalize a validation transaction
> > + * @ctx: The Validation transaction to finalize.
> > + *
> > + * Finalize a validation transaction and its related drm_exec
> > transaction.
> > + */
> > +void xe_validation_ctx_fini(struct xe_validation_ctx *ctx)
> > +{
> > +	drm_exec_fini(ctx->exec);
> > +	xe_validation_unlock(ctx);
> > +}
> > +
> > +/**
> > + * xe_validation_should_retry() - Determine if a validation
> > transaction should retry
> > + * @ctx: The validation transaction.
> > + * @ret: Pointer to a return value variable.
> > + *
> > + * Determines whether a validation transaction should retry based
> > on the
> > + * internal transaction state and the return value pointed to by
> > @ret.
> > + * If a validation should be retried, the transaction is prepared
> > for that,
> > + * and the validation locked might be re-locked in exclusive mode,
> > and *@ret
> > + * is set to %0. If the re-locking errors, typically due to
> > interruptible
> > + * locking with signal pending, *@ret is instead set to -EINTR and
> > the
> > + * function returns %false.
> > + *
> > + * Return: %true if validation should be retried, %false
> > otherwise.
> > + */
> > +bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int
> > *ret)
> > +{
> > +	if (__xe_validation_should_retry(ctx, *ret)) {
> > +		drm_exec_fini(ctx->exec);
> > +		*ret =3D 0;
> > +		if (ctx->request_exclusive !=3D ctx-
> > >lock_held_exclusive) {
> > +			xe_validation_unlock(ctx);
> > +			*ret =3D xe_validation_lock(ctx);
> > +		}
> > +		drm_exec_init(ctx->exec, ctx->flags, ctx->nr);
> > +		return !*ret;
> > +	}
> > +
> > +	return false;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_validation.h
> > b/drivers/gpu/drm/xe/xe_validation.h
> > index db50feacad7a..a708c260cf18 100644
> > --- a/drivers/gpu/drm/xe/xe_validation.h
> > +++ b/drivers/gpu/drm/xe/xe_validation.h
> > @@ -7,9 +7,11 @@
> > =C2=A0
> > =C2=A0#include <linux/dma-resv.h>
> > =C2=A0#include <linux/types.h>
> > +#include <linux/rwsem.h>
> > =C2=A0
> > =C2=A0struct drm_exec;
> > =C2=A0struct drm_gem_object;
> > +struct drm_gpuvm_exec;
> > =C2=A0struct xe_device;
> > =C2=A0
> > =C2=A0#ifdef CONFIG_PROVE_LOCKING
> > @@ -66,4 +68,109 @@ void xe_validation_assert_exec(const struct
> > xe_device *xe, const struct drm_exec
> > =C2=A0	} while (0)
> > =C2=A0#endif
> > =C2=A0
> > +/**
> > + * struct xe_validation_device - The domain for exhaustive
> > eviction
> > + * @lock: The lock used to exclude other processes from allocating
> > graphics memory
> > + *
> > + * The struct xe_validation_device represents the domain for which
> > we want to use
> > + * exhaustive eviction. The @lock is typically grabbed in read
> > mode for allocations
> > + * but when graphics memory allocation fails, it is retried with
> > the write mode held.
> > + */
> > +struct xe_validation_device {
> > +	struct rw_semaphore lock;
> > +};
> > +
> > +/**
> > + * struct xe_validation_ctx - A struct drm_exec subclass with
> > support for
> > + * exhaustive eviction
> > + * @exec: The drm_exec object base class. Note that we use a
> > pointer instead of
> > + * embedding to avoid diamond inheritance.
> > + * @val: The exhaustive eviction domain.
> > + * @lock_held: Whether The domain lock is currently held.
> > + * @lock_held_exclusive: Whether the domain lock is held in
> > exclusive mode.
> > + * @request_exclusive: Whether to lock exclusively (write mode)
> > the next time
> > + * the domain lock is locked.
> > + * @flags: The drm_exec flags used for drm_exec (re-
> > )initialization.
> > + * @nr: The drm_exec nr parameter used for drm_exec (re-
> > )initializaiton.
> > + */
> > +struct xe_validation_ctx {
> > +	struct drm_exec *exec;
> > +	struct xe_validation_device *val;
> > +	bool lock_held;
> > +	bool lock_held_exclusive;
> > +	bool request_exclusive;
> > +	u32 flags;
> > +	unsigned int nr;
> > +};
> > +
> > +int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct
> > xe_validation_device *val,
> > +			=C2=A0=C2=A0 struct drm_exec *exec, u32 flags,
> > unsigned int nr,
> > +			=C2=A0=C2=A0 bool exclusive);
> > +
> > +int xe_validation_exec_lock(struct xe_validation_ctx *ctx, struct
> > drm_gpuvm_exec *vm_exec,
> > +			=C2=A0=C2=A0=C2=A0 struct xe_validation_device *val);
> > +
> > +void xe_validation_ctx_fini(struct xe_validation_ctx *ctx);
> > +
> > +bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int
> > *ret);
> > +
> > +/**
> > + * xe_validation_retry_on_oom() - Retry on oom in an xe_validaton
> > transaction
> > + * @_ctx: Pointer to the xe_validation_ctx
> > + * @_ret: The current error value possibly holding -ENOMEM
> > + *
> > + * Use this in way similar to drm_exec_retry_on_contention().
> > + * If @_ret contains -ENOMEM the tranaction is restarted once in a
> > way that
> > + * blocks other transactions and allows exhastive eviction. If the
> > transaction
> > + * was already restarted once, Just return the -ENOMEM. May also
> > set
> > + * _ret to -EINTR if not retrying and waits are interruptible.
> > + * May only be used within a drm_exec_until_all_locked() loop.
> > + */
> > +#define xe_validation_retry_on_oom(_ctx,
> > _ret)				\
> > +	do
> > {								\
> > +		if (xe_validation_should_retry(_ctx,
> > _ret))		\
> > +			goto
> > *__drm_exec_retry_ptr;			\
> > +	} while (0)
> > +
> > +/**
> > + * xe_validation_device_init - Initialize a struct
> > xe_validation_device
> > + * @val: The xe_validation_device to init.
> > + */
> > +static inline void
> > +xe_validation_device_init(struct xe_validation_device *val)
> > +{
> > +	init_rwsem(&val->lock);
> > +}
> > +
> > +/*
> > + * Make guard() and scoped_guard() work with xe_validation_ctx
> > + * so that we can exit transactions without caring about the
> > + * cleanup.
> > + */
> > +DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,
> > +	=C2=A0=C2=A0=C2=A0=C2=A0 if (!IS_ERR(_T)) xe_validation_ctx_fini(_T);=
,
>=20
> I think this should be 'if (_T)', right?
>=20
> > +	=C2=A0=C2=A0=C2=A0=C2=A0 ({_ret =3D xe_validation_ctx_init(_ctx, _val=
, _exec,
> > _flags, 0, _excl);
> > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _ret ? NULL : _ctx; }),
>=20
> Or here '_ret ? ERR_PTR(_ret) : _ctx;'
>=20
> One or the other if I correctly understand how DEFINE_CLASS works.

Right. good catch.


>=20
> Matt
>=20
> > +	=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_validation_ctx *_ctx, struct
> > xe_validation_device *_val,
> > +	=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_exec *_exec, u32 _flags, int _ret=
, bool
> > _excl);
> > +static inline void
> > *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
> > +{return *_T; }
> > +#define class_xe_validation_is_conditional false
> > +
> > +/**
> > + * xe_validation_guard() - An auto-cleanup xe_validation_ctx
> > transaction
> > + * @_ctx: The xe_validation_ctx.
> > + * @_val: The xe_validation_device.
> > + * @_exec: The struct drm_exec object
> > + * @_flags: Flags for the drm_exec transaction. See the struct
> > drm_exec documention!
> > + * @_ret: Return in / out parameter. May be set by this macro.
> > Typicall 0 when called.
> > + * @_excl: Whether to start in exclusive mode already in the first
> > iteration.
> > + *
> > + * This macro is will initiate a drm_exec transaction with
> > additional support for
> > + * exhaustive eviction.
> > + */
> > +#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret,
> > _excl)	\
> > +	scoped_guard(xe_validation, _ctx, _val, _exec, _flags,
> > _ret, _excl) \
> > +	drm_exec_until_all_locked(_exec)
> > +
> > =C2=A0#endif
> > --=20
> > 2.50.1
> >=20

