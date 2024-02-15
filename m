Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683E9C4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 11:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A6710E0DF;
	Thu, 15 Feb 2024 11:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpL1zlQE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89BB10E0DF
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 11:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707995880; x=1739531880;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=zVfg/kZA3uTHmFrbjO5UhhkqGNUNWNXnJersjsPtTbI=;
 b=jpL1zlQEuQdRCfJjKTtUWsi0CFyeymFN0aHHTSaUphDX7OJ/kDrBsYjh
 xtjl7S977pEORiqMZinpRplUTRnyU/PVhyY0gm+odmFlbUJDLJl8WZFve
 q/nmmKRbg8Qq+L6YbzmUbegh0hxXWp81R61r9ScjJ3bt2oi6F8XB57Wo2
 NDYd2IttRKHrdhhWtDlO6rK5U614PsdFcY9h3ZllDMiphtA/ctDqEhkIn
 eUbo6zaifWpsKkp0a09Mb1Hm00LLLWL85qL4N6FALgISgconOwAw9hcoi
 /bBkkF4osKYkdfWSof8uOa9uKZq+LiZyaWika8DaF10nZfb85PQL+jdz/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="13176676"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="13176676"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 03:18:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826402091"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="826402091"
Received: from kraszkow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.44.13])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 03:17:57 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>, Thomas =?utf-8?Q?Hellst?=
 =?utf-8?Q?r=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Expose user fence from xe_sync_entry
