Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B99C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 17:22:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DA410F190;
	Tue, 15 Sep 2026 17:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KRJxlgxy";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E47C10E47F;
 Tue, 15 Sep 2026 17:22:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3524D40F08;
 Tue, 15 Sep 2026 17:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0EBF1F000FF;
 Tue, 15 Sep 2026 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789492939;
 bh=oWTtDaIZvqr28Nu2WzX3EpfvWoUVQLrGReQwnXUCuSc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=KRJxlgxyk+/CwQyusicd4X198OG1Vym8ZKsCZ7g+ZO1euEIKSsmWKF33zElb5xxg+
 Tqab9buI9tlNJasJFDMkj+j6onsZ6xSZdRuSjhFpW2120RA13uBNAfHjaAJMXMhPPV
 D5N2VPM+JGX626dlkQRPwf7dIeQP61T3lhitXn3iLNxUovjyuHkwcpfm3XRiHvPgAt
 NyY1wKkrwK1d0m2WcwSNXezIVMV1CkDajh9YANnv6DpAlayAC3zrFDpR7UzaHTaKfq
 Peq9I18VJEDt8UeaYYqVy8Yu7db6qxFnFNAhW1u1SYZf2PvLmRnzurRBh4Dzupa1om
 MNowqU6wgc0Qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/14] drm/i915/dip: Store and use AS SDP
 transmission line from crtc state
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260915164657.3429075-7-ankit.k.nautiyal@intel.com>
References: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
 <20260915164657.3429075-7-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 17:22:18 +0000
Message-Id: <20260915172218.D0EBF1F000FF@smtp.kernel.org>
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
- [Medium] drm/i915/dip: Spurious state mismatch for EMP_AS_SDP_TL on HDMI =
fastsets
--

commit 33aef03ce9383e1676d66a385c5b27a724956776
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: drm/i915/dip: Store and use AS SDP transmission line from crtc sta=
te

The driver computes and stores the Adaptive Sync SDP transmission line in t=
he
crtc state and uses it when programming the EMP_AS_SDP_TL register. This
prepares the ground for supporting programmable transmission lines for
additional DP SDPs.

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
Will this trigger a spurious state mismatch for EMP_AS_SDP_TL on HDMI fasts=
ets?

If a non-DP (e.g., HDMI) connection inherits a non-zero EMP_AS_SDP_TL value
from a BIOS handover or a previous DP VRR mode, the hardware state
(hw_crtc_state) will reflect this non-zero value.

This happens because intel_dip_sdp_transmission_line_get_config()
unconditionally reads the register here via intel_dip_read_emp_as_sdp_tl()
without verifying if the encoder is DP:

drivers/gpu/drm/i915/display/intel_dip.c:intel_dip_read_emp_as_sdp_tl() {
    ...
    val =3D intel_de_read(display, EMP_AS_SDP_TL(display, cpu_transcoder));
    return REG_FIELD_GET(EMP_AS_SDP_DB_TL_MASK, val);
}

Meanwhile, the software state (sw_crtc_state) expects 0 for HDMI since
intel_dip_sdp_tl_compute_config_late() is only called for DP.

Because the dip.emp_as_sdp_tl comparison is guarded by if (!fastset) in
intel_pipe_config_compare(), the discrepancy is ignored during the fastset
compatibility check, allowing a fastset to proceed.

The fastset skips reprogramming the VRR transcoder timings, leaving the
hardware register at its stale non-zero value.

During post-commit hardware verification in verify_crtc_state(),
intel_pipe_config_compare() is called with fastset =3D false, which strictly
checks the field. This causes a drm_WARN backtrace when comparing the expec=
ted
0 against the stale non-zero hardware value.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915164657.3429=
075-1-ankit.k.nautiyal@intel.com?part=3D6
