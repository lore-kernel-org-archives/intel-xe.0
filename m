Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9FC606A327
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V7J8imHV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154E610E4B9;
	Fri, 23 Oct 2026 05:18:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B0B1129A2;
 Fri, 23 Oct 2026 05:18:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6F58541850;
 Fri, 23 Oct 2026 05:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA871F01825;
 Fri, 23 Oct 2026 05:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792732715;
 bh=UIWoSlE2CxmuChCu7+ybKgMbnJApJlqHecChgS1jhdE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=V7J8imHVZZuOKZ77GAofzS40e3hfTUGZBm1ZG1N1GvGzFuHJtcv7ehUruwd8k7PkX
 9G0AE6TAFxAlrmFlJ8Gt6QGbU8uC2mxCPNnIidgRzvKY6vns7tb8IYjVd2Z6zrLRmw
 vcroZmspLIKU5iV0hkxrPL4ebWBqNpSWuhRfAptmdjI75gRlkuc7zMLfrMoL9hUZh+
 VdBIXN1dXDiVRqlCsBANPdRtY5hCoNtxb+E51TKmkggm1d8/cgRTk3M6W4U1dTn8aQ
 3KTiiFRqCgKTWNaiIZ5tJV3f7C7P99z4+UeDWMCa4/Kt7uxeg0Uxga+Mdx2WeNhLfb
 U9Ws2BxPsOgOQ==
Message-ID: <sashiko-outbox-182308@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 02/14] drm/i915/dp: Limit M/N ratio for DP
To: "Suraj Kandpal" <suraj.kandpal@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261023050227.2068466-3-suraj.kandpal@intel.com>
References: <20261023050227.2068466-1-suraj.kandpal@intel.com>
 <20261023050227.2068466-3-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 05:18:34 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/i915/dp: intel_dp_test_compute_config() clobbers M/N ratio f=
ilter
--

commit 555420da2bc55656b200265b485cbd9bd62d516b
Author: Suraj Kandpal <suraj.kandpal@intel.com>

drm/i915/dp: Limit M/N ratio for DP

This commit restricts DisplayPort link configurations to those where the
ceiling of the Link M/N ratio does not exceed the hardware limit (4 on DG2,
10 on other platforms), enforcing the constraint both in mode_valid and
when computing link configuration limits.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index d8c0d9381471d..661a863362ad4 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c

[ ... ]

> @@ -2772,6 +2886,9 @@ intel_dp_compute_config_limits(struct intel_dp *int=
el_dp,
>  		limits->link_config_filter =3D new_filter;
>  	}
> =20
> +	if (!intel_dp_compute_m_n_ratio_limits(intel_dp, conn_state, crtc_state=
, limits))
> +		return false;
> +
>  	if (!intel_dp_test_compute_config(connector, crtc_state, limits))
>  		return false;

[Severity: Medium]
Can intel_dp_test_compute_config() clobber the M/N ratio filter that was ju=
st
computed by intel_dp_compute_m_n_ratio_limits()?

When intel_dp->compliance.test_type =3D=3D DP_TEST_LINK_TRAINING,
intel_dp_test_compute_config() calls set_filter_for_link_params() ->
set_filter_for_link_config() in drivers/gpu/drm/i915/display/intel_dp_test.=
c:

static bool set_filter_for_link_config(struct intel_connector *connector,
				       struct intel_dp_link_caps *link_caps,
				       const struct intel_dp_link_config *link_params,
				       struct link_config_limits *limits)
{
	struct intel_dp_link_caps_filter new_filter =3D INTEL_DP_LINK_CAPS_FILTER_=
NONE;

	if (!intel_dp_link_caps_filter_add(link_caps, &new_filter, link_params))
		return false;

	limits->link_config_filter =3D new_filter;

	return true;
}

Because intel_dp_link_caps_filter_add() only checks
get_allowed_config_filter(link_caps) and ignores limits->link_config_filter,
set_filter_for_link_config() overwrites limits->link_config_filter with a
fresh filter containing the compliance test link configuration even if that
link rate was filtered out by intel_dp_compute_m_n_ratio_limits().

Should intel_dp_compute_m_n_ratio_limits() be called after
intel_dp_test_compute_config(), or should set_filter_for_link_config()
intersect against the existing limits->link_config_filter?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023050227.2068=
466-1-suraj.kandpal@intel.com?part=3D2
