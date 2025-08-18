Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A744CA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 09:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2553C10E1CC;
	Mon, 18 Aug 2025 09:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SfRNXYPn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92F510E1CC
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755508322; x=1787044322;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YZK5UoKOpsEfFxvewR8+GPUYkXIAh7y79BgewJkeeM4=;
 b=SfRNXYPnP8BbO9lfJvcsuYyCXzEXBJKw8pdzrz99LitSOX7k6KP8FuJB
 Wu33qFNnRQWLra7XI1+6+SCWTcleUlYaie5ZPr3WBV3DcHJuAUbw2mk1R
 ASDXZQJAFWfZ2/SqaFFtxR1sQfUBR+05Mv+iglv5xy8F00S/A+U4YUICX
 XRA4wRMpLy/x7EGnKTQxjiEEiaR/V1YBO1c72y8HtWbgw3VxVF/dt67JA
 J7DWsFVO7caHVX0qCcs+CZIaGT5LXidSziwprWEVvbcXhPBtxVtpPR5Gd
 fnV4xO2pd9EHtXbVJ2aCUyj+jGup1Kv/63q0nf9mPBjIqFqHj/jPkyq4X Q==;
X-CSE-ConnectionGUID: kk8TOIudQoiy2/BMSUXUQw==
X-CSE-MsgGUID: 5Xg/RyvARdyjLRexDEegGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57874117"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57874117"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 02:12:02 -0700
X-CSE-ConnectionGUID: WfXwjTwKQdmtE7cw4GG5RQ==
X-CSE-MsgGUID: WR8nW20nQdO8IEQHWAOBAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="172868306"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.224])
 ([10.245.245.224])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 02:11:59 -0700
Message-ID: <abbacebb1dcbfe18d3ead6e52784d176123ad36a.camel@linux.intel.com>
Subject: Re: [PATCH 09/15] drm/xe: Convert the CPU fault handler for
 exhaustive eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Mon, 18 Aug 2025 11:11:42 +0200
In-Reply-To: <aJ+E0UbTPk4FPenz@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-10-thomas.hellstrom@linux.intel.com>
 <aJ0MUTkV1j2xWAam@lstrano-desk.jf.intel.com>
 <e37e926918884fa683713db9437f2e7c0f0a07ca.camel@linux.intel.com>
 <aJ+E0UbTPk4FPenz@lstrano-desk.jf.intel.com>
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

On Fri, 2025-08-15 at 12:04 -0700, Matthew Brost wrote:
> On Fri, Aug 15, 2025 at 05:16:54PM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2025-08-13 at 15:06 -0700, Matthew Brost wrote:
> > > On Wed, Aug 13, 2025 at 12:51:15PM +0200, Thomas Hellstr=C3=B6m wrote=
:
> > > > The CPU fault handler may populate bos and migrate, and in
> > > > doing
> > > > so might interfere with other tasks validing.
> > > >=20
> > > > Convert it for exhaustive eviction. To do this properly without
> > > > potentially introducing stalls with the mmap lock held requires
> > > > TTM work. In the meantime, let's live with those stalls that
> > > > would typically happen on memory pressure.
> > > >=20
> > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > > =C2=A0drivers/gpu/drm/xe/xe_bo.c | 11 ++++++++---
> > > > =C2=A01 file changed, 8 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 5e40b6cb8d2a..dd1e0e9957e0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -1720,14 +1720,18 @@ static vm_fault_t xe_gem_fault(struct
> > > > vm_fault *vmf)
> > > > =C2=A0	struct xe_device *xe =3D to_xe_device(ddev);
> > > > =C2=A0	struct xe_bo *bo =3D ttm_to_xe_bo(tbo);
> > > > =C2=A0	bool needs_rpm =3D bo->flags & XE_BO_FLAG_VRAM_MASK;
> > > > -	struct drm_exec *exec;
> > > > +	struct xe_validation_ctx ctx;
> > > > +	struct drm_exec exec;
> > > > =C2=A0	vm_fault_t ret;
> > > > =C2=A0	int idx;
> > > > =C2=A0
> > > > =C2=A0	if (needs_rpm)
> > > > =C2=A0		xe_pm_runtime_get(xe);
> > > > =C2=A0
> > > > -	exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > > > +	if (xe_validation_ctx_init(&ctx, &xe->val, &exec,
> > > > +				=C2=A0=C2=A0
> > > > DRM_EXEC_INTERRUPTIBLE_WAIT, 0,
> > > > false))
> > > > +		return VM_FAULT_NOPAGE;
> > >=20
> > > Any particular reason to not use xe_validation_guard here?
> >=20
> > Well this is a bit complicated ATM.
> > We would need some serious TTM rework here to support drm_exec in
> > these
> > helpers, and ATM I think upon closer inspection we'd need an
> > xe_validation_ctx_init that doesn't initialize a drm_exec.
> >=20
>=20
> Right, so I think this is an unsupported case then.

We should be able to re-lock in write-mode, though.
Let me have a look at this in v2.

Thanks,
Thomas


>=20
> Matt
>=20
> > ttm_bo_vm_reserve() might use a bo lock without a drm_exec and that
> > will cause a lockdep splat if the drm_exec transaction has
> > initialized
> > the ww ctx, which happens in drm_exec_until_all_locked().=20
> >=20
> > I should add a comment about that.
> >=20
> > /Thomas
> >=20
> >=20
> >=20
> > >=20
> > > Matt
> > >=20
> > > > +
> > > > =C2=A0	ret =3D ttm_bo_vm_reserve(tbo, vmf);
> > > > =C2=A0	if (ret)
> > > > =C2=A0		goto out;
> > > > @@ -1735,7 +1739,7 @@ static vm_fault_t xe_gem_fault(struct
> > > > vm_fault *vmf)
> > > > =C2=A0	if (drm_dev_enter(ddev, &idx)) {
> > > > =C2=A0		trace_xe_bo_cpu_fault(bo);
> > > > =C2=A0
> > > > -		xe_validation_assert_exec(xe, exec, &tbo-
> > > > >base);
> > > > +		xe_validation_assert_exec(xe, &exec, &tbo-
> > > > >base);
> > > > =C2=A0		ret =3D ttm_bo_vm_fault_reserved(vmf, vmf->vma-
> > > > > vm_page_prot,
> > > > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > TTM_BO_VM_NUM_PREFAULT);
> > > > =C2=A0		drm_dev_exit(idx);
> > > > @@ -1761,6 +1765,7 @@ static vm_fault_t xe_gem_fault(struct
> > > > vm_fault *vmf)
> > > > =C2=A0
> > > > =C2=A0	dma_resv_unlock(tbo->base.resv);
> > > > =C2=A0out:
> > > > +	xe_validation_ctx_fini(&ctx);
> > > > =C2=A0	if (needs_rpm)
> > > > =C2=A0		xe_pm_runtime_put(xe);
> > > > =C2=A0
> > > > --=20
> > > > 2.50.1
> > > >=20
> >=20

