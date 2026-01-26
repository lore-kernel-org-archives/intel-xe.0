Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCCACF65FF
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 12:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FFD10E40F;
	Mon, 26 Jan 2026 12:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CDoimRud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA9C10E40F
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 12:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769431169; x=1800967169;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DWmfao2msy4XSfGvu2b5TnIzrcH2ztFdCTZci+Fr0vM=;
 b=CDoimRudC/aPblKRiuRZTdeF3WkBbGHxLTNKhi//HoyPlLhoiNYkOGBI
 jqotH37+XAaxCtQbqqCnCK27MLqgTRLptLGKkiGcgkfFMDgzZldzz3+qs
 5lsAGK28/ErAtXSCFk3MsiQv9p3YcOgLKfbE9/KXOm3nSl+L++SH+LoUJ
 zJ2GsUxSLXzGf4MvGBpR5MC447OH1i87qqFsq9SHniwsE2SfQ2nOst6eW
 tlLmauft2VGd/LoffYlfdON1Sp7J3pw2tOjGG/jBbsZnwd1X0p0mkAKPt
 IyHFd12WvH0cu3Ykjl7gvcR35oyGNUIYjxHQQr6JhB2I4XcP9fKmqfwcY w==;
X-CSE-ConnectionGUID: agutrcQ1QeWPTpzb12P86Q==
X-CSE-MsgGUID: mlFLrifiSJCE4OzsoB7wDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="58180113"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="58180113"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 04:39:29 -0800
X-CSE-ConnectionGUID: qq8oLaIPSDybHHArY2jkmQ==
X-CSE-MsgGUID: KkI3NAypQym1QYVOS5kfyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="245274328"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.169])
 ([10.245.245.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 04:39:28 -0800
Message-ID: <a1502d2dbd1d550f14b1e2f3c2bfc82770417685.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/multi_queue: Protect priority against
 concurrent access
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Date: Mon, 26 Jan 2026 13:39:14 +0100
In-Reply-To: <20260123212710.3393405-2-niranjana.vishwanathapura@intel.com>
References: <20260123212710.3393405-2-niranjana.vishwanathapura@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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

On Fri, 2026-01-23 at 13:27 -0800, Niranjana Vishwanathapura wrote:
> Use a spinlock to protect multi-queue priority being concurrently
> updated by multiple set_priority ioctls and to protect against
> concurrent read and write to this field.
>=20
> v2: Update documentation, remove WRITE/READ_LOCK() (Thomas)
> =C2=A0=C2=A0=C2=A0 Use scoped_guard, reduced lock scope (Matt Brost)
> v3: Fix author (checkpatch)
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue_types.h |=C2=A0 7 ++++++-
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 19 +++++++++++++++----
> =C2=A03 files changed, 22 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 7e7e663189e4..66d0e10ee2c4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -230,6 +230,7 @@ static struct xe_exec_queue
> *__xe_exec_queue_alloc(struct xe_device *xe,
> =C2=A0	INIT_LIST_HEAD(&q->multi_gt_link);
> =C2=A0	INIT_LIST_HEAD(&q->hw_engine_group_link);
> =C2=A0	INIT_LIST_HEAD(&q->pxp.link);
> +	spin_lock_init(&q->multi_queue.lock);
> =C2=A0	q->multi_queue.priority =3D XE_MULTI_QUEUE_PRIORITY_NORMAL;
> =C2=A0
> =C2=A0	q->sched_props.timeslice_us =3D hwe->eclass-
> >sched_props.timeslice_us;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index e987d431ce27..3791fed34ffa 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -161,8 +161,13 @@ struct xe_exec_queue {
> =C2=A0		struct xe_exec_queue_group *group;
> =C2=A0		/** @multi_queue.link: Link into group's secondary
> queues list */
> =C2=A0		struct list_head link;
> -		/** @multi_queue.priority: Queue priority within the
> multi-queue group */
> +		/**
> +		 * @multi_queue.priority: Queue priority within the
> multi-queue group.
> +		 * It is protected by @multi_queue.lock.
> +		 */
> =C2=A0		enum xe_multi_queue_priority priority;
> +		/** @multi_queue.lock: Lock for protecting certain
> members */
> +		spinlock_t lock;
> =C2=A0		/** @multi_queue.pos: Position of queue within the
> multi-queue group */
> =C2=A0		u8 pos;
> =C2=A0		/** @multi_queue.valid: Queue belongs to a multi
> queue group */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 456f549c16f6..1f4625ddae0e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -804,6 +804,7 @@ static void
> xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
> =C2=A0{
> =C2=A0	struct xe_exec_queue_group *group =3D q->multi_queue.group;
> =C2=A0	struct xe_device *xe =3D guc_to_xe(guc);
> +	enum xe_multi_queue_priority priority;
> =C2=A0	long ret;
> =C2=A0
> =C2=A0	/*
> @@ -827,7 +828,10 @@ static void
> xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> -	xe_lrc_set_multi_queue_priority(q->lrc[0], q-
> >multi_queue.priority);
> +	scoped_guard(spinlock, &q->multi_queue.lock)
> +		priority =3D q->multi_queue.priority;
> +
> +	xe_lrc_set_multi_queue_priority(q->lrc[0], priority);
> =C2=A0	xe_guc_exec_queue_group_cgp_update(xe, q);
> =C2=A0
> =C2=A0	WRITE_ONCE(group->sync_pending, true);
> @@ -2181,15 +2185,22 @@ static int
> guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
> =C2=A0
> =C2=A0	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
> xe_exec_queue_is_multi_queue(q));
> =C2=A0
> -	if (q->multi_queue.priority =3D=3D priority ||
> -	=C2=A0=C2=A0=C2=A0 exec_queue_killed_or_banned_or_wedged(q))
> +	if (exec_queue_killed_or_banned_or_wedged(q))
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	msg =3D kmalloc(sizeof(*msg), GFP_KERNEL);
> =C2=A0	if (!msg)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	q->multi_queue.priority =3D priority;
> +	scoped_guard(spinlock, &q->multi_queue.lock) {
> +		if (q->multi_queue.priority =3D=3D priority) {
> +			kfree(msg);
> +			return 0;
> +		}
> +
> +		q->multi_queue.priority =3D priority;
> +	}
> +
> =C2=A0	guc_exec_queue_add_msg(q, msg, SET_MULTI_QUEUE_PRIORITY);
> =C2=A0
> =C2=A0	return 0;
