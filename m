Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2713C88E7F
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 19:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729CC10E164;
	Wed, 16 Sep 2026 19:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QnG9AkPV";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AFF10E164
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 19:24:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C38026022B;
 Wed, 16 Sep 2026 19:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EEE1F000FF;
 Wed, 16 Sep 2026 19:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789586643;
 bh=m9CUOVvSJjJlCiX1FX2CZLal1WU0kSRC8eUDQWn8A04=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=QnG9AkPV7fnmNHqx+75kTpZjryB9uGKXVS6psBsEUhl1k1nzo6+9J/OE3NLOvKveX
 kir1c7g3vVVSIdfi9ET7c+qSW7b9MI6e2p3Zf3Aa6K4q5vEXZjwlmlhDDZfvFawxGP
 U97zWG+dBsBQ+YWAnTZZLIStNiJyFMTe7FCaCHvJsUfRv5hUNf4Fc+vIw0z6djC02h
 k84IUbq2lilSnorr+xcGaXUhuFNEbE5jTqOVxYvzpBqvzDZ70dLpaD9J9KFsdes3eu
 t60Ee3NI0qZfzDm+MWek0Ocr2+Hp0A9eDh41xqaZmO9HdN5lVuzq8ReRQFYFCWG6rs
 QFYgJLtqziGJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6] drm/xe: Poll GT for C6 before D3
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260916190614.3047807-1-vinay.belgaumkar@intel.com>
References: <20260916190614.3047807-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 19:24:02 +0000
Message-Id: <20260916192403.50EEE1F000FF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/xe: C6 poll after xe_pm_runtime_suspend() always fails breakin=
g D3
- [Medium] pm: device stuck in RPM_ACTIVE when C6 check fails
--

commit d48ea91e20a44679b212e2b189bddfe7fa5220c9
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Poll GT for C6 before D3

This commit ensures the GT is in C6 before transitioning to D3 during
runtime suspend, avoiding scenarios where GT is accessed after D3 is
programmed. It aborts the suspend by returning an error if the GT
fails to enter C6.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 00b2b5dfb8f6c..d66d5a0339ae3 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c

[ ... ]

> @@ -1394,6 +1394,17 @@ static int xe_pci_runtime_suspend(struct device *d=
ev)
>  	if (err)
>  		return err;
> =20
> +	err =3D xe_pm_wait_all_c6(xe);

[Severity: High]
Since this check happens after xe_pm_runtime_suspend(), which already
called xe_gt_suspend() and explicitly disabled power gating (RC6), isn't
this guaranteed to fail and cause 200ms timeouts on every suspend attempt?

When the system attempts to enter D3cold runtime suspend, GuC is already
reset and power gating is disabled by the time we reach this check, so
the GT cannot enter C6 autonomously.

> +	if (err) {
> +		drm_dbg(&xe->drm, "Resuming - GT C6 check failed!");
> +		ret =3D xe_pm_runtime_resume(xe);
> +		if (ret) {
> +			drm_err(&xe->drm, "Resume failed after suspend was canceled");
> +			return ret;
> +		}
> +		return err;

[Severity: Medium]
When we return -EAGAIN to the PM core here to abort the suspend, shouldn't
we first update the last_busy timestamp by calling
pm_runtime_mark_last_busy(dev)?

Without it, the PM core's rpm_suspend() handles -EAGAIN by aborting suspend
but only re-arms the autosuspend timer if last_busy was updated. This causes
the autosuspend expiration time to evaluate to the past, preventing the tim=
er
from being re-armed and leaving the device awake indefinitely in RPM_ACTIVE
until another explicit PM cycle occurs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916190614.3047=
807-1-vinay.belgaumkar@intel.com?part=3D1
