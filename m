Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D41C001B3
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jul 2023 19:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A40A10E0B8;
	Mon,  3 Jul 2023 19:39:24 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B1610E0B8
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jul 2023 19:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688413162; x=1719949162;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=daAwtlvjLg87kl2VAmEsoO4hKTYGyeYCvhIKEkK+aB4=;
 b=jeXRB0H8QjwAmfyhbOjb0E0g081BM5ZZSlKH9rvu64p+Q8WX5Qp+RxZb
 cy8q9FCBJnmhZ9ksxJCe0S5C2BB765TZ0JD0yHo43PIQANvuxLAZo67QX
 +Nl2PU8UDGiNs3QXJoqASw9T//sGyAFAo9pSo32bUUv75XucShLMIwf2j
 3MShBNT2b7MGSS1tqSag//uy40nOFJ/giU7w3zYU3QObIF5pm/Rmtw+WA
 rTDpfOa61sa05TO/tAnr3Uj6JtH6/KzZJpAVSJ0OQF17ImoditKgSI372
 Ch9uoG6Vk5KMMhoczXrfgAJntdu5Z12nCN2lWquFA8FpNJ8J9EySkAMR7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="428998510"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="428998510"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 12:39:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="718683406"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="718683406"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.218.33])
 ([10.251.218.33])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 12:38:57 -0700
Message-ID: <66421fd5-2e00-82a5-5aa4-bb9f40cb6881@linux.intel.com>
Date: Mon, 3 Jul 2023 21:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
References: <20230703091933.3832500-1-tejas.upadhyay@intel.com>
 <20230703091933.3832500-2-tejas.upadhyay@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230703091933.3832500-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: make GT sysfs init return void
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


On 7/3/2023 11:19 AM, Tejas Upadhyay wrote:
> As we dont use return from xe_gt_sysfs_init, we
> should make it return void to make it proper return
> type.

May be "Currently return from xe_gt_sysfs_init() is ignored and also

  a failure in xe_gt_sysfs_init() isn't fatal so make it return void. "

>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

otherwise

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_gt_sysfs.c | 10 ++++------
>   drivers/gpu/drm/xe/xe_gt_sysfs.h |  2 +-
>   2 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index 2c47059bef42..4ecbd972e6a1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -29,7 +29,7 @@ static void gt_sysfs_fini(struct drm_device *drm, void *arg)
>   	kobject_put(gt->sysfs);
>   }
>   
> -int xe_gt_sysfs_init(struct xe_gt *gt)
> +void xe_gt_sysfs_init(struct xe_gt *gt)
>   {
>   	struct xe_tile *tile = gt_to_tile(gt);
>   	struct kobj_gt *kg;
> @@ -37,7 +37,7 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
>   
>   	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
>   	if (!kg)
> -		return -ENOMEM;
> +		return;
>   
>   	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
>   	kg->gt = gt;
> @@ -45,14 +45,12 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
>   	err = kobject_add(&kg->base, tile->sysfs, "gt%d", gt->info.id);
>   	if (err) {
>   		kobject_put(&kg->base);
> -		return err;
> +		return;
>   	}
>   
>   	gt->sysfs = &kg->base;
>   
>   	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_sysfs_fini, gt);
>   	if (err)
> -		return err;
> -
> -	return 0;
> +		return;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> index ecbfcc5c7d42..e3ec278ca0be 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> @@ -8,7 +8,7 @@
>   
>   #include "xe_gt_sysfs_types.h"
>   
> -int xe_gt_sysfs_init(struct xe_gt *gt);
> +void xe_gt_sysfs_init(struct xe_gt *gt);
>   
>   static inline struct xe_gt *
>   kobj_to_gt(struct kobject *kobj)
