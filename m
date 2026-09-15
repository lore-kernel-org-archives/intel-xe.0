Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF7DC88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 17:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1573710E5FB;
	Tue, 15 Sep 2026 17:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZggRxzNM";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F09B10E47F;
 Tue, 15 Sep 2026 17:28:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3E6A041B41;
 Tue, 15 Sep 2026 17:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03151F000FF;
 Tue, 15 Sep 2026 17:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789493338;
 bh=umy4wey/iVEqubDBUG2B9ILxwyvIu4jc6s7DAhErDrI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ZggRxzNMI1C/7lv8faAOiFqUCyXe7SMfvpzLQg065fgX+NtCQsFesvU0cC3QdUBnc
 9rx5LiopXGijWNu7wn9gJw0PiozUi0LQADJ1nS44A/EqIxQ3sFNpxRsiPpqYCikoAB
 6kXi4QHdQR/AGHAGp/e1UdtZhRqamciaiBS8xsDt2dV8/C+hQvLefGpUgaYtNJzv/i
 5Cqrr7lYmd0SloEaNRtNbxDRHoQ7108gyOMnxbRKSbzG8yVDlU3XL5MjROUL+jfKIo
 LQjzMIzjikFHuuOc+cb++3OZg5jNEuuhGeZhTJ0X+tkGmt4rVaLKLXBNV+KuSoTalI
 P2cPaSnkkOGpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 11/14] drm/i915/dip: Enable Common SDP Transmission line
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260915164657.3429075-12-ankit.k.nautiyal@intel.com>
References: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
 <20260915164657.3429075-12-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 17:28:57 +0000
Message-Id: <20260915172857.E03151F000FF@smtp.kernel.org>
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
- [Medium] drm/i915/dip: Missing CMN_SDP_TL programming for DP MST slave tr=
anscoders
--

commit de3a67cbeba4a6e70cc767d1dce1950454f58dfa
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dip: Enable Common SDP Transmission line

This commit enables programming of the common SDP transmission line on
supported platforms. It computes and programs the base transmission line
and stagger values during modeset. It also disables the feature on pipe
disable.

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index dacb4b7588a02..3cdb06e81130b 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2737,6 +2737,8 @@ static void mtl_ddi_pre_enable_dp(struct intel_atom=
ic_state *state,
>  	/* 6.o Configure and enable FEC if needed */
>  	intel_ddi_enable_fec(encoder, crtc_state);
> =20
> +	intel_dip_cmn_sdp_transmission_line_enable(crtc_state);
> +

[Severity: Medium]
Will placing this transcoder-specific initialization in mtl_ddi_pre_enable_=
dp()
cause it to be skipped for subsequent MST streams?=20

In DP MST configurations, mst_stream_pre_enable() invokes the primary encod=
er's
pre_enable hook (mtl_ddi_pre_enable_dp()) solely for the first active MST
stream.

Because intel_dip_cmn_sdp_transmission_line_enable() is called here, it
appears it will be skipped for all subsequent streams. This would leave the
CMN_SDP_TL registers uninitialized for slave transcoders, potentially causi=
ng
broken or mistimed SDP transmission on secondary MST monitors.

>  	/* 7.a 128b/132b SST. */
>  	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
>  		/* VCPID 1, start slot 0 for 128b/132b, tu slots */
[ ... ]
> @@ -3124,6 +3126,7 @@ static void intel_ddi_buf_disable(struct intel_enco=
der *encoder,
>  			     DP_TP_CTL_ENABLE, 0);
>  	}
> =20
> +	intel_dip_cmn_sdp_transmission_line_disable(crtc_state);

[Severity: Medium]
Does placing this disable routine in intel_ddi_buf_disable() prevent it from
executing for slave transcoders during MST teardown?=20

Similar to the enable path, intel_ddi_buf_disable() is only called for the
last active stream during teardown, which means the CMN_SDP_TL disable rout=
ine
would be skipped for slave streams.

>  	intel_ddi_disable_fec(encoder, crtc_state);
> =20
>  	if (DISPLAY_VER(display) < 14)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915164657.3429=
075-1-ankit.k.nautiyal@intel.com?part=3D11
