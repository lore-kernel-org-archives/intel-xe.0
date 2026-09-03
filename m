Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B889DC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB5F10F692;
	Thu,  3 Sep 2026 15:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="giw7ZYED";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4430810F692
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:24:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 23D4B4401E;
 Thu,  3 Sep 2026 15:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACF41F00A3D;
 Thu,  3 Sep 2026 15:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788449061;
 bh=FB45C17h6UOvLdZ/9NBsu6xTMEmWHxC2yyYYU2qcN7g=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=giw7ZYEDN6TLXroP7Q21QqfSq9Fvr50JXaoDirNv0ra99Y8qdMwkeTldlqwMGbMrp
 G4KMPaie7bxLOgjpEvL4gmMDyg2hKPKlLPcJygq8dogJMOG7iy0PVO9IqkyDszuNOc
 DjnY5rhGT+z2tj2/8KcbL3MJ9ZJtT/+HfnTrccpggA9cI3/9+5gQOhtYjKcFSQg6Ho
 EQkKCMadTjFG4VqjY1aIUU41fw9UQ/3c1d20mSfpa9ibnMtlFu8D++x6JhyUK3POkD
 qVoMmbNu7UZf0aWQXjiPpB1bcLoumxSqqDpslFR1RKbQwpHm2bQ5+U5z0A/9PdzcWr
 fnZX3PvXMgfkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 13/27] drm/xe/eudebug: Add userptr vm pread/pwrite
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903145952.848051-14-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-14-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:24:20 +0000
Message-Id: <20260903152420.DACF41F00A3D@smtp.kernel.org>
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
- [Critical] Time-of-Check to Time-of-Use (TOCTOU) race condition in `xe_eu=
debug_vma_access()` allows a debugger to bypass security checks and read/wr=
ite arbitrary memory in an unrelated privileged process.
- [High] Debugger access to userptr memory spuriously fails with `-ESRCH` i=
f the specific thread that bound the userptr exits, even though the process=
 and address space remain fully valid.
--

commit f0c74c4990322a45ea5e521e420b8ab7f3f80507
Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
drm/xe/eudebug: Add userptr vm pread/pwrite

This commit implements debugger VM access for userptrs by taking a reference
to the current task when the bind is done. During pread/pwrite, it uses this
task parameter to access the debuggee VM via access_process_vm().

> diff --git a/drivers/gpu/drm/xe/xe_eudebug_vm.c b/drivers/gpu/drm/xe/xe_e=
udebug_vm.c
> index 316fe29586b0a..42e24c1bc09c7 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug_vm.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug_vm.c
[ ... ]
> @@ -52,6 +53,50 @@ static int xe_eudebug_vma_access(struct xe_vma *vma,
[ ... ]
> +	} else if (xe_vma_is_userptr(vma)) {
> +		struct xe_userptr *userptr =3D &to_userptr_vma(vma)->userptr;
> +		struct mm_struct *mm;
> +		int ret;
[ ... ]
> +		mm =3D get_task_mm(userptr->eudebug.task);
> +		if (!mm)
> +			return -ESRCH;

[Severity: High]
Will this cause spurious -ESRCH failures if the specific thread that bound
the userptr exits?

When the specific thread exits, its task->mm is cleared to NULL in exit_mm(=
),
causing get_task_mm() to return NULL here. If an application (like a
Vulkan/OpenGL driver) uses background worker threads to allocate and bind
memory, won't the debugger lose access to this valid memory once that worker
thread terminates, even though the process and mm_struct are still fully
alive?

> +
> +		ret =3D mm =3D=3D userptr->notifier.mm ? 0 : -ESRCH;
> +		mmput(mm);
> +		if (ret)
> +			return ret;
> +
> +		return access_process_vm(userptr->eudebug.task,
> +					 xe_vma_userptr(vma) + offset_in_vma,
> +					 buf, bytes,
> +					 write ? FOLL_WRITE : 0);

[Severity: Critical]
Does this sequence introduce a Time-of-Check to Time-of-Use (TOCTOU) race
condition that could allow local privilege escalation?

The code verifies that the mm matches the expected userptr->notifier.mm,
but then it drops the reference with mmput(mm) before proceeding.

Because access_process_vm() internally re-resolves the mm dynamically
without ptrace_may_access() checks, could a malicious unprivileged process
bind a userptr, pass the eudebug fd to a collaborating process, and call
execve() on a setuid binary?=20

If the execve() executes during the race window between mmput(mm) and
access_process_vm(), it appears this would fetch the new, privileged mm of
the setuid binary, granting the debugger arbitrary read/write access to it.

> diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_user=
ptr.h
> index 2a3cd1b5efbb0..b0781618b3f46 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.h
> +++ b/drivers/gpu/drm/xe/xe_userptr.h
[ ... ]
> @@ -133,4 +139,30 @@ static inline void xe_vma_userptr_force_invalidate(s=
truct xe_userptr_vma *uvma)
[ ... ]
> +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
> +static inline void xe_eudebug_track_userptr_task(struct xe_userptr *user=
ptr)
> +{
> +	/*
> +	 * We could use the mm which is on notifier. But
> +	 * the access_remote_vm() is not exported. Thus
> +	 * we get reference to task for access_process_vm()
> +	 */
> +	userptr->eudebug.task =3D get_task_struct(current);

[Severity: High]
Should this track the process leader rather than the specific calling threa=
d?

By saving the specific thread (current) here, the userptr becomes bound to
this thread's lifespan. Changing this to track the process leader instead
(e.g., current->group_leader) might prevent the spurious -ESRCH failures
in xe_eudebug_vma_access() when background worker threads exit.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903145952.8480=
51-1-mika.kuoppala@linux.intel.com?part=3D13
