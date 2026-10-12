Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B267CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 06:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7D710ED53;
	Mon, 12 Oct 2026 06:01:00 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F1C10ED54
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 06:00:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6FA0543D5D;
 Mon, 12 Oct 2026 06:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E3F1F0089B;
 Mon, 12 Oct 2026 06:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791784854;
 bh=J0wLZQvngiQzT7hymOxCeu+cvUt4ldKst8vi46PNPbM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=iQBxGw/ocMTd7+Nz5BHql/8OYpv9hDwN68efn++1OqP3bCspYsddXi7avrRi5ls1C
 UUc4tT8IvcyfC5kfuseO7YdUq2opOOzx5MJ3Mj+rIVkkbaNd4BMx9k9w+OwPRs8feM
 AeSauVOFl7+e3/51fX3dlhuS3UZ75SMVbs4Nljm3+kiJOWXHpUaFRvV67QdqVhC7WG
 LhWjPJxqAgMpLiZtkfSgWLv10QSh8U9RF3zWMgWIpNalCRLNmL6x0GlL9CTvOoNYtb
 uoxhp3jSxe/DI2Xa4g709j+dTP1NR9bBpqXbiazcvu1ptCNxeG8jJJTDySGzJWkSRa
 vx2s7vxBmjlaQ==
Message-ID: <sashiko-outbox-167695@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] drm/xe/guc: Protect timeout handling from device
 unplug
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261012055053.964468-7-satyanarayana.k.v.p@intel.com>
References: <20261012055053.964468-5-satyanarayana.k.v.p@intel.com>
 <20261012055053.964468-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 06:00:53 +0000
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
- [Medium] drm/scheduler: Memory leak of timed-out job when returning ENODEV
--

commit 17e9fcf9241e0bec8edf4a488366f62c46a0e6dc
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe/guc: Protect timeout handling from device unplug

This commit guards the GuC scheduler timeout callback with drm_dev_enter()
and drm_dev_exit() to handle concurrent device unplug. If an unplug has
started, it marks the job with -ENODEV and returns a corresponding status
to the scheduler.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 7ce73489c35fc..082c94340b41d 100644
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
> +		return DRM_GPU_SCHED_STAT_ENODEV;

[Severity: Medium]
Does returning DRM_GPU_SCHED_STAT_ENODEV here cause a memory leak of the
struct xe_sched_job and its associated resources?

When a job times out concurrently with device unplug, the DRM scheduler core
in drm_sched_job_timedout() explicitly drops the job from its pending list
before invoking this backend timeout callback. It only reinserts the job in=
to
the pending list if the callback returns DRM_GPU_SCHED_STAT_NO_HANG.

By returning DRM_GPU_SCHED_STAT_ENODEV, the job remains unlinked. Even thou=
gh
the fence is signaled via xe_sched_job_set_error(), the scheduler's cleanup
worker (drm_sched_free_job_work()) and teardown sequences only search
sched->pending_list.=20

Because the job is neither manually freed in this early return path nor
reinserted for automatic scheduler cleanup, the job structure appears to be
permanently orphaned.

> +	}
> =20
>  	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012055053.9644=
68-5-satyanarayana.k.v.p@intel.com?part=3D2
