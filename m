Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADAFC5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 08:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6A610E3E7;
	Wed, 12 Aug 2026 08:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nCyopDZk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EAC10E3E5;
 Wed, 12 Aug 2026 08:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786522881; x=1818058881;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=XnNpBZ13UkxHg+2HBZQvJ0H/bEPUHRKu13EQzK90NY8=;
 b=nCyopDZkQs3ErdOFNitoT5P8mD1PakDMcYHcpSZ65uToUhZ8Cj3fQ6fi
 sagJz9istlpQjPOtBLiS5vf05hRC0JH/eR5tOTZtKbswYorCrF6mtmtDj
 e0v85eqf0tJAMkzACMlY0i1ZkqiDkzlmbACXwtQylTvqmFMTAclbgvtFT
 FkQsyQKAGco9rhNk+sL9O5ry04tM4Z45iZgN6evsysNyVDxmHiAsZAur8
 u8lBVjBOX1BMpcM4yBUZPdFLfHFmC7g7ecgcGzGu0pFThKUqZIbxmuQ5u
 a6CHeYJOejrsl6al1MiKGJaLSZUY9drPnyA4OqcIF6bgMMuN3JJCUtfu5 Q==;
X-CSE-ConnectionGUID: aK2csaAYTuWWF+X5PSF2Ew==
X-CSE-MsgGUID: NYVwEB0PS0CkSdLajqM3mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="109856300"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="109856300"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 01:21:20 -0700
X-CSE-ConnectionGUID: A+Fst3ryTyeGw9NDV2rhAA==
X-CSE-MsgGUID: z8wH+A2mRMyGYFem2/Ka+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="288319173"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.141])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 01:21:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Vinod Govindapillai
 <vinod.govindapillai@intel.com>, Mitul Golani
 <mitulkumar.ajitkumar.golani@intel.com>
Subject: Re: [v3 2/2] drm/i915/audio: Prune ELD SADs based on HDMI audio
 bandwidth
In-Reply-To: <20260812065427.3154985-3-chaitanya.kumar.borah@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260812065427.3154985-1-chaitanya.kumar.borah@intel.com>
 <20260812065427.3154985-3-chaitanya.kumar.borah@intel.com>
Date: Wed, 12 Aug 2026 11:21:13 +0300
Message-ID: <44efde31ad9f5dc4368bb84cc082f5d97dd8ec20@intel.com>
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

