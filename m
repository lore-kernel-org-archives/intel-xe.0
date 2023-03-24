Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DE5C6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 16:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776E610E548;
	Fri, 24 Mar 2023 16:21:30 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66F610E558
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 16:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679674887; x=1711210887;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=eqaPU4oRycK4yWu0ciJlci0oEq1RlFNe+EuDHl+GgBk=;
 b=H9lZpkXE6RJJ2U2jSuZvIfXLs8YP36yAR+I5lzymUnf1OIPPvBY4XD4o
 S6Om5ENZr8ITDiH8amtGVK7W+0Q/8orq7eyUMv9TfPum9Mzqii/phC1tG
 nHjLQmXqbdh+r9eNqWC4tSMDC4LB5uS37T6sdGFIc6KccOq5mb1npDWjd
 VPx1hp0GPIBLSfuIxlciRGma5ggD8TZ9I5zI/aExwHdGyQNf3K/X5ocSO
 PsBYURcRfolebadh1DYw0ae2SHksfyhn/+OZ2PsMKn8DGvAE8vFC3+9SP
 GtuElno9MFdmhLS8bqlJHSsxQFS7Jx9KsodA4/jv+VVoTXK5+tEIeAbGT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="328241739"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="328241739"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 09:21:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="676204023"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="676204023"
Received: from bherle-mobl.ger.corp.intel.com (HELO [10.252.38.170])
 ([10.252.38.170])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 09:21:20 -0700
Message-ID: <df2d7bbd-5ad7-c659-6273-191eb6a2a273@linux.intel.com>
Date: Fri, 24 Mar 2023 17:21:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230321034247.666767-1-matthew.brost@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230321034247.666767-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix potential deadlock handling page
 faults
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

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

On 2023-03-21 04:42, Matthew Brost wrote:
> Within a class the GuC will hault scheduling if the head of the queue
> can't be scheduled the queue will block. This can lead to deadlock if
> BCS0-7 all have faults and another engine on BCS0-7 is at head of the
> GuC scheduling queue as the migration engine used to fix tthe fault will
> be blocked. To work around this set the migration engine to the highest
> priority when servicing page faults.
>
> v2 (Maarten): Set priority to kernel once at creation
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 77a6d71f6e89..546711a0ec39 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -359,6 +359,8 @@ struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
>   		xe_vm_close_and_put(vm);
>   		return ERR_CAST(m->eng);
>   	}
> +	if (xe->info.supports_usm)
> +		m->eng->entity->priority = DRM_SCHED_PRIORITY_KERNEL;
>   
>   	mutex_init(&m->job_mutex);
>   
