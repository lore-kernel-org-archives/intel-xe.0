Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F398C88E5C
	for <intel-xe@archiver.kernel.org>; Sun, 13 Sep 2026 15:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84BC10E09B;
	Sun, 13 Sep 2026 15:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iJfS+YWU";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E8110E09B;
 Sun, 13 Sep 2026 15:30:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E624C43447;
 Sun, 13 Sep 2026 15:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E951F000FF;
 Sun, 13 Sep 2026 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789313437;
 bh=mJclRgtnE0rpm098qEiX5nArpY+PgT2Brnb8iMoz3KM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=iJfS+YWUGaUUHCVnDWp4LurZvcI6s28ylfZ9R0p3R+31dEKv96jLuP77a0kAuqZBV
 eUtxwnwkxWFW96nsjLnegPE+0fOGIBJAqH2BM8Cdp/5X476sZ7/OWpuceee1aHGa2+
 nzIYF0689Xf69Sne+zVGsFYW7Q4QtePyuPX+aDvTv7ynRL6D7s+ZKRZyeJ3caNV3WH
 1GOVV9Ujw4ijuDdxWWoK/LMkVKIgLS4DyVVxZ5wCQ/YmwKd6uncLn6zi1ufUYVzT/l
 smK4FIh0pPs5lhkIaYt43kAQUGalc1r8TCD1l0wXTZHH3BajVPizQOeIi4VNrwnpob
 E/0ymZUzwH5fQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/13] drm/i915/dip: Store and use AS SDP
 transmission line from crtc state
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260913145649.3240904-7-ankit.k.nautiyal@intel.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
 <20260913145649.3240904-7-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 15:30:37 +0000
Message-Id: <20260913153037.94E951F000FF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Spurious state mismatch warning due to un-cleared EMP_AS_SDP_TL =
register for non-VRR and HDMI modesets.
- [Low] AS SDP transmission line is computed unconditionally for DP, contra=
dicting the commit message claim.
--

commit 058f1f7445f91002d16b429b35d8a7cd903b86af
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dip: Store and use AS SDP transmission line from crtc state

Computes and stores the Adaptive Sync SDP transmission line in the
crtc state rather than computing it at programming time.

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index 9b3b526e5e55b..dacb4b7588a02 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
[ ... ]
> @@ -4235,6 +4236,7 @@ static void intel_ddi_get_config(struct intel_encod=
er *encoder,
>  	intel_read_dp_sdp(encoder, pipe_config, HDMI_PACKET_TYPE_GAMUT_METADATA=
);
>  	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
>  	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_ADAPTIVE_SYNC);
> +	intel_dip_sdp_transmission_line_get_config(pipe_config);

[Severity: Medium]
Will this lead to a state mismatch warning on non-VRR or HDMI modesets?

When transitioning from a DP monitor with VRR enabled to an HDMI monitor or=
 DP
with VRR disabled, intel_vrr_possible() returns false. This causes
intel_vrr_set_transcoder_timings() to return early without calling
intel_dip_write_emp_as_sdp_tl():

drivers/gpu/drm/i915/display/intel_vrr.c:intel_vrr_set_transcoder_timings()=
 {
	if (!intel_vrr_possible(crtc_state)) {
		intel_de_write(display,
			       TRANS_VRR_CTL(display, cpu_transcoder), 0);
		return;
	}
	...
	intel_dip_write_emp_as_sdp_tl(crtc_state);
}

Since intel_dip_write_emp_as_sdp_tl() is skipped, the EMP_AS_SDP_TL hardware
register is left with a stale non-zero value.

Will intel_pipe_config_compare() now throw a state mismatch error because t=
he
software state is computed as 0 for HDMI, but the hardware register retains
the stale VRR value read here?

> =20
>  	intel_audio_codec_get_config(encoder, pipe_config);
>  }
[ ... ]
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0cd5e6b5034cf..8c3a324e164ec 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
[ ... ]
> @@ -7324,6 +7325,8 @@ int intel_dp_sdp_compute_config_late(struct intel_c=
rtc_state *crtc_state)
>  		return -EINVAL;
>  	}
> =20
> +	intel_dip_sdp_tl_compute_config_late(crtc_state);

[Severity: Low]
Does this execute unconditionally for DP, contradicting the commit message?

The commit message states: "we must configure the AS SDP transmission line =
at
this point when AS SDP is enabled in crtc_state."

However, this is called without checking if DP_SDP_ADAPTIVE_SYNC is actually
present in crtc_state->infoframes.enable, which populates the software state
variable with vsync_start even when AS SDP is not enabled. Should this have=
 a
conditional check?

> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913145649.3240=
904-1-ankit.k.nautiyal@intel.com?part=3D6
