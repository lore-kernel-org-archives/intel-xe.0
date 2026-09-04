Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4293C61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AFA10F833;
	Fri,  4 Sep 2026 02:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XSFTlGoz";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF5610F833
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 02:46:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 51B6742BB8;
 Fri,  4 Sep 2026 02:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6B91F00A3D;
 Fri,  4 Sep 2026 02:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788489982;
 bh=A7Ks6JDOMamzqu/w3tyW5pgI//cyE5zDkFwocL3TF6o=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=XSFTlGozVGXQdiOuYCDWQ9ABBe/ob+e2bG0LrvgOd3f0X4OF6Cf4kgB2gNjRmbnub
 1ZIpl40qB1R+RGaPsuvs/3IrCiWV1/jgosZ6xCWvLX6BPSr9V3FjiUAh68BrCG7ZWj
 46EHcEQJVfb7uU1xd0IVCPFkd8w/e8oxqPAaKmPdFmRpqxfTwWvNQzFeOY7otsR2rd
 y5yNHVTEdO2cSMsReiwSmT0Ymtw6WHNSLuXPzagwQrjfRVzCI+z6Uft5LKg2SbjdV/
 V09du2G4jOxvIqSckQ1kQyjbyXIhV5LD1FjLUY9WPaD7K08xjYx6/H/7paT8rmzXv4
 JkA49M1N98lng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/25] drm/xe: Update GuC submission backend to run
 PT jobs
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904022207.3490018-11-matthew.brost@intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
 <20260904022207.3490018-11-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 02:46:21 +0000
Message-Id: <20260904024622.0A6B91F00A3D@smtp.kernel.org>
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
- [Critical] PT jobs silently falsely report successful completion to the D=
RM scheduler when skipped due to a killed, banned, or wedged execution queu=
e, or when the job has an error.
- [Medium] Memory leak of `pt_job_ops` when a PT job is canceled or destroy=
ed before execution.
--

commit b19832ca384abf64ac2c629d5560dfa5eee4d788
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Update GuC submission backend to run PT jobs

This commit updates the GuC submission backend to execute PT (page table)
jobs via the CPU. These jobs bypass normal GPU execution to program page
tables for the final step of a bind job.

Link: https://patch.msgid.link/20260228013501.106680-11-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index cf306568ef307..528869928c1d3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
> @@ -1261,14 +1277,25 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_=
job)
[ ... ]
>  		job->restore_replay =3D false;
>  	}
> =20
> +	if (is_pt_job(job)) {

[Severity: Critical]
Does returning NULL here cause PT jobs to silently report successful
completion to the DRM scheduler when they were actually skipped?

If the execution queue is killed, banned, or wedged, or if the job has
an error, the execution block earlier in guc_exec_queue_run_job() is
skipped. However, this check unconditionally returns NULL for PT jobs
even in those cases.

Could this regression result in physical memory being freed and reallocated
while the page tables were never updated by the CPU, potentially allowing
a different queue in the same VM to access the reallocated memory?

> +		xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);

[Severity: Medium]
Is there a potential memory leak of the xe_pt_job_ops structures if a
PT job is canceled or destroyed before it reaches this execution phase?

This drops the reference to pt_job_ops during the run_job execution phase.
If the DRM scheduler is torn down (e.g. due to queue destruction, wedge,
or driver unload) while jobs are pending, the backend free_job callback
is invoked instead, bypassing this execution path.

Does the teardown path in xe_sched_job_destroy() need to drop these
pt_job_ops references as well to prevent a regression?

> +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
> +		return NULL;
> +	}
> +
>  run_job_out:
> =20
>  	return job->fence;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904022207.3490=
018-1-matthew.brost@intel.com?part=3D10
