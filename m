Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0E0CD98ED
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 12:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE2710F2CA;
	Thu, 18 Jun 2026 12:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSm854sY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E569A10F2CA
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 12:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781786321; x=1813322321;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=leFGvgxsWUloAfkucUbRKViS0PSPck15FQ+BhqZWwRo=;
 b=mSm854sYOdVZZG+u4krlf/HJ+fA7CD6X9UrikBNe+mrZXyXOeuxpEu5T
 Mw924eFGcpYflMp0Ku6Jx2qBoH3haESzIW4e2/6fNis8bpoXiieURwiuQ
 +EBgnHlqLbf+z0Fi/Vkr4xWXNDbKDrZtQ4ti+NKw3UcKCvTtgCq+oqvOz
 UDMrXyVC+Bwy46wp+64Yx3X223ADIqw29VYs/FvX913pPA3PIvaznwJAY
 yigdzqXF/f/sKvWVEzpL8Y0Q73v6PeucqIwDiwfYhWz/2XQQU0JVOlXgP
 ttknrPO/ToRCCEbt2hRE6A6PB1L1s3EnilnDvr1fBV58wA5ScimxjWfLQ g==;
X-CSE-ConnectionGUID: bCwM8IAnSoSvnaBFlxzO7Q==
X-CSE-MsgGUID: jPNf+Bf/Sm+cHRiuhqkKhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86531825"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="86531825"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 05:38:40 -0700
X-CSE-ConnectionGUID: pFM6DeArQuWV7haL7NB3+g==
X-CSE-MsgGUID: N3DvcJNbSeWJZjx3kiN0hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="252256656"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 05:38:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Disable display in admin only PF mode
In-Reply-To: <20260611124206.3742717-1-satyanarayana.k.v.p@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260611124206.3742717-1-satyanarayana.k.v.p@intel.com>
Date: Thu, 18 Jun 2026 15:38:33 +0300
Message-ID: <f1e4ae88eb77594097a7c9df11b20f4abf9e1cd9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 11 Jun 2026, Satyanarayana K V P <satyanarayana.k.v.p@intel.com> wr=
ote:
> Admin-only PF mode does not expose media or 3D execution capabilities
> to userspace, so display pipelines cannot receive rendered content.

That conclusion doesn't ring true to me. There may be other reasons to
disable display, but that's not it.

> Fixes: d88c4bac8c2a ("drm/xe/pf: Restrict device query responses in admin=
-only PF mode")
>

Please keep trailers together without newlines in between. See git log
for examples.

BR,
Jani.

> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
> Cc: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 --
>  drivers/gpu/drm/xe/xe_pci.c    | 4 +++-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 51e3a2dd7b22..9c02e0e314c7 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -426,7 +426,6 @@ static const struct drm_ioctl_desc xe_ioctls_admin_on=
ly[] =3D {
>=20=20
>  static const struct drm_driver admin_only_driver =3D {
>  	.driver_features =3D
> -	    XE_DISPLAY_DRIVER_FEATURES |
>  	    DRIVER_GEM | DRIVER_RENDER,
>  	.open =3D xe_file_open,
>  	.postclose =3D xe_file_close,
> @@ -438,7 +437,6 @@ static const struct drm_driver admin_only_driver =3D {
>  	.major =3D DRIVER_MAJOR,
>  	.minor =3D DRIVER_MINOR,
>  	.patchlevel =3D DRIVER_PATCHLEVEL,
> -	XE_DISPLAY_DRIVER_OPS,
>  };
>=20=20
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 78fc2e4dcfc6..6fd882443fa5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -789,7 +789,9 @@ static int xe_info_init_early(struct xe_device *xe,
>=20=20
>  	xe->info.probe_display =3D IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				 xe_modparam.probe_display &&
> -				 desc->has_display;
> +				 desc->has_display &&
> +				 !xe_device_is_admin_only(xe);
> +
>  	xe->info.force_execlist =3D xe_modparam.force_execlist;
>=20=20
>  	xe_assert(xe, desc->max_gt_per_tile > 0);

--=20
Jani Nikula, Intel
