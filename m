Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB624CD98CC
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 07:35:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB8110ED33;
	Thu, 11 Jun 2026 07:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vh8vz+Xt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114D910ED31;
 Thu, 11 Jun 2026 07:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781163352; x=1812699352;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=NxwFuOOfBuQHRSg+AewCTBCkyEAKE3qSMNSGn2V3+M4=;
 b=Vh8vz+XtpOY4ECnihQwl+3KxIphkhlyx0p3pIu+Ti13SY3gK7vpLxWbf
 gpz4F3YmeADi/a1Y3D343xoueyKnMPGjaoQ5uJpfvUqGeQTqTaxxzHfoM
 eNZ3vaBiV59BdUQ8GaZLnn5lPUWrjRdeZJmnJNRnrjRcqu1fYEEgVnwFm
 sPZX+LzUy4L5jarBNvtXOPjEAL11u/5lVdVR2y7KkvNjdFy8zGz4c1LMF
 FkcHUpBlb4so1a7nB3Gq5hhn7rmBBJnGamA7n97zzifXdAl5FhS7OEtjA
 LVETirXJE0OTDWsD3t51r2RFJ0vIFrh1Pi1Zj7kDhB08AnjyBLN1++fA8 w==;
X-CSE-ConnectionGUID: DBewdCjaTKaFcQ6iic5sdQ==
X-CSE-MsgGUID: 9T64CmJdQyWc2tyC74l65A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99393271"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="99393271"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:35:52 -0700
X-CSE-ConnectionGUID: twHR9Y1XQ8yekJHZ3/yW5A==
X-CSE-MsgGUID: Gu8cPF1qS06sbwhwgYQGOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="276595125"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:35:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 05/14] drm/i915/cdclk: Stop forcing voltage level to 3
 all the time on DG2
In-Reply-To: <20260610170652.5320-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
 <20260610170652.5320-6-ville.syrjala@linux.intel.com>
Date: Thu, 11 Jun 2026 10:35:47 +0300
Message-ID: <17dfe2a76cf38cc821160283b9f87c3530250a30@intel.com>
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

On Wed, 10 Jun 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> SKL_CDCLK_PREPARE_FOR_CHANGE =3D=3D DISPLAY_TO_PCODE_VOLTAGE(3) so
> we are currently forcing the voltage level to 3 all the time on
> DG2. Remove SKL_CDCLK_PREPARE_FOR_CHANGE from the mask to avoid
> this.

Fixes: ?

The pcode mailbox defines are a mess.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm=
/i915/display/intel_cdclk.c
> index 7259048361a7..ecb6be3383ca 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2598,7 +2598,6 @@ static void intel_pcode_notify(struct intel_display=
 *display,
>  		update_mask |=3D DISPLAY_TO_PCODE_PIPE_COUNT_VALID;
>=20=20
>  	ret =3D intel_parent_pcode_request(display, SKL_PCODE_CDCLK_CONTROL,
> -					 SKL_CDCLK_PREPARE_FOR_CHANGE |
>  					 update_mask,
>  					 SKL_CDCLK_READY_FOR_CHANGE,
>  					 SKL_CDCLK_READY_FOR_CHANGE, 3);

--=20
Jani Nikula, Intel
