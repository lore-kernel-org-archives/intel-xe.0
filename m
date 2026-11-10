Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAE4606A330
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzxG3tl7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC69810F63B;
	Tue, 10 Nov 2026 12:07:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B6010F63C;
 Tue, 10 Nov 2026 12:07:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 37C9D43A82;
 Tue, 10 Nov 2026 12:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34191F0089F;
 Tue, 10 Nov 2026 12:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794312457;
 bh=2oGFDBdnw0OHaHzjY916/d+w4U2c1/t+irMfLPLPF0U=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=TzxG3tl7sIozrs6DNDtVb/NDvM5po7NC5iGOLcSc/SiHJJxSTI8qCZ6bN7CP9zE2D
 3T9Z1tUYIpI6I+MtEq37ejspE1SDFDST6QhfFSVhh667xYGz2YIAL4a0DaUmSzfZQM
 dykYsUVx/D5dZIwHaorBTRZ0gh8vjDc5BYAvE7QoEcLPgbUTUCwmjo1L0ktONFaxhw
 L6azK82H57GtNY4Sfiz6yq/xepat9MXM+SroF8CJ2ybLrI/Nh08ZhuHbifBwN525hU
 3dVxWnG+814cq1Kg7vhNgnmudQ05fAX03IDAQVUd632bogWVkoQXCAmGvtSpxQcKtX
 bonBfzOSyF1EA==
Message-ID: <sashiko-outbox-206984@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] drm/i915/bios: Parse eDP fast link training params
 only if enabled
To: "Lee Shawn C" <shawn.c.lee@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261110115432.894616-3-shawn.c.lee@intel.com>
References: <20261110115432.894616-1-shawn.c.lee@intel.com>
 <20261110115432.894616-3-shawn.c.lee@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 12:07:36 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/i915/bios: commit message omits clamping rate to
  max_link_rate
--

commit 3610be7f547f32532810e072a6b6707742df692f
Author: Lee Shawn C <shawn.c.lee@intel.com>

drm/i915/bios: Parse eDP fast link training params only if enabled

This commit parses the VBT eDP fast link training enable bit and only
populates the fast link training parameters when that bit is set, while
also normalizing the parsed rate and lane count values.

> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/=
i915/display/intel_bios.c
> index 6b2924c56cae3..378f8b60b4a09 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c

[ ... ]

> @@ -1526,6 +1532,29 @@ parse_edp_fast_link_params(struct intel_display *d=
isplay,
>  			    edp_link_params->vswing);
>  		break;
>  	}
> +
> +	/*
> +	 * The fast link training rate is limited by the eDP max port link
> +	 * rate: FLT rate =3D min(FLT rate, eDP max port link rate).
> +	 */
> +	if (panel->vbt.edp.rate && panel->vbt.edp.max_link_rate)
> +		panel->vbt.edp.rate =3D min(panel->vbt.edp.rate,
> +					  panel->vbt.edp.max_link_rate);

[Severity: Low]
This isn't a bug, but the commit message does not mention clamping
panel->vbt.edp.rate to panel->vbt.edp.max_link_rate or reordering
parse_edp_fast_link_params() in parse_edp() after max_link_rate is parsed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110115432.8946=
16-1-shawn.c.lee@intel.com?part=3D2
