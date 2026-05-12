Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B57CD4F21
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 10:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B725410E2F8;
	Tue, 12 May 2026 10:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nd2Hlz8W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CDF10E11B;
 Tue, 12 May 2026 10:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778582748; x=1810118748;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=byaVFHUwvts6/LFnPLYfvfc246ZQDro/177MK5/Ulso=;
 b=Nd2Hlz8WLzi+EpbDbhippmRcBvoXW5oWYcWwTc+NAeHUMAmhFwRtqxx0
 uNw00WSDw7WCqJj90ElH/EuS0bscvG6jEh+96AZaFyrGiT65r3SJT8d6T
 DTJ7lV5KeRA/PwjGNBlV944KihjHaix0JcJvpA6ST5g1YCIurWY/T7ItE
 xv2Bism/wWcUamCvmsX8ZTR6qLpvfzLGhGhI/L/ZMWvgGvNYJOylehFLl
 rXz5hdcZPnwepXGsaTxt1SQ3k0BITemjkwErSRBtjHdJ1rKDUPTodY/Wy
 GtGOFqDlho68R+idPkDQ0Gd5WGqo8oh8hZ8UbSas+2CboNn4uM4A/pNrP A==;
X-CSE-ConnectionGUID: SBvrkBtMT/6NV49jd1hJGw==
X-CSE-MsgGUID: t9jq0KnmTi2wG3pIStshcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="89790361"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="89790361"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 03:45:47 -0700
X-CSE-ConnectionGUID: ArpE1PKiRbeDUllS6lygyA==
X-CSE-MsgGUID: dljJdHxoRKGD56+H4Q6HUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="261227152"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.203])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 03:45:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 08/14] drm/xe: Print a debug message if we have no
 stolen for the initial FB
In-Reply-To: <20260511214122.8468-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260511214122.8468-1-ville.syrjala@linux.intel.com>
 <20260511214122.8468-9-ville.syrjala@linux.intel.com>
Date: Tue, 12 May 2026 13:45:41 +0300
Message-ID: <a7fc052011cc1525083eb509f9dd88e78bdf5464@intel.com>
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

On Tue, 12 May 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Inform the poor sop reading the logs why the initial FB was rejected
> if there is no stolen memory.
>
> Technically this should perhaps be an error since the plane is known
> to be enabled at this point, and if there is no stolen then it clearly
> can't be scanning out from anywhere. But maybe there are some
> virtualization passthrough cases and whatnot where we might not be
> able to get access to stolen, so keep it as debug (same as i915).
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_initial_plane.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/=
drm/xe/display/xe_initial_plane.c
> index 14ac4cd8b7ff..b7e0685351bb 100644
> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> @@ -67,10 +67,14 @@ initial_plane_bo(struct xe_device *xe,
>  			    "Using phys_base=3D%pa, based on initial plane programming\n",
>  			    &phys_base);
>  	} else {
> -		struct ttm_resource_manager *stolen =3D ttm_manager_type(&xe->ttm, XE_=
PL_STOLEN);
> +		struct ttm_resource_manager *stolen;
>=20=20
> -		if (!stolen)
> +		stolen =3D ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> +		if (!stolen) {
> +			drm_dbg_kms(&xe->drm, "No stolen for initial FB\n");
>  			return NULL;
> +		}
> +
>  		phys_base =3D base;
>  		flags |=3D XE_BO_FLAG_STOLEN;
>  	}

--=20
Jani Nikula, Intel