In-Reply-To: <20240214141217.361122-1-mika.kuoppala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240214141217.361122-1-mika.kuoppala@linux.intel.com>
Date: Thu, 15 Feb 2024 13:17:54 +0200
Message-ID: <87plwy563h.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 14 Feb 2024, Mika Kuoppala <mika.kuoppala@linux.intel.com> wrote:
> By allowing getting reference to user fence, we can
> control the lifetime outside of sync entries.
>
> This is needed to allow vma to track the associated
> user fence that was provided with bind ioctl.
>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c       | 63 +++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_sync.h       |  4 ++
>  drivers/gpu/drm/xe/xe_sync_types.h | 20 +++++++---
>  3 files changed, 64 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index aab92bee1d7cf..c3e745c7778b9 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -19,39 +19,29 @@
>  #include "xe_macros.h"
>  #include "xe_sched_job_types.h"
>=20=20
> -struct user_fence {
> -	struct xe_device *xe;
> -	struct kref refcount;
> -	struct dma_fence_cb cb;
> -	struct work_struct worker;
> -	struct mm_struct *mm;
> -	u64 __user *addr;
> -	u64 value;
> -};
> -
>  static void user_fence_destroy(struct kref *kref)
>  {
> -	struct user_fence *ufence =3D container_of(kref, struct user_fence,
> +	struct xe_user_fence *ufence =3D container_of(kref, struct xe_user_fenc=
e,
>  						 refcount);
>=20=20
>  	mmdrop(ufence->mm);
>  	kfree(ufence);
>  }
>=20=20
> -static void user_fence_get(struct user_fence *ufence)
> +static void user_fence_get(struct xe_user_fence *ufence)
>  {
>  	kref_get(&ufence->refcount);
>  }
>=20=20
> -static void user_fence_put(struct user_fence *ufence)
> +static void user_fence_put(struct xe_user_fence *ufence)
>  {
>  	kref_put(&ufence->refcount, user_fence_destroy);
>  }
>=20=20
> -static struct user_fence *user_fence_create(struct xe_device *xe, u64 ad=
dr,
> +static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64=
 addr,
>  					    u64 value)
>  {
> -	struct user_fence *ufence;
> +	struct xe_user_fence *ufence;
>=20=20
>  	ufence =3D kmalloc(sizeof(*ufence), GFP_KERNEL);
>  	if (!ufence)
> @@ -69,7 +59,7 @@ static struct user_fence *user_fence_create(struct xe_d=
evice *xe, u64 addr,
>=20=20
>  static void user_fence_worker(struct work_struct *w)
>  {
> -	struct user_fence *ufence =3D container_of(w, struct user_fence, worker=
);
> +	struct xe_user_fence *ufence =3D container_of(w, struct xe_user_fence, =
worker);
>=20=20
>  	if (mmget_not_zero(ufence->mm)) {
>  		kthread_use_mm(ufence->mm);
> @@ -80,10 +70,11 @@ static void user_fence_worker(struct work_struct *w)
>  	}
>=20=20
>  	wake_up_all(&ufence->xe->ufence_wq);
> +	WRITE_ONCE(ufence->signalled, 1);
>  	user_fence_put(ufence);
>  }
>=20=20
> -static void kick_ufence(struct user_fence *ufence, struct dma_fence *fen=
ce)
> +static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *=
fence)
>  {
>  	INIT_WORK(&ufence->worker, user_fence_worker);
>  	queue_work(ufence->xe->ordered_wq, &ufence->worker);
> @@ -92,7 +83,7 @@ static void kick_ufence(struct user_fence *ufence, stru=
ct dma_fence *fence)
>=20=20
>  static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *=
cb)
>  {
> -	struct user_fence *ufence =3D container_of(cb, struct user_fence, cb);
> +	struct xe_user_fence *ufence =3D container_of(cb, struct xe_user_fence,=
 cb);
>=20=20
>  	kick_ufence(ufence, fence);
>  }
> @@ -340,3 +331,39 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int=
 num_sync,
>=20=20
>  	return ERR_PTR(-ENOMEM);
>  }
> +
> +/**
> + * xe_sync_ufence_get() - Get user fence from sync
> + * @sync: input syncs
> + *
> + * Get a user fence reference from sync.
> + *
> + * Return: xe_user_fence pointer with reference
> + */
> +struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync)
> +{
> +	user_fence_get(sync->ufence);
> +
> +	return sync->ufence;
> +}
> +
> +/**
> + * xe_sync_ufence_put() - Put user fence reference
> + * @ufence: user fence reference
> + *
> + */
> +void xe_sync_ufence_put(struct xe_user_fence *ufence)
> +{
> +	user_fence_put(ufence);
> +}
> +
> +/**
> + * xe_sync_ufence_get_status() - Get user fence status
> + * @ufence: user fence
> + *
> + * Return: 1 if signalled, 0 not signalled, <0 on error
> + */
> +int xe_sync_ufence_get_status(struct xe_user_fence *ufence)
> +{
> +	return READ_ONCE(ufence->signalled);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
> index f43cdcaca6c57..0fd0d51208e62 100644
> --- a/drivers/gpu/drm/xe/xe_sync.h
> +++ b/drivers/gpu/drm/xe/xe_sync.h
> @@ -38,4 +38,8 @@ static inline bool xe_sync_is_ufence(struct xe_sync_ent=
ry *sync)
>  	return !!sync->ufence;
>  }
>=20=20
> +struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
> +void xe_sync_ufence_put(struct xe_user_fence *ufence);
> +int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sync_types.h b/drivers/gpu/drm/xe/xe_s=
ync_types.h
> index 852db5e7884fc..6176ef9d65c72 100644
> --- a/drivers/gpu/drm/xe/xe_sync_types.h
> +++ b/drivers/gpu/drm/xe/xe_sync_types.h
> @@ -7,18 +7,28 @@
>  #define _XE_SYNC_TYPES_H_
>=20=20
>  #include <linux/types.h>
> +#include <linux/kref.h>
> +#include <linux/dma-fence.h>
> +#include <linux/workqueue.h>
>=20=20
> -struct drm_syncobj;
> -struct dma_fence;
> -struct dma_fence_chain;
>  struct drm_xe_sync;
> -struct user_fence;
> +
> +struct xe_user_fence {
> +	struct xe_device *xe;
> +	struct kref refcount;
> +	struct dma_fence_cb cb;
> +	struct work_struct worker;
> +	struct mm_struct *mm;
> +	u64 __user *addr;
> +	u64 value;
> +	int signalled;
> +};

Looking at the series, I think you could keep this as an opaque struct,
i.e. just forward declare struct xe_user_fence here, and leave the
definition inside xe_sync.c.

BR,
Jani.


>=20=20
>  struct xe_sync_entry {
>  	struct drm_syncobj *syncobj;
>  	struct dma_fence *fence;
>  	struct dma_fence_chain *chain_fence;
> -	struct user_fence *ufence;
> +	struct xe_user_fence *ufence;
>  	u64 addr;
>  	u64 timeline_value;
>  	u32 type;

--=20
Jani Nikula, Intel
