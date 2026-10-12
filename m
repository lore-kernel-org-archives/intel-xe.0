Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39929CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63AE10E46A;
	Mon, 12 Oct 2026 12:52:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2650210E46A;
 Mon, 12 Oct 2026 12:52:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C8B9341882;
 Mon, 12 Oct 2026 12:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E271F0089B;
 Mon, 12 Oct 2026 12:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791809534;
 bh=APT61oI8oTdgj1+3lfI3E2N+83eBc5ZgepwpL7zEEWk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jQ8hSXU0/3aEGy7hL6bFxmS6IzYcJu6XXV979cUyO2q0+4v4olUv2DlJjJEa58lXu
 uLY4KmQKQ4c6l++sX1UldW1k+4xJvAJFOsBTbborLBrQwKLklSQ1K7SVhUunEdiv6o
 4vujCa3OH7wso9+ONUH3RB6S06IepAi8Xn8SSErg7TUrBkcNRKYyxxVC2ZKukZlwpY
 NP/uJkfFbQ3julmrFpo4mx0geNHxyWrARyE2CghYh9NU2ha3TokDntYS5g4/98dc6z
 h6759gE9z7vXFoPdnVOKxH2sMt2Q43o95G4HzpvVogBjvlsaV8gTuggMcE/Yiic53V
 oQarfCUbjpV3g==
Message-ID: <sashiko-outbox-168129@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] drm/i915/display: Allow forcing the joiner on eDP
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261012124145.1960050-7-mika.kahola@intel.com>
References: <20261012124145.1960050-1-mika.kahola@intel.com>
 <20261012124145.1960050-7-mika.kahola@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 12:52:13 +0000
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
- [Low] drm/i915: data race on connector->force_joined_pipes via debugfs
--

commit 45be7b5e2e6fcbea23658dd271134587c4797f89
Author: Mika Kahola <mika.kahola@intel.com>

drm/i915/display: Allow forcing the joiner on eDP

intel_dp_has_joiner() rejects eDP unless the VBT enables the pipe
joiner, and the debugfs file is only created when that returns true, so
i915_joiner_force_enable can never turn it on.

Always create the file for DP and eDP, and let a forced pipe count
above one override the VBT.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index d8c0d9381471d..ec0b4885e33ac 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c

[ ... ]

> @@ -473,9 +473,15 @@ bool intel_dp_has_joiner(struct intel_dp *intel_dp)
>  	if (intel_dp->mso_link_count)
>  		return false;
> =20
> -	if (intel_dp_is_edp(intel_dp) &&
> -	    !connector->panel.vbt.edp.pipe_joiner_enable)
> -		return false;
> +	if (intel_dp_is_edp(intel_dp)) {
> +		bool pipe_joiner_enable =3D connector->panel.vbt.edp.pipe_joiner_enabl=
e;
> +
> +		if (connector->force_joined_pipes > 1)

[Severity: Low]
Does this code introduce a data race with debugfs?

The debugfs handler i915_joiner_write() locklessly modifies
connector->force_joined_pipes:

drivers/gpu/drm/i915/display/intel_display_debugfs.c:i915_joiner_write() {
    ...
    connector->force_joined_pipes =3D force_joined_pipes;
    ...
}

Meanwhile, this read in intel_dp_has_joiner() during an atomic modeset
happens without holding any lock shared with the debugfs write path.

This problem wasn't introduced by this patch, but this commit expands a
similar pattern found in intel_dp_joiner_candidate_valid(), where a
double-read can cause a TOCTOU flaw if the compiler reloads the value
between reads:

drivers/gpu/drm/i915/display/intel_dp.c:intel_dp_joiner_candidate_valid() {
    ...
    if (connector->force_joined_pipes && connector->force_joined_pipes !=3D=
 num_joined_pipes)
        return false;
    ...
}

Could a lock or READ_ONCE() and WRITE_ONCE() annotations be added to
safely serialize or annotate these accesses?

> +			pipe_joiner_enable =3D true;
> +
> +		if (!pipe_joiner_enable)
> +			return false;
> +	}
> =20
>  	return DISPLAY_VER(display) >=3D 12 ||
>  		(DISPLAY_VER(display) =3D=3D 11 &&

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012124145.1960=
050-1-mika.kahola@intel.com?part=3D6
