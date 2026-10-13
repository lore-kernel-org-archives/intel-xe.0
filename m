Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133BECC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 21:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECE610EA38;
	Tue, 13 Oct 2026 21:03:17 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CBB10EA38
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 21:03:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F16F240E4B;
 Tue, 13 Oct 2026 21:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61411F00893;
 Tue, 13 Oct 2026 21:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791925390;
 bh=2qktXRf+Txu5Jxa+o5y8UFynNvaS9tgap9IFOSABxwg=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=FKoXTk7RDy11kcxeVdZtwstw3uWxlULpzpwyCl0JgFO/a7WOdyY9aCB0IBXxUdVNj
 Up9db/QhJ8LftVTrdROIeuHkjQzXhZJGykZNNq7gVBUgik5aE3BAUZIdoVCKdR52Ts
 cIA5m4VkW8+XwY9NYEqNzB49778VoXfzWq1oZJj0ZLkruRTlqY1nsS2Xyf+OFMkIF4
 I7XSauNCZEPexNEOEXroD8XCHLaU/gdeOo0MKzPeqkSYqCqhnKWbb2EnuNDAfysRoK
 celjZl6iM5/X/TkF+j2w6V9al4mSzUQI1bADi9PzA6PwcbNnBocMfkBFjyECBvmC0c
 DJ64eT85m9rLQ==
Message-ID: <sashiko-outbox-170505@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] drm/xe: Synchronously wait for queue kill on FD
 close
To: "Daniel Charles" <daniel.charles@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013201508.514480-4-daniel.charles@intel.com>
References: <20261013201508.514480-1-daniel.charles@intel.com>
 <20261013201508.514480-4-daniel.charles@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 21:03:10 +0000
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
- [High] drm/xe: page table teardown races with async GT reset on timeout
--

commit 7c6f890c53c2275179c96ad6d41beb44f5cd78ba
Author: Daniel Charles <daniel.charles@intel.com>

drm/xe: Synchronously wait for queue kill on FD close

This commit splits the FD close teardown into two passes, first killing
every queue, then synchronously waiting for the queue scheduling to stop
by calling xe_exec_queue_kill_sync(). In the GuC backend, this wait uses
a 5-second timeout, after which it triggers an asynchronous GT reset if
the GuC does not respond.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 2ad5efec2bda1..1c5588eb9676b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -190,8 +190,13 @@ static void xe_file_close(struct drm_device *dev, st=
ruct drm_file *file)
[ ... ]
> +	xa_for_each(&xef->exec_queue.xa, idx, q) {
> +		xe_exec_queue_kill_sync(q);
>  		xe_exec_queue_put(q);
>  	}
> +
>  	xa_for_each(&xef->vm.xa, idx, vm)
>  		xe_vm_close_and_put(vm);

[Severity: High]
If the queue kill sync times out and triggers an asynchronous GT reset,
this teardown sequence will proceed before the hardware is actually stopped.

Since the GuC and hardware engines may still be actively executing the
context, can tearing down the VM's page tables via xe_vm_close_and_put()
here cause regressions like CAT errors and secondary engine resets?

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 609af66b343d5..353078e0c9e0b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2267,6 +2267,28 @@ static void guc_exec_queue_kill(struct xe_exec_que=
ue *q)
[ ... ]
> +static void guc_exec_queue_kill_sync(struct xe_exec_queue *q)
> +{
[ ... ]
> +	ret =3D wait_event_timeout(guc->ct.wq,
> +				 (!exec_queue_enabled(primary) &&
> +				  !exec_queue_pending_disable(primary) &&
> +				  !exec_queue_pending_enable(primary)) ||
> +				 xe_guc_read_stopped(guc) ||
> +				 vf_recovery(guc) ||
> +				 exec_queue_wedged(primary), HZ * 5);
> +	if (!ret) {
> +		xe_gt_warn(q->gt, "Queue kill failed to respond, guc_id=3D%d\n",
> +			   primary->guc->id);
> +		xe_gt_reset_async(q->gt);
> +	}
> +}

[Severity: High]
Does triggering an asynchronous reset here fail to provide the necessary
synchronization guarantee?

By returning immediately while the reset is only queued, the caller
xe_file_close() will proceed to tear down page tables while the hardware
might still be running. Should this wait for the reset to complete to avoid
introducing regressions during cleanup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013201508.5144=
80-1-daniel.charles@intel.com?part=3D3
