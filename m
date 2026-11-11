Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B51606A326
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PBqMHCuf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0995910E9CB;
	Wed, 11 Nov 2026 10:57:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680E510E9CB;
 Wed, 11 Nov 2026 10:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794394642; x=1825930642;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Bw/0JIsAPfNobDe1chKDTWjvhw1N4JcVeTEbAacVPRM=;
 b=PBqMHCufaao3uIeovW6A0mz2GB1KV4ui2F+C3NHwvuwXsVk6VZOUGGDA
 sqgvxM8SgjkUECCDv+RG4KSC69+Wr0OIp1fV95fPdubkreyUihCoyCvEx
 VpX/UnbLVNNrcAGiVWz+KNAPQNslbWNwJA675l4coPyO07UZAa3IWKuiU
 8ybQOy8nc4/gNxcmWwQ2DhgWU+YSWMIS0LuhqV6H7VuE/D5zJF0kAc/sj
 ZjJ4IShL7IYi0PdQLI0e4Kq1y1esy8VY1ZweBstRHFprY+iMlaF5Pw/iw
 edyytjmRt0A1irCJ29htjW5EcRdnfutK5MK0ikeY2RBxARf9uTjcy1cAt w==;
X-CSE-ConnectionGUID: 3qspwKTOQo24HNya7INXQA==
X-CSE-MsgGUID: LxK7McgkRMG1Qg6n+d2QBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3184834"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3184834"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 02:57:22 -0800
X-CSE-ConnectionGUID: rdf+EHu8Q9OLeboDIiuCmA==
X-CSE-MsgGUID: ZTsXSVYoSxODFK5lvW5qKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8822697"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.124])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 02:57:19 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 08/10] drm/i915: Nuke
 HAS_FPGA_DBG_UNCLAIMED()/.has_fpga_dbg
In-Reply-To: <20261110184622.1721-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261110184622.1721-1-ville.syrjala@linux.intel.com>
 <20261110184622.1721-9-ville.syrjala@linux.intel.com>
Date: Wed, 11 Nov 2026 12:57:17 +0200
Message-ID: <6bb3d1e896f78a744efa26a6d2f167ac17cec2fd@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> HAS_FPGA_DBG_UNCLAIMED() and the underlying .has_fpga_dbg device
> flag is now unused. Nuke it all.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display_device.c | 8 --------
>  drivers/gpu/drm/i915/display/intel_display_device.h | 2 --
>  2 files changed, 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/driver=
s/gpu/drm/i915/display/intel_display_device.c
> index 69046d0cd5e9..055396f85e4a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> @@ -571,7 +571,6 @@ static const struct platform_desc hsw_desc =3D {
>  	.info =3D &(const struct intel_display_device_info) {
>  		.has_ddi =3D 1,
>  		.has_dp_mst =3D 1,
> -		.has_fpga_dbg =3D 1,
>  		.has_hotplug =3D 1,
>  		.has_psr =3D 1,
>  		.has_psr_hw_tracking =3D 1,
> @@ -624,7 +623,6 @@ static const struct platform_desc bdw_desc =3D {
>  	.info =3D &(const struct intel_display_device_info) {
>  		.has_ddi =3D 1,
>  		.has_dp_mst =3D 1,
> -		.has_fpga_dbg =3D 1,
>  		.has_hotplug =3D 1,
>  		.has_psr =3D 1,
>  		.has_psr_hw_tracking =3D 1,
> @@ -665,7 +663,6 @@ static const struct intel_display_device_info skl_dis=
play =3D {
>  	.dbuf.slice_mask =3D BIT(DBUF_S1),
>  	.has_ddi =3D 1,
>  	.has_dp_mst =3D 1,
> -	.has_fpga_dbg =3D 1,
>  	.has_hotplug =3D 1,
>  	.has_ipc =3D 1,
>  	.has_psr =3D 1,
> @@ -815,7 +812,6 @@ static const struct platform_desc cml_desc =3D {
>  	.dbuf.slice_mask =3D BIT(DBUF_S1), \
>  	.has_dp_mst =3D 1, \
>  	.has_ddi =3D 1, \
> -	.has_fpga_dbg =3D 1, \
>  	.has_hotplug =3D 1, \
>  	.has_ipc =3D 1, \
>  	.has_psr =3D 1, \
> @@ -874,7 +870,6 @@ static const struct platform_desc glk_desc =3D {
>  	.dbuf.slice_mask =3D BIT(DBUF_S1) | BIT(DBUF_S2), \
>  	.has_ddi =3D 1, \
>  	.has_dp_mst =3D 1, \
> -	.has_fpga_dbg =3D 1, \
>  	.has_hotplug =3D 1, \
>  	.has_ipc =3D 1, \
>  	.has_psr =3D 1, \
> @@ -965,7 +960,6 @@ static const struct platform_desc ehl_desc =3D {
>  	.has_ddi =3D 1, \
>  	.has_dp_mst =3D 1, \
>  	.has_dsb =3D 1, \
> -	.has_fpga_dbg =3D 1, \
>  	.has_hotplug =3D 1, \
>  	.has_ipc =3D 1, \
>  	.has_psr =3D 1, \
> @@ -1133,7 +1127,6 @@ static const struct platform_desc adl_s_desc =3D {
>  	.has_ddi =3D 1,								\
>  	.has_dp_mst =3D 1,							\
>  	.has_dsb =3D 1,								\
> -	.has_fpga_dbg =3D 1,							\
>  	.has_hotplug =3D 1,							\
>  	.has_ipc =3D 1,								\
>  	.has_psr =3D 1,								\
> @@ -1313,7 +1306,6 @@ static const struct platform_desc dg2_desc =3D {
>  	.has_ddi =3D 1,								\
>  	.has_dp_mst =3D 1,							\
>  	.has_dsb =3D 1,								\
> -	.has_fpga_dbg =3D 1,							\
>  	.has_hotplug =3D 1,							\
>  	.has_ipc =3D 1,								\
>  	.has_psr =3D 1,								\
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/driver=
s/gpu/drm/i915/display/intel_display_device.h
> index 7121e7cd9512..4f82520ef960 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -134,7 +134,6 @@ struct intel_display_platforms {
>  	func(has_ddi); \
>  	func(has_dp_mst); \
>  	func(has_dsb); \
> -	func(has_fpga_dbg); \
>  	func(has_gmch); \
>  	func(has_hotplug); \
>  	func(has_hti); \
> @@ -177,7 +176,6 @@ struct intel_display_platforms {
>  #define HAS_FBC(__display)		(DISPLAY_RUNTIME_INFO(__display)->fbc_mask !=
=3D 0)
>  #define HAS_FBC_DIRTY_RECT(__display)	(DISPLAY_VER(__display) >=3D 30)
>  #define HAS_FBC_SYS_CACHE(__display)	(DISPLAY_VER(__display) >=3D 35 && =
!(__display)->platform.dgfx)
> -#define HAS_FPGA_DBG_UNCLAIMED(__display)	(DISPLAY_INFO(__display)->has_=
fpga_dbg)
>  #define HAS_FW_BLC(__display)		(DISPLAY_VER(__display) >=3D 3)
>  #define HAS_GMBUS_BURST_READ(__display)	(DISPLAY_VER(__display) >=3D 10 =
|| (__display)->platform.kabylake)
>  #define HAS_GMBUS_IRQ(__display)	(DISPLAY_VER(__display) >=3D 4)

--=20
Jani Nikula, Intel
