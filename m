Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDC3CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 10:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E59810E191;
	Wed, 27 May 2026 10:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZYomNHW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B4C10E191
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 10:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779877189; x=1811413189;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gd1kvtHZGVxbDdgW4YLi15vxD2T5Pn1slgwuoKPuaFk=;
 b=KZYomNHWP9zT8vQ9d/32aoyWpfk16/EJ1kYQ/UopzggOwxkCy+4fHHFl
 L8/PL37WQG/kmJ8DlP7KSkUinTTd7S7m93IEx9KqjEKgAwNt698kCVSGw
 kicFylR2XJQ09jPXFkIxmYeG/tMe4Fy6ykGaJxwPlyvvtti8E4AHDoWGI
 N2/zZu2NUQOfur+lG79S/8HhhN7Gt2TGrv5IFji13TvRM0DDDncvmcS1e
 lmgu6NUc4h5B0+0LJzyDAnATKrvl63AbSjQ3/29aSBk9jSONbTeAG/+Of
 7moXyw6T5qvNO1EX+XVzJaOcdqWfssCLzcVaFXL+r7Xpl5m+NlLaPqbd1 Q==;
X-CSE-ConnectionGUID: EpZALvt4RySipVBHjhg5yg==
X-CSE-MsgGUID: X6SDqfhORqW3AJAmZ+m/Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80552448"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80552448"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 03:19:49 -0700
X-CSE-ConnectionGUID: P/kSbRE0TmeLP/FasYzuyw==
X-CSE-MsgGUID: UCM0UYJZRiuEe9MCbJIWXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="244016637"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.17])
 ([10.245.245.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 03:19:47 -0700
Message-ID: <b3a30dfcf5eb035aca3e7e836b985155c419d9fe.camel@linux.intel.com>
Subject: Re: [PATCH v3 2/5] drm/xe/guc: Don't ban LR VM exec queues on PM
 suspend
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 stable@vger.kernel.org, Francois Dugast <francois.dugast@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Wed, 27 May 2026 12:19:45 +0200
In-Reply-To: <f0df867c-d4f4-4a9f-b2f0-58d05e5f8926@intel.com>
References: <20260525133051.91636-1-thomas.hellstrom@linux.intel.com>
 <20260525133051.91636-3-thomas.hellstrom@linux.intel.com>
 <f0df867c-d4f4-4a9f-b2f0-58d05e5f8926@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 2026-05-26 at 16:38 +0100, Matthew Auld wrote:
> On 25/05/2026 14:30, Thomas Hellstr=C3=B6m wrote:
> > When xe_guc_submit_stop() is called during an S3/S4 suspend or GT
> > reset, guc_exec_queue_stop() bans any user exec queue that has a
> > job
> > which has started but not yet completed.=C2=A0 For normal (non-LR) exec
> > queues this is the correct behaviour: a started-but-incomplete job
> > at
> > reset time may indicate a hung workload.
>=20
> Is it not too harsh to ban the user job for that? Say you are a well=20
> behaved 3D workload, and forced suspend is triggered by the user, if
> you=20
> are very unlucky you can get banned, if you hit the queue_stop flow
> with=20
> a WIP job?

Actually (and this has bearing also on patch 1, I think) suspend /
resume must not sit in the critical path of any dma-fence job. Meaning
we explicitly have to wait for all outstanding dma-fences before
suspending, and add that if that's not already done.

/Thomas


>=20
> >=20
> > For exec queues attached to Long Running (LR) VMs the same
> > condition
> > is always true during normal operation: LR jobs are designed to run
> > indefinitely and are never "completed" in the DRM scheduler sense =E2=
=80=94
> > they are preempted and resumed via the preempt-fence mechanism.
> > Banning such an exec queue on PM suspend permanently prevents the
> > job
> > from restarting after resume, causing the userspace compute
> > workload to
> > fail silently.
> >=20
> > Fix this by not banning LR VM exec queues when a system suspend or
> > hibernation is in progress, while preserving the ban for GT reset
> > where
> > a started-but-incomplete job is a legitimate indicator of a hang.
> >=20
> > Fixes: f6375fb3aa94 ("drm/xe: Track LR jobs in DRM scheduler
> > pending list")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Tomasz Lis <tomasz.lis@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: <stable@vger.kernel.org> # v6.19+
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_device_types.h |=C2=A0 8 ++++++++
> > =C2=A0 drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0 | 10 +++++++++-
> > =C2=A0 drivers/gpu/drm/xe/xe_pm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++++-
> > =C2=A0 3 files changed, 21 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 32dd2ffbc796..9dbf7b3a0c49 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -433,6 +433,14 @@ struct xe_device {
> > =C2=A0=C2=A0	struct notifier_block pm_notifier;
> > =C2=A0=C2=A0	/** @pm_block: Completion to block validating tasks on
> > suspend / hibernate prepare */
> > =C2=A0=C2=A0	struct completion pm_block;
> > +	/**
> > +	 * @pm_suspend_in_progress: True while the device is going
> > through
> > +	 * system suspend or hibernation (set at xe_pm_suspend()
> > entry, cleared
> > +	 * at xe_pm_resume() entry or on suspend error). Used to
> > suppress exec
> > +	 * queue bans that should only apply during GT reset, not
> > PM suspend.
> > +	 * Serialised by the PM suspend sequence; no lock
> > required.
> > +	 */
> > +	bool pm_suspend_in_progress;
> > =C2=A0=C2=A0	/** @rebind_resume_list: List of wq items to kick on
> > resume. */
> > =C2=A0=C2=A0	struct list_head rebind_resume_list;
> > =C2=A0=C2=A0	/** @rebind_resume_lock: Lock to protect the
> > rebind_resume_list */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 2b8b316c0ca3..f1a6f13011b5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2268,8 +2268,16 @@ static void guc_exec_queue_stop(struct
> > xe_guc *guc, struct xe_exec_queue *q)
> > =C2=A0=C2=A0	 * Ban any engine (aside from kernel and engines used for
> > VM ops) with a
> > =C2=A0=C2=A0	 * started but not complete job or if a job has gone
> > through a GT reset
> > =C2=A0=C2=A0	 * more than twice.
> > +	 *
> > +	 * LR VM exec queues are excluded from this ban during PM
> > suspend: their
> > +	 * jobs are intentionally long-running and are preempted
> > and resumed via
> > +	 * the preempt-fence mechanism. Banning them on PM suspend
> > would
> > +	 * permanently prevent the job from restarting after
> > resume.
> > +	 * On GT reset however we do want to ban them, as that may
> > indicate a
> > +	 * genuinely hung workload.
> > =C2=A0=C2=A0	 */
> > -	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL |
> > EXEC_QUEUE_FLAG_VM))) {
> > +	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL |
> > EXEC_QUEUE_FLAG_VM)) &&
> > +	=C2=A0=C2=A0=C2=A0 !(q->vm && xe_vm_in_lr_mode(q->vm) && guc_to_xe(gu=
c)-
> > >pm_suspend_in_progress)) {
> > =C2=A0=C2=A0		struct xe_sched_job *job =3D
> > xe_sched_first_pending_job(sched);
> > =C2=A0=C2=A0		bool ban =3D false;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c
> > b/drivers/gpu/drm/xe/xe_pm.c
> > index c203a59d7000..76d211986822 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -176,6 +176,7 @@ int xe_pm_suspend(struct xe_device *xe)
> > =C2=A0=C2=A0	int err;
> > =C2=A0=20
> > =C2=A0=C2=A0	drm_dbg(&xe->drm, "Suspending device\n");
> > +	xe->pm_suspend_in_progress =3D true;
> > =C2=A0=C2=A0	xe_pm_block_begin_signalling();
> > =C2=A0=C2=A0	trace_xe_pm_suspend(xe, __builtin_return_address(0));
> > =C2=A0=20
> > @@ -217,6 +218,7 @@ int xe_pm_suspend(struct xe_device *xe)
> > =C2=A0=C2=A0	xe_pxp_pm_resume(xe->pxp);
> > =C2=A0 err:
> > =C2=A0=C2=A0	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
> > +	xe->pm_suspend_in_progress =3D false;
> > =C2=A0=C2=A0	xe_pm_block_end_signalling();
> > =C2=A0=C2=A0	return err;
> > =C2=A0 }
> > @@ -234,8 +236,9 @@ int xe_pm_resume(struct xe_device *xe)
> > =C2=A0=C2=A0	u8 id;
> > =C2=A0=C2=A0	int err;
> > =C2=A0=20
> > -	xe_pm_block_begin_signalling();
> > +	xe->pm_suspend_in_progress =3D false;
> > =C2=A0=C2=A0	drm_dbg(&xe->drm, "Resuming device\n");
> > +	xe_pm_block_begin_signalling();
> > =C2=A0=C2=A0	trace_xe_pm_resume(xe, __builtin_return_address(0));
> > =C2=A0=20
> > =C2=A0=C2=A0	for_each_gt(gt, xe, id)
