Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C11C561E6
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 09:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AB510E2EC;
	Thu,  6 Aug 2026 09:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/1fyS1c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1432810E2EC;
 Thu,  6 Aug 2026 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786008622; x=1817544622;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Ah5kciwFVq/814S/NswUGKga8JdyJFjNhvvd2dNB/iU=;
 b=R/1fyS1c4II6TwRct8n9dBOZSkMinpSwdDQ/WDkA42AVbSV9MFNMlVlQ
 T+y2Q6iuI65P6Nc/Zi9rRiizMVUqgJHoQ7kSD8APez9qYPzb1X8KjVQpZ
 vNvwcqUkGAtouecK6UvOZfdNw5yA7n7cUPoBP9dBsKvxtTb/jc7rRIsVp
 H/UNrAMuk3jnNgxRUOFJHD0R8pDTiOQXQD/6h5psglXK3iratuuA5HF/K
 4PTGzB6/BPKBI0V2mGrPfSpHH1ZRAzVCce389oFwaI+CXBuif+QoD4Xyu
 9LzjHaLG8XSG7SBeSGGsEaKi8SSCaS2gXiLtBbXXOGZTPQ8fblyVFSPJd A==;
X-CSE-ConnectionGUID: PFQxO0eTQP2eA/wUV7jIsw==
X-CSE-MsgGUID: zn+5bVUMTneJBCGMIfxZqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="104130248"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="104130248"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 02:30:21 -0700
X-CSE-ConnectionGUID: NPcUvLcoQr69po+vPBl10Q==
X-CSE-MsgGUID: bnMQQ217TNul4VvgM6UZ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="266282131"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.228])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 02:30:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH] drm/i915/dp_mst: Remove duplicate
 intel_pfit_compute_config() call
In-Reply-To: <20260806074819.2631970-1-chaitanya.kumar.borah@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260806074819.2631970-1-chaitanya.kumar.borah@intel.com>
Date: Thu, 06 Aug 2026 12:30:16 +0300
Message-ID: <aeb1e53100b0b28c557061a706fe2ffb04a662d5@intel.com>
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

On Thu, 06 Aug 2026, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com=
> wrote:
> mst_stream_compute_config() called intel_pfit_compute_config() twice
> in a row. Probably because of a bad merge. Drop the redundant duplicate
> call.
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Nemesa Garg <nemesa.garg@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Fixes: 5ce9ac1531b8 ("drm/i915/mst: Call intel_pfit_compute_config() for =
sharpness filter")

Rodrigo, by the looks of it, this was an unnecessary cherry-pick for
fixes. The context for 5ce9ac1531b8 shows the existing call, so I don't
think this is a merge failure. But why it happened, no idea!

BR,
Jani.


> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 3be1643f8d03..57daed0b0b36 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -761,10 +761,6 @@ static int mst_stream_compute_config(struct intel_at=
omic_state *state,
>  	pipe_config->sink_format =3D INTEL_OUTPUT_FORMAT_RGB;
>  	pipe_config->output_format =3D INTEL_OUTPUT_FORMAT_RGB;
>=20=20
> -	ret =3D intel_pfit_compute_config(pipe_config, conn_state);
> -	if (ret)
> -		return ret;
> -
>  	ret =3D intel_pfit_compute_config(pipe_config, conn_state);
>  	if (ret)
>  		return ret;

--=20
Jani Nikula, Intel
