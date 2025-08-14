Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28514CA0EE4
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 13:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C508410E1A6;
	Thu, 14 Aug 2025 13:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+hYRFpa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA1A10E1A6
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 13:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755177303; x=1786713303;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lpkD70YjwKwwiLRiUOvk4fNAtlj1+zzVUzvIncfp7zE=;
 b=A+hYRFpaMDEhIgWhKDmi+OD4AsHurnN4WRspzJTKwjO+aOIjCxEtI9fE
 k+aQwyJFJ//y1Ox3K8ESOsjI8vbz8Ud+mRagHxwPpybJm4/SkDm7kvK6S
 WyqFE20CqGpmmK9CWoqjKEB0deCD3beTqLKb10p7kKdk9fpiFWmeGZy/A
 h3bt4FWQ9sbaJTWcbIV1Yu04+47kZIF1A1lOTgAtKpUrfkKSNOdqDHY+e
 ZcQX1Pk53/5SvVLioOqfBV4K4FRrduxJXNuAxR+CNHBdqUxvlwcyivXh6
 QJ/0lk1ykSQjnPitevCyHbFe+Slc5tStIdtiX5ILX4zoNXKq2xWoQ7vZP A==;
X-CSE-ConnectionGUID: 13/VxirkT/i3AakLZ3Oh9g==
X-CSE-MsgGUID: j5Hgg6mPQKmePLw9LTvGfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68946549"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68946549"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 06:15:02 -0700
X-CSE-ConnectionGUID: dL0SvACiTiiXdysseyVukA==
X-CSE-MsgGUID: H0W5oVwqTvG/x2K7IzRy5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166247293"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.244.149])
 ([10.245.244.149])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 06:15:00 -0700
Message-ID: <af2b09635de23fe4d5dd6eb57812979eec09278b.camel@linux.intel.com>
Subject: Re: [PATCH 14/15] drm/xe: Convert xe_bo_create_pin_map() for
 exhaustive eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Thu, 14 Aug 2025 15:14:57 +0200
In-Reply-To: <aJ1jpOrhPEkIMA7r@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-15-thomas.hellstrom@linux.intel.com>
 <aJ1jpOrhPEkIMA7r@lstrano-desk.jf.intel.com>
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

