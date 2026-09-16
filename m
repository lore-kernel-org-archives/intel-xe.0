Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCB3C88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C54110E0C1;
	Wed, 16 Sep 2026 09:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QZF7ZKVM";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DB610E0C1;
 Wed, 16 Sep 2026 09:25:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1FD9560A54;
 Wed, 16 Sep 2026 09:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9546E1F000FF;
 Wed, 16 Sep 2026 09:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789550722;
 bh=hfIg4kxvlf3WneDuqn+WHC6Dq+QziC7tYU/8ibWKDfE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=QZF7ZKVMHaoolndy4s1FmGO+4GSAbZHq78XteBjAilrv/gMLNIvHA5lsdxwwGN/xc
 n561/p9jXQMEpmg0plbnP4D/JeoZi8XGndksEcX7vOwABeH668jukdmopwyZ3s+0MK
 Ch2clD/R/vedIVNM2r+tre7L7xramcXHF2OuF3Mt8qaRGJTmjJnRGTccFaihJhHFEf
 KKxbYAB8zm6sM02oYvLkqGOjWDN32ER8VFtmZE3Bw6F+SiMOL+LbADLPLQxSH3k0tJ
 N0dNJ0igKJXn/wvu0Z8iA1PG5x9NXXZKdqcks4vAekNwTMN5hcbLy5s0IrfxrStk8Z
 A2uwnDTZU0kXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/10] drm/i915/dp: Limit M/N ratio for DP SST
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260916090946.677564-3-suraj.kandpal@intel.com>
References: <20260916090946.677564-1-suraj.kandpal@intel.com>
 <20260916090946.677564-3-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 09:25:22 +0000
Message-Id: <20260916092522.9546E1F000FF@smtp.kernel.org>
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
- [Medium] drm/i915/dp: mode_valid allows modes that will fail atomic_check=
 due to decoupled M/N and bandwidth checks
--

commit 0616c11329b8f8c5ca25700eb71cd2152a14fe54
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Wed Sep 16 09:09:38 2026 +0000

    drm/i915/dp: Limit M/N ratio for DP SST

This commit restricts DisplayPort link configurations to those satisfying t=
he
hardware limitation for the Link M/Link N ratio limit in the transcoder's
timing generator DDA. The constraint is checked during link rate configurat=
ion
and modes failing this check are pruned in mode_valid.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0cd5e6b5034cf..f6a2152c4432a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
[ ... ]
> @@ -1300,6 +1329,31 @@ bool intel_dp_dotclk_valid(struct intel_display *d=
isplay,
>  	return target_clock <=3D effective_dotclk_limit;
>  }
> =20
> +bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int pixel_clock)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	struct intel_dp_link_caps_order order =3D {
> +		.key =3D INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
> +		.dir =3D INTEL_DP_LINK_CAPS_ORDER_DIR_DESC,
> +	};
> +	struct intel_dp_link_config link_config;
> +	struct intel_dp_link_caps_iter iter;
> +	bool found =3D false;
> +
> +	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
> +				      INTEL_DP_LINK_CAPS_FILTER_ALL);
> +	for_each_dp_link_config(&iter, &link_config) {
> +		if (intel_dp_can_support_m_n(display, pixel_clock, link_config.rate)) {
> +			found =3D true;
> +
> +			break;
> +		}
> +	}
> +	intel_dp_link_caps_iter_end(&iter);
> +
> +	return found;
> +}

[Severity: Medium]
Will this loop cause modes to falsely pass mode_valid checks but later fail
during atomic_check?

Because HBR3 uses 8b/10b encoding, it has a higher symbol clock (810 MHz) t=
han
UHBR20 (625 MHz, 128b/132b). This means HBR3 can satisfy the M/N ratio limit
for a higher pixel clock than UHBR20.

If a high-resolution mode (e.g., 3.0 GHz pixel clock needing 40 Gbps) is te=
sted,
this function passes because HBR3 satisfies the M/N ratio. Subsequently,
intel_dp_mode_valid_format() passes because it independently checks bandwid=
th
against the absolute max link rate (UHBR20).

However, during atomic_check, UHBR20 gets filtered out due to the M/N ratio
limit, and HBR3 gets rejected for lacking bandwidth, causing the modeset to
fail. Does mode_valid need to verify that the specific link rate satisfying=
 the
M/N ratio also provides enough bandwidth for the mode?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916090946.6775=
64-1-suraj.kandpal@intel.com?part=3D2
