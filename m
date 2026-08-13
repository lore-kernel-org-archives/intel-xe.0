Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A850C5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 00:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168FE10E480;
	Thu, 13 Aug 2026 00:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dmsUAhlj";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D38D10E480
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 00:23:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B3725600AD;
 Thu, 13 Aug 2026 00:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FED01F000E9;
 Thu, 13 Aug 2026 00:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786580593;
 bh=BIqH/ABO7a6Eivg/wYwGwMPL+Lra7IkI3eR6H2FSqq4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=dmsUAhlj281Fm4EqXForYviPzrDyFPLbuUXB7SRKEcrPj/1Dp9CZLntDve4VCWcxn
 4X9esfCbYy+U43JnQ4IF98UznfP7wJuuQsoF4GGVPkZbgEW9AFZ53fP9fmI6NnVnbd
 8TVn41k7SGycEFQ5qGIjjQsKKw5QzOouRVzR1zFtDxIZr+lEptcTA/2g9XDnLCNv/b
 7JZ/0OYO84zNaEjpip5NriYwrJE0Tijqj01Rs4os5qTQWBEDCWYVCvt2MvlD7ao2cN
 H11GlBtO5gI8aYWo/0hSW8fByiic+G9TOl2esA8Znl7ncpmMLMF74do6vYepLPV9z0
 1xud5GU0uzdag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] drm/xe/forcewake: add delayed-release state machine
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260813000654.2712317-3-zongyao.bai@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <20260813000654.2712317-3-zongyao.bai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 00:23:12 +0000
Message-Id: <20260813002313.3FED01F000E9@smtp.kernel.org>
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
- [High] Use-After-Free in delayed-release forcewake due to devm/drmm teard=
own asymmetry and timer re-arming
--

--- Patch [2]: [PATCH v5 2/4] drm/xe/forcewake: add delayed-release state m=
achine ---
commit 7a90eb7b65ee38383fb6f1973ddea842f2c9c391
Author: Zongyao Bai <zongyao.bai@intel.com>

drm/xe/forcewake: add delayed-release state machine

Add an opt-in forcewake release path that keeps an idle domain awake
for a short hold interval. A subsequent get can reuse the domain
without issuing another wake request or waiting for its ACK.

> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_f=
orce_wake.c
> index 197e2197bd0a3..3f5013c7424c8 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c

[ ... ]

> +static void xe_force_wake_fini(void *arg)
> +{
> +	struct xe_force_wake *fw =3D arg;
> +	struct xe_force_wake_domain *domain;
> +	unsigned int tmp;
> +
> +	for_each_fw_domain(domain, fw, tmp)
> +		hrtimer_cancel(&domain->sleep_timer);
> +}
> +
> -void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> +int xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>  {

[ ... ]

>  	}
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_force_wake_fini, fw);
>  }

[Severity: High]
Does registering this teardown via devm create a use-after-free window?

Since devm teardown (PCI unbind) happens before drmm teardown, background
tasks like gt->ordered_wq (which are destroyed during drmm teardown) can
still be running after xe_force_wake_fini() has executed.

Also, if a timer was pending here, canceling it without putting the domain
to sleep could leave the hardware permanently awake. Is there a need to
clear the state or issue domain_sleep() during teardown?

[ ... ]

> @@ -242,12 +330,24 @@ void xe_force_wake_put(struct xe_force_wake *fw, un=
signed int fw_ref)
> =20
>  	spin_lock_irqsave(&fw->lock, flags);
>  	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
> +		assert_domain_state(fw, domain);
>  		xe_gt_assert(gt, domain->ref);
> =20
>  		if (!--domain->ref) {
> -			sleep |=3D BIT(domain->id);
> -			domain_sleep(gt, domain);
> +			if (delayed_release || domain->delayed_release_requested) {
> +				domain->delayed_release_requested =3D false;
> +				fw->delayed_release_domains |=3D BIT(domain->id);
> +				hrtimer_start(&domain->sleep_timer,
> +					      us_to_ktime(xe->forcewake_hold_delay_us),
> +					      HRTIMER_MODE_REL);

[Severity: High]
If a background task drops the last reference here after xe_force_wake_fini=
()
has already run, could this unconditionally re-arm the timer?

If the timer is re-armed during this devm/drmm teardown window, the timer
callback might fire after the struct xe_gt memory has been completely freed
by drmm, resulting in a use-after-free.

Would it be safer to use drmm_add_action_or_reset() for teardown, or add a
mechanism to ensure we don't start timers when the device is being destroye=
d?

> +			} else {
> +				sleep |=3D BIT(domain->id);
> +				domain_sleep(gt, domain);
> +			}
> +		} else if (delayed_release) {
> +			domain->delayed_release_requested =3D true;
>  		}
> +		assert_domain_state(fw, domain);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813000654.2712=
317-1-zongyao.bai@intel.com?part=3D2
