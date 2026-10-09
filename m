Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13AFCA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 15:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6837210E16B;
	Fri,  9 Oct 2026 15:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nfl7xf56";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9022210E16B
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 15:14:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 376A2417D0;
 Fri,  9 Oct 2026 15:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50C21F00893;
 Fri,  9 Oct 2026 15:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791558899;
 bh=WmfLusBE66grS4ioFv/oKZFC83O4iMeTym4hXopmPdU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nfl7xf56EOb53tWxcG5luEpTUAYjITZsSV9nZtcs/KPcAjgpvueN7S1bBTX8Qkntz
 GyQdMBrZn0JISAj+iDczJElThlLzAQzaKjo9380QE2WPVFrj1iOKU0+Mc69RYwI66l
 wh4+KYvnN52D5MwDOGzUvf99aOq9lWK8imL3KV5LjhXDUDJ2d2RYEA8FsTdO4FtrZC
 JpqyqnlmOfF1n3SYgillenP4TcunreWBofZgFS9AhmXJnnSRpQJLQbd1GTCsbixk22
 Tydu5mySuvzl62UgctZRjf/RxWbh0dJ3k8d5Ufpq9lxSyOHWEoWdW7qO0ndTd+Wpfe
 EB9gYBWsdAkpw==
Message-ID: <sashiko-outbox-165753@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] drm/xe/guc: Protect timeout handling from device
 unplug
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009145906.886719-7-satyanarayana.k.v.p@intel.com>
References: <20261009145906.886719-5-satyanarayana.k.v.p@intel.com>
 <20261009145906.886719-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:14:58 +0000
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
- [High] drm/xe: UAF in scheduler timer due to NO_HANG return during unplug
--

commit 89f2548ce53ddab43344452d08720715459b50fd
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe/guc: Protect timeout handling from device unplug

This commit guards the GuC scheduler timeout callback with drm_dev_enter()
and drm_dev_exit() to handle device unplug. If the device is unplugged,
it marks the job with -ENODEV and returns DRM_GPU_SCHED_STAT_NO_HANG.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 0b231228bde8b..443842e87498e 100644
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

[Severity: High]
Does returning DRM_GPU_SCHED_STAT_NO_HANG here during device unplug cause a
use-after-free in the scheduler timer?

When the unplug path calls drm_sched_fini(), it stops queues and waits on
cancel_delayed_work_sync(&sched->work_tdr). Concurrently, returning
DRM_GPU_SCHED_STAT_NO_HANG from the timeout handler instructs the scheduler
to reinsert the job onto pending_list and call
drm_sched_start_timeout_unlocked().

Because pending_list is not empty, drm_sched_start_timeout_unlocked()
re-arms work_tdr via mod_delayed_work().

Once the timeout handler returns, cancel_delayed_work_sync() completes, but
the timer remains actively armed. After drm_sched_fini() finishes and devm
frees the scheduler, the armed timer fires, causing a panic.

Should this return DRM_GPU_SCHED_STAT_ENODEV instead to prevent re-arming
the timer?

> +	}
> =20
>  	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009145906.8867=
19-5-satyanarayana.k.v.p@intel.com?part=3D2
