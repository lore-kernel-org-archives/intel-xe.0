Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BD3CC6B19
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 16:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7731B10E20E;
	Tue, 13 Oct 2026 16:25:00 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E692F10F8EE;
 Tue, 13 Oct 2026 16:24:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 95F8941884;
 Tue, 13 Oct 2026 16:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B5D1F000FF;
 Tue, 13 Oct 2026 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791908693;
 bh=PAxNMYovLvqDay1SlH3NiF0PFvUs4sgVKVI75QwFQ14=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=XjH0h1ss31XEPxu2pYmL7BcH3ygXVACj56TGQUUQ9SKtr5JlTuODhcugb0/N9rwXN
 TRYNEKOXAP3fuG0Exjef+aWqSv8rHToXzSYaML7X+tq70Y3Gop7lksTmCEcEOnYtxE
 myhHI9MxqcIEvRMwtuiT8/dC/WMYGhU/JZo+Cf8vcO7TG07HR/vdxvPNisY7yi5WlC
 UIXzQd8asMBukfCGzy/KWrpE19jzZycoYi9ObFLmu2G+6BDxqNyeCUOmLOMEa2yn1D
 72eHYot5l1/pRdrTbHF/r9L/WqjSOQ9lSwoWIJaQxXvSp+epiUQ5273Wbh6CDocwat
 tE/AjVsz0zWUA==
Message-ID: <sashiko-outbox-170108@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/i915/dmc_wl: Avoid blocking on delayed wakelock
 release
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013161131.2572279-6-dibin.moolakadan.subrahmanian@intel.com>
References: <20261013161131.2572279-4-dibin.moolakadan.subrahmanian@intel.com>
 <20261013161131.2572279-6-dibin.moolakadan.subrahmanian@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 16:24:52 +0000
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
- [Medium] drm/i915/dmc_wl: race allows delayed work execution after disable
--

commit c0608498f162e6c645a132e26ca4016580c97dce
Author: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.=
com>

drm/i915/dmc_wl: Avoid blocking on delayed wakelock release

This commit modifies intel_dmc_wl_disable() to cancel the pending wakelock
release work rather than flushing it. This prevents the DC-exit path from
being unnecessarily delayed by workqueue scheduling and ACK polling. It dro=
ps
the work when disabling the wakelock instead of forcing it to run.

> diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/dr=
m/i915/display/intel_dmc_wl.c
> index ab4e0e9573dfb..3eae119009782 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
> @@ -400,7 +400,7 @@ void intel_dmc_wl_disable(struct intel_display *displ=
ay)
>  	if (!__intel_dmc_wl_supported(display))
>  		return;
> =20
> -	intel_dmc_wl_flush_release_work(display);
> +	cancel_delayed_work_sync(&wl->work);

[Severity: Medium]
Could this leave a stray delayed work queued after the wakelock is disabled?

Since cancel_delayed_work_sync() is called outside of wl->lock and before
wl->enabled is cleared, could a concurrent intel_dmc_wl_put() race here?

If CPU1 is in intel_dmc_wl_disable() just after cancel_delayed_work_sync(),
and CPU2 calls intel_dmc_wl_put():

CPU2 takes the lock in intel_dmc_wl_put(), sees wl->enabled is still true,
and queues the work again:

    if (refcount_dec_and_test(&wl->refcount)) {
        if (!wl->enabled)
            goto out_unlock;
       =20
        __intel_dmc_wl_release(display);
        ...

Then CPU1 would acquire the lock, disable the wakelock, and set=20
wl->enabled =3D false, but the work has already been re-queued.

When the queued intel_dmc_wl_work() executes later, it checks if refcount is
non-zero but doesn't check wl->enabled. It would then poll for
DMC_WAKELOCK_CTL_ACK and trigger the "DMC wakelock release timed out"
WARN_RATELIMIT since the wakelock was already disabled.

> =20
>  	spin_lock_irqsave(&wl->lock, flags);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013161131.2572=
279-4-dibin.moolakadan.subrahmanian@intel.com?part=3D2
