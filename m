Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54D2C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 12:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994F610E5E1;
	Fri,  3 Jul 2026 12:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJkMvp2v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C293B10E5E1
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 12:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783082723; x=1814618723;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0aC8w9q0z565Y62huoPJVMIdPPj5f0i/TASQy09hfEE=;
 b=RJkMvp2vc44IDPFXapu0TP5KYgwy4doYnfAN42vhttw/pW59ZqEASsFc
 W5kj2gdNO8nifFDEL0xLEE6sTTbIycrhIFsVgMty2X1HuNF1c7NBxBZa9
 WiqgVToESBAHQ+jgvykvM+IXrlGfyxSgl7cpgduq9dPmIIc0w2xGxEUYw
 Z7n2VRE/yqqOfKz96ENOo0gCfXO5u94vQIxLlOrnboc/ynEYsQsW3dk7R
 2h98R58YTplq4dTqqA+DWmUVzwnkbuCyxk2tFGubCgXkWauzqTJcuvgn6
 AVYQufxSygstusx0AFCT6Qkh4XOzvm3/X7aV31Nixam5z6kzy1jHavpkr g==;
X-CSE-ConnectionGUID: bqXWSonxQzehX/V3UbN1AQ==
X-CSE-MsgGUID: Dh5OdIz1QSWnbnK8gOChxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="84026470"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="84026470"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 05:45:23 -0700
X-CSE-ConnectionGUID: c1tjSt6hSZC3ESr9hVW89Q==
X-CSE-MsgGUID: hYaA4atpSAiPqRJt0awjxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="255023900"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.146])
 ([10.245.245.146])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 05:45:21 -0700
Message-ID: <472b1e17a858113396a50a8a7b8d9c51dc396410.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/display: skip FORCE_WC and vm_bound check for
 external dma-bufs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>, 	intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Fri, 03 Jul 2026 14:45:18 +0200
In-Reply-To: <8ef2f0cf-629e-4b38-a467-e243f37f8285@intel.com>
References: <20260612170501.550816-2-matthew.auld@intel.com>
 <d5be431c-8393-4846-95b8-c30cbceed51b@lankhorst.se>
 <8ef2f0cf-629e-4b38-a467-e243f37f8285@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Fri, 2026-06-26 at 10:09 +0100, Matthew Auld wrote:
> On 25/06/2026 16:35, Maarten Lankhorst wrote:
> > Hello,
> >=20
> > On 6/12/26 19:05, Matthew Auld wrote:
> > > Currently, xe_display_bo_framebuffer_init() unconditionally
> > > attempts to
> > > apply XE_BO_FLAG_FORCE_WC to the buffer and rejects the FB
> > > creation with
> > > -EINVAL if the BO is already VM_BINDed.
> > >=20
> > > However, for imported dma-bufs (ttm_bo_type_sg), this check
> > > doesn't seem
> > > to make much sense since CPU caching policy is entirely
> > > controlled by
> > > the exporter. Plus there is no place to set this flag, in the
> > > first
> > > place. Also this is not rejected if not yet vm_binded, but that
> > > seems
> > > arbitrary since setting or not setting FORCE_WC should a noop
> > > either
> > > way, at this stage, and whether it is currently VM_BINDed makes
> > > no
> > > difference.
> > >=20
> > > Currently if we run an app and offload rendering to an external
> > > dGPU,
> > > like NV or another xe device, the dma-buf passed back to the
> > > compositor
> > > (igpu) will be an actual external import from xe pov, and it will
> > > be
> > > missing FORCE_WC, and if the compositor side did a VM_BIND before
> > > turning into it into an fb the whole thing gets rejected.
> > >=20
> > > So it looks like we either need to reject outright, no matter
> > > what, or
> > > this usecase is valid and we need to loosen the restriction for
> > > sg
> > > buffers.=C2=A0 Proposing here to loosen the restriction.
> > >=20
> > > Assisted-by: Gemini:gemini-3.1-pro-preview
> > > Link:
> > > https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7919
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Maarten Lankhorst <dev@lankhorst.se>
> > > ---
> > > =C2=A0 drivers/gpu/drm/xe/display/xe_display_bo.c | 3 ++-
> > > =C2=A0 drivers/gpu/drm/xe/display/xe_fb_pin.c=C2=A0=C2=A0=C2=A0=C2=A0=
 | 3 ++-
> > > =C2=A0 2 files changed, 4 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c
> > > b/drivers/gpu/drm/xe/display/xe_display_bo.c
> > > index 7fbac223b097..8953da0136dc 100644
> > > --- a/drivers/gpu/drm/xe/display/xe_display_bo.c
> > > +++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
> > > @@ -48,7 +48,8 @@ static int
> > > xe_display_bo_framebuffer_init(struct drm_gem_object *obj,
> > > =C2=A0=C2=A0	if (ret)
> > > =C2=A0=C2=A0		goto err;
> > > =C2=A0=20
> > > -	if (!(bo->flags & XE_BO_FLAG_FORCE_WC)) {
> > > +	if (!(bo->flags & XE_BO_FLAG_FORCE_WC) &&
> > > +	=C2=A0=C2=A0=C2=A0 bo->ttm.type !=3D ttm_bo_type_sg) {
> > > =C2=A0=C2=A0		/*
> > > =C2=A0=C2=A0		 * XE_BO_FLAG_FORCE_WC should ideally be set at
> > > creation, or is
> > > =C2=A0=C2=A0		 * automatically set when creating FB. We cannot
> > > change caching
> > > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > index f93c98bec5b5..5f4a0cd8deca 100644
> > > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > @@ -331,7 +331,8 @@ static struct i915_vma
> > > *__xe_pin_fb_vma(struct drm_gem_object *obj, bool is_dpt,
> > > =C2=A0=C2=A0	int ret =3D 0;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/* We reject creating !SCANOUT fb's, so this is weird..
> > > */
> > > -	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags &
> > > XE_BO_FLAG_FORCE_WC));
> > > +	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags &
> > > XE_BO_FLAG_FORCE_WC) &&
> > > +		=C2=A0=C2=A0=C2=A0 bo->ttm.type !=3D ttm_bo_type_sg);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	if (!vma)
> > > =C2=A0=C2=A0		return ERR_PTR(-ENODEV);
> >=20
> > Yeah we cannot actually set the force flag on imported bo's for
> > mmap coherency, but mmap on an imported dma-buf should be forbidden
> > anyway, so that is fine.
> >=20
> > Best we can hope for is that dirtyfb is called correctly.
> >=20
> > Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
>=20
> Thanks!
>=20
> >=20
Hi,

Is there a chance an attacker could create a dma-buf on device 1,
export it to device 2, then scan out from it while the clearing still
sits in the CPU cache?

We have a forced flush for this situation in the i915 driver, right?

/Thomas
