Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF77CCD4F3C
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 09:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F9710E283;
	Mon, 18 May 2026 09:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BtK9N2IJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2ED610E283
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 09:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779094897; x=1810630897;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=7rpBZQPeSJwucjwmKAXlH19n3+XFa9l/igb7BB4IDS4=;
 b=BtK9N2IJ0CGpW4ar0EitqdOjBERLztHzRjjG4arcfpt+PsT2cy1KOOdC
 MhXy+zsKJuiInFeTs/XRMyZgsl00ZuVyL/oPeG0uBnANuj+6neb3M/9JJ
 Z1oyZ2KWdDVHAf7fZBM5bruXr5imBsb9MfpLelgsJr0Xj17e6nlNWMvE7
 qsD3KffMS/HPQK69vQV4vXNxOv2OZG6i9qaUdijaXin/zv904VydQXVXU
 onm8z+waisJA73HP9RNUKRjfLbxtXtO488FCAvtnGvamNb5nkx41j04FT
 EPU81TeEr6RLY2iAxXKDytKBdIDd9mJjXigls7CsDzxMqHpn2f1x0YySk Q==;
X-CSE-ConnectionGUID: vM3EETYSS4qmtsaue1X8nQ==
X-CSE-MsgGUID: N6lwYDoaSLm66F6LPe2Kmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="91047078"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="91047078"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 02:01:37 -0700
X-CSE-ConnectionGUID: ZbSd1+wuQLeGRO/LaAMx2A==
X-CSE-MsgGUID: revcV2WLQTK0BlBj5M5W5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="269709868"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.57])
 ([10.245.244.57])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 02:01:36 -0700
Message-ID: <8c150600-7773-4644-9c29-83de7db2b96e@intel.com>
Date: Mon, 18 May 2026 10:01:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/multi_queue: Fix secondary queue error case
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260515210450.249621-2-niranjana.vishwanathapura@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260515210450.249621-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 15/05/2026 22:04, Niranjana Vishwanathapura wrote:
> If xe_lrc_create() fails, the secondary queue added to the
> multi-queue group list is not removed before freeing the
> queue. Fix error path handling for secondary queues by
> removing it from the multi-queue group list at the right
> place.
> 
> Fixes: d716a5088c88 ("drm/xe/multi_queue: Handle tearing down of a multi queue")
> 

Can drop the newline here. Would be good to also add:

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7979
Reported-by: Sebastian Österlund <sebastian.osterlund@intel.com>

> Cc: stable@vger.kernel.org # v7.0+
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4171eff4e8ad..afd8cc7bd231 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1665,6 +1665,14 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>   	struct xe_guc_exec_queue *ge = q->guc;
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +
> +		mutex_lock(&group->list_lock);
> +		list_del(&q->multi_queue.link);
> +		mutex_unlock(&group->list_lock);
> +	}
> +
>   	release_guc_id(guc, q);
>   	xe_sched_entity_fini(&ge->entity);
>   	xe_sched_fini(&ge->sched);
> @@ -1686,14 +1694,6 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
>   	guard(xe_pm_runtime)(guc_to_xe(guc));
>   	trace_xe_exec_queue_destroy(q);
>   
> -	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> -		struct xe_exec_queue_group *group = q->multi_queue.group;
> -
> -		mutex_lock(&group->list_lock);
> -		list_del(&q->multi_queue.link);
> -		mutex_unlock(&group->list_lock);
> -	}
> -
>   	/* Confirm no work left behind accessing device structures */
>   	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>   

