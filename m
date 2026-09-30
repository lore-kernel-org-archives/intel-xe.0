Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A29CA5FAC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 12:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC77610E814;
	Wed, 30 Sep 2026 12:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NBWtvnyt";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB8810E214;
 Wed, 30 Sep 2026 12:02:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1C5E14388F;
 Wed, 30 Sep 2026 12:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C990F1F000FF;
 Wed, 30 Sep 2026 12:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790769743;
 bh=GCEUBE4/sTBdDe1YRieuzhIolZ+AVpAIgszrBgvD9dM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=NBWtvnytLYLJALBP3/ZPhc6eA60A8o043jw03quN+2k1gLDEvevDClZxCMsnR4Nb8
 5EkiqXdV5Pd7XKWM4+mjusRZnqeWtxM7k8EXgQ79X98hGER8YaAcEs+cLeAChfq1jN
 lF3QV3Nc6gupSe3TDbfw2+25+88zZnullSm4RK6ZlJUFocLjN9nPHrBIJKnUMc3XWY
 ++feUgd0FpKSf9bQxA2KOUAkCvhxLFzoINwwudvTXGJrTlG1nQ3NnpeQlDUqj5smc5
 E10FjKrfSSxKrm4fpMIvtKrQx+78M33iPcBuCWt6pf8JDh4KHbAbi7RjNY3OIO5knL
 8qsIoppRn0+tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] drm/i915/dp: Drop using intel_de_read_notrace()
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260930115303.24285-2-ville.syrjala@linux.intel.com>
References: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
 <20260930115303.24285-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 12:02:22 +0000
Message-Id: <20260930120222.C990F1F000FF@smtp.kernel.org>
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
- [Low] Tracing redundancy: duplicate trace of DP_AUX_CH_CTL read
--

commit afa17c7838a57999000c6a138fccf379e59ccba4
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915/dp: Drop using intel_de_read_notrace()

This patch eliminates intel_de_read_notrace() to shrink the API, switching
its last users in intel_dp_aux_wait_done() and intel_dp_aux_xfer() over to
the normal intel_de_read().

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/dr=
m/i915/display/intel_dp_aux.c
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c

[ ... ]

> @@ -324,7 +324,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> =20
>  	/* Try to wait for any previous AUX channel activity */
>  	for (try =3D 0; try < 3; try++) {
> -		status =3D intel_de_read_notrace(display, ch_ctl);
> +		status =3D intel_de_read(display, ch_ctl);
>  		if ((status & DP_AUX_CH_CTL_SEND_BUSY) =3D=3D 0)
>  			break;
>  		msleep(1);
>  	}
>  	/* just trace the final value */
>  	trace_i915_reg_rw(false, ch_ctl, status, sizeof(status), true);

[Severity: Low]
Does this leave us with duplicate trace events?

Since intel_de_read() internally traces the register read, this explicit
trace_i915_reg_rw() call in intel_dp_aux_xfer() appears redundant and might
cause duplicate trace log entries for this final read.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930115303.2428=
5-1-ville.syrjala@linux.intel.com?part=3D2
