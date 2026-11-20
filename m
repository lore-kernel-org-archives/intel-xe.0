Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B182606A32A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=enhTVTbT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8EC10E90B;
	Fri, 20 Nov 2026 14:48:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415B5112AE5;
 Fri, 20 Nov 2026 14:48:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2A461412E7;
 Fri, 20 Nov 2026 14:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532841F000CA;
 Fri, 20 Nov 2026 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795186103;
 bh=U8ePJMeHIjONytavSquAM03LDhtIP3ucu16x1Y7QSk4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=enhTVTbT37xupdXqNdfvuH7X8C+G9e3rY30MXleaVypdKsTvt7wIrJuuFywOlUdj3
 XO5NYDM64bqMmgF0BRahmMufEeoSd/pTYogtIRdgmbzcDOZCWWWVSzBLz1JgwE36Zs
 UD1x4n2/7kVMFyMBoxqX8Vm6rHv5mnGxzldrjKm8/Zozcm+smydmUBqW+qccqCpFmk
 2WzvQQ/uWR7b4aQ4VmKMXUMwbA9emfhXkmJXM/Ii7tnVdRK9Ok1Zf2waFIL29uPhZ3
 H2/HQUbxrRmlEDo5jRG34LNDbDFoFUmr+znPqcCPHNTva3Z+DGZMIxwvOD+duFKMJR
 ydbXcIaKKK0iw==
Message-ID: <sashiko-outbox-225410@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 27/29] drm/i915/dp: Pick the DSC slice count for
 pass-through within the HDMI limits
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261120140729.466177-28-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
 <20261120140729.466177-28-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 14:48:22 +0000
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
- [Medium] drm/i915/dp: PCON pass-through DSC slice limits ignored in TU
  and min_hblank
--

commit 5df55e454ef968026d14526944396c73e571eb41
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dp: Pick the DSC slice count for pass-through within the HDMI limi=
ts

This commit populates the downstream DSC slice count limits from the HDMI
sink when passing a DSC 1.2a stream through a PCON.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index b4f943d6401d4..3a53d23c4587c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2912,7 +2912,8 @@ intel_dp_dsc_compute_pipe_bpp_limits(struct intel_c=
onnector *connector,
> =20
>  /*
>   * The stream of a PCON passing DSC through is not recompressed, so it h=
as to
> - * fit the HDMI FRL link as is. Limit the compressed bpp of the DP strea=
m.
> + * fit the HDMI link and be one the HDMI sink can decode as is. Limit th=
e DSC
> + * parameters of the DP stream accordingly.
>   *
>   * This applies only if the HDMI link needs DSC and the DP stream is a D=
SC 1.2a
>   * stream, as passing it through is the only PCON operation possible the=
n.
> @@ -2936,6 +2937,13 @@ intel_dp_pcon_dsc_compute_passthrough_limits(struc=
t intel_dp *intel_dp,
>  				  true) =3D=3D MODE_OK)
>  		return true;
> =20
> +	if (!intel_dp_pcon_dsc_hdmi_slice_limits(connector, adjusted_mode,
> +						 adjusted_mode->crtc_clock,
> +						 crtc_state->sink_format,
> +						 &limits->dfp_dsc.min_slices,
> +						 &limits->dfp_dsc.max_slices))
> +		return false;

[Severity: Medium]
Do the TU and min_hblank calculations still ignore limits->dfp_dsc when
the HDMI sink requires a larger minimum slice count than the DP sink?

In intel_dp_dsc_compute_config(), intel_dp_dsc_compute_pipe_bpp() runs
before intel_dp_dsc_get_slice_config() populates
pipe_config->dsc.slice_config:

drivers/gpu/drm/i915/display/intel_dp.c:intel_dp_dsc_compute_config() {
	if (!is_mst) {
		ret =3D intel_dp_dsc_compute_pipe_bpp(intel_dp, pipe_config,
						    conn_state, limits);
		if (ret) {
			...
			return ret;
		}
	}

	if (!intel_dp_dsc_get_slice_config(connector, adjusted_mode->crtc_clock,
					   adjusted_mode->crtc_hdisplay, num_joined_pipes,
					   limits->dfp_dsc.min_slices,
					   limits->dfp_dsc.max_slices,
					   &pipe_config->dsc.slice_config))
		return -EINVAL;
}

On a UHBR link, intel_dp_dsc_compute_pipe_bpp() ->
dsc_compute_link_config() -> intel_dp_mtp_tu_compute_config() obtains the
slice count via intel_dp_dsc_get_slice_count(), which hardcodes
dfp_min_slices =3D 0 and dfp_max_slices =3D INT_MAX (and on non-UHBR links,
dsc_compute_link_config() reads
intel_dsc_line_slice_count(&pipe_config->dsc.slice_config) while
slice_config is still zeroed).  Later in intel_dp_compute_config(),
intel_dp_compute_min_hblank() also calls intel_dp_dsc_get_slice_count()
instead of using
intel_dsc_line_slice_count(&crtc_state->dsc.slice_config).

As a result, symbol cycles, link M/N, TU, and min_hblank are computed for
the unconstrained DP slice count rather than the slice count programmed in
pipe_config->dsc.slice_config.  Computing pipe_config->dsc.slice_config
before intel_dp_dsc_compute_pipe_bpp() and reading
intel_dsc_line_slice_count(&crtc_state->dsc.slice_config) in the downstream
callers would keep these calculations consistent.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120140729.4661=
77-1-ankit.k.nautiyal@intel.com?part=3D27
