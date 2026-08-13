Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7CCC5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 12:34:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF2110E00E;
	Thu, 13 Aug 2026 12:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HrTBh+fz";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA7B10E021;
 Thu, 13 Aug 2026 12:34:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AC46D600AD;
 Thu, 13 Aug 2026 12:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B281F00A3A;
 Thu, 13 Aug 2026 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786624472;
 bh=ySOnfFXGJRTsXQuN5H1QeIV4P7rYYOH9+XT4itum88Y=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=HrTBh+fzJ9UjzRJv8pSWKA1XMpF5RlPNq0rp26lZMWOgysPAs016xwW8QV7YM3sPb
 7KGNSvEoiNYUDCpwyFJbCKetK6BsTVAGHNZ0nj68Thd8nphiNridywl7Dpb4MXL0Cj
 cvbNOkOiYCStWtps4W5VM3EGX0+J++u5QmEhFnJB44tfKQyKJc4a9ofQclq5ee/iZK
 Nt50ppGSa+JwCVzBdIeEhuqEaeYsgN8ORSsFImD6/ZN//oqgbptM0PjClTlRQ5CzRW
 99ZHZ2+MFHrbqt0N48Tr/44I822vXD5okI/3k3fwi3dLUOzMXEqRRVYnS98m6cHjXm
 tYldjWn2lTt9g==
From: sashiko-bot@kernel.org
Subject: Re: [v4 2/2] drm/i915/audio: Prune ELD SADs based on HDMI audio
 bandwidth
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260813120016.3444891-3-chaitanya.kumar.borah@intel.com>
References: <20260813120016.3444891-1-chaitanya.kumar.borah@intel.com>
 <20260813120016.3444891-3-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 12:34:31 +0000
Message-Id: <20260813123432.23B281F00A3A@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The bandwidth check incorrectly uses the maximum pixel clock ins=
tead of the minimum pixel clock to calculate worst-case audio packet accumu=
lation per line.
--

--- Patch [2]: [v4 2/2] drm/i915/audio: Prune ELD SADs based on HDMI audio =
bandwidth ---
commit fa98484a48f1957f560711682a22233b5a6fa1f5
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

drm/i915/audio: Prune ELD SADs based on HDMI audio bandwidth

This commit adds a bandwidth check to determine whether a given audio
sample rate and channel count can be carried within the hblank period
for HDMI TMDS mode. It uses this check to prune unsupported sample rates
from each SAD in the ELD.

> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm=
/i915/display/intel_audio.c
> index eae76e9611055..9eb6867fa3f3a 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c

[ ... ]

> @@ -697,6 +698,158 @@ static void ibx_audio_codec_enable(struct intel_enc=
oder *encoder,

[ ... ]

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

[ ... ]

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

[Severity: Medium]
To calculate the worst-case (maximum possible) required audio packets per l=
ine,
should this logic use the minimum possible pixel clock instead of the maxim=
um?

A slower pixel clock means a video line takes longer to transmit in real ti=
me,
causing more audio packets to accumulate in the FIFO during that line. These
accumulated packets then require more TMDS bandwidth to transmit during the
corresponding blanking period.

By multiplying the nominal clock by 1005 (adding 0.5% tolerance) instead of
995 (subtracting 0.5% tolerance) and using it as a divisor here, the code
calculates the minimum required packets instead of the maximum. This optimi=
stic
calculation could incorrectly allow audio configurations that will overflow
the HDMI audio FIFO and cause audio dropouts when the pixel clock runs at
nominal or slower speeds.

Although this matches the exact naming in the 'f_pixelclk_max' comment
(suggesting a likely typo in the underlying BSpec/HDMI hardware specificati=
on),
is it mathematically flawed for a worst-case capability bounds check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813120016.3444=
891-1-chaitanya.kumar.borah@intel.com?part=3D2
