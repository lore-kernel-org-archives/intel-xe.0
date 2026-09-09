Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2598BC79FA1
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 01:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE44610E06B;
	Wed,  9 Sep 2026 01:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bkuxtXat";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B25810E06B
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 01:56:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3FEBE601FB;
 Wed,  9 Sep 2026 01:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1D91F00A3A;
 Wed,  9 Sep 2026 01:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788918965;
 bh=FGC4RYDa0k7tCTBsN/JlJeahf+zr7s2BwDAMHlEiBTM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=bkuxtXatLtt8UMfTIp1oZFsMqbhyJVHSWkTVuisQRbSSpGvD/FDMMmHC5dBLr0ASL
 knoFAv7mJaJxBlG8N42tGOP1lFXB3/fagnotoDxZQW3Tf0CdDWrKMj9Ccfq/epCRsC
 YueiJ67cPQZo3Md1vJ8pLKp2PwBy9XHlYxCJGtmxzAABhe9dJ6Lqw8BNK4ia50Nck3
 7MGHaxQB8YoxrliJa6JYgCNMZS3tlzJJaL3ar/7yOxjwnzhq8EBzu8A10ixXiGabtU
 W6Lq0PoKbCUjNSTfq5UX9tRmGer+nFhXp8bF3iMUtPEbJAeoHjtnDdJrel9HM6dw1x
 uhyqyC4pmCmrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/xe: Inspect all forcewake bits for runtime
 idleness
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909013712.1962521-1-vinay.belgaumkar@intel.com>
References: <20260909013712.1962521-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 01:56:04 +0000
Message-Id: <20260909015604.CF1D91F00A3A@smtp.kernel.org>
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
- [High] Returning -EAGAIN from `xe_pci_runtime_idle` aborts the runtime PM=
 idle transition but fails to schedule a retry, permanently preventing runt=
ime suspend.
- [Medium] Using `xe_gt_info` in a runtime PM path will cause severe log sp=
am when forcewake is held.
--

commit 987ddc78bc72644b422f8d130f4407129128a641
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Inspect all forcewake bits for runtime idleness

This commit updates the runtime idleness check to inspect all forcewake
bits across all domains. If any bit is set, it returns -EAGAIN to skip=20
the suspend operation.

> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_f=
orce_wake.c
[ ... ]
> +bool xe_force_wake_any_bit_set(struct xe_force_wake *fw)
> +{
> +	struct xe_gt *gt =3D fw->gt;
> +	struct xe_force_wake_domain *domain;
> +	unsigned int tmp;
> +	u32 val;
> +
> +	for_each_fw_domain(domain, fw, tmp) {
> +		val =3D xe_mmio_read32(&gt->mmio, domain->reg_ctl);
> +		if (val & 0xFFFF) {
> +			xe_gt_info(gt, "FW bit set in domain: %d, val: 0x%x",
> +				   domain->id, val);

[Severity: Medium]
Will this cause severe log spam in high-frequency runtime PM paths?

Forcewake can be legitimately held for long periods (for example, by
userspace profiling tools, IGT tests, or debugfs readers). Every time the
driver drops its PM reference and triggers a runtime idle check, this
unconditional info message will print if the external agent is still holding
forcewake.=20

Should this be a debug-level log (xe_gt_dbg) or rate-limited instead?

> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
[ ... ]
> @@ -1437,9 +1438,14 @@ static int xe_pci_runtime_idle(struct device *dev)
>  {
>  	struct pci_dev *pdev =3D to_pci_dev(dev);
>  	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> +	struct xe_gt *gt;
> +	u8 id;
> =20
>  	xe_pm_d3cold_allowed_toggle(xe);
> =20
> +	for_each_gt(gt, xe, id)
> +		if (xe_force_wake_any_bit_set(gt_to_fw(gt)))
> +			return -EAGAIN;

[Severity: High]
Will returning -EAGAIN here permanently prevent runtime suspend?

When the PM core's rpm_idle() function receives a non-zero return value, it
aborts the idle transition and bypasses the subsequent call to rpm_suspend(=
).
Returning an error code does not automatically instruct the PM core to poll
or reschedule an autosuspend.

If a forcewake bit happens to be set at the moment the PM usage count drops
to 0, it seems the device will remain stranded in the active (D0) state
indefinitely.=20

Should this explicitly schedule a retry, perhaps by calling
pm_runtime_mark_last_busy() and pm_runtime_autosuspend() before returning?

>  	return 0;
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909013712.1962=
521-1-vinay.belgaumkar@intel.com?part=3D1
