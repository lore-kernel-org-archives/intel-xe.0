Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB01606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 03:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nk1+XXFh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEAA010E19F;
	Thu, 22 Oct 2026 03:43:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CFD10E19F;
 Thu, 22 Oct 2026 03:43:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DD04460AAB;
 Thu, 22 Oct 2026 03:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3A11F000C1;
 Thu, 22 Oct 2026 03:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792640613;
 bh=+RMiY9uw6eCN0BpTPDSoavmomVaVOJjoADFEWKO7cYw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=nk1+XXFh3mnnLnQOCgcnzoyo96g1VFkh37yG1OADu5rGMqEO8eXIVbR4tROOsX2Gs
 /T7maoSS3YNLt2jzqaTOEcpg5QiLbO91l3TCQESSywqV3U7QKdILfiU3Pz9tPThYIS
 32hM7MmHB5+iHwEY1IUfrRTmMpu5FROeuMH5nu1POUKgAU71HDI966pSkJlbBlUcdV
 I3DVmOa8Jfs89la/iFIhgtcT/uVDzAHqhhLw1OqDa3vcZJC0VOaUgDpVAmRcxK2AKO
 1+pSXYgsFrgRcqhQ3GLhU5pJr2ewdZxQ1uwB42viTZT2PEsc2sCERJmQJEGkcpICn4
 fmAHPUwKp71TQ==
Message-ID: <sashiko-outbox-180972@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/13] drm/i915/dp_mst: Limit M/N ratio for MST
To: "Suraj Kandpal" <suraj.kandpal@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261022032247.1378809-5-suraj.kandpal@intel.com>
References: <20261022032247.1378809-1-suraj.kandpal@intel.com>
 <20261022032247.1378809-5-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 03:43:32 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/i915/dp_mst: M/N mode_valid check mismatches MST compute_con=
fig limits
--

commit 67d8f2b2b1195befcc18a05f5eb7b442e2188782
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dp_mst: Limit M/N ratio for MST

This commit adds a Link M/Link N ratio check to mst_connector_mode_valid_ct=
x()
using intel_dp_mode_valid_m_n() to prune display modes that exceed the
hardware M/N ratio limit on MST connectors.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 7023619aaaba9..f00edfb66a10a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1565,6 +1565,11 @@ mst_connector_mode_valid_ctx(struct drm_connector =
*_connector,
>  					   min_link_bpp_x16,
>  					   bw_overhead_flags);
> =20
> +	if (!intel_dp_mode_valid_m_n(intel_dp, mode->clock)) {
> +		*status =3D MODE_CLOCK_HIGH;
> +		return 0;
> +	}
> +
>  	/*
>  	 * TODO:
>  	 * - Also check if compression would allow for the mode

[Severity: Medium]
Does calling intel_dp_mode_valid_m_n() here match the link configuration
constraints enforced during MST modeset in intel_dp_compute_config_limits()?

In drivers/gpu/drm/i915/display/intel_dp_mst.c, mst_connector_mode_valid_ct=
x()
evaluates bandwidth and DSC against max_bw_config, whereas
intel_dp_mode_valid_m_n() in drivers/gpu/drm/i915/display/intel_dp.c iterat=
es
over all configurations in INTEL_DP_LINK_CAPS_FILTER_ALL:

drivers/gpu/drm/i915/display/intel_dp.c:intel_dp_mode_valid_m_n() {
	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
				      INTEL_DP_LINK_CAPS_FILTER_ALL);
	for_each_dp_link_config(&iter, &link_config) {
		if (intel_dp_can_support_m_n(display, m_n_pixel_clock,
					     link_config.rate)) {
			found =3D true;

			break;
		}
	}
}

On a UHBR-capable MST topology (for example UHBR10 with a 312.5 MHz symbol
clock, or UHBR13.5 with a 421.875 MHz symbol clock), intel_dp->link.caps al=
so
includes 8b/10b rates such as HBR3 (810 MHz symbol clock). Because HBR3 has=
 a
higher link symbol clock than UHBR10 or UHBR13.5, intel_dp_mode_valid_m_n()
will see that HBR3 satisfies intel_dp_can_support_m_n() and return true even
when max_bw_config violates the M/N ratio limit.

However, during modeset via
mst_stream_compute_config() -> mst_stream_compute_link_for_joined_pipes() ->
mst_stream_compute_config_limits() -> intel_dp_compute_config_limits(),
the MST path narrows limits->link_config_filter to the single highest-BW
max_config before intel_dp_compute_m_n_ratio_limits() is called:

drivers/gpu/drm/i915/display/intel_dp.c:intel_dp_compute_config_limits() {
	if (is_mst || intel_dp->use_max_params) {
		struct intel_dp_link_caps_filter new_filter =3D INTEL_DP_LINK_CAPS_FILTER=
_NONE;
		struct intel_dp_link_config max_config;
		...
		if (!intel_dp_get_connector_max_link_config(connector, limits, &max_confi=
g))
			return false;

		if (!intel_dp_link_caps_filter_add(link_caps, &new_filter, &max_config))
			return false;

		limits->link_config_filter =3D new_filter;
	}

	if (!intel_dp_compute_m_n_ratio_limits(intel_dp, conn_state, crtc_state, l=
imits))
		return false;
}

As a result, intel_dp_compute_m_n_ratio_limits() only checks max_config for
MST and rejects the modeset if max_config violates the M/N ratio limit.

Should mst_connector_mode_valid_ctx() check intel_dp_can_support_m_n() agai=
nst
max_link_clock (matching the rest of mst_connector_mode_valid_ctx() and the
current MST max_config selection), or should intel_dp_compute_m_n_ratio_lim=
its()
filter limits->link_config_filter before intel_dp_get_connector_max_link_co=
nfig()
picks max_config?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022032247.1378=
809-1-suraj.kandpal@intel.com?part=3D4
