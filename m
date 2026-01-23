Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6F0D72379
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 12:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8922D10EACF;
	Fri, 23 Jan 2026 12:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Smyol/wK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488D610EAC9
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 12:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769169854; x=1800705854;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7Qgclsp+BGncNJnG5RVMQDh/ScxYo+SqWoGDHh64MoI=;
 b=Smyol/wKh34UvliXWo2FW6NDgWi1aOD9kFLYn9nGmnZwL28w7u5g1q4k
 7mJgCTcEhKkPTVdDWnrNUBiRqqgwI8f/RTWCuhyHOum3quDEFMpi9uglk
 lRfnPfO8lrV4RckfZtwkT2oSXKUBwsMFxVM1jrmwfxzTe5peeIcxO5Di4
 m0miuQENztbNZHGQetXXnLye+HQrK5qr+Mh/Ul0YG2G9Chj6mre3sT/7z
 3HlIel9g1o+nTazvqbrikao4PJn5/Y289fuPnmFxAyPYIth/FRV2jnoZt
 rcadg5aJCC5VOOZoAn2mAFtlroLeVT+mTXk5SiE3Z57EsS6AJBuK7yb6h w==;
X-CSE-ConnectionGUID: jUgazZVIR5uuP2+uyLuQpw==
X-CSE-MsgGUID: VRcusbpTSjirhKIeGKWQrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="95892277"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="95892277"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 04:04:14 -0800
X-CSE-ConnectionGUID: lLLsTFvnR2KD2OUPYJgIzg==
X-CSE-MsgGUID: 3TC4T4G2REebKkspwnBfrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="206832353"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.177])
 ([10.245.244.177])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 04:04:13 -0800
Message-ID: <b6b13b58a7ffd230d68964e32ddfea7972809751.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/multi_queue: Protect priority against concurrent
 access
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Date: Fri, 23 Jan 2026 13:04:10 +0100
In-Reply-To: <20260121211933.3354277-2-niranjana.vishwanathapura@intel.com>
References: <20260121211933.3354277-2-niranjana.vishwanathapura@intel.com>
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

Hi, Niranjana,

On Wed, 2026-01-21 at 13:19 -0800, Niranjana Vishwanathapura wrote:
> From: "Vishwanathapura, Niranjana"
> <niranjana.vishwanathapura@intel.com>
>=20
> Use a spin_lock to protect multi-queue priority being concurrently
> updated by multiple set_priority ioctls and protect against
> concurrent read and write to this field. Also, guard against
> compile optimization by using WRITE_ONCE() and READ_ONCE() macros.
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue_types.h |=C2=A0 2 ++
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 20 ++++++++++++++------
> =C2=A03 files changed, 17 insertions(+), 6 deletions(-)
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
> index e987d431ce27..ab6980aaa36e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -163,6 +163,8 @@ struct xe_exec_queue {
> =C2=A0		struct list_head link;
> =C2=A0		/** @multi_queue.priority: Queue priority within the
> multi-queue group */
> =C2=A0		enum xe_multi_queue_priority priority;

Should probably add to each field protected that it is protected by the
lock, and in the kernel-doc below mention that it's used to protect
certain members.

> +		/** @multi_queue.lock: Lock for
> @multi_queue.priority access */
> +		spinlock_t lock;
> =C2=A0		/** @multi_queue.pos: Position of queue within the
> multi-queue group */
> =C2=A0		u8 pos;
> =C2=A0		/** @multi_queue.valid: Queue belongs to a multi
> queue group */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 456f549c16f6..76dd3a204811 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -827,7 +827,9 @@ static void
> xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> -	xe_lrc_set_multi_queue_priority(q->lrc[0], q-
> >multi_queue.priority);
> +	spin_lock(&q->multi_queue.lock);
> +	xe_lrc_set_multi_queue_priority(q->lrc[0], READ_ONCE(q-
> >multi_queue.priority));

Since we have the lock, no need for READ_ONCE()?

> +	spin_unlock(&q->multi_queue.lock);
> =C2=A0	xe_guc_exec_queue_group_cgp_update(xe, q);
> =C2=A0
> =C2=A0	WRITE_ONCE(group->sync_pending, true);
> @@ -2181,15 +2183,21 @@ static int
> guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
> =C2=A0
> =C2=A0	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
> xe_exec_queue_is_multi_queue(q));
> =C2=A0
> -	if (q->multi_queue.priority =3D=3D priority ||
> -	=C2=A0=C2=A0=C2=A0 exec_queue_killed_or_banned_or_wedged(q))
> -		return 0;
> -
> =C2=A0	msg =3D kmalloc(sizeof(*msg), GFP_KERNEL);
> =C2=A0	if (!msg)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	q->multi_queue.priority =3D priority;
> +	spin_lock(&q->multi_queue.lock);
> +	if (q->multi_queue.priority =3D=3D priority ||
> +	=C2=A0=C2=A0=C2=A0 exec_queue_killed_or_banned_or_wedged(q)) {
> +		spin_unlock(&q->multi_queue.lock);
> +		kfree(msg);
> +		return 0;
> +	}
> +
> +	WRITE_ONCE(q->multi_queue.priority, priority);

Similarly here, no need for WRITE_ONCE()?

> +	spin_unlock(&q->multi_queue.lock);
> +
> =C2=A0	guc_exec_queue_add_msg(q, msg, SET_MULTI_QUEUE_PRIORITY);
> =C2=A0
> =C2=A0	return 0;

Thanks,
Thomas