On Wed, 12 Aug 2026, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com=
> wrote:
> Add bandwidth check to determine whether a given audio sample rate and
> channel count can be carried within the hblank period for HDMI TMDS mode.
>
> Use this check to prune unsupported sample rates from each SAD in the
> ELD during intel_audio_compute_config(). SADs with no remaining
> supported rates are removed entirely.
>
> Sample rates are pruned rather than channel counts, since compressed
> formats (e.g. AC-3) are associated with specific channel counts.
>
> v2:
>  - Use DIV64_U64_ROUND_UP() instead of DIV_ROUND_UP_ULL() to avoid
>    do_div() truncating the 64-bit divisor to 32-bit, which caused
>    audio_packets_line to be wildly inflated and all SADs to be pruned.
>  - Guard intel_audio_hdmi_eld_compute_config() against HDMI FRL modes.
>    (Remove it when BW calculations for FRL are added.)
>
> v3:
>  - Rebase
>
> BSpec: 68944
> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Assisted-by: GitHub-Copilot:claude-opus-4.6
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_audio.c | 149 +++++++++++++++++++++
>  1 file changed, 149 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm=
/i915/display/intel_audio.c
> index eae76e961105..d59acb390f8a 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -39,6 +39,7 @@
>  #include "intel_display_types.h"
>  #include "intel_display_wa.h"
>  #include "intel_dp.h"
> +#include "intel_hdmi.h"
>  #include "intel_lpe_audio.h"
>=20=20
>  /**
> @@ -697,6 +698,151 @@ static void ibx_audio_codec_enable(struct intel_enc=
oder *encoder,
>  	mutex_unlock(&display->audio.mutex);
>  }
>=20=20
> +static bool hdmi_audio_rate_supported(const struct intel_crtc_state *crt=
c_state,
> +				      int available_tmds,
> +				      int audio_rate, int channels)
> +{
> +	const struct drm_display_mode *mode =3D &crtc_state->hw.adjusted_mode;
> +	int pixel_clk_max_hz;
> +	int audio_pkt_factor;
> +	u64 audio_pkt_rate_x4_x1000;
> +	int audio_packets_line;
> +	int hblank_overhead;
> +	int required_tmds;
> +
> +	/*
> +	 * Part 2: Calculate TMDS clock cycles required for Audio Bandwidth
> +	 *
> +	 * Step 1: pixelclk_max =3D nominal_pixel_rate * (1 + 0.5%)
> +	 * crtc_clock (kHz) * 1000 * 1.005 =3D crtc_clock * 1005 (Hz)
> +	 */
> +	pixel_clk_max_hz =3D mode->crtc_clock * 1005;
> +
> +	/*
> +	 * Steps 3-4: Audio Packet Rate.
> +	 *   R_AP =3D (audio_rate * AP + 2 * acrrate_max) * (1 + 1000 / 1e6)
> +	 *        =3D (audio_rate * AP + 2*1500) * 1.001
> +	 *
> +	 * AP =3D 0.25 (2ch) or 1.0 (3-8ch); acrrate_max =3D 1500 Hz (max ACR
> +	 * packet transmission rate per HDMI spec)
> +	 *
> +	 * Scale by 4*1000 to stay integer:
> +	 *  x4: eliminates AP=3D0.25 -> audio_pkt_factor=3D1(2ch) or 4(3-8ch),
> +	 *      scaled acrrate_max: 2 * 1500 * 4 =3D 12000
> +	 *  x1000: eliminates 1.001 -> *1000*1.001 =3D *1001
> +	 *
> +	 * R_AP * 4 * 1000 =3D (audio_rate * audio_pkt_factor + 12000) * 1001
> +	 */
> +	audio_pkt_factor =3D (channels <=3D 2) ? 1 : 4;
> +	audio_pkt_rate_x4_x1000 =3D (u64)(audio_rate * audio_pkt_factor + 12000=
) * 1001;
> +
> +	/*
> +	 * Steps 2+5-6: Audio packets per line.
> +	 *   AudioPackets_Line =3D CEIL[R_AP * htotal / f_pixelclk_max]
> +	 *
> +	 * With audio_pkt_rate_x4_x1000 =3D R_AP * 4 * 1000:
> +	 *   =3D CEIL[audio_pkt_rate_x4_x1000 * htotal / (4 * 1000 * pixel_clk_=
max_hz)]
> +	 */
> +	audio_packets_line =3D DIV64_U64_ROUND_UP(audio_pkt_rate_x4_x1000 * mod=
e->htotal,
> +						(u64)4 * 1000 * pixel_clk_max_hz);
> +
> +	/*
> +	 * Steps 7-9: Hblank overhead.
> +	 * Standard:  2*dip_guardband + 2*control_period + video_guardband
> +	 *          =3D 2*2 + 2*12 + 2 =3D 30
> +	 * HDCP 1.x:  rekey_period + dip_guardband + control_period + video_gua=
rdband
> +	 *          =3D 58 + 2 + 12 + 2 =3D 74
> +	 *
> +	 * Always use HDCP 1.x worst case (74) since HDCP can be toggled
> +	 * via fastset without compute_config.
> +	 */
> +	hblank_overhead =3D 74;
> +
> +	/*
> +	 * Step 10: Required TMDS cycles for Audio.
> +	 *  32 TMDS clock cycles per audio packet.
> +	 *   Hblank_audio_min =3D 32 * AudioPackets_Line + Hblank_overhead
> +	 */
> +	required_tmds =3D 32 * audio_packets_line + hblank_overhead;
> +
> +	/*
> +	 * Part 3: audio supported if Hblank_audio_min <=3D TB_blank and
> +	 * audio packets per line <=3D Maximum allowed packets per line (18)
> +	 */
> +
> +	return required_tmds <=3D available_tmds && audio_packets_line <=3D 18;
> +}
> +
> +static void intel_audio_hdmi_eld_compute_config(struct intel_crtc_state =
*crtc_state)
> +{
> +	static const int sad_freqs[] =3D {
> +		32000, 44100, 48000, 88200, 96000, 176400, 192000
> +	};
> +	const struct drm_display_mode *mode =3D &crtc_state->hw.adjusted_mode;
> +	int hblank =3D mode->htotal - mode->hdisplay;
> +	int bpc =3D crtc_state->pipe_bpp / 3;
> +	int ycbcr_420_divider =3D (crtc_state->output_format =3D=3D INTEL_OUTPU=
T_FORMAT_YCBCR420) ? 2 : 1;
> +	int available_tmds;
> +	u8 *eld =3D crtc_state->eld;
> +	int mnl =3D drm_eld_mnl(eld);
> +	int sad_count =3D drm_eld_sad_count(eld);
> +	int i =3D 0;
> +
> +	/* Only applies to HDMI TMDS, not FRL */
> +	if (intel_hdmi_is_frl(crtc_state->port_clock))
> +		return;
> +	/*
> +	 * Part 1: Calculate available TMDS clock cycles (TB_blank).
> +	 *
> +	 * TB_blank =3D CEILING[hblank * K_CD / K_420]
> +	 *
> +	 * K_CD =3D 1 for YCbCr4:2:2, bpc / 8 otherwise.
> +	 * K_420 =3D 2 for YCbCr4:2:0, 1 otherwise.
> +	 * Rearranged: CEILING[hblank * bpc / (8 * K_420)]
> +	 *
> +	 * TODO: As and when support for YCbCr4:2:2 is added, set bpc =3D 8
> +	 * to achieve K_CD =3D 1
> +	 */
> +	available_tmds =3D DIV_ROUND_UP(hblank * bpc, 8 * ycbcr_420_divider);
> +
> +	while (i < sad_count) {
> +		int sad_offset =3D DRM_ELD_CEA_SAD(mnl, i);
> +		int channels =3D (eld[sad_offset] & 0x7) + 1;
> +		u8 freq_mask =3D eld[sad_offset + 1];
> +		u8 new_freq_mask =3D 0;
> +		int bit;
> +
> +		for (bit =3D 0; bit < 7; bit++) {
> +			if (!(freq_mask & BIT(bit)))
> +				continue;
> +			if (hdmi_audio_rate_supported(crtc_state, available_tmds,
> +						      sad_freqs[bit], channels))
> +				new_freq_mask |=3D BIT(bit);
> +		}
> +
> +		eld[sad_offset + 1] =3D new_freq_mask;
> +
> +		if (!new_freq_mask) {
> +			/* Remove this SAD by compacting the rest */
> +			memmove(&eld[DRM_ELD_CEA_SAD(mnl, i)],
> +				&eld[DRM_ELD_CEA_SAD(mnl, i + 1)],
> +				(sad_count - i - 1) * 3);

What if there is no SAD i + 1?

> +			memset(&eld[DRM_ELD_CEA_SAD(mnl, sad_count - 1)], 0, 3);
> +			sad_count--;
> +			continue;
> +		}
> +		i++;

I believe it would all be more readable and robust if you used a for
loop to go through all the sads, without modifing the end conditions
while iterating, and used a separate destination index for when you have
to move sads over. And only moved the sads one at a time as you iterate,
not all the time.

Sometimes decrementing the sad_count and sometimes incrementing i makes
this difficult to reason.

> +	}
> +
> +	/* Update SAD count in ELD header */
> +	eld[DRM_ELD_SAD_COUNT_CONN_TYPE] &=3D ~DRM_ELD_SAD_COUNT_MASK;
> +	eld[DRM_ELD_SAD_COUNT_CONN_TYPE] |=3D sad_count << DRM_ELD_SAD_COUNT_SH=
IFT;
> +
> +	/* Recalculate baseline ELD length (in dwords) */
> +	eld[DRM_ELD_BASELINE_ELD_LEN] =3D
> +		DIV_ROUND_UP(drm_eld_calc_baseline_block_size(eld), 4);
> +}
> +
>  static
>  bool intel_audio_needs_cpu_transcoder_id(const struct intel_crtc_state *=
crtc_state)
>  {
> @@ -725,6 +871,9 @@ bool intel_audio_compute_config(struct intel_encoder =
*encoder,
>  	BUILD_BUG_ON(sizeof(crtc_state->eld) !=3D sizeof(connector->eld));
>  	memcpy(crtc_state->eld, connector->eld, sizeof(crtc_state->eld));
>=20=20
> +	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
> +		intel_audio_hdmi_eld_compute_config(crtc_state);
> +
>  	crtc_state->eld[6] =3D drm_av_sync_delay(connector, adjusted_mode) / 2;
>  	mutex_unlock(&connector->eld_mutex);

--=20
Jani Nikula, Intel