On Wed, 2025-08-13 at 21:18 -0700, Matthew Brost wrote:
> On Wed, Aug 13, 2025 at 12:51:20PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Introduce an xe_bo_create_pin_map_novm() function that does not
> > take the drm_exec paramenter to simplify the conversion of many
> > callsites.
> > For the rest, ensure that the same drm_exec context that was used
> > for locking the vm is passed down to validation.
> >=20
> > Use xe_validation_guard() where appropriate.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/display/intel_fbdev_fb.c=C2=A0=C2=A0 |=C2=A0 1=
8 +--
> > =C2=A0drivers/gpu/drm/xe/display/xe_dsb_buffer.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 10 +-
> > =C2=A0drivers/gpu/drm/xe/display/xe_fb_pin.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 39 +++---
> > =C2=A0drivers/gpu/drm/xe/display/xe_hdcp_gsc.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 8 +-
> > =C2=A0drivers/gpu/drm/xe/tests/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 53 +++++++-
> > =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 6 +-
> > =C2=A0drivers/gpu/drm/xe/xe_gsc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 8 +-
> > =C2=A0drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 24 ++--
> > =C2=A0drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |=C2=A0 24 ++--
> > =C2=A0drivers/gpu/drm/xe/xe_guc_engine_activity.c=C2=A0=C2=A0 |=C2=A0 1=
3 +-
> > =C2=A0drivers/gpu/drm/xe/xe_lmtt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
12 +-
> > =C2=A0drivers/gpu/drm/xe/xe_lrc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 7 +-
> > =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 20 ++-
> > =C2=A0drivers/gpu/drm/xe/xe_oa.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 6 +-
> > =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 10 +-
> > =C2=A0drivers/gpu/drm/xe/xe_pt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 3 +-
> > =C2=A0drivers/gpu/drm/xe/xe_pxp_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 34 +++--
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 119 ++++++++++----
> > ----
> > =C2=A019 files changed, 252 insertions(+), 171 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> > b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> > index d96ba2b51065..8ea9a472113c 100644
> > --- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> > +++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> > @@ -42,11 +42,11 @@ struct intel_framebuffer
> > *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
> > =C2=A0	obj =3D ERR_PTR(-ENODEV);
> > =C2=A0
> > =C2=A0	if (!IS_DGFX(xe) && !XE_GT_WA(xe_root_mmio_gt(xe),
> > 22019338487_display)) {
> > -		obj =3D xe_bo_create_pin_map(xe,
> > xe_device_get_root_tile(xe),
> > -					=C2=A0=C2=A0 NULL, size,
> > -					=C2=A0=C2=A0 ttm_bo_type_kernel,
> > XE_BO_FLAG_SCANOUT |
> > -					=C2=A0=C2=A0 XE_BO_FLAG_STOLEN |
> > -					=C2=A0=C2=A0 XE_BO_FLAG_GGTT);
> > +		obj =3D xe_bo_create_pin_map_novm(xe,
> > xe_device_get_root_tile(xe),
> > +						size,
> > +						ttm_bo_type_kernel
> > , XE_BO_FLAG_SCANOUT |
> > +						XE_BO_FLAG_STOLEN
> > |
> > +						XE_BO_FLAG_GGTT,
> > false);
> > =C2=A0		if (!IS_ERR(obj))
> > =C2=A0			drm_info(&xe->drm, "Allocated fbdev into
> > stolen\n");
> > =C2=A0		else
> > @@ -54,10 +54,10 @@ struct intel_framebuffer
> > *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	if (IS_ERR(obj)) {
> > -		obj =3D xe_bo_create_pin_map(xe,
> > xe_device_get_root_tile(xe), NULL, size,
> > -					=C2=A0=C2=A0 ttm_bo_type_kernel,
> > XE_BO_FLAG_SCANOUT |
> > -					=C2=A0=C2=A0
> > XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
> > -					=C2=A0=C2=A0 XE_BO_FLAG_GGTT);
> > +		obj =3D xe_bo_create_pin_map_novm(xe,
> > xe_device_get_root_tile(xe), size,
> > +						ttm_bo_type_kernel
> > , XE_BO_FLAG_SCANOUT |
> > +						XE_BO_FLAG_VRAM_IF
> > _DGFX(xe_device_get_root_tile(xe)) |
> > +						XE_BO_FLAG_GGTT,
> > false);
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	if (IS_ERR(obj)) {
> > diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> > b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> > index 9f941fc2e36b..58581d7aaae6 100644
> > --- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> > +++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> > @@ -43,11 +43,11 @@ bool intel_dsb_buffer_create(struct intel_crtc
> > *crtc, struct intel_dsb_buffer *d
> > =C2=A0		return false;
> > =C2=A0
> > =C2=A0	/* Set scanout flag for WC mapping */
> > -	obj =3D xe_bo_create_pin_map(xe,
> > xe_device_get_root_tile(xe),
> > -				=C2=A0=C2=A0 NULL, PAGE_ALIGN(size),
> > -				=C2=A0=C2=A0 ttm_bo_type_kernel,
> > -				=C2=A0=C2=A0
> > XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
> > -				=C2=A0=C2=A0 XE_BO_FLAG_SCANOUT |
> > XE_BO_FLAG_GGTT);
> > +	obj =3D xe_bo_create_pin_map_novm(xe,
> > xe_device_get_root_tile(xe),
> > +					PAGE_ALIGN(size),
> > +					ttm_bo_type_kernel,
> > +					XE_BO_FLAG_VRAM_IF_DGFX(xe
> > _device_get_root_tile(xe)) |
> > +					XE_BO_FLAG_SCANOUT |
> > XE_BO_FLAG_GGTT, false);
> > =C2=A0	if (IS_ERR(obj)) {
> > =C2=A0		kfree(vma);
> > =C2=A0		return false;
> > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > index d46ff7ebb0a1..d8e15ebb740c 100644
> > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > @@ -102,32 +102,23 @@ static int __xe_pin_fb_vma_dpt(const struct
> > intel_framebuffer *fb,
> > =C2=A0				 XE_PAGE_SIZE);
> > =C2=A0
> > =C2=A0	if (IS_DGFX(xe))
> > -		dpt =3D xe_bo_create_pin_map_at_novm(xe, tile0,
> > -						=C2=A0=C2=A0 dpt_size,
> > ~0ull,
> > -						=C2=A0=C2=A0
> > ttm_bo_type_kernel,
> > -						=C2=A0=C2=A0 true,
> > -						=C2=A0=C2=A0
> > XE_BO_FLAG_VRAM0 |
> > -						=C2=A0=C2=A0 XE_BO_FLAG_GGTT
> > |
> > -						=C2=A0=C2=A0
> > XE_BO_FLAG_PAGETABLE,
> > -						=C2=A0=C2=A0 alignment,
> > false);
> > +		dpt =3D xe_bo_create_pin_map_novm(xe, tile0,
> > dpt_size,
> > +						ttm_bo_type_kernel
> > ,
> > +						XE_BO_FLAG_VRAM0 |
> > +						XE_BO_FLAG_GGTT |
> > +						XE_BO_FLAG_PAGETAB
> > LE, true);
> > =C2=A0	else
> > -		dpt =3D xe_bo_create_pin_map_at_novm(xe, tile0,
> > -						=C2=A0=C2=A0 dpt_size,=C2=A0
> > ~0ull,
> > -						=C2=A0=C2=A0
> > ttm_bo_type_kernel,
> > -						=C2=A0=C2=A0 true,
> > -						=C2=A0=C2=A0
> > XE_BO_FLAG_STOLEN |
> > -						=C2=A0=C2=A0 XE_BO_FLAG_GGTT
> > |
> > -						=C2=A0=C2=A0
> > XE_BO_FLAG_PAGETABLE,
> > -						=C2=A0=C2=A0 alignment,
> > false);
> > +		dpt =3D xe_bo_create_pin_map_novm(xe, tile0,
> > dpt_size,
> > +						ttm_bo_type_kernel
> > ,
> > +						XE_BO_FLAG_STOLEN
> > |
> > +						XE_BO_FLAG_GGTT |
> > +						XE_BO_FLAG_PAGETAB
> > LE, true);
> > =C2=A0	if (IS_ERR(dpt))
> > -		dpt =3D xe_bo_create_pin_map_at_novm(xe, tile0,
> > -						=C2=A0=C2=A0 dpt_size,=C2=A0
> > ~0ull,
> > -						=C2=A0=C2=A0
> > ttm_bo_type_kernel,
> > -						=C2=A0=C2=A0 true,
> > -						=C2=A0=C2=A0
> > XE_BO_FLAG_SYSTEM |
> > -						=C2=A0=C2=A0 XE_BO_FLAG_GGTT
> > |
> > -						=C2=A0=C2=A0
> > XE_BO_FLAG_PAGETABLE,
> > -						=C2=A0=C2=A0 alignment,
> > false);
> > +		dpt =3D xe_bo_create_pin_map_novm(xe, tile0,
> > dpt_size,
> > +						ttm_bo_type_kernel
> > ,
> > +						XE_BO_FLAG_SYSTEM
> > |
> > +						XE_BO_FLAG_GGTT |
> > +						XE_BO_FLAG_PAGETAB
> > LE, true);
> > =C2=A0	if (IS_ERR(dpt))
> > =C2=A0		return PTR_ERR(dpt);
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > index 30f1073141fc..4ae847b628e2 100644
> > --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> > @@ -72,10 +72,10 @@ static int
> > intel_hdcp_gsc_initialize_message(struct xe_device *xe,
> > =C2=A0	int ret =3D 0;
> > =C2=A0
> > =C2=A0	/* allocate object of two page for HDCP command memory and
> > store it */
> > -	bo =3D xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe),
> > NULL, PAGE_SIZE * 2,
> > -				=C2=A0 ttm_bo_type_kernel,
> > -				=C2=A0 XE_BO_FLAG_SYSTEM |
> > -				=C2=A0 XE_BO_FLAG_GGTT);
> > +	bo =3D xe_bo_create_pin_map_novm(xe,
> > xe_device_get_root_tile(xe), PAGE_SIZE * 2,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_kernel,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_SYSTEM |
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_GGTT, false);
> > =C2=A0
> > =C2=A0	if (IS_ERR(bo)) {
> > =C2=A0		drm_err(&xe->drm, "Failed to allocate bo for HDCP
> > streaming command!\n");
> > diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c
> > b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > index afa794e56065..5904d658d1f2 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > @@ -204,7 +204,8 @@ static void xe_migrate_sanity_test(struct
> > xe_migrate *m, struct kunit *test,
> > =C2=A0
> > =C2=A0	big =3D xe_bo_create_pin_map(xe, tile, m->q->vm, SZ_4M,
> > =C2=A0				=C2=A0=C2=A0 ttm_bo_type_kernel,
> > -				=C2=A0=C2=A0 XE_BO_FLAG_VRAM_IF_DGFX(tile));
> > +				=C2=A0=C2=A0 XE_BO_FLAG_VRAM_IF_DGFX(tile),
> > +				=C2=A0=C2=A0 exec);
> > =C2=A0	if (IS_ERR(big)) {
> > =C2=A0		KUNIT_FAIL(test, "Failed to allocate bo: %li\n",
> > PTR_ERR(big));
> > =C2=A0		goto vunmap;
> > @@ -212,7 +213,8 @@ static void xe_migrate_sanity_test(struct
> > xe_migrate *m, struct kunit *test,
> > =C2=A0
> > =C2=A0	pt =3D xe_bo_create_pin_map(xe, tile, m->q->vm,
> > XE_PAGE_SIZE,
> > =C2=A0				=C2=A0 ttm_bo_type_kernel,
> > -				=C2=A0 XE_BO_FLAG_VRAM_IF_DGFX(tile));
> > +				=C2=A0 XE_BO_FLAG_VRAM_IF_DGFX(tile),
> > +				=C2=A0 exec);
> > =C2=A0	if (IS_ERR(pt)) {
> > =C2=A0		KUNIT_FAIL(test, "Failed to allocate fake pt:
> > %li\n",
> > =C2=A0			=C2=A0=C2=A0 PTR_ERR(pt));
> > @@ -222,7 +224,8 @@ static void xe_migrate_sanity_test(struct
> > xe_migrate *m, struct kunit *test,
> > =C2=A0	tiny =3D xe_bo_create_pin_map(xe, tile, m->q->vm,
> > =C2=A0				=C2=A0=C2=A0=C2=A0 2 * SZ_4K,
> > =C2=A0				=C2=A0=C2=A0=C2=A0 ttm_bo_type_kernel,
> > -				=C2=A0=C2=A0=C2=A0
> > XE_BO_FLAG_VRAM_IF_DGFX(tile));
> > +				=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_VRAM_IF_DGFX(tile),
> > +				=C2=A0=C2=A0=C2=A0 exec);
> > =C2=A0	if (IS_ERR(tiny)) {
> > =C2=A0		KUNIT_FAIL(test, "Failed to allocate tiny fake pt:
> > %li\n",
> > =C2=A0			=C2=A0=C2=A0 PTR_ERR(tiny));
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index c9928d4ee5a0..82bf158426ad 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -2343,16 +2343,60 @@ xe_bo_create_pin_map_at_novm(struct
> > xe_device *xe, struct xe_tile *tile,
> > =C2=A0	return ret ? ERR_PTR(ret) : bo;
> > =C2=A0}
> > =C2=A0
> > +/**
> > + * xe_bo_create_pin_map() - Create pinned and mapped bo
> > + * @xe: The xe device.
> > + * @tile: The tile to select for migration of this bo, and the
> > tile used for
> > + * @vm: The vm to associate the buffer object with. The vm's resv
> > must be locked
> > + * with the transaction represented by @exec.
> > + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel
> > bos.
> > + * @size: The storage size to use for the bo.
> > + * @type: The TTM buffer object type.
> > + * @flags: XE_BO_FLAG_ flags.
> > + * @exec: The drm_exec transaction to use for exhaustive eviction,
> > and
> > + * previously used for locking @vm's resv.
> > + *
> > + * Create a pinned and mapped bo. The bo will be external and not
> > associated
> > + * with a VM.
> > + *
> > + * Return: The buffer object on success. Negative error pointer on
> > failure.
> > + * In particular, the function may return ERR_PTR(%-EINTR) if
> > @intr was set
> > + * to true on entry.
> > + */
> > =C2=A0struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct
> > xe_tile *tile,
> > =C2=A0				=C2=A0=C2=A0 struct xe_vm *vm, size_t size,
> > -				=C2=A0=C2=A0 enum ttm_bo_type type, u32
> > flags)
> > +				=C2=A0=C2=A0 enum ttm_bo_type type, u32
> > flags,
> > +				=C2=A0=C2=A0 struct drm_exec *exec)
> > =C2=A0{
> > -	struct drm_exec *exec =3D vm ? xe_vm_validation_exec(vm) :
> > XE_VALIDATION_UNIMPLEMENTED;
> > -
> > +	xe_assert(xe, exec);
> > =C2=A0	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size,
> > ~0ull, type, flags,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 true, 0, exec);
> > =C2=A0}
> > =C2=A0
> > +/**
> > + * xe_bo_create_pin_map_novm() - Create pinned and mapped bo
> > + * @xe: The xe device.
> > + * @tile: The tile to select for migration of this bo, and the
> > tile used for
> > + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel
> > bos.
> > + * @size: The storage size to use for the bo.
> > + * @type: The TTM buffer object type.
> > + * @flags: XE_BO_FLAG_ flags.
> > + * @intr: Whether to execut any waits for backing store
> > interruptible.
> > + *
> > + * Create a pinned and mapped bo. The bo will be external and not
> > associated
> > + * with a VM.
> > + *
> > + * Return: The buffer object on success. Negative error pointer on
> > failure.
> > + * In particular, the function may return ERR_PTR(%-EINTR) if
> > @intr was set
> > + * to true on entry.
> > + */
> > +struct xe_bo *xe_bo_create_pin_map_novm(struct xe_device *xe,
> > struct xe_tile *tile,
> > +					size_t size, enum
> > ttm_bo_type type, u32 flags,
> > +					bool intr)
> > +{
> > +	return xe_bo_create_pin_map_at_novm(xe, tile, size, ~0ull,
> > type, flags, true, 0, intr);
> > +}
> > +
> > =C2=A0static void __xe_bo_unpin_map_no_vm(void *arg)
> > =C2=A0{
> > =C2=A0	xe_bo_unpin_map_no_vm(arg);
> > @@ -2365,8 +2409,7 @@ struct xe_bo
> > *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	KUNIT_STATIC_STUB_REDIRECT(xe_managed_bo_create_pin_map,
> > xe, tile, size, flags);
> > -
> > -	bo =3D xe_bo_create_pin_map(xe, tile, NULL, size,
> > ttm_bo_type_kernel, flags);
> > +	bo =3D xe_bo_create_pin_map_novm(xe, tile, size,
> > ttm_bo_type_kernel, flags, true);
> > =C2=A0	if (IS_ERR(bo))
> > =C2=A0		return bo;
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > b/drivers/gpu/drm/xe/xe_bo.h
> > index d06266af9662..802e3c7d7872 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -108,7 +108,11 @@ struct xe_bo *xe_bo_create_user(struct
> > xe_device *xe, struct xe_vm *vm, size_t s
> > =C2=A0				u16 cpu_caching, u32 flags, struct
> > drm_exec *exec);
> > =C2=A0struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct
> > xe_tile *tile,
> > =C2=A0				=C2=A0=C2=A0 struct xe_vm *vm, size_t size,
> > -				=C2=A0=C2=A0 enum ttm_bo_type type, u32
> > flags);
> > +				=C2=A0=C2=A0 enum ttm_bo_type type, u32
> > flags,
> > +				=C2=A0=C2=A0 struct drm_exec *exec);
> > +struct xe_bo *xe_bo_create_pin_map_novm(struct xe_device *xe,
> > struct xe_tile *tile,
> > +					size_t size, enum
> > ttm_bo_type type, u32 flags,
> > +					bool intr);
> > =C2=A0struct xe_bo *
> > =C2=A0xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile
> > *tile,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 size_t size, u64 offset, enum
> > ttm_bo_type type,
> > diff --git a/drivers/gpu/drm/xe/xe_gsc.c
> > b/drivers/gpu/drm/xe/xe_gsc.c
> > index f5ae28af60d4..83d61bf8ec62 100644
> > --- a/drivers/gpu/drm/xe/xe_gsc.c
> > +++ b/drivers/gpu/drm/xe/xe_gsc.c
> > @@ -136,10 +136,10 @@ static int query_compatibility_version(struct
> > xe_gsc *gsc)
> > =C2=A0	u64 ggtt_offset;
> > =C2=A0	int err;
> > =C2=A0
> > -	bo =3D xe_bo_create_pin_map(xe, tile, NULL, GSC_VER_PKT_SZ *
> > 2,
> > -				=C2=A0 ttm_bo_type_kernel,
> > -				=C2=A0 XE_BO_FLAG_SYSTEM |
> > -				=C2=A0 XE_BO_FLAG_GGTT);
> > +	bo =3D xe_bo_create_pin_map_novm(xe, tile, GSC_VER_PKT_SZ *
> > 2,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_kernel,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_SYSTEM |
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_GGTT, false);
> > =C2=A0	if (IS_ERR(bo)) {
> > =C2=A0		xe_gt_err(gt, "failed to allocate bo for GSC
> > version query\n");
> > =C2=A0		return PTR_ERR(bo);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > index 906011671b60..d0a87d7b028b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > @@ -1452,7 +1452,6 @@ static bool pf_release_vf_config_lmem(struct
> > xe_gt *gt, struct xe_gt_sriov_confi
> > =C2=A0static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int
> > vfid, u64 size)
> > =C2=A0{
> > =C2=A0	struct xe_gt_sriov_config *config =3D pf_pick_vf_config(gt,
> > vfid);
> > -	struct drm_exec *exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > =C2=A0	struct xe_device *xe =3D gt_to_xe(gt);
> > =C2=A0	struct xe_tile *tile =3D gt_to_tile(gt);
> > =C2=A0	struct xe_bo *bo;
> > @@ -1479,24 +1478,17 @@ static int pf_provision_vf_lmem(struct
> > xe_gt *gt, unsigned int vfid, u64 size)
> > =C2=A0		return 0;
> > =C2=A0
> > =C2=A0	xe_gt_assert(gt, pf_get_lmem_alignment(gt) =3D=3D SZ_2M);
> > -	bo =3D xe_bo_create_locked(xe, tile, NULL,
> > -				 ALIGN(size, PAGE_SIZE),
> > -				 ttm_bo_type_kernel,
> > -				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > -				 XE_BO_FLAG_NEEDS_2M |
> > -				 XE_BO_FLAG_PINNED |
> > -				 XE_BO_FLAG_PINNED_LATE_RESTORE,
> > -				 exec);
> > +	bo =3D xe_bo_create_pin_map_at_novm(xe, tile,
> > +					=C2=A0 ALIGN(size, PAGE_SIZE),
> > +					=C2=A0 0,
> > +					=C2=A0 ttm_bo_type_kernel,
> > +					=C2=A0
> > XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > +					=C2=A0 XE_BO_FLAG_NEEDS_2M |
> > +					=C2=A0
> > XE_BO_FLAG_PINNED_LATE_RESTORE,
> > +					=C2=A0 false, 0, false);
> > =C2=A0	if (IS_ERR(bo))
> > =C2=A0		return PTR_ERR(bo);
> > =C2=A0
> > -	err =3D xe_bo_pin(bo, exec);
> > -	xe_bo_unlock(bo);
> > -	if (unlikely(err)) {
> > -		xe_bo_put(bo);
> > -		return err;
> > -	}
> > -
> > =C2=A0	config->lmem_obj =3D bo;
> > =C2=A0
> > =C2=A0	if (xe_device_has_lmtt(xe)) {
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index c712111aa30d..44cc612b0a75 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -55,12 +55,12 @@ static int pf_send_guc_save_vf_state(struct
> > xe_gt *gt, unsigned int vfid,
> > =C2=A0	xe_gt_assert(gt, size % sizeof(u32) =3D=3D 0);
> > =C2=A0	xe_gt_assert(gt, size =3D=3D ndwords * sizeof(u32));
> > =C2=A0
> > -	bo =3D xe_bo_create_pin_map(xe, tile, NULL,
> > -				=C2=A0 ALIGN(size, PAGE_SIZE),
> > -				=C2=A0 ttm_bo_type_kernel,
> > -				=C2=A0 XE_BO_FLAG_SYSTEM |
> > -				=C2=A0 XE_BO_FLAG_GGTT |
> > -				=C2=A0 XE_BO_FLAG_GGTT_INVALIDATE);
> > +	bo =3D xe_bo_create_pin_map_novm(xe, tile,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ALIGN(size, PAGE_SIZE),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_kernel,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_SYSTEM |
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_GGTT |
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_GGTT_INVALIDATE,
> > false);
> > =C2=A0	if (IS_ERR(bo))
> > =C2=A0		return PTR_ERR(bo);
> > =C2=A0
> > @@ -91,12 +91,12 @@ static int pf_send_guc_restore_vf_state(struct
> > xe_gt *gt, unsigned int vfid,
> > =C2=A0	xe_gt_assert(gt, size % sizeof(u32) =3D=3D 0);
> > =C2=A0	xe_gt_assert(gt, size =3D=3D ndwords * sizeof(u32));
> > =C2=A0
> > -	bo =3D xe_bo_create_pin_map(xe, tile, NULL,
> > -				=C2=A0 ALIGN(size, PAGE_SIZE),
> > -				=C2=A0 ttm_bo_type_kernel,
> > -				=C2=A0 XE_BO_FLAG_SYSTEM |
> > -				=C2=A0 XE_BO_FLAG_GGTT |
> > -				=C2=A0 XE_BO_FLAG_GGTT_INVALIDATE);
> > +	bo =3D xe_bo_create_pin_map_novm(xe, tile,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ALIGN(size, PAGE_SIZE),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_kernel,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_SYSTEM |
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_GGTT |
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_GGTT_INVALIDATE,
> > false);
> > =C2=A0	if (IS_ERR(bo))
> > =C2=A0		return PTR_ERR(bo);
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> > b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> > index 92e1f9f41b8c..2b99c1ebdd58 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> > @@ -94,16 +94,17 @@ static int
> > allocate_engine_activity_buffers(struct xe_guc *guc,
> > =C2=A0	struct xe_tile *tile =3D gt_to_tile(gt);
> > =C2=A0	struct xe_bo *bo, *metadata_bo;
> > =C2=A0
> > -	metadata_bo =3D xe_bo_create_pin_map(gt_to_xe(gt), tile,
> > NULL, PAGE_ALIGN(metadata_size),
> > -					=C2=A0=C2=A0 ttm_bo_type_kernel,
> > XE_BO_FLAG_SYSTEM |
> > -					=C2=A0=C2=A0 XE_BO_FLAG_GGTT |
> > XE_BO_FLAG_GGTT_INVALIDATE);
> > +	metadata_bo =3D xe_bo_create_pin_map_novm(gt_to_xe(gt),
> > tile, PAGE_ALIGN(metadata_size),
> > +						ttm_bo_type_kernel
> > , XE_BO_FLAG_SYSTEM |
> > +						XE_BO_FLAG_GGTT |
> > XE_BO_FLAG_GGTT_INVALIDATE,
> > +						false);
> > =C2=A0
> > =C2=A0	if (IS_ERR(metadata_bo))
> > =C2=A0		return PTR_ERR(metadata_bo);
> > =C2=A0
> > -	bo =3D xe_bo_create_pin_map(gt_to_xe(gt), tile, NULL,
> > PAGE_ALIGN(size),
> > -				=C2=A0 ttm_bo_type_kernel,
> > XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > -				=C2=A0 XE_BO_FLAG_GGTT |
> > XE_BO_FLAG_GGTT_INVALIDATE);
> > +	bo =3D xe_bo_create_pin_map_novm(gt_to_xe(gt), tile,
> > PAGE_ALIGN(size),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_kernel,
> > XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_GGTT |
> > XE_BO_FLAG_GGTT_INVALIDATE, false);
> > =C2=A0
> > =C2=A0	if (IS_ERR(bo)) {
> > =C2=A0		xe_bo_unpin_map_no_vm(metadata_bo);
> > diff --git a/drivers/gpu/drm/xe/xe_lmtt.c
> > b/drivers/gpu/drm/xe/xe_lmtt.c
> > index a78c9d474a6e..4ad468574174 100644
> > --- a/drivers/gpu/drm/xe/xe_lmtt.c
> > +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> > @@ -67,12 +67,12 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct
> > xe_lmtt *lmtt, unsigned int level
> > =C2=A0		goto out;
> > =C2=A0	}
> > =C2=A0
> > -	bo =3D xe_bo_create_pin_map(lmtt_to_xe(lmtt),
> > lmtt_to_tile(lmtt), NULL,
> > -				=C2=A0 PAGE_ALIGN(lmtt->ops-
> > >lmtt_pte_size(level) *
> > -					=C2=A0=C2=A0=C2=A0=C2=A0 lmtt->ops-
> > >lmtt_pte_num(level)),
> > -				=C2=A0 ttm_bo_type_kernel,
> > -				=C2=A0
> > XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
> > -				=C2=A0 XE_BO_FLAG_NEEDS_64K);
> > +	bo =3D xe_bo_create_pin_map_novm(lmtt_to_xe(lmtt),
> > lmtt_to_tile(lmtt),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_ALIGN(lmtt->ops-
> > >lmtt_pte_size(level) *
> > +						=C2=A0 lmtt->ops-
> > >lmtt_pte_num(level)),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_kernel,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > XE_BO_FLAG_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_NEEDS_64K,
> > false);
> > =C2=A0	if (IS_ERR(bo)) {
> > =C2=A0		err =3D PTR_ERR(bo);
> > =C2=A0		goto out_free_pt;
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> > b/drivers/gpu/drm/xe/xe_lrc.c
> > index 8f6c3ba47882..6d52e0eb97f5 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -1340,9 +1340,10 @@ static int xe_lrc_init(struct xe_lrc *lrc,
> > struct xe_hw_engine *hwe,
> > =C2=A0	if (vm && vm->xef) /* userspace */
> > =C2=A0		bo_flags |=3D XE_BO_FLAG_PINNED_LATE_RESTORE;
> > =C2=A0
> > -	lrc->bo =3D xe_bo_create_pin_map(xe, tile, NULL, bo_size,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_kernel,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo_flags);
> > +	lrc->bo =3D xe_bo_create_pin_map_novm(xe, tile,
> > +					=C2=A0=C2=A0=C2=A0 bo_size,
> > +					=C2=A0=C2=A0=C2=A0 ttm_bo_type_kernel,
> > +					=C2=A0=C2=A0=C2=A0 bo_flags, false);
> > =C2=A0	if (IS_ERR(lrc->bo))
> > =C2=A0		return PTR_ERR(lrc->bo);
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index ddfad7506a82..fe0d15ab340e 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -35,6 +35,7 @@
> > =C2=A0#include "xe_sched_job.h"
> > =C2=A0#include "xe_sync.h"
> > =C2=A0#include "xe_trace_bo.h"
> > +#include "xe_validation.h"
> > =C2=A0#include "xe_vm.h"
> > =C2=A0#include "xe_vram.h"
> > =C2=A0
> > @@ -173,7 +174,7 @@ static void xe_migrate_program_identity(struct
> > xe_device *xe, struct xe_vm *vm,
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int xe_migrate_prepare_vm(struct xe_tile *tile, struct
> > xe_migrate *m,
> > -				 struct xe_vm *vm)
> > +				 struct xe_vm *vm, struct drm_exec
> > *exec)
> > =C2=A0{
> > =C2=A0	struct xe_device *xe =3D tile_to_xe(tile);
> > =C2=A0	u16 pat_index =3D xe->pat.idx[XE_CACHE_WB];
> > @@ -200,7 +201,7 @@ static int xe_migrate_prepare_vm(struct xe_tile
> > *tile, struct xe_migrate *m,
> > =C2=A0				=C2=A0 num_entries * XE_PAGE_SIZE,
> > =C2=A0				=C2=A0 ttm_bo_type_kernel,
> > =C2=A0				=C2=A0 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > -				=C2=A0 XE_BO_FLAG_PAGETABLE);
> > +				=C2=A0 XE_BO_FLAG_PAGETABLE, exec);
> > =C2=A0	if (IS_ERR(bo))
> > =C2=A0		return PTR_ERR(bo);
> > =C2=A0
> > @@ -404,6 +405,8 @@ int xe_migrate_init(struct xe_migrate *m)
> > =C2=A0	struct xe_tile *tile =3D m->tile;
> > =C2=A0	struct xe_gt *primary_gt =3D tile->primary_gt;
> > =C2=A0	struct xe_device *xe =3D tile_to_xe(tile);
> > +	struct xe_validation_ctx ctx;
> > +	struct drm_exec exec;
> > =C2=A0	struct xe_vm *vm;
> > =C2=A0	int err;
> > =C2=A0
> > @@ -413,11 +416,16 @@ int xe_migrate_init(struct xe_migrate *m)
> > =C2=A0	if (IS_ERR(vm))
> > =C2=A0		return PTR_ERR(vm);
> > =C2=A0
> > -	xe_vm_lock(vm, false);
> > -	err =3D xe_migrate_prepare_vm(tile, m, vm);
> > -	xe_vm_unlock(vm);
> > +	err =3D 0;
> > +	xe_validation_guard(&ctx, &xe->val, &exec, 0, err, false)
> > {
> > +		err =3D xe_vm_drm_exec_lock(vm, &exec);
> > +		drm_exec_retry_on_contention(&exec);
> > +		err =3D xe_migrate_prepare_vm(tile, m, vm, &exec);
> > +		drm_exec_retry_on_contention(&exec);
> > +		xe_validation_retry_on_oom(&ctx, &err);
> > +	}
> > =C2=A0	if (err)
> > -		goto err_out;
> > +		return err;
> > =C2=A0
> > =C2=A0	if (xe->info.has_usm) {
> > =C2=A0		struct xe_hw_engine *hwe =3D
> > xe_gt_hw_engine(primary_gt,
> > diff --git a/drivers/gpu/drm/xe/xe_oa.c
> > b/drivers/gpu/drm/xe/xe_oa.c
> > index a188bad172ad..a4894eb0d7f3 100644
> > --- a/drivers/gpu/drm/xe/xe_oa.c
> > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > @@ -883,9 +883,9 @@ static int xe_oa_alloc_oa_buffer(struct
> > xe_oa_stream *stream, size_t size)
> > =C2=A0{
> > =C2=A0	struct xe_bo *bo;
> > =C2=A0
> > -	bo =3D xe_bo_create_pin_map(stream->oa->xe, stream->gt-
> > >tile, NULL,
> > -				=C2=A0 size, ttm_bo_type_kernel,
> > -				=C2=A0 XE_BO_FLAG_SYSTEM |
> > XE_BO_FLAG_GGTT);
> > +	bo =3D xe_bo_create_pin_map_novm(stream->oa->xe, stream->gt-
> > >tile,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size, ttm_bo_type_kernel,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_SYSTEM |
> > XE_BO_FLAG_GGTT, false);
> > =C2=A0	if (IS_ERR(bo))
> > =C2=A0		return PTR_ERR(bo);
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > b/drivers/gpu/drm/xe/xe_pt.c
> > index f3a39e734a90..33ad40418ceb 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -88,6 +88,7 @@ static void xe_pt_free(struct xe_pt *pt)
> > =C2=A0 * @vm: The vm to create for.
> > =C2=A0 * @tile: The tile to create for.
> > =C2=A0 * @level: The page-table level.
> > + * @exec: The drm_exec object used to lock the vm.
> > =C2=A0 *
> > =C2=A0 * Allocate and initialize a single struct xe_pt metadata
> > structure. Also
> > =C2=A0 * create the corresponding page-table bo, but don't initialize
> > it. If the
> > @@ -99,7 +100,7 @@ static void xe_pt_free(struct xe_pt *pt)
> > =C2=A0 * error.
> > =C2=A0 */
> > =C2=A0struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile=
,
> > -			=C2=A0=C2=A0 unsigned int level)
> > +			=C2=A0=C2=A0 unsigned int level, struct drm_exec
> > *exec)
> > =C2=A0{
> > =C2=A0	struct xe_pt *pt;
> > =C2=A0	struct xe_bo *bo;
> > @@ -123,9 +124,11 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm,
> > struct xe_tile *tile,
> > =C2=A0		bo_flags |=3D XE_BO_FLAG_PINNED_LATE_RESTORE;
> > =C2=A0
> > =C2=A0	pt->level =3D level;
> > +
> > +	drm_WARN_ON(&vm->xe->drm, IS_ERR_OR_NULL(exec));
> > =C2=A0	bo =3D xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
> > =C2=A0				=C2=A0 ttm_bo_type_kernel,
> > -				=C2=A0 bo_flags);
> > +				=C2=A0 bo_flags, exec);
> > =C2=A0	if (IS_ERR(bo)) {
> > =C2=A0		err =3D PTR_ERR(bo);
> > =C2=A0		goto err_kfree;
> > @@ -589,7 +592,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > pgoff_t offset,
> > =C2=A0	if (covers || !*child) {
> > =C2=A0		u64 flags =3D 0;
> > =C2=A0
> > -		xe_child =3D xe_pt_create(xe_walk->vm, xe_walk-
> > >tile, level - 1);
> > +		xe_child =3D xe_pt_create(xe_walk->vm, xe_walk-
> > >tile, level - 1,
> > +					xe_vm_validation_exec(vm))
> > ;
> > =C2=A0		if (IS_ERR(xe_child))
> > =C2=A0			return PTR_ERR(xe_child);
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_pt.h
> > b/drivers/gpu/drm/xe/xe_pt.h
> > index 5ecf003d513c..4daeebaab5a1 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.h
> > +++ b/drivers/gpu/drm/xe/xe_pt.h
> > @@ -10,6 +10,7 @@
> > =C2=A0#include "xe_pt_types.h"
> > =C2=A0
> > =C2=A0struct dma_fence;
> > +struct drm_exec;
> > =C2=A0struct xe_bo;
> > =C2=A0struct xe_device;
> > =C2=A0struct xe_exec_queue;
> > @@ -29,7 +30,7 @@ struct xe_vma_ops;
> > =C2=A0unsigned int xe_pt_shift(unsigned int level);
> > =C2=A0
> > =C2=A0struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile=
,
> > -			=C2=A0=C2=A0 unsigned int level);
> > +			=C2=A0=C2=A0 unsigned int level, struct drm_exec
> > *exec);
> > =C2=A0
> > =C2=A0void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
> > =C2=A0			=C2=A0 struct xe_pt *pt);
> > diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c
> > b/drivers/gpu/drm/xe/xe_pxp_submit.c
> > index ca95f2a4d4ef..54bd6b64dc6d 100644
> > --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> > @@ -54,8 +54,9 @@ static int
> > allocate_vcs_execution_resources(struct xe_pxp *pxp)
> > =C2=A0	 * Each termination is 16 DWORDS, so 4K is enough to
> > contain a
> > =C2=A0	 * termination for each sessions.
> > =C2=A0	 */
> > -	bo =3D xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
> > ttm_bo_type_kernel,
> > -				=C2=A0 XE_BO_FLAG_SYSTEM |
> > XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);
> > +	bo =3D xe_bo_create_pin_map_novm(xe, tile, SZ_4K,
> > ttm_bo_type_kernel,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_SYSTEM |
> > XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 false);
> > =C2=A0	if (IS_ERR(bo)) {
> > =C2=A0		err =3D PTR_ERR(bo);
> > =C2=A0		goto out_queue;
> > @@ -87,7 +88,9 @@ static int allocate_gsc_client_resources(struct
> > xe_gt *gt,
> > =C2=A0{
> > =C2=A0	struct xe_tile *tile =3D gt_to_tile(gt);
> > =C2=A0	struct xe_device *xe =3D tile_to_xe(tile);
> > +	struct xe_validation_ctx ctx;
> > =C2=A0	struct xe_hw_engine *hwe;
> > +	struct drm_exec exec;
> > =C2=A0	struct xe_vm *vm;
> > =C2=A0	struct xe_bo *bo;
> > =C2=A0	struct xe_exec_queue *q;
> > @@ -106,15 +109,26 @@ static int
> > allocate_gsc_client_resources(struct xe_gt *gt,
> > =C2=A0		return PTR_ERR(vm);
> > =C2=A0
> > =C2=A0	/* We allocate a single object for the batch and the
> > in/out memory */
> > -	xe_vm_lock(vm, false);
> > -	bo =3D xe_bo_create_pin_map(xe, tile, vm, PXP_BB_SIZE +
> > inout_size * 2,
> > -				=C2=A0 ttm_bo_type_kernel,
> > -				=C2=A0 XE_BO_FLAG_SYSTEM |
> > XE_BO_FLAG_PINNED | XE_BO_FLAG_NEEDS_UC);
> > -	xe_vm_unlock(vm);
> > -	if (IS_ERR(bo)) {
> > -		err =3D PTR_ERR(bo);
> > -		goto vm_out;
> > +
> > +	xe_validation_guard(&ctx, &xe->val, &exec, 0, err, false)
> > {
> > +		err =3D xe_vm_drm_exec_lock(vm, &exec);
> > +		drm_exec_retry_on_contention(&exec);
> > +		if (err)
> > +			break;
> > +
> > +		bo =3D xe_bo_create_pin_map(xe, tile, vm,
> > PXP_BB_SIZE + inout_size * 2,
> > +					=C2=A0 ttm_bo_type_kernel,
> > +					=C2=A0 XE_BO_FLAG_SYSTEM |
> > XE_BO_FLAG_PINNED |
> > +					=C2=A0 XE_BO_FLAG_NEEDS_UC,
> > &exec);
> > +		drm_exec_retry_on_contention(&exec);
> > +		if (IS_ERR(bo)) {
> > +			err =3D PTR_ERR(bo);
> > +			xe_validation_retry_on_oom(&ctx, &err);
> > +			break;
> > +		}
> > =C2=A0	}
> > +	if (err)
> > +		goto vm_out;
> > =C2=A0
> > =C2=A0	fence =3D xe_vm_bind_kernel_bo(vm, bo, NULL, 0,
> > XE_CACHE_WB);
> > =C2=A0	if (IS_ERR(fence)) {
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 989d84c2e82f..b3ee65126841 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1606,6 +1606,7 @@ static void vm_destroy_work_func(struct
> > work_struct *w);
> > =C2=A0 * @xe: xe device.
> > =C2=A0 * @tile: tile to set up for.
> > =C2=A0 * @vm: vm to set up for.
> > + * @exec: The struct drm_exec object used to lock the vm resv.
> > =C2=A0 *
> > =C2=A0 * Sets up a pagetable tree with one page-table per level and a
> > single
> > =C2=A0 * leaf PTE. All pagetable entries point to the single page-table
> > or,
> > @@ -1615,20 +1616,19 @@ static void vm_destroy_work_func(struct
> > work_struct *w);
> > =C2=A0 * Return: 0 on success, negative error code on error.
> > =C2=A0 */
> > =C2=A0static int xe_vm_create_scratch(struct xe_device *xe, struct
> > xe_tile *tile,
> > -				struct xe_vm *vm)
> > +				struct xe_vm *vm, struct drm_exec
> > *exec)
> > =C2=A0{
> > =C2=A0	u8 id =3D tile->id;
> > =C2=A0	int i;
> > =C2=A0
> > =C2=A0	for (i =3D MAX_HUGEPTE_LEVEL; i < vm->pt_root[id]->level;
> > i++) {
> > -		vm->scratch_pt[id][i] =3D xe_pt_create(vm, tile, i);
> > +		vm->scratch_pt[id][i] =3D xe_pt_create(vm, tile, i,
> > exec);
> > =C2=A0		if (IS_ERR(vm->scratch_pt[id][i])) {
> > =C2=A0			int err =3D PTR_ERR(vm->scratch_pt[id][i]);
> > =C2=A0
> > =C2=A0			vm->scratch_pt[id][i] =3D NULL;
> > =C2=A0			return err;
> > =C2=A0		}
> > -
> > =C2=A0		xe_pt_populate_empty(tile, vm, vm-
> > >scratch_pt[id][i]);
> > =C2=A0	}
> > =C2=A0
> > @@ -1656,9 +1656,26 @@ static void xe_vm_free_scratch(struct xe_vm
> > *vm)
> > =C2=A0	}
> > =C2=A0}
> > =C2=A0
> > +static void xe_vm_pt_destroy(struct xe_vm *vm)
> > +{
> > +	struct xe_tile *tile;
> > +	u8 id;
> > +
> > +	xe_vm_assert_held(vm);
> > +
> > +	for_each_tile(tile, vm->xe, id) {
> > +		if (vm->pt_root[id]) {
> > +			xe_pt_destroy(vm->pt_root[id], vm->flags,
> > NULL);
> > +			vm->pt_root[id] =3D NULL;
> > +		}
> > +	}
> > +}
> > +
> > =C2=A0struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struc=
t
> > xe_file *xef)
> > =C2=A0{
> > =C2=A0	struct drm_gem_object *vm_resv_obj;
> > +	struct xe_validation_ctx ctx;
> > +	struct drm_exec exec;
> > =C2=A0	struct xe_vm *vm;
> > =C2=A0	int err, number_tiles =3D 0;
> > =C2=A0	struct xe_tile *tile;
> > @@ -1745,49 +1762,64 @@ struct xe_vm *xe_vm_create(struct xe_device
> > *xe, u32 flags, struct xe_file *xef)
> > =C2=A0
> > =C2=A0	drm_gem_object_put(vm_resv_obj);
> > =C2=A0
> > -	err =3D xe_vm_lock(vm, true);
> > -	if (err)
> > -		goto err_close;
> > +	err =3D 0;
> > +	xe_validation_guard(&ctx, &xe->val, &exec,
> > DRM_EXEC_INTERRUPTIBLE_WAIT,
> > +			=C2=A0=C2=A0=C2=A0 err, true) {
> > +		err =3D xe_vm_drm_exec_lock(vm, &exec);
> > +		drm_exec_retry_on_contention(&exec);
> > =C2=A0
> > -	if (IS_DGFX(xe) && xe->info.vram_flags &
> > XE_VRAM_FLAGS_NEED64K)
> > -		vm->flags |=3D XE_VM_FLAG_64K;
> > +		if (IS_DGFX(xe) && xe->info.vram_flags &
> > XE_VRAM_FLAGS_NEED64K)
> > +			vm->flags |=3D XE_VM_FLAG_64K;
> > =C2=A0
> > -	for_each_tile(tile, xe, id) {
> > -		if (flags & XE_VM_FLAG_MIGRATION &&
> > -		=C2=A0=C2=A0=C2=A0 tile->id !=3D XE_VM_FLAG_TILE_ID(flags))
> > -			continue;
> > +		for_each_tile(tile, xe, id) {
> > +			if (flags & XE_VM_FLAG_MIGRATION &&
> > +			=C2=A0=C2=A0=C2=A0 tile->id !=3D XE_VM_FLAG_TILE_ID(flags))
> > +				continue;
> > =C2=A0
> > -		vm->pt_root[id] =3D xe_pt_create(vm, tile, xe-
> > >info.vm_max_level);
> > -		if (IS_ERR(vm->pt_root[id])) {
> > -			err =3D PTR_ERR(vm->pt_root[id]);
> > -			vm->pt_root[id] =3D NULL;
> > -			goto err_unlock_close;
> > +			vm->pt_root[id] =3D xe_pt_create(vm, tile,
> > xe->info.vm_max_level,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &exec);
> > +			if (IS_ERR(vm->pt_root[id])) {
> > +				err =3D PTR_ERR(vm->pt_root[id]);
> > +				vm->pt_root[id] =3D NULL;
> > +				xe_vm_pt_destroy(vm);
> > +				drm_exec_retry_on_contention(&exec
> > );
> > +				xe_validation_retry_on_oom(&ctx,
> > &err);
> > +				goto err_close;
> > +			}
> > =C2=A0		}
> > -	}
> > =C2=A0
> > -	if (xe_vm_has_scratch(vm)) {
> > +		if (xe_vm_has_scratch(vm)) {
> > +			for_each_tile(tile, xe, id) {
> > +				if (!vm->pt_root[id])
> > +					continue;
> > +
> > +				err =3D xe_vm_create_scratch(xe,
> > tile, vm, &exec);
> > +				if (err) {
> > +					xe_vm_free_scratch(vm);
> > +					xe_vm_pt_destroy(vm);
> > +					drm_exec_retry_on_contenti
> > on(&exec);
> > +					xe_validation_retry_on_oom
> > (&ctx, &err);
> > +					goto err_close;
> > +				}
> > +			}
> > +			vm->batch_invalidate_tlb =3D true;
> > +		}
> > +
> > +		if (vm->flags & XE_VM_FLAG_LR_MODE) {
> > +			INIT_WORK(&vm->preempt.rebind_work,
> > preempt_rebind_work_func);
> > +			vm->batch_invalidate_tlb =3D false;
> > +		}
> > +
> > +		/* Fill pt_root after allocating scratch tables */
> > =C2=A0		for_each_tile(tile, xe, id) {
> > =C2=A0			if (!vm->pt_root[id])
> > =C2=A0				continue;
> > =C2=A0
> > -			err =3D xe_vm_create_scratch(xe, tile, vm);
> > -			if (err)
> > -				goto err_unlock_close;
> > +			xe_pt_populate_empty(tile, vm, vm-
> > >pt_root[id]);
> > =C2=A0		}
> > -		vm->batch_invalidate_tlb =3D true;
> > -	}
> > -
> > -	if (vm->flags & XE_VM_FLAG_LR_MODE)
> > -		vm->batch_invalidate_tlb =3D false;
> > -
> > -	/* Fill pt_root after allocating scratch tables */
> > -	for_each_tile(tile, xe, id) {
> > -		if (!vm->pt_root[id])
> > -			continue;
> > -
> > -		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
> > =C2=A0	}
> > -	xe_vm_unlock(vm);
> > +	if (err)
> > +		goto err_close;
> > =C2=A0
> > =C2=A0	/* Kernel migration VM shouldn't have a circular loop.. */
> > =C2=A0	if (!(flags & XE_VM_FLAG_MIGRATION)) {
> > @@ -1820,7 +1852,7 @@ struct xe_vm *xe_vm_create(struct xe_device
> > *xe, u32 flags, struct xe_file *xef)
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &xe->usm.next_asid,
> > GFP_KERNEL);
> > =C2=A0		up_write(&xe->usm.lock);
> > =C2=A0		if (err < 0)
> > -			goto err_unlock_close;
> > +			goto err_close;
> > =C2=A0
> > =C2=A0		vm->usm.asid =3D asid;
> > =C2=A0	}
> > @@ -1829,8 +1861,6 @@ struct xe_vm *xe_vm_create(struct xe_device
> > *xe, u32 flags, struct xe_file *xef)
> > =C2=A0
> > =C2=A0	return vm;
> > =C2=A0
> > -err_unlock_close:
> > -	xe_vm_unlock(vm);
> > =C2=A0err_close:
> > =C2=A0	xe_vm_close_and_put(vm);
> > =C2=A0	return ERR_PTR(err);
> > @@ -1959,13 +1989,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> > =C2=A0	 * destroy the pagetables immediately.
> > =C2=A0	 */
> > =C2=A0	xe_vm_free_scratch(vm);
> > -
> > -	for_each_tile(tile, xe, id) {
> > -		if (vm->pt_root[id]) {
> > -			xe_pt_destroy(vm->pt_root[id], vm->flags,
> > NULL);
> > -			vm->pt_root[id] =3D NULL;
> > -		}
> > -	}
> > +	xe_vm_pt_destroy(vm);
> > =C2=A0	xe_vm_unlock(vm);
> > =C2=A0
> > =C2=A0	/*
> > @@ -3845,7 +3869,6 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct
> > xe_vm *vm, struct xe_bo *bo,
> > =C2=A0 */
> > =C2=A0int xe_vm_lock(struct xe_vm *vm, bool intr)
> > =C2=A0{
> > -	struct drm_exec *exec =3D XE_VALIDATION_UNIMPLEMENTED;
>=20
> You add this earlier in the series and then delete it here, which
> seems
> odd. If the intent is to apply a workaround (WA) earlier and finalize
> it
> here, that makes sense.

Yes, the patch that introduces these identifies all the call-sites
where we need a fix-up, and uses lockdep to verify that a validation
transaction starting there doesn't violate the dma_resv locking orders.

Most of the series then eliminates these _UNIMPLEMENTED one by one.
Of course one could do it in the opposite order to avoid introducing
and then eliminating these but I think that would be harder both for
the developer and reviewer.

>=20
> However, deleting it here appears to leave a problematic path in
> xe_svm.c around xe_vm_range_rebind, where vm->validating._exec may
> remain unset/stale. I=E2=80=99m surprised CI didn=E2=80=99t catch this=E2=
=80=94perhaps due to
> an
> unbalanced xe_vm_set_validation_exec leaving stale state=E2=80=94or I=E2=
=80=99m
> missing
> something.

Yes, you are correct. There was an imbalance and I will fix that.

Thanks,
Thomas

>=20
> Matt
>=20
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	if (intr)
> > @@ -3853,9 +3876,6 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
> > =C2=A0	else
> > =C2=A0		ret =3D dma_resv_lock(xe_vm_resv(vm), NULL);
> > =C2=A0
> > -	if (!ret)
> > -		xe_vm_set_validation_exec(vm, exec);
> > -
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > @@ -3867,7 +3887,6 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
> > =C2=A0 */
> > =C2=A0void xe_vm_unlock(struct xe_vm *vm)
> > =C2=A0{
> > -	xe_vm_set_validation_exec(vm, NULL);
> > =C2=A0	dma_resv_unlock(xe_vm_resv(vm));
> > =C2=A0}
> > =C2=A0
> > --=20
> > 2.50.1
> >=20

