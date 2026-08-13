Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A80C5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 00:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D7810E480;
	Thu, 13 Aug 2026 00:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gbgd4Wr+";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A9F10E480
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 00:23:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5E324600AD;
 Thu, 13 Aug 2026 00:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA04F1F000E9;
 Thu, 13 Aug 2026 00:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786580614;
 bh=VE8B8uVhH8SKxGikj6Ip7f2P9l51vSsh2hfRLZ7bmsI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Gbgd4Wr+RyFn347s9PSKdWd9hrirQFhqUuErdNKWdra+UtC6UA1kdjTylPlATaakL
 PSueJpby5BbKrKQS7GYi459zYGEt5nzxPSz8IFAYbSqBWKWRui1fLaPBtIb8P8TCA0
 GJOYC3QIrnZU/DgWixS5ELlwdoTcETDBgP6n1bHpmej3B403NozTtPX4A26bLqFTHR
 Pv6jUFJLldV6MqVtdVlPmSMOTSmjqFrZug/IKtOgAbB28bqvNzhZTdw2tHX5WKKrIa
 FnT5+mKmt4ubQj2Cr23j/ukJFvPJ/3LjdnUay5z1C9VudZPvhVea7RZRvgePNKEvt/
 /By9gzeJsSk0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] drm/xe/forcewake: flush delayed release at power
 boundaries
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260813000654.2712317-4-zongyao.bai@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <20260813000654.2712317-4-zongyao.bai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 00:23:33 +0000
Message-Id: <20260813002333.EA04F1F000E9@smtp.kernel.org>
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

Pre-existing issues:
- [High] PMU events hold long-lived forcewake references that outlive devic=
e teardown and suspend boundaries, defeating the patch's attempt to quiesce=
 forcewake accesses before power-off.
--

--- Patch [3]: [PATCH v5 3/4] drm/xe/forcewake: flush delayed release at po=
wer boundaries ---
commit 137d6a969747b4828385eae977e1c1ba6eb0b98d
Author: Zongyao Bai <zongyao.bai@intel.com>

drm/xe/forcewake: flush delayed release at power boundaries
   =20
Add a synchronous forcewake flush that cancels per-domain timers and
settles pending sleep acknowledgments. Provide a scoped cleanup class
so the final put is always followed by the flush before the caller
continues toward power-off.

> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_f=
orce_wake.c
> index 3f5013c7424c8..ef43899e1f7d3 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -391,6 +391,55 @@ void xe_force_wake_put_delay(struct xe_force_wake *f=
w, unsigned int fw_ref)
>  	__xe_force_wake_put(fw, fw_ref, true);
>  }
> =20
> +/**
> + * xe_force_wake_flush - Flush delayed forcewake releases
> + * @fw: Pointer to the force wake structure
> + *
> + * Synchronously cancels delayed-release timers and completes pending sl=
eep
> + * requests and ACK waits. This must be called after the final forcewake=
 put
> + * and before power-off because the timer callback accesses MMIO.
> + *
> + * The caller must ensure no forcewake reference outlives this call and
> + * serialize against new delayed releases or final puts that consume a
> + * recorded delayed-release request. Timers are canceled before taking
> + * fw->lock because their callbacks acquire the same lock.
> + */
> +void xe_force_wake_flush(struct xe_force_wake *fw)
> +{
> +	struct xe_gt *gt =3D fw->gt;
> +	struct xe_force_wake_domain *domain;
> +	unsigned int tmp, sleep, ack_fail =3D 0;
> +	unsigned long flags;
> +
> +	for_each_fw_domain(domain, fw, tmp)
> +		hrtimer_cancel(&domain->sleep_timer);
> +
> +	spin_lock_irqsave(&fw->lock, flags);
> +	sleep =3D fw->sleep_ack_pending_domains;
> +	for_each_fw_domain(domain, fw, tmp) {
> +		assert_domain_state(fw, domain);
> +		domain->delayed_release_requested =3D false;
> +		if ((fw->delayed_release_domains & BIT(domain->id)) &&
> +		    !domain->ref) {

[Severity: High]
This is a pre-existing issue, but does this flush mechanism fail to quiesce
active PMU references before power-off?

If a user opens a PMU event (e.g., engine-active-ticks) and acquires a
forcewake reference, it can outlive device teardown or suspend. When
xe_force_wake_flush() runs, it skips the domain because domain->ref > 0.

If the device is unplugged or suspended while the PMU event is open, the do=
main
is not put to sleep due to the active reference, and the hardware loses pow=
er.
On resume, software may incorrectly believe the domain is awake, failing to=
 send
wake requests and causing hardware timeouts or hangs on subsequent accesses.

Furthermore, on unplug, mmio_fini sets regs =3D NULL. When the user finally
closes the PMU event fd, xe_pmu_event_destroy() releases forcewake:

drivers/gpu/drm/xe/xe_pmu.c:xe_pmu_event_destroy() {
    ...
    xe_force_wake_put(gt_to_fw(gt), *fw_ref);
    ...
}

Will this cause a use-after-unmap logic hitting a WARN_ON_ONCE in
mmio_available when accessing the unmapped MMIO?

> +			fw->delayed_release_domains &=3D ~BIT(domain->id);
> +			sleep |=3D BIT(domain->id);
> +			domain_sleep(gt, domain);
> +		}
> +		assert_domain_state(fw, domain);
> +	}
> +	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
> +		fw->sleep_ack_pending_domains &=3D ~BIT(domain->id);
> +		if (domain_sleep_wait(gt, domain) =3D=3D 0)
> +			fw->awake_domains &=3D ~BIT(domain->id);
> +		else
> +			ack_fail |=3D BIT(domain->id);
> +	}
> +	spin_unlock_irqrestore(&fw->lock, flags);
> +
> +	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge =
sleep request\n",
> +		   str_plural(hweight_long(ack_fail)), ack_fail);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813000654.2712=
317-1-zongyao.bai@intel.com?part=3D3
