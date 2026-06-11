Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7808CD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 07:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670D210ED3D;
	Thu, 11 Jun 2026 07:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/C2XNem";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6358610ED3D
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 07:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781164173; x=1812700173;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PCSb5yHCjbjcvEii3G4KDuaKg1MFjhY0syTpDs1e+h0=;
 b=a/C2XNemUoj/EdJt6lOzAA5LiPYfjnhxM1kHecawbTYCBkDn9NQ6ThHD
 hChupuwam7hZt7i4qjRGK2POt4k7DQsMpsR0ky8tg7RqkhGwwU04RLj9P
 kQH+p5B+BBrRJkF4kY4bFDBUYRfZB2AgUsAm3WmcjqgsTrxQJdFbIlWmK
 B0NjCwgVux723FTIO9JIzmCFLm7GgN7xgfrt/MLqo3BXMQrgl44GqiYZ/
 cpUQy0DmObAYHhS0zAQo+BtkLzSRHcUSgE6OHA6aMv07qGcmnRFCkbYqh
 FHvMHfB7+4SeaGG3DySjglJ7oSRDX3Oyazicljq/+MJzTR35MqsHLhyhl g==;
X-CSE-ConnectionGUID: q8pE7Oh9TfWP26l/LTm+xw==
X-CSE-MsgGUID: DdKiYHHRQRObDcgIIm9tcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81975696"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="81975696"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:49:32 -0700
X-CSE-ConnectionGUID: qTbS9qMjQAq9KFTmZ3DVsA==
X-CSE-MsgGUID: 2AVs+O9VQbKdOycCFYkYFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="242264145"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.244.169])
 ([10.245.244.169])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:49:30 -0700
Message-ID: <fe421fb45402da90e0a8078f32e9bbd1e68eac2e.camel@linux.intel.com>
Subject: Re: [PATCH v3 4/5] drm/xe: Rename EXEC_MODE_LR to EXEC_MODE_FAULT
 in hw engine group
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Date: Thu, 11 Jun 2026 09:49:27 +0200
In-Reply-To: <ahh8gb_uEO2_W7kv@fdugast-desk>
References: <20260525133051.91636-1-thomas.hellstrom@linux.intel.com>
 <20260525133051.91636-5-thomas.hellstrom@linux.intel.com>
 <ahh2Hvx0xBydhBJ4@intel.com> <ahh8gb_uEO2_W7kv@fdugast-desk>
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

