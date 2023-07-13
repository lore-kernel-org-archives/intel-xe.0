Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFABC001B0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 15:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8268B10E6FC;
	Thu, 13 Jul 2023 15:24:49 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A411B10E709
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 15:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689261886; x=1720797886;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=uM/t2fV4t3N7mm7PhvwbixaqP5etmhwp+xZP8CFhp8I=;
 b=LNof8UHqJg4Aa75NG3pjLPHhpw4TWtWqZVshlwVbqWFVe3zvCHV57tT7
 qgOYm/KeT8pFGR19werbXw3xlifPVWUUTLlXmMw/yqqs3x8qdndwueaKP
 gt+EW88+hcet/9PX+qzFsq0xMApT17VOAKuEmNbGk3bel7q2Iq81WMzNI
 4yF7Lr913EQeSppu290t/1E3Aqg5H/pn6PtKqwLAIfFsnUYdBg9xLsrjw
 7DKcM+d8Bhw6ZvV5Jds/+zvF97Ca8y/YlEg4bvuwGt9UkHKgq96M/63Eq
 y3bm8nX3TpInSGatonJjAhoudrq21tzQ8XAlfsfImZrILdBP5LhbezdMv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="345538356"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="345538356"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:24:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="968658052"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="968658052"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.53.19])
 ([10.252.53.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:24:42 -0700
Message-ID: <f29b47f6-9899-6be4-3ef6-b5341d39a6c9@linux.intel.com>
Date: Thu, 13 Jul 2023 17:24:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230713094125.326709-5-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230713094125.326709-5-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe/selftests: hold rpm for
 evict_test_run_device()
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


On 7/13/2023 11:41 AM, Matthew Auld wrote:
> We are calling fairly low level things like xe_bo_restore_kernel() which
> expect caller to be holding mem_access.ref. Since we are doing stuff
> like evict_all we likely don't want to race with rpm suspend, since that
> potentially wants to do the same thing, so just wrap the whole test.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_bo.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 5309204d8d1b..edee4116c59d 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -12,6 +12,7 @@
>   
>   #include "xe_bo_evict.h"
>   #include "xe_pci.h"
> +#include "xe_pm.h"
>   
>   static int ccs_test_migrate(struct xe_gt *gt, struct xe_bo *bo,
>   			    bool clear, u64 get_val, u64 assign_val,
> @@ -295,9 +296,15 @@ static int evict_test_run_device(struct xe_device *xe)
>   		return 0;
>   	}
>   
> +	xe_pm_runtime_get(xe); /* FIXME: remove once mem_access actually works */
> +	xe_device_mem_access_get(xe);
> +
>   	for_each_gt(gt, xe, id)
>   		evict_test_run_gt(xe, gt, test);
>   
> +	xe_device_mem_access_put(xe);
> +	xe_pm_runtime_put(xe);
> +
>   	return 0;
>   }
>   
