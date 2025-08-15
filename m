Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AB0CA0EE4
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 15:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC1910E22D;
	Fri, 15 Aug 2025 15:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJQrX465";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9392C10E22D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 15:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755271019; x=1786807019;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hXft3W9FHAw2emO6+q//gDAGe1kemLCPxcAhsVZFFoA=;
 b=RJQrX46563tMitV5qWFoAb+/qBq8ZewauUeX4h6keyhrkAHLmraqLBUd
 rGL3cGWM8uoHdxuO7SdiCGeEy/fBeyg8vXpVjuXG+nBQ5mnHhf0t4cYOj
 ukVQxBvi0fVXPfobth33udtyP7wVwKgYm6xvz3ug84atQ/729RJmyfK6a
 BRxuwF9rETXmMoSiklIUc/zKjopFx58Ozxy2LqVLfRYeWV6gDvfOKSupe
 KFCzFAQFOzHyjyf2Jp6z3J45Fp6XaLs9pmWKLwq6ppuQSN+wdD82vPBZK
 kpQ11axKb1cfmf6P2+uSLL7mlWFvaW262azMKOLf2eyBFOQ89VqqXNPi8 Q==;
X-CSE-ConnectionGUID: g/kWM9wdQxG/k5naT1xdug==
X-CSE-MsgGUID: p4I9pWHISDGgG8xkOGIghw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="61403551"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="61403551"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 08:16:58 -0700
X-CSE-ConnectionGUID: XGnFyUpVRMe+Res0bplspQ==
X-CSE-MsgGUID: cZpYbg3KR4m5BQ4uGhi8Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="166247188"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.18])
 ([10.245.245.18])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 08:16:56 -0700
Message-ID: <e37e926918884fa683713db9437f2e7c0f0a07ca.camel@linux.intel.com>
Subject: Re: [PATCH 09/15] drm/xe: Convert the CPU fault handler for
 exhaustive eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Fri, 15 Aug 2025 17:16:54 +0200
In-Reply-To: <aJ0MUTkV1j2xWAam@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-10-thomas.hellstrom@linux.intel.com>
 <aJ0MUTkV1j2xWAam@lstrano-desk.jf.intel.com>
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

On Wed, 2025-08-13 at 15:06 -0700, Matthew Brost wrote:
> On Wed, Aug 13, 2025 at 12:51:15PM +0200, Thomas Hellstr=C3=B6m wrote:
> > The CPU fault handler may populate bos and migrate, and in doing
> > so might interfere with other tasks validing.
> >=20
> > Convert it for exhaustive eviction. To do this properly without
> > potentially introducing stalls with the mmap lock held requires
> > TTM work. In the meantime, let's live with those stalls that
> > would typically happen on memory pressure.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c | 11 ++++++++---
> > =C2=A01 file changed, 8 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 5e40b6cb8d2a..dd1e0e9957e0 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1720,14 +1720,18 @@ static vm_fault_t xe_gem_fault(struct
> > vm_fault *vmf)
> > =C2=A0	struct xe_device *xe =3D to_xe_device(ddev);
> > =C2=A0	struct xe_bo *bo =3D ttm_to_xe_bo(tbo);
> > =C2=A0	bool needs_rpm =3D bo->flags & XE_BO_FLAG_VRAM_MASK;
> > -	struct drm_exec *exec;
> > +	struct xe_validation_ctx ctx;
> > +	struct drm_exec exec;
> > =C2=A0	vm_fault_t ret;
> > =C2=A0	int idx;
> > =C2=A0
> > =C2=A0	if (needs_rpm)
> > =C2=A0		xe_pm_runtime_get(xe);
> > =C2=A0
> > -	exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > +	if (xe_validation_ctx_init(&ctx, &xe->val, &exec,
> > +				=C2=A0=C2=A0 DRM_EXEC_INTERRUPTIBLE_WAIT, 0,
> > false))
> > +		return VM_FAULT_NOPAGE;
>=20
> Any particular reason to not use xe_validation_guard here?

Well this is a bit complicated ATM.
We would need some serious TTM rework here to support drm_exec in these
helpers, and ATM I think upon closer inspection we'd need an
xe_validation_ctx_init that doesn't initialize a drm_exec.

ttm_bo_vm_reserve() might use a bo lock without a drm_exec and that
will cause a lockdep splat if the drm_exec transaction has initialized
the ww ctx, which happens in drm_exec_until_all_locked().=20

I should add a comment about that.

/Thomas



>=20
> Matt
>=20
> > +
> > =C2=A0	ret =3D ttm_bo_vm_reserve(tbo, vmf);
> > =C2=A0	if (ret)
> > =C2=A0		goto out;
> > @@ -1735,7 +1739,7 @@ static vm_fault_t xe_gem_fault(struct
> > vm_fault *vmf)
> > =C2=A0	if (drm_dev_enter(ddev, &idx)) {
> > =C2=A0		trace_xe_bo_cpu_fault(bo);
> > =C2=A0
> > -		xe_validation_assert_exec(xe, exec, &tbo->base);
> > +		xe_validation_assert_exec(xe, &exec, &tbo->base);
> > =C2=A0		ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma-
> > >vm_page_prot,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > TTM_BO_VM_NUM_PREFAULT);
> > =C2=A0		drm_dev_exit(idx);
> > @@ -1761,6 +1765,7 @@ static vm_fault_t xe_gem_fault(struct
> > vm_fault *vmf)
> > =C2=A0
> > =C2=A0	dma_resv_unlock(tbo->base.resv);
> > =C2=A0out:
> > +	xe_validation_ctx_fini(&ctx);
> > =C2=A0	if (needs_rpm)
> > =C2=A0		xe_pm_runtime_put(xe);
> > =C2=A0
> > --=20
> > 2.50.1
> >=20

