Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1C7606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JXlJMz/5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95276112AFE;
	Fri, 20 Nov 2026 14:41:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F084112AFE;
 Fri, 20 Nov 2026 14:41:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0A850627EA;
 Fri, 20 Nov 2026 14:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8645F1F000C6;
 Fri, 20 Nov 2026 14:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795185676;
 bh=Hf41jrP8MrmqOsLt0PjtCz3fD5Wd9Dw1HNdI7KYRk58=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=JXlJMz/5v46u2Yd3N1cK8wcQhflj8ZiLu9tJ+mYNXoh9NRGq0q0PZtzhuXIu4SFRG
 mXucNlOcXoR1NtNUmmMveD/9Eeo9oUYRGgoNUcLFKrwWqlo/St1oPme+3pfiX4kZ1N
 Jtc8QAOTx2I/Rn4mAvcUEObQVyxs5/G6aofsUHmyWR2TG/yoQ/84IOFpGwQQxblX97
 4GXnI3vndDdQn+4KxQhYeZ1hjmGzSYwQ+2qp5HziwSsAHUbH+Ifl2k2vYYI1js9gDY
 JPeEBI6DNRPl4GWxz1aeq7tYx4f2LWMbV9vKalXgNBPPwSeYuQe+XT/+E/Pk54s1ux
 CUiAktJZ3zUOg==
Message-ID: <sashiko-outbox-225399@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 25/29] drm/i915/dp: Allow limiting the DSC slice count
 for the downstream device
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261120140729.466177-26-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
 <20261120140729.466177-26-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 14:41:16 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/i915/dp: DFP slice limits bypassed in UHBR TU and
  min_hblank paths
--

commit ebe2f0e6460b71fe1655c9706717ef4b175b371c
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dp: Allow limiting the DSC slice count for the downstream device

This commit adds minimum and maximum downstream facing port DSC slice count
limits to struct link_config_limits and applies them when selecting a DSC
slice configuration.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0ac4e26666c30..1cd5385618ddb 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
[ ... ]
> @@ -971,7 +977,7 @@ u8 intel_dp_dsc_get_slice_count(const struct intel_co=
nnector *connector,
> =20
>  	if (!intel_dp_dsc_get_slice_config(connector,
>  					   mode_clock, mode_hdisplay,
> -					   num_joined_pipes, &config))
> +					   num_joined_pipes, 0, INT_MAX, &config))
>  		return 0;
> =20
>  	return intel_dsc_line_slice_count(&config);
> @@ -2616,6 +2622,8 @@ int intel_dp_dsc_compute_config(struct intel_dp *in=
tel_dp,
> =20
>  	if (!intel_dp_dsc_get_slice_config(connector, adjusted_mode->crtc_clock,
>  					   adjusted_mode->crtc_hdisplay, num_joined_pipes,
> +					   limits->dfp_dsc.min_slices,
> +					   limits->dfp_dsc.max_slices,
>  					   &pipe_config->dsc.slice_config))
>  		return -EINVAL;

[Severity: Medium]
Does passing 0 and INT_MAX in intel_dp_dsc_get_slice_count() cause UHBR link
TU calculations and intel_dp_compute_min_hblank() to use an unconstrained
slice count when limits->dfp_dsc restricts the downstream slice count?

Before intel_dp_dsc_compute_config() populates
pipe_config->dsc.slice_config with limits->dfp_dsc,
intel_dp_dsc_compute_pipe_bpp() -> dsc_compute_compressed_bpp() ->
dsc_compute_link_config() calls intel_dp_mtp_tu_compute_config() on UHBR
links, which queries the slice count via
intel_dp_mst_dsc_get_slice_count() -> intel_dp_dsc_get_slice_count().
Later, intel_dp_compute_min_hblank() also calls
intel_dp_dsc_get_slice_count() instead of reading
intel_dsc_line_slice_count(&crtc_state->dsc.slice_config).  When a
downstream device requires a higher minimum (or lower maximum) slice count
than the DP sink, DSC EOC overhead, pipe_config->dp_m_n, and
pipe_config->min_hblank will be computed for a different slice count than
the one programmed in pipe_config->dsc.slice_config.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120140729.4661=
77-1-ankit.k.nautiyal@intel.com?part=3D25
