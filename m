Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16BCCA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 09:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EDE10EBBC;
	Mon, 12 Oct 2026 09:50:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BFB10EBBC
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 09:50:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3AAFA43CE2;
 Mon, 12 Oct 2026 09:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0031E1F0089B;
 Mon, 12 Oct 2026 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791798635;
 bh=lfQtjDbk5XabWk/7LsFyzZgVVA0kq660u3z5fNXQXqA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=WwlRguGeW1Ob1sS3tCWaQ+yrgEF+qwlWVBj1Z4mZk5QZQL3KzTyNMwjeFh1GX560E
 ptj7QtU/Kx/eD0+LgNdChonhjrJ/ocorEitTrlH1EA4G9hg4CJV2hY1ZP5kxr1isAN
 NPuzkBT5qw5iuSCysWzQotXzq4DAlBgM7CfgLR7AjKeIovaqB25dXe3HR/JDoreQsb
 F3T+5xYel8N9v4mFh/Vvz/xKtgkMhVl2xm+1r4MZYJGA6FwmylaawBrbUYfxf+Cs9U
 xicET9kOZ3NTxYRosoIWUcj8kt2ia9q9PJiTUHN0fL8yi/cqzYoNCUI3VwabDYh9SQ
 qRWM/SjrziI1Q==
Message-ID: <sashiko-outbox-167907@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] drm/xe/guc: Protect timeout handling from device
 unplug
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261012093053.2103743-7-satyanarayana.k.v.p@intel.com>
References: <20261012093053.2103743-5-satyanarayana.k.v.p@intel.com>
 <20261012093053.2103743-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 09:50:34 +0000
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
- [High] drm/xe: user-space hang and job leak on unplug due to aborted TDR =
cleanup
--

commit 1871c63913c38876d863255c92ead2457412e562
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe/guc: Protect timeout handling from device unplug

This commit adds drm_dev_enter() and drm_dev_exit() guards to the GuC sched=
uler
timeout callback. If the device unplug has already started, it sets an -ENO=
DEV
error on the timed-out job and returns early.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 7ce73489c35fc..68fd9785a8da4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1599,6 +1599,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *=
drm_job)
>  	int err =3D -ETIME;
>  	pid_t pid =3D -1;
>  	bool wedged =3D false, wedge_device =3D false, skip_timeout_check;
> +	int idx;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx)) {
> +		xe_sched_job_set_error(job, -ENODEV);
> +		return DRM_GPU_SCHED_STAT_NO_HANG;
> +	}

[Severity: High]
Does this early return skip setting the error on all other pending jobs in =
the
queue?

By returning early here, we skip the drm_sched_for_each_pending_job() loop
later in this function that sets -ECANCELED for all other pending jobs.

Later during hardware teardown, xe_gt_fini() calls xe_hw_fence_irq_finish()
to forcibly signal remaining hardware fences. However, xe_hw_fence_irq_fini=
sh()
only signals if xe_hw_fence_signaled() returns true:

drivers/gpu/drm/xe/xe_hw_fence.c:xe_hw_fence_signaled() {
    ...
	return dma_fence->error ||
		!__dma_fence_is_later(dma_fence, dma_fence->seqno, seqno);
}

Because the device is unplugged, MMIO reads of the sequence number typically
return 0xFFFFFFFF, making the chronological check evaluate to false for
pending jobs.

Without an error set on the fence from the skipped loop, xe_hw_fence_signal=
ed()
evaluates to false.

This could leave the fences permanently orphaned in xe_hw_fence_irq_finish(=
):

drivers/gpu/drm/xe/xe_hw_fence.c:xe_hw_fence_irq_finish() {
    ...
		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
			list_del_init(&fence->irq_link);
			XE_WARN_ON(dma_fence_check_and_signal_locked(&fence->dma));
			dma_fence_put(&fence->dma);
		}
    ...
}

If the fences are removed from the pending list but not signaled, can this
cause any user-space process waiting on them to hang indefinitely?

Furthermore, since the xe driver does not implement the cancel_job DRM
scheduler backend op, it seems drm_sched_fini() will not clean up the
pending_list, which could leak the unsignaled xe_sched_job structures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012093053.2103=
743-5-satyanarayana.k.v.p@intel.com?part=3D2
