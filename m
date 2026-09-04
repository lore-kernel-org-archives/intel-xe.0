Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FD2C624D6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 00:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02A510E0FD;
	Fri,  4 Sep 2026 00:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TzlJdwm1";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E3A10E0FD
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 00:25:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 501D560234;
 Fri,  4 Sep 2026 00:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25B61F000E9;
 Fri,  4 Sep 2026 00:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788481515;
 bh=ArREvJ4TQw+1BQeQGMfL92IoXq20c2wo+NraeHJO7ug=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=TzlJdwm1qEkAyC9fSuQ010f93zhBM4ukXTMYcGooAl4gUWaPEQ1uOX0OMRio6nJaL
 yx2LZLCHdPyByF2QLpINjLGcRX/8bTIDQ0JM2CR30gQlB9jT2dAnYhKuz36M8VzreF
 QqQoHLJHfOP9XC61LaEtYfIyZ96yZ4juOy4Yz/WFFOz5Y3i+IO/P/4u2vBmQ9rKvJ8
 ZFQxdN3NTqPAPr1ulIRbXtFlVV1dORnQiTWZ3u2h22P36L23Jz6sDVbppYCf2vBrOH
 +UR/0SaN+4vedLcZ5vBMVnhIM6boWIqjAu9ERr2KXx0a94zIg8ReQ6+CGHjlA0zoaw
 HFMD7xYdO090w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/25] drm/xe: Update scheduler job layer to support
 PT jobs
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903235842.3401722-8-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-8-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 00:25:14 +0000
Message-Id: <20260904002514.D25B61F000E9@smtp.kernel.org>
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
- [Medium] Type Confusion in xe_sched_job union leads to kernel pointer lea=
k via trace events and devcoredump
--

commit 6a6fd5ea520b6b9671aa39ce12a2edcd42ab0033
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Update scheduler job layer to support PT jobs

This commit updates the scheduler job layer to support page table (PT) jobs,
which run entirely on the CPU. It reuses the LRC fence storage by introduci=
ng
a union in the xe_sched_job struct to hold PT update arguments when the job
does not require an LRC fence or batch address.

Link: https://patch.msgid.link/20260228013501.106680-8-matthew.brost@intel.=
com

> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe=
/xe_sched_job_types.h
> index 0490b1247a6e9..5e1824c36c740 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h

[ ... ]

> @@ -71,8 +90,14 @@ struct xe_sched_job {
>  	bool restore_replay;
>  	/** @last_replay: last job being replayed */
>  	bool last_replay;
> -	/** @ptrs: per instance pointers. */
> -	struct xe_job_ptrs ptrs[];
> +	/** @is_pt_job: is a PT job */
> +	bool is_pt_job;
> +	union {
> +		/** @ptrs: per instance pointers. */
> +		DECLARE_FLEX_ARRAY(struct xe_job_ptrs, ptrs);
> +		/** @pt_update: PT update arguments */
> +		DECLARE_FLEX_ARRAY(struct xe_pt_update_args, pt_update);
> +	};
>  };
> =20

[Severity: Medium]
Does this regression cause a kernel pointer leak when the job is a PT job?

In struct xe_job_ptrs, batch_addr is a 64-bit value that aliases with the
const struct xe_migrate_pt_update_ops *ops pointer in struct
xe_pt_update_args.

When xe_sched_job_snapshot_capture() in drivers/gpu/drm/xe/xe_sched_job.c
captures a snapshot, it appears to unconditionally read batch_addr without
checking if the job is a PT job:

for (i =3D 0; i < q->width; i++)
	snapshot->batch_addr[i] =3D
		xe_device_uncanonicalize_addr(xe, job->ptrs[i].batch_addr);

Similarly, the xe_sched_job trace event in drivers/gpu/drm/xe/xe_trace.h
unconditionally reads batch_addr:

__entry->batch_addr =3D (u64)job->ptrs[0].batch_addr;

Can this type confusion expose kernel function pointers to userspace via
trace events or sysfs devcoredump during a GPU hang?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903235842.3401=
722-1-matthew.brost@intel.com?part=3D7
