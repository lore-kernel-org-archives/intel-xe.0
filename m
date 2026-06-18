Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E91CD98F6
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 14:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B3210E7CA;
	Thu, 18 Jun 2026 14:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hhxAW0bj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F007E10E3E1;
 Thu, 18 Jun 2026 14:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781794762; x=1813330762;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=vZdJ/yC9yiuAFdW81W5wG26AjPAuQANx+KyaXvkLYEE=;
 b=hhxAW0bjjDlH3mISB0d4cuJeZk5yu5BOBB3pdI3qZE/DgUkzh525cYFm
 sPT/2m+fJQrYv7BxGyRUkQU1qHxsYmnJY35SFC2rQEqWHxSBWqTG8DBtK
 S1EoeLP3Rh4gDpQhFiiWpzx/Z7BaBBn838ImWi6IE/Ncol0qNbjtszbR4
 4bNfQ5CIjm0ch4/eLvqiuLrjeJGcvVHhXVYphj+Rnp1QxFPVYLHLDo3oJ
 VFTkZV5AkMp4W4xp6S+jCFWzHzq7aNCHHNP/sYwnyVSTtmeUXTVWt0Mg6
 F0GfXAIyCdem95LQG+qdmpALOs4UaPUKctoeAGoNrIjS5yfVRa3JpH+dU A==;
X-CSE-ConnectionGUID: K4bVKhcQRimd8a/gt69Fzw==
X-CSE-MsgGUID: qEnbvp42SEGlK6Va2b7wIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82828935"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="82828935"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 07:59:22 -0700
X-CSE-ConnectionGUID: PrDydHVWS32IdiEyhpIGuA==
X-CSE-MsgGUID: 3BWA0gLHRvCpGX8JA+47QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="278566973"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 07:59:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>, Nemesa Garg
 <nemesa.garg@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 3/3] drm/i915/scaler: return -EINVAL instead of -1
In-Reply-To: <20260615190839.1219417-4-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260615190839.1219417-1-michal.grzelak@intel.com>
 <20260615190839.1219417-4-michal.grzelak@intel.com>
Date: Thu, 18 Jun 2026 17:59:17 +0300
Message-ID: <973593167a4c5c2077ee92f13e97857624800e49@intel.com>
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

On Mon, 15 Jun 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> Scaler allocation fails returning -1 which equates to -EPERM. Return
> -EINVAL instead. Also apply for skl_pipe_scaler_get_hw_state().
>
> Fixes: e2255e9a5a77 ("drm/i915/scaler: abstract scaler searching loop")
> Fixes: ecf2afc59c1e ("drm/i915/scaler: Extract intel_allocate_scaler()")

Same as in patch 1. There is no bug that needs fixing. The trailers are
superfluous.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> Cc: Nemesa Garg <nemesa.garg@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/skl_scaler.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/=
i915/display/skl_scaler.c
> index 0cfa5b7564ba8..c339fdd6936fa 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -351,7 +351,7 @@ static int intel_allocate_scaler(struct intel_crtc_sc=
aler_state *scaler_state,
>  		return scaler_id;
>  	}
>=20=20
> -	return -1;
> +	return -EINVAL;
>  }
>=20=20
>  static void
> @@ -848,7 +848,7 @@ static int skl_pipe_scaler_get_hw_state(struct intel_=
crtc_state *crtc_state)
>  			return scaler_id;
>  	}
>=20=20
> -	return -1;
> +	return -EINVAL;
>  }
>=20=20
>  void

--=20
Jani Nikula, Intel
