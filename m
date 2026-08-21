Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5F8C5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D923310E284;
	Fri, 21 Aug 2026 11:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xz1MozGK";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE2510E284
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 11:52:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 38A1C60A5D;
 Fri, 21 Aug 2026 11:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4601F000E9;
 Fri, 21 Aug 2026 11:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787313120;
 bh=ju+xVPlrsjSKzT9DsjqQEja5oCG9ZvF6KBWllBH/1eM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Xz1MozGKkP4bOqDYaAKkih8STan8ahSJH973N7Yq7beCTNm5IOcd21CFL5JH+3A5R
 AIAalpj8E0B/kYY7BtZseWNDfMopp1vbO7eD8I0Hynl2sfNcGorUM4VFWCJaXZsHbU
 XAwWFCw/FLuX7Io8+t3hXfMqIJjE6i+Cpn/DfoGSg/ori1ZydNxvloD1ug33U7UY8/
 ETv9bYgto1rpTjb8OZHCwjWWdixiuhk97cthgIWbtyyrmd2fouKqZ8wrnDDO5/siDK
 edKMVfaC6v9JRhCulVSHEFJyv4s3nCyyORWG0o2tnh0wEEUe7UEXnSykruwqEKjo6e
 y5xriyz/oZR3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 02/10] drm/xe/guc_submit: Introduce
 guc_exec_queue_reinit_kernel()
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260821112436.545405-3-raag.jadav@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-3-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 11:52:00 +0000
Message-Id: <20260821115200.BB4601F000E9@smtp.kernel.org>
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
- [High] Unprotected modification of scheduler timeout in xe_sched_reinit()=
 races with active TDR work, and drm_sched_is_stopped() assert will falsely=
 trigger.
- [Medium] Layering violation: generic `xe_gpu_scheduler` component directl=
y references GuC-specific `xe_guc_exec_queue` via downcast.
--

--- Patch [2]: [PATCH v10 02/10] drm/xe/guc_submit: Introduce guc_exec_queu=
e_reinit_kernel() ---
commit 9c5abd285bbf057d5cc8df0e74c9cc1e73a4d283
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/guc_submit: Introduce guc_exec_queue_reinit_kernel()

In preparation of usecases which require re-initializing GuC submission
after PCIe FLR, introduce guc_exec_queue_reinit_kernel() helper. This will
restore kernel queues which might have been killed before PCIe FLR.

> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/x=
e_gpu_scheduler.c
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c

[ ... ]

> @@ -84,6 +88,19 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
>  	return drm_sched_init(&sched->base, &args);
>  }
> =20
> +void xe_sched_reinit(struct xe_gpu_scheduler *sched)
> +{
> +	struct xe_guc_exec_queue *ge =3D container_of(sched, struct xe_guc_exec=
_queue, sched);

[Severity: Medium]
Is it safe for the generic xe_gpu_scheduler component to directly downcast =
to
the GuC-specific xe_guc_exec_queue structure?

If xe_sched_reinit() is ever called by another submission backend (such as
execlists), couldn't this result in an invalid downcast and potential
memory corruption?

> +
> +	xe_gt_assert(ge->q->gt, drm_sched_is_stopped(&sched->base));
> +
> +	/*
> +	 * TODO: Implement drm_sched_reinit() instead of requiring the
> +	 * driver to restore individual fields.
> +	 */
> +	sched->base.timeout =3D sched->timeout;

[Severity: High]
Will the drm_sched_is_stopped() assert falsely trigger during PCIe FLR?

During hardware resets like PCIe FLR, xe_guc_submit_pause_abort() executes =
on
kernel queues, calling xe_sched_submission_start() (which sets pause_submit=
 to
false) and queuing TDR via guc_exec_queue_kill(). If xe_sched_reinit() is
later called on the same queue, the scheduler is no longer stopped, causing
this assert to fail.

Additionally, does modifying sched->base.timeout here race with the concurr=
ent
TDR work (work_tdr)? Modifying it without calling cancel_delayed_work_sync()
might leave the TDR work executing with an inconsistent timeout state on a
re-initialized kernel queue.

> +}
> +
>  void xe_sched_fini(struct xe_gpu_scheduler *sched)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821112436.5454=
05-1-raag.jadav@intel.com?part=3D2