On Thu, 2026-05-28 at 19:33 +0200, Francois Dugast wrote:
> On Thu, May 28, 2026 at 01:06:38PM -0400, Rodrigo Vivi wrote:
> > On Mon, May 25, 2026 at 03:30:50PM +0200, Thomas Hellstr=C3=B6m wrote:
> > > The execution mode tracked by xe_hw_engine_group_execution_mode
> > > describes whether the hw engine group is currently executing jobs
> > > in fault mode (long-running, fault-capable) or in DMA fence mode.
> > > The EXEC_MODE_LR label was misleading since not all LR queues use
> > > fault mode; rename it to EXEC_MODE_FAULT for clarity.
> > >=20
> > > No functional change.
> > >=20
> > > Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_exec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> > > =C2=A0drivers/gpu/drm/xe/xe_hw_engine_group.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 10 +++++-----
> > > =C2=A0drivers/gpu/drm/xe/xe_hw_engine_group_types.h |=C2=A0 4 ++--
> > > =C2=A03 files changed, 8 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > > b/drivers/gpu/drm/xe/xe_exec.c
> > > index e05dabfcd43c..15ad0fee906c 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > @@ -342,7 +342,7 @@ int xe_exec_ioctl(struct drm_device *dev,
> > > void *data, struct drm_file *file)
> > > =C2=A0		spin_unlock(&xe->ttm.lru_lock);
> > > =C2=A0	}
> > > =C2=A0
> > > -	if (mode =3D=3D EXEC_MODE_LR)
> > > +	if (mode =3D=3D EXEC_MODE_FAULT)
> > > =C2=A0		xe_hw_engine_group_resume_faulting_lr_jobs(group
> > > );
> > > =C2=A0
> > > =C2=A0err_repin:
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > index 791be6edd0a4..fba0ed039bad 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > @@ -22,12 +22,12 @@ hw_engine_group_resume_lr_jobs_func(struct
> > > work_struct *w)
> > > =C2=A0	int err;
> > > =C2=A0	enum xe_hw_engine_group_execution_mode previous_mode;
> > > =C2=A0
> > > -	err =3D xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
> > > &previous_mode,
> > > +	err =3D xe_hw_engine_group_get_mode(group,
> > > EXEC_MODE_FAULT, &previous_mode,
> > > =C2=A0					=C2=A0 NULL, 0);
> > > =C2=A0	if (err)
> > > =C2=A0		return;
> > > =C2=A0
> > > -	if (previous_mode =3D=3D EXEC_MODE_LR)
> > > +	if (previous_mode =3D=3D EXEC_MODE_FAULT)
> > > =C2=A0		goto put;
> > > =C2=A0
> > > =C2=A0	list_for_each_entry(q, &group->exec_queue_list,
> > > hw_engine_group_link) {
> > > @@ -292,13 +292,13 @@ static int switch_mode(struct
> > > xe_hw_engine_group *group, bool has_deps)
> > > =C2=A0	lockdep_assert_held_write(&group->mode_sem);
> > > =C2=A0
> > > =C2=A0	switch (group->cur_mode) {
> > > -	case EXEC_MODE_LR:
> > > +	case EXEC_MODE_FAULT:
> > > =C2=A0		new_mode =3D EXEC_MODE_DMA_FENCE;
> > > =C2=A0		err =3D
> > > xe_hw_engine_group_suspend_faulting_lr_jobs(group,
> > > =C2=A0								=C2=A0
> > >  has_deps);
> >=20
> > should we also rename this function?
>=20
> I think we should, together with other occurrences of "lr" in this
> file.

I think this particular instance is correct by including "faulting",
anyway, I'll rename it to "..fault_mode_jobs" and also do an additional
check of other "lr" only instances.

Thanks,
Thomas



>=20
> Francois
>=20
> >=20
> >=20
> > anyway, for this patch:
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >=20
> > > =C2=A0		break;
> > > =C2=A0	case EXEC_MODE_DMA_FENCE:
> > > -		new_mode =3D EXEC_MODE_LR;
> > > +		new_mode =3D EXEC_MODE_FAULT;
> > > =C2=A0		err =3D
> > > xe_hw_engine_group_wait_for_dma_fence_jobs(group);
> > > =C2=A0		break;
> > > =C2=A0	}
> > > @@ -395,7 +395,7 @@ enum xe_hw_engine_group_execution_mode
> > > =C2=A0xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q)
> > > =C2=A0{
> > > =C2=A0	if (xe_vm_in_fault_mode(q->vm))
> > > -		return EXEC_MODE_LR;
> > > +		return EXEC_MODE_FAULT;
> > > =C2=A0	else
> > > =C2=A0		return EXEC_MODE_DMA_FENCE;
> > > =C2=A0}
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> > > b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> > > index 92b6e0712c03..b4c41de6ba5f 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> > > @@ -14,11 +14,11 @@
> > > =C2=A0 * enum xe_hw_engine_group_execution_mode - possible execution
> > > modes of a hw
> > > =C2=A0 * engine group
> > > =C2=A0 *
> > > - * @EXEC_MODE_LR: execution in long-running mode
> > > + * @EXEC_MODE_FAULT: execution in fault mode (long-running,
> > > fault-capable)
> > > =C2=A0 * @EXEC_MODE_DMA_FENCE: execution in dma fence mode
> > > =C2=A0 */
> > > =C2=A0enum xe_hw_engine_group_execution_mode {
> > > -	EXEC_MODE_LR,
> > > +	EXEC_MODE_FAULT,
> > > =C2=A0	EXEC_MODE_DMA_FENCE,
> > > =C2=A0};
> > > =C2=A0
> > > --=20
> > > 2.54.0
> > >=20
