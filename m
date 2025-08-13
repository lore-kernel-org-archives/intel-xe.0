Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8334DC87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 14:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC9C10E739;
	Wed, 13 Aug 2025 14:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSCUd+r9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E400F10E739
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 14:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755095586; x=1786631586;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vHDuIcaScRbYate5IDFvkEIs5pJM8EoqMIKmvBVQd08=;
 b=dSCUd+r95mwwk82XeWtezOWIPwJ+8nC1Pd/N8AsiZnGHCmgOJkmblTjc
 glXCan+IuULgn1QLsmMbmqCmeppbPzhyHJBh77KLzNMuyZam+YJ9PGprf
 Q3qtp/RJCgU9NH346lHkaxM9CwQXfLDcJY5hCGsLXQAYSI1lrDGqXIX4k
 pu0feV3UOtr88bQC3s2Vfiasp7P2OS6dk7Go80P6kZc9CyOob7EkuMnS/
 qmj8ljcxtrYKOh0nxdRRm0cRgfoXw1yhMCf1QONDAbdDcrY9hiAAEKOIa
 tMoIguTwxyYz69UHBQSorl2qOEVyJyuY28nYGMGiweZUCGsVi2a/lTlgw g==;
X-CSE-ConnectionGUID: 0ffFLffvTzSEzNJeeD1rUg==
X-CSE-MsgGUID: vRcwHLjiTb+5YtWNnrKYhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57509801"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57509801"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 07:33:06 -0700
X-CSE-ConnectionGUID: /FiRnMJpStCKysFNqOOxhA==
X-CSE-MsgGUID: v66cTn+cT5mY7gTNkUJKWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="170621753"
Received: from agladkov-desk.ger.corp.intel.com (HELO [10.245.245.199])
 ([10.245.245.199])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 07:33:04 -0700
Message-ID: <e6e365e23e1cd02e242c221e91b687e9ac97731b.camel@linux.intel.com>
Subject: Re: [PATCH 01/15] drm/xe/vm: Don't use a pin the vm_resv during
 validation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Wed, 13 Aug 2025 16:33:01 +0200
In-Reply-To: <aJyhGXq6JEKuPs81@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-2-thomas.hellstrom@linux.intel.com>
 <aJyhGXq6JEKuPs81@lstrano-desk.jf.intel.com>
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

On Wed, 2025-08-13 at 07:28 -0700, Matthew Brost wrote:
> On Wed, Aug 13, 2025 at 12:51:07PM +0200, Thomas Hellstr=C3=B6m wrote:
> > The pinning has the odd side-effect that unlocking *any* resv
> > during validation triggers an "unlocking pinned lock" warning.
> >=20
>=20
> So this is a cross process thing then - right? e.g., Process A pins a
> dma-resv lock, Process B unlock a dma-resv lock and boom lockdep
> warning? Just want to make sure I am understandinf the problem
> correctly.

No, my understanding is that this is a single process thing.
We lock the vm, pin it, lock a bo for eviction, perhaps using the same
ww_mutex_ctx, unlock the evicted bo =3D> bang.

It might be that the locks need to be locked using the same ww_mutex
context, but not sure.

/Thomas


>=20
> Matt=20
>=20
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Fixes: 9d5558649f68 ("drm/xe: Rework eviction rejection of bound
> > external bos")
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c |=C2=A0 5 ++---
> > =C2=A0drivers/gpu/drm/xe/xe_vm.h | 15 ++-------------
> > =C2=A02 files changed, 4 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 6fea39842e1e..11eaf3b06766 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -2468,7 +2468,6 @@ int xe_bo_validate(struct xe_bo *bo, struct
> > xe_vm *vm, bool allow_res_evict)
> > =C2=A0		.no_wait_gpu =3D false,
> > =C2=A0		.gfp_retry_mayfail =3D true,
> > =C2=A0	};
> > -	struct pin_cookie cookie;
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	if (vm) {
> > @@ -2479,10 +2478,10 @@ int xe_bo_validate(struct xe_bo *bo, struct
> > xe_vm *vm, bool allow_res_evict)
> > =C2=A0		ctx.resv =3D xe_vm_resv(vm);
> > =C2=A0	}
> > =C2=A0
> > -	cookie =3D xe_vm_set_validating(vm, allow_res_evict);
> > +	xe_vm_set_validating(vm, allow_res_evict);
> > =C2=A0	trace_xe_bo_validate(bo);
> > =C2=A0	ret =3D ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
> > -	xe_vm_clear_validating(vm, allow_res_evict, cookie);
> > +	xe_vm_clear_validating(vm, allow_res_evict);
> > =C2=A0
> > =C2=A0	return ret;
> > =C2=A0}
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > b/drivers/gpu/drm/xe/xe_vm.h
> > index 2f213737c7e5..2ecb417c19a2 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -315,22 +315,14 @@ void xe_vm_snapshot_free(struct
> > xe_vm_snapshot *snap);
> > =C2=A0 * Register this task as currently making bos resident for the vm=
.
> > Intended
> > =C2=A0 * to avoid eviction by the same task of shared bos bound to the
> > vm.
> > =C2=A0 * Call with the vm's resv lock held.
> > - *
> > - * Return: A pin cookie that should be used for
> > xe_vm_clear_validating().
> > =C2=A0 */
> > -static inline struct pin_cookie xe_vm_set_validating(struct xe_vm
> > *vm,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0 bool
> > allow_res_evict)
> > +static inline void xe_vm_set_validating(struct xe_vm *vm, bool
> > allow_res_evict)
> > =C2=A0{
> > -	struct pin_cookie cookie =3D {};
> > -
> > =C2=A0	if (vm && !allow_res_evict) {
> > =C2=A0		xe_vm_assert_held(vm);
> > -		cookie =3D lockdep_pin_lock(&xe_vm_resv(vm)-
> > >lock.base);
> > =C2=A0		/* Pairs with READ_ONCE in xe_vm_is_validating()
> > */
> > =C2=A0		WRITE_ONCE(vm->validating, current);
> > =C2=A0	}
> > -
> > -	return cookie;
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > @@ -338,17 +330,14 @@ static inline struct pin_cookie
> > xe_vm_set_validating(struct xe_vm *vm,
> > =C2=A0 * @vm: Pointer to the vm or NULL
> > =C2=A0 * @allow_res_evict: Eviction from @vm was allowed. Must be set t=
o
> > the same
> > =C2=A0 * value as for xe_vm_set_validation().
> > - * @cookie: Cookie obtained from xe_vm_set_validating().
> > =C2=A0 *
> > =C2=A0 * Register this task as currently making bos resident for the vm=
.
> > Intended
> > =C2=A0 * to avoid eviction by the same task of shared bos bound to the
> > vm.
> > =C2=A0 * Call with the vm's resv lock held.
> > =C2=A0 */
> > -static inline void xe_vm_clear_validating(struct xe_vm *vm, bool
> > allow_res_evict,
> > -					=C2=A0 struct pin_cookie
> > cookie)
> > +static inline void xe_vm_clear_validating(struct xe_vm *vm, bool
> > allow_res_evict)
> > =C2=A0{
> > =C2=A0	if (vm && !allow_res_evict) {
> > -		lockdep_unpin_lock(&xe_vm_resv(vm)->lock.base,
> > cookie);
> > =C2=A0		/* Pairs with READ_ONCE in xe_vm_is_validating()
> > */
> > =C2=A0		WRITE_ONCE(vm->validating, NULL);
> > =C2=A0	}
> > --=20
> > 2.50.1
> >=20

