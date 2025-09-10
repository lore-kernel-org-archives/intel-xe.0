Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF9BCA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 15:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E4E10E27F;
	Wed, 10 Sep 2025 15:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="liH1hAJP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9484110E27F
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 15:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757519258; x=1789055258;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LvbE6jcMAoE0S0GWmNBNAPJaZE2fGFm/yEqz1TeJty8=;
 b=liH1hAJPVESB5BNqN+RCZYNWz6wvm+faZUxW8kSj2Gp8oPsEInj4V33z
 pZD8iUDbt99kTySt3eoqYwPwyOyMiBzR9tbXLfsYL3XqDpLFo44jziEvC
 EXjYQ5H6UwVJ3JjGhjoLWq5Dto/KgxlhFcGzsOlcdFBtEEds1GoyfSZgb
 tOXTzQyajFm4DOhR7STF7ZRLcHLu3CRTMl1KSM44i7lzts7ssDVn9fntm
 PFLPsi2HU/NkFiq4wfgGLsJj55qwNSpmhXrKDHTJ7bkxJbGU0z4BVy/nj
 jjdlT/HgliVNZtFa2WfC5JXbPXMM5Woe3514uqpCjQWwyQSsE6RQ/xBv8 w==;
X-CSE-ConnectionGUID: K09nJ+k2Shi58drwA487lQ==
X-CSE-MsgGUID: LShtAtdxRNaUlqHB1AXhAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59784234"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59784234"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 08:47:38 -0700
X-CSE-ConnectionGUID: Kygy+77oS4+ft4Ij0xL/2Q==
X-CSE-MsgGUID: AgBAVQi+T1K2/2OK/EZXCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="204193406"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.245.22])
 ([10.245.245.22])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 08:47:37 -0700
Message-ID: <22293f685a0b0e95556d2fb68771f4fdb4be1618.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix uninitialized return values
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Brost, Matthew" <matthew.brost@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
Date: Wed, 10 Sep 2025 17:47:34 +0200
In-Reply-To: <CH0PR11MB5444CF1FA4EEF9650C47A093E50EA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250910151128.49693-1-thomas.hellstrom@linux.intel.com>
 <CH0PR11MB5444CF1FA4EEF9650C47A093E50EA@CH0PR11MB5444.namprd11.prod.outlook.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Wed, 2025-09-10 at 15:39 +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Thomas Hellstr=C3=B6m
> Sent: Wednesday, September 10, 2025 8:11 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>; Brost,
> Matthew <matthew.brost@intel.com>; Jani Nikula
> <jani.nikula@linux.intel.com>
> Subject: [PATCH] drm/xe: Fix uninitialized return values
> >=20
> > clang warned about two uninitialized variables used as return
> > values in the exhaustive eviction series.
> >=20
> > Fix those.
> >=20
> > Fixes: 1f1541720f65 ("drm/xe: Rework instances of variants of
> > xe_bo_create_locked()")
> > Fixes: 7bcb6e38c14d ("drm/xe/display: Convert __xe_pin_fb_vma()")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> I see an alternate solution to the issue in i915_gem_stolen.h, but
> otherwise:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Thanks for reviewing.

>=20
> > ---
> > =C2=A0drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h | 2
> > +-
> > =C2=A0drivers/gpu/drm/xe/display/xe_fb_pin.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2
> > +-
> > =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/compat-i915-
> > headers/gem/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-
> > headers/gem/i915_gem_stolen.h
> > index a2d1f684a3a8..f097fc6d5127 100644
> > --- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> > +++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> > @@ -22,7 +22,7 @@ static inline int
> > i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
> > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 start,
> > u32 end)
> > =C2=A0{
> > =C2=A0	struct xe_bo *bo;
> > -	int err;
> > +	int err =3D 0;
>=20
> NIT:
> On the other hand, looking at the rest of the function, we probably
> don't even
> need 'int err' at all.=C2=A0 Specifically:
>=20
> """
> static inline int i915_gem_stolen_insert_node_in_range(struct
> xe_device *xe,
> 						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct
> i915_stolen_fb *fb,
> 						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 size, u32
> align,
> 						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 start,
> u32 end)
> {
> 	struct xe_bo *bo;
> 	u32 flags =3D XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
>=20
> 	if (start < SZ_4K)
> 		start =3D SZ_4K;
>=20
> 	if (align) {
> 		size =3D ALIGN(size, align);
> 		start =3D ALIGN(start, align);
> 	}
>=20
> 	bo =3D xe_bo_create_pin_range_novm(xe,
> xe_device_get_root_tile(xe),
> 					 size, start, end,
> ttm_bo_type_kernel, flags);
> 	if (IS_ERR(bo))
> 		return PTR_ERR(bo);
>=20
> 	fb->bo =3D bo;
>=20
> 	return 0;
> }
> """
>=20
> Note that we're no longer setting bo =3D NULL in the error path, but
> that had no effect anyways,
> AFAICT.=C2=A0 Was this function previously passing an xe_bo pointer as on=
e
> of its parameters?

Not sure TBH. The original code set fb->bo to NULL, so since this is
strictly a fix, I'll keep that. But yeah, could probably clean this
function up a bit now.

Thanks,
Thomas



> -Jonathan Cavitt
>=20
> > =C2=A0	u32 flags =3D XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
> > =C2=A0
> > =C2=A0	if (start < SZ_4K)
> > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > index 287b0c4355ef..1fd4a815e784 100644
> > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > @@ -283,7 +283,7 @@ static struct i915_vma *__xe_pin_fb_vma(const
> > struct intel_framebuffer *fb,
> > =C2=A0	struct xe_bo *bo =3D gem_to_xe_bo(obj);
> > =C2=A0	struct xe_validation_ctx ctx;
> > =C2=A0	struct drm_exec exec;
> > -	int ret;
> > +	int ret =3D 0;
> > =C2=A0
> > =C2=A0	if (!vma)
> > =C2=A0		return ERR_PTR(-ENODEV);
> > --=20
> > 2.51.0
> >=20
> >=20

