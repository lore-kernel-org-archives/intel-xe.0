Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195331073CBF
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 14:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46A610E336;
	Wed,  8 Apr 2026 14:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHUcPyS7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210C310E336;
 Wed,  8 Apr 2026 14:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775657067; x=1807193067;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=N/0mO0AcHt1PSMlAjX412S/PtkgbjPEPqbt52y0UrE8=;
 b=lHUcPyS7ZtU0WcJEM/DlheYGNw9/No4ediiyImZ4QtzG+X4G93CUvPhQ
 ImOAqG9/GZPWHoMNRePaGqTETBwCbsXu9V55qGFuFqh1LxX56o+AbkOQa
 8+LY0HgCFijXm+a5W27h6wVDI5yVpydbO3JUloxzCnCAwpdfgNcsXqgzn
 GD0JmlOQVHld2ipHRhxmv5vOmMc4neqJD7HP7umPKM67DaJyVivhcjKwO
 jXL4qmsFXnPu/HnhlBqw44x8MuChW4+u4v4J6Yv9+C2SJ+32uWQNvGiq2
 5SDDtQwVsTE+q3yUnyGrsHLQm3WHp0QeVR11PdHZaUC57anjp6/j4MHFU g==;
X-CSE-ConnectionGUID: cHM/BtV3Ru+Kqq9OlW4WVw==
X-CSE-MsgGUID: 8hgAHOv5Rj6G0Z9GdYg2SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="102094076"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="102094076"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 07:04:27 -0700
X-CSE-ConnectionGUID: YV3TS/FnT/6B8OZEUpNLOA==
X-CSE-MsgGUID: lR4NzSi+Qq+tPBOoVAhAGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="221954660"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 07:04:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: Re: [PATCH 4/7] drm/i915/psr: Add new macro for accessing cached
 PSR DPCD registers
In-Reply-To: <20260408140059.252067-5-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260408140059.252067-1-jouni.hogander@intel.com>
 <20260408140059.252067-5-jouni.hogander@intel.com>
Date: Wed, 08 Apr 2026 17:04:22 +0300
Message-ID: <dcb80b09f5fe72f11f4aaea59f1ed2c3495563f8@intel.com>
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

On Wed, 08 Apr 2026, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> Add new macro to ease accessing cached PSR DPCD registers.
>
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index e2496db1642a..7d04867e3053 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -584,6 +584,7 @@ struct intel_connector {
>=20=20
>  		struct {
>  			u8 dpcd[EDP_PSR_RECEIVER_CAP_SIZE];
> +#define INTEL_PSR_DPCD_INDEX(psr_dpcd_register)	((psr_dpcd_register) - D=
P_PSR_SUPPORT)

Dunno, feels like maybe this should be in intel_psr.c. The point being,
that the whole member should basically be off-limits outside of
intel_psr.c.

BR,
Jani.

>=20=20
>  			bool support;
>  			bool su_support;

--=20
Jani Nikula, Intel
