Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE57C54E67
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 12:34:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B507210E87D;
	Thu, 14 Mar 2024 12:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWq8zNTp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C3F10E87D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 12:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710419653; x=1741955653;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=A5lUSbmnUioTCJYiVusoWiUpvW4TgTgpP/WqXHffqg8=;
 b=iWq8zNTpiXppHQVs+JS/8TXTBRZB0ArdNXf4AwjimRW79LcQ6QZx4hNw
 iEGvzMU/rv5yzs6jutt5ofN5sqhkuxbi1FsJl5JT7MZ+WZ9+UQNi6orGE
 xNgJbHaMlKmrF7G/KhV75UANTRNDPL7VPdKUnUyJ/Sh8lC1dYaDusxmON
 qyBH4IivD3CCqAHqmASpr914PMM4oVys5PH2n1VFzPVYAMCgN/mMgcI5Y
 nlJr95z1oo7gg9APf3ATaJmgx8kJT9JotzkHTGVJ4ERwNkGL6U8tt7712
 44tDT6ggcBw8dGQ7xRDZLnvGZchvjIyKczNP6yiAuuZplWGMHgBnaXs7h w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="8170609"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="8170609"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 05:34:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12346384"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.35.115])
 ([10.246.35.115])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 05:34:11 -0700
Message-ID: <c3d85eb3-b850-4ecc-bbd1-089e60f47533@linux.intel.com>
Date: Thu, 14 Mar 2024 13:34:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc_submit: use jiffies for job timeout
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20240314121554.223229-2-matthew.auld@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240314121554.223229-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 3/14/2024 1:15 PM, Matthew Auld wrote:
> drm_sched_init() expects jiffies for the timeout, but here we are
> passing the timeout in ms. Convert to jiffies instead.
>
> Fixes: eef55700f302 ("drm/xe: Add sysfs for default engine scheduler properties")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 19efdb2f881f..82c955a2a15c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1226,7 +1226,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   	init_waitqueue_head(&ge->suspend_wait);
>   
>   	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
> -		  q->sched_props.job_timeout_ms;
> +		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>   	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
>   			    get_submit_wq(guc),
>   			    q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES, 64,
