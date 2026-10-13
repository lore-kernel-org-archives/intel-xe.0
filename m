Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5DBCC6B16
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 15:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F93410EE28;
	Tue, 13 Oct 2026 15:40:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DC010EE28
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 15:40:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3094742AFC;
 Tue, 13 Oct 2026 15:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF6B1F00898;
 Tue, 13 Oct 2026 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791906040;
 bh=lpzcbYeedvxGv5VuVMJDI59efXlj1s0mrPYMaZD2oFA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ARgh8lckjDH+sIlWE01UWt3MNc3/2glzeKxXjJ/VzM/5Z7l+J+jl48lkbZ+WGvulP
 Jcn2OS1p2FT1jmI9VxnPQSczAJKfNAhgOrW/557/zg5nL7g9DMnPrCcCvFUcU0CmOT
 cjzLSUjTk15DbG8j5Xr1flyhckDulcIHr+QWBXtnqIy+rSWjAU64+N9MckIPbkIix3
 xA2wR8acZRx74p1SNo8YfRqeW0/uOeNuSjGdner9HTrp1ElfMTbjC23JuPSTkiGbtZ
 XpU13WBe4y+TepYFhoeRXRj+H9FD+Qc/W70SEYsDCXuIRMQzlslrYVrBwDP5ffVyWJ
 mciiNW0DB26pA==
Message-ID: <sashiko-outbox-170033@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] drm/xe/guc: Protect timeout handling from device
 unplug
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261013152417.3189567-7-satyanarayana.k.v.p@intel.com>
References: <20261013152417.3189567-5-satyanarayana.k.v.p@intel.com>
 <20261013152417.3189567-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 15:40:39 +0000
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
- [High] drm/xe/guc: memory leak of xe_sched_job when timeout handler retur=
ns NO_HANG
--

commit 178ee20625b5c3cfd23b5dbaf2b17c6d37fd5010
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe/guc: Protect timeout handling from device unplug

This commit guards the GuC scheduler timeout callback with drm_dev_enter()
and drm_dev_exit() to ensure device unplug waits for in-flight timeout
handling. If the unplug has already started, it sets the job error to
-ENODEV and returns it to the scheduler for cleanup.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 7ce73489c35fc..e0a3ce6015e02 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
> @@ -1614,6 +1615,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *=
drm_job)
>  	    vf_recovery(guc))
>  		return DRM_GPU_SCHED_STAT_NO_HANG;
> =20
> +	if (!drm_dev_enter(&xe->drm, &idx)) {
> +		xe_sched_job_set_error(job, -ENODEV);
> +		return DRM_GPU_SCHED_STAT_NO_HANG;
> +	}

[Severity: High]
Does returning DRM_GPU_SCHED_STAT_NO_HANG here cause a permanent memory
leak of the xe_sched_job?

When drm_dev_enter() fails, the timeout handler returns NO_HANG, which
causes the DRM scheduler to reinsert the job into sched->pending_list.
The unplug thread then destroys the queue, calling drm_sched_fini(),
which cancels the asynchronous work_free_job using cancel_work_sync().

Because the Xe driver does not implement the cancel_job callback in its
drm_sched_ops:

static const struct drm_sched_backend_ops drm_sched_ops =3D {
        .run_job =3D guc_exec_queue_run_job,
        .free_job =3D guc_exec_queue_free_job,
        .timedout_job =3D guc_exec_queue_timedout_job,
};

drm_sched_fini() does not free the remaining jobs in pending_list. The
jobs are permanently leaked, accompanied by a "Tearing down scheduler
while jobs are pending" warning.

As a quick note, a use-after-free concern regarding job->q here would
be structurally impossible, because guc_exec_queue_do_destroy() calls
cancel_delayed_work_sync(&work_tdr), strictly serializing queue teardown
against the timeout handler.

> +
>  	/* Kill the run_job entry point */
>  	if (xe_exec_queue_is_multi_queue(q))

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013152417.3189=
567-5-satyanarayana.k.v.p@intel.com?part=3D2
