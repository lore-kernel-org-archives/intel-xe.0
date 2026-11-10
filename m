Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D542C606A320
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 22:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SkoXzITV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9507F10E078;
	Tue, 10 Nov 2026 22:34:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7653410E078
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 22:34:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1BF2042296;
 Tue, 10 Nov 2026 22:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19A31F008A2;
 Tue, 10 Nov 2026 22:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794350048;
 bh=J+r92uiWfUl6vpuj6leqwuLO8DLMUkLk+rVSuQBZbKw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=SkoXzITV3/mlchUumY8CBFekv9uk0rzBScCDmtPGlTan1tCQJ1mNTBPICbE/WxyGy
 w24Iwy0IXli1Lw1YXd+eJGP/gl6HTJe7xLwJjQym8zPNr78ReE9LRSr0jmBV7YjPNH
 DrWVfT41l6AWTo4D/9KVWois6vnMQatdJaCh4O4dxSn6mz/aQJlTkIR8NRTpEDk7/x
 UMbzL/7GW4RmL3UDKqxX6FCBbROcboH/n6dPHOJbS0UTCNpra0lcWvu80I3bivMEnq
 xMg5uxObO/RCB/u98C6prxTa3aTb7hAgI1qJBM0WNPT36/tmCnKKYOrrxmHVooLEAj
 pbgao/YQKBgsA==
Message-ID: <sashiko-outbox-207832@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] drm/xe/forcewake: add delayed release with
 hysteresis
To: "Zongyao Bai" <zongyao.bai@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261110220542.432595-2-zongyao.bai@intel.com>
References: <20261017031856.2723986-1-zongyao.bai@intel.com>
 <20261110220542.432595-1-zongyao.bai@intel.com>
 <20261110220542.432595-2-zongyao.bai@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 22:34:07 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/xe: delayed forcewake domains stranded when
  rpm_get_if_active fails
- [Low] drm/xe/forcewake: xe_force_wake_assert_held() passes on delayed
  domains
--

commit 4a71af2399dc0153d2185a60b2aa48a76a02006c
Author: Zongyao Bai <zongyao.bai@intel.com>

drm/xe/forcewake: add delayed release with hysteresis

This commit adds xe_force_wake_put_delay() and a delayed release worker to
keep forcewake domains awake for a short hold period after their last
reference is dropped.

> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_f=
orce_wake.c
> index 197e2197bd0a3..d09d138c10840 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c

[ ... ]

> @@ -244,21 +307,101 @@ void xe_force_wake_put(struct xe_force_wake *fw, u=
nsigned int fw_ref)
>  	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
>  		xe_gt_assert(gt, domain->ref);
> =20
> -		if (!--domain->ref) {
> +		if (--domain->ref)
> +			continue;
> +
> +		if (hold_ms && fw->delayed_enabled) {
> +			unsigned long hold =3D xe_force_wake_hold_jiffies(hold_ms);
> +
> +			domain->hold_until =3D jiffies + hold;
> +			fw->delayed_domains |=3D BIT(domain->id);
> +			/* No-op if pending, the worker requeues for the latest hold. */
> +			queue_delayed_work(system_percpu_wq,
> +					   &fw->delayed_release_work, hold);
> +		} else {
>  			sleep |=3D BIT(domain->id);
> -			domain_sleep(gt, domain);
>  		}
>  	}

[Severity: Low]
Does keeping BIT(domain->id) set in fw->awake_domains while a domain is in
fw->delayed_domains cause xe_force_wake_assert_held() to pass even when no
caller holds a reference?

drivers/gpu/drm/xe/xe_force_wake.h:xe_force_wake_assert_held() {
	xe_gt_assert(fw->gt, domain !=3D XE_FORCEWAKE_ALL);
	xe_gt_assert(fw->gt, fw->awake_domains & domain);
}

During the delayed hold window, domain->ref is 0 and
xe_force_wake_delayed_release_work() can put the domain to sleep on
another CPU at any time, but xe_force_wake_assert_held() only checks
fw->awake_domains & domain without excluding fw->delayed_domains.

> +	ack_fail =3D xe_force_wake_sleep_locked(fw, sleep);
>  	spin_unlock_irqrestore(&fw->lock, flags);
> =20
> +	xe_force_wake_warn_sleep_fail(gt, ack_fail);
> +}

[ ... ]

> +static void xe_force_wake_delayed_release_work(struct work_struct *work)
> +{
> +	struct xe_force_wake *fw =3D container_of(to_delayed_work(work),
> +						struct xe_force_wake, delayed_release_work);
> +	struct xe_gt *gt =3D fw->gt;
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +	struct xe_force_wake_domain *domain;
> +	unsigned int tmp, expired =3D 0, ack_fail;
> +	unsigned long flags, next =3D 0;
> +	bool remaining =3D false;
> +
> +	/* Never resume from here, the suspend flush settles delayed domains. */
> +	if (!xe_pm_runtime_get_if_active(xe))
> +		return;

[Severity: Medium]
Can returning early here without sleeping expired domains or requeuing
fw->delayed_release_work leave fw->delayed_domains stranded awake?

Although commit "drm/xe/forcewake: flush delayed release at power and
teardown boundaries" flushes delayed domains in xe_gt_suspend() and
xe_gt_runtime_suspend(), xe_pm_runtime_get_if_active() returns false as
soon as rpm_suspend() sets dev->power.runtime_status to RPM_SUSPENDING.
If xe_force_wake_delayed_release_work() runs while xe_pm_runtime_suspend()
is in xe_pxp_pm_suspend(), xe_bo_evict_all(), or an earlier GT's suspend,
and that step fails and jumps to out_resume, the remaining GTs are never
flushed and runtime_status returns to RPM_ACTIVE with their delayed
domains still awake and no worker pending, preventing C6 entry.  In
addition, when CONFIG_PM is disabled, pm_runtime_get_if_active() returns
-EINVAL, so xe_pm_runtime_get_if_active() is always false and delayed
domains are never released.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110220542.4325=
95-1-zongyao.bai@intel.com?part=3D1
