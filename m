Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDD3CCF2E3
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 12:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030F410E9B4;
	Mon, 19 Oct 2026 12:07:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A12E10E5E4;
 Mon, 19 Oct 2026 12:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792411618; x=1823947618;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=FOgI2pD5DF14yilwU0km4ecaV8uZgBQfHBjN/62/KYU=;
 b=CNArp2DSYJSuFTMdCJzmgl5tV9P48ilX2h3swx4he3cACaBVdMJXmeXJ
 wpQ25w6eJwRtJNceqHC7fZLPtleMxHeyHeXSW0f1bscWQjAXFElZ/tnyg
 SQ2hN1x3W084JiOVi+u8SI4IqK0rwGF9USU5b7La9tGgWmMHOCu/6+lYm
 wkSaRLn7EfwDQLsTl4jbg4cUkrYAGKI0ymJXFz3DptuoLTjRVoQIsTpkG
 wmkifVWOWXfk226Kw6heEjk1RsioKypuxP+Z7ClNTeX3WJPSLHII8INOM
 M/anCbOtsmwvnu39Eq28yx907KYxlKYyzBR7MdYpQq4LQQkCXSeSokCQE A==;
X-CSE-ConnectionGUID: ODwHVMBKTcO3aDp5MdZFMQ==
X-CSE-MsgGUID: Cpi9zb/8TsKfdXkfSKY8Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1076937"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1076937"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 05:06:57 -0700
X-CSE-ConnectionGUID: YoPx8YODQpiVZqMaiYkKDg==
X-CSE-MsgGUID: gMV/LQD4Q+u5VOk8JqDu3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4305833"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 05:06:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH] drm/i915/mst: let the branch-sink check uncompressed
 with 18bpp
In-Reply-To: <20260804094450.125307-1-arun.r.murthy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260804094450.125307-1-arun.r.murthy@intel.com>
Date: Mon, 19 Oct 2026 15:06:53 +0300
Message-ID: <e533815b60c86e9a49aabd9f59096d282707e3d9@intel.com>
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

On Tue, 04 Aug 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> mst_connector_mode_valid_ctx() uses a single 18bpp floor for both
> the source-link BW check and the last-branch=E2=86=92sink PBN check, and
> only drops it to the DSC-compressed minimum when the branch is in
> DSC pass-through mode. This rejects modes on topologies where the
> branch decodes DSC locally =E2=80=94 the source=E2=86=92branch segment is=
 actually
> compressed and should not be gated by the 18bpp floor, while only
> the last-branch=E2=86=92sink segment needs to remain at 18bpp.
>
> The source-to-first-branch MST link carries DSC-compressed data
> whenever any device along the path (a DSC pass-through branch, an
> intermediate decoder-in-branch, or the endpoint sink) is able to
> decode DSC. In all those cases the source can emit the stream
> compressed and the check against the source link BW should use the
> minimum compressed bpp, not the uncompressed 18bpp floor.
>
> The last-branch-to-sink segment however is only compressed when the
> path is true DSC pass-through; if the branch decodes locally and
> re-transmits uncompressed, that segment must still fit at the
> uncompressed 18bpp floor. That case is handled via port->full_pbn
> below.
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16640
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 23 +++++++++------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 3be1643f8d03..2e8f4c31e07f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1519,7 +1519,8 @@ mst_connector_mode_valid_ctx(struct drm_connector *=
_connector,
>  	int max_rate, mode_rate, max_lanes, max_link_clock;
>  	unsigned long bw_overhead_flags =3D
>  		DRM_DP_BW_OVERHEAD_MST | DRM_DP_BW_OVERHEAD_SSC_REF_CLK;
> -	int min_link_bpp_x16 =3D fxp_q4_from_int(18);
> +	int src_min_link_bpp_x16 =3D fxp_q4_from_int(18);
> +	int sink_min_link_bpp_x16 =3D fxp_q4_from_int(18);

I don't understand what "src link" and "sink link" are supposed to mean
here.

You have a source and its constraints. You have a sink and its
constraints. And you have a link between the source and the sink, with
the constraints of both.

BR,
Jani.

>  	struct intel_dp_link_config max_bw_config;
>  	static bool supports_dsc;
>  	int ret;
> @@ -1549,9 +1550,13 @@ mst_connector_mode_valid_ctx(struct drm_connector =
*_connector,
>  	supports_dsc =3D intel_dp_has_dsc(connector) &&
>  		       drm_dp_sink_supports_fec(connector->dp.fec_capability);
>=20=20
> +	if (supports_dsc && connector->dp.dsc_decompression_aux)
> +		src_min_link_bpp_x16 =3D
> +			intel_dp_compute_min_compressed_bpp_x16(connector,
> +								INTEL_OUTPUT_FORMAT_RGB);
> +
>  	if (supports_dsc && connector->mst.port->passthrough_aux)
> -		min_link_bpp_x16 =3D intel_dp_compute_min_compressed_bpp_x16(connector,
> -									   INTEL_OUTPUT_FORMAT_RGB);
> +		sink_min_link_bpp_x16 =3D src_min_link_bpp_x16;
>=20=20
>  	intel_dp_link_caps_get_max_bw_config(intel_dp->link.caps, &max_bw_confi=
g);
>  	max_link_clock =3D max_bw_config.rate;
> @@ -1561,19 +1566,11 @@ mst_connector_mode_valid_ctx(struct drm_connector=
 *_connector,
>  					       max_link_clock, max_lanes);
>  	mode_rate =3D intel_dp_link_required(max_link_clock, max_lanes,
>  					   mode->clock, mode->hdisplay,
> -					   min_link_bpp_x16,
> +					   src_min_link_bpp_x16,
>  					   bw_overhead_flags);
>=20=20
>  	/*
>  	 * TODO:
> -	 * - Also check if compression would allow for the mode
> -	 *   in non-passthrough mode, i.e. the last branch device
> -	 *   decompressing the stream. This makes a difference only if
> -	 *   the BW on the link between the last branch device and the
> -	 *   sink is higher than the BW on the whole MST path from the
> -	 *   source to the last branch device. Relying on the extra BW
> -	 *   this provides also requires the
> -	 *   DFP_Link_Available_Payload_Bandwidth_Number described below.
>  	 * - Calculate the overhead using drm_dp_bw_overhead() /
>  	 *   drm_dp_bw_channel_coding_efficiency(), similarly to the
>  	 *   compute config code, as drm_dp_calc_pbn_mode() doesn't
> @@ -1588,7 +1585,7 @@ mst_connector_mode_valid_ctx(struct drm_connector *=
_connector,
>  		return ret;
>=20=20
>  	if (mode_rate > max_rate ||
> -	    drm_dp_calc_pbn_mode(mode->clock, min_link_bpp_x16) > port->full_pb=
n) {
> +	    drm_dp_calc_pbn_mode(mode->clock, sink_min_link_bpp_x16) > port->fu=
ll_pbn) {
>  		*status =3D MODE_CLOCK_HIGH;
>  		return 0;
>  	}

--=20
Jani Nikula, Intel
