Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEC9606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jj5BAc35
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C7C112AE9;
	Fri, 20 Nov 2026 14:34:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1563D112AED;
 Fri, 20 Nov 2026 14:34:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6B1ED618D5;
 Fri, 20 Nov 2026 14:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1551F000C0;
 Fri, 20 Nov 2026 14:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795185289;
 bh=57n/fDWBZ7e6BX0WSuk1yDEv1FpXdd/D772L4sYNLNs=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Jj5BAc35IQt/IW0cV7jl3CH1RIjLc25qrOw8pZ4e6XeWeAetEqjtImA/ESvnjZsr+
 wyUoXtgJwZAfu5E7shDn7ZMb66NBrr4JVq6OAE6BjwqDjs1y6VZ2YVFOYhUmYxwWzS
 Q07qQxYtSNNSmCjDBooBy9edOTjfdRpUWJr+AdHeO9RSPY2L6rbCXvndzOL+r7L3U9
 ElQeJywVeDf21yCxSusb9IBI5/b8Z4S2uh2UNdlQYRYMlqYC0n1T5wzgQI42XGTY2R
 DxbayaFSwFYw41mQBvSTE1sqEMQ1VFukBIIV7aDuDA/MeMI9KKV5469qpVq4fY5byG
 jxQeBttq+8Bqw==
Message-ID: <sashiko-outbox-225386@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/29] drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261120140729.466177-3-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
 <20261120140729.466177-3-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 14:34:49 +0000
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/i915/dp: missing Fixes: trailer for HDMI 2.1 DFP FRL
  bandwidth check fix
--

commit addfd82d3927c014185f27ec746e89863b581033
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
>
> The FRL bandwidth check considers only the PCON's max FRL rate, ignoring
> the HDMI2.1 sink's own max FRL rate. Cap the available bandwidth by the
> minimum of the two, similar to the TMDS case.
>
> Move the check into a helper intel_dp_frl_bw_valid() so it can also be
> used in the compute_config phase in a subsequent change.
>
> The DSC case, where both the PCON and HDMI sink support DSC, is left
> as a FIXME and handled later.
>
> v2: Remove extra braces and re-format comment. (Suraj)
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

[Severity: Low]
This fixes the downstream FRL bandwidth check in
intel_dp_mode_valid_downstream(), which previously only checked
intel_dp->dfp.pcon_max_frl_bw without considering the HDMI 2.1 sink's max
FRL rate.  Should this include:

  Fixes: 2f78347e3634 ("drm/i915: Capture max frl rate for PCON in dfp cap =
structure")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120140729.4661=
77-1-ankit.k.nautiyal@intel.com?part=3D2
