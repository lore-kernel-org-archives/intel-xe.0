Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15007CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A54112661;
	Fri, 16 Oct 2026 07:50:10 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7678112661
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:50:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 035A560008;
 Fri, 16 Oct 2026 07:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEE41F000C4;
 Fri, 16 Oct 2026 07:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792137003;
 bh=mSehoETdBdZoY/9c6raaIdC+1vwLM+bOz9JIWJrbi4k=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=GUb4Bq8+9t36d5/lQaJJquX8rx+eZhrXudromwcCVMAC6apIbPeNfkHrptcWYr+Lr
 6/cKuxJ7g6yD4zAs8w1xk7BPw+o+ar/uvhDnIgB2cwpmUEdmCvRg0dP0fzc4mMTYAD
 UhE7Js5y4YNSTNBQ+4S6tsGVdLqFyCF8q5gQhS1laRfstrl5YbhmjitmnrbgagfjbS
 uLJnBZS9pFZDyANYgm5PD2+ePWs66EYiIFtCkjtkW4NXtBg91WF8AisUNJBZZ0AoNT
 GJuAn7oOoN41c58sux8pMEC5LG2KDqkZyq0tv7iq96A5G46g3waHmLKiHGQ9Ic7rcx
 uX4QgeJOH8M7g==
Message-ID: <sashiko-outbox-173970@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/9] drm/xe/gt: Use GT ordered workqueue for wedging
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261016072623.457392-2-raag.jadav@intel.com>
References: <20261016072623.457392-1-raag.jadav@intel.com>
 <20261016072623.457392-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 07:50:03 +0000
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
- [High] drm/xe: gt_wedge_worker assertion fails if device is suspended
--

commit ad400bddb33c2efaf9ed050aad03a83745b08aa2
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/gt: Use GT ordered workqueue for wedging

This commit introduces a GT wedge worker to handle execution queue
teardown asynchronously, avoiding scheduler disruption while jobs are
in-flight. It also adds a for_each_initialized_gt() macro to prevent
races if the device is wedged during the probe sequence.

> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index bc9bf6f0b5a79..27f32627a1f9b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
[ ... ]
> @@ -1204,6 +1209,15 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe=
_gt *gt)
>  	return NULL;
>  }
> =20
> +static void gt_wedge_worker(struct work_struct *w)
> +{
> +	struct xe_gt *gt =3D container_of(w, typeof(*gt), wedge.worker);
> +
> +	xe_device_assert_mem_access(gt_to_xe(gt));

[Severity: High]
Does this assertion fail if the device is suspended?

If a hardware fault or PCIe AER injection triggers wedging while the
device is in a runtime-suspended state (like D3hot), the error handler
calls xe_device_declare_wedged() in drivers/gpu/drm/xe/xe_device.c.

That function uses xe_pm_runtime_get_noresume():

	if (!atomic_xchg(&xe->wedged.flag, 1)) {
		xe->needs_flr_on_fini =3D true;
		xe_pm_runtime_get_noresume(xe);

This increments the PM usage count but leaves the device suspended.

When this asynchronous gt_wedge_worker executes, it unconditionally hits
xe_device_assert_mem_access(). Since the device is still
runtime-suspended, this assertion will fail, potentially causing a kernel
warning that disrupts the recovery process.

> +	xe_uc_declare_wedged(&gt->uc);
> +	xe_tlb_inval_reset(&gt->tlb_inval);
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016072623.4573=
92-1-raag.jadav@intel.com?part=3D1
