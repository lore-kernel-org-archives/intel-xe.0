Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B517606A335
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H4G1hPJh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2798410E90B;
	Fri, 20 Nov 2026 14:48:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646C410E90B;
 Fri, 20 Nov 2026 14:48:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3EAB446573;
 Fri, 20 Nov 2026 14:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54001F000E6;
 Fri, 20 Nov 2026 14:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795186082;
 bh=rRL3Yb8R8cvyj6a8IQ5KNE4eRQ/QbuxUDIcY9AWCIo8=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=H4G1hPJhUX9egkfy+QDL60oTzEfarhD3k05YIQQMTWKnjmTAFAjGUSs7w+GVr1W30
 /978AR96eo+sjF7zP+35InNrgGp4fdtCzH38KRXI3+9ra04FO2OOanNuXhyCmSocEQ
 4nSGYLr2jhkIA78/UdHy/I4NR98tLSdMtRTZ3BV1PkFm3oZS26kc7TksnjWistB0It
 YdJ+HhJOMdmRWqk7yjT/lTkkFj8uX3eNYCzlNzM89c38fow0t5806YCjNfHFR36rFJ
 5mq4Qk0p/KfnNRkAl/XWV4J4vZ8dauTV5RG51/1bNwG5pdYq8cQQXngotaggHFiP1r
 nyU2KRCDJXIiA==
Message-ID: <sashiko-outbox-225409@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 21/29] drm/i915/dp: Allow PCON DSC modes through the FRL
 bw check
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261120140729.466177-22-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
 <20261120140729.466177-22-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 14:48:01 +0000
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
- [Medium] drm/i915/dp: intel_dp_mode_valid_downstream() ignores mode DP
  DSC validity
--

commit 02c40d12d5e3bd58a7720d18f4d98e8346680fdc
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dp: Allow PCON DSC modes through the FRL bw check

This commit updates downstream mode validation and HDMI bpc selection to
allow modes that exceed the uncompressed HDMI FRL bandwidth when both the
DP link and the PCON-to-HDMI FRL link can carry the stream compressed.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index cea90ef761c3c..7b66cd82b065e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
[ ... ]
> @@ -1318,12 +1334,22 @@ intel_dp_mode_valid_downstream(struct intel_conne=
ctor *connector,
>  {
>  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
>  	int bpc =3D 8; /* Assume 8bpc for the DP++/HDMI/DVI TMDS/FRL bw check */
> +	enum drm_mode_status status;
> =20
>  	if (intel_dp->dfp.max_dotclock &&
>  	    target_clock > intel_dp->dfp.max_dotclock)
>  		return MODE_CLOCK_HIGH;
> =20
> -	return intel_dp_hdmi_bw_valid(intel_dp, target_clock, bpc, sink_format,=
 true);
> +	status =3D intel_dp_hdmi_bw_valid(intel_dp, target_clock, bpc, sink_for=
mat, true);
> +	if (status !=3D MODE_CLOCK_HIGH)
> +		return status;
> +
> +	/* The PCON may be able to compress the stream for the HDMI link */
> +	if (intel_dp_has_dsc(connector) &&
> +	    intel_dp_hdmi_dsc_possible(intel_dp, mode, target_clock, bpc, sink_=
format))
> +		return MODE_OK;
> +
> +	return status;
>  }

[Severity: Medium]
Can intel_dp_mode_valid_downstream() accept a mode that requires PCON DSC
even when the DP stream itself cannot be compressed for that mode?

intel_dp_has_dsc() only checks static device and DPCD DSC support, whereas
intel_dp_mode_valid_format() checks per-mode DP DSC constraints (FEC
support, PCON branch throughput, max line width, slice count, and DSC
dotclock overhead) in its for_each_joiner_candidate() loop:

drivers/gpu/drm/i915/display/intel_dp.c:intel_dp_mode_valid_format() {
    ...
		if (intel_dp_joiner_needs_dsc(display, num_joined_pipes) && !dsc) {
			status =3D MODE_CLOCK_HIGH;
			continue;
		}

		if (mode_rate > max_rate && !dsc) {
			status =3D MODE_CLOCK_HIGH;
			continue;
		}
    ...
		if (!dsc)
			dsc_slice_count =3D 0;
    ...
}

When a mode fits uncompressed on the DP link (mode_rate <=3D max_rate, e.g.
at the 6 bpc DP minimum or on a DP link faster than the downstream FRL
rate) without a joiner that forces DSC, that loop succeeds even if dsc is
false.  intel_dp_mode_valid_downstream() then sees intel_dp_has_dsc() =3D=3D
true and returns MODE_OK, exposing a mode to userspace that later fails
atomic check in intel_dp_compute_link_for_joined_pipes() because the PCON
cannot encode an uncompressed DP stream into DSC.

Passing whether DP DSC was valid in intel_dp_mode_valid_format() (or
requiring dsc when downstream needs HDMI DSC) would avoid accepting modes
that cannot be compressed on the DP link.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120140729.4661=
77-1-ankit.k.nautiyal@intel.com?part=3D21
