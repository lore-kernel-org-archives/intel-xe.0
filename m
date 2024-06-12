Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83640C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 10:11:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0851F10E77F;
	Wed, 12 Jun 2024 10:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEkCDJKD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1335410E77F
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 10:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718187111; x=1749723111;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=g3NDUlhWAeW9u534587arNhWNp4tXgI/j4zCgfyOXcE=;
 b=WEkCDJKDv7FwEE9xPaeQMzzz+p0261YRirMGks90F69t1x5sqjEk9lWR
 f0j+m8dr3kgc4O/X09KQc/j3m7zd3vRZaHFrQkwCVaIBkGYpwkwoJSe1R
 M89yyUEaTYEAY43CN2dUnYN76FRMpMTLoenPDb6zD5b0zn0LxXnyY96ZD
 sqJPORIrgkyidKuQtBIvomXWaVi66GnZTBSTTktucHzkbP0rz8Zykx640
 YoPIe+4k+ttI5hpc/Bo4N+FEWUwnVI5Sw7yF1mwKQG043JZ51Yxvzwbyn
 BcxfXkH07ksYFu3q8HBP0xdpaz4WXQdPKb6dNVBClplhESeX6MxYDYlc8 w==;
X-CSE-ConnectionGUID: vVQfEKBbS3+zqBA/HdWlAw==
X-CSE-MsgGUID: NHCE3L/ZTdyTJKjW3nTGbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14775899"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="14775899"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:11:50 -0700
X-CSE-ConnectionGUID: w3NA4LGpRq6LCtlJEGNqIg==
X-CSE-MsgGUID: /wgkZfCgQLyuojZIqQ+fEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="39629972"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.248.192])
 ([10.94.248.192])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:11:48 -0700
Message-ID: <f958e5fd-5230-4842-b87c-627c924c616e@linux.intel.com>
Date: Wed, 12 Jun 2024 12:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/xe: Prefer GT oriented messages in
 xe_force_wake.c
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240611163537.1944-1-michal.wajdeczko@intel.com>
 <20240611163537.1944-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240611163537.1944-2-michal.wajdeczko@intel.com>
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


On 6/11/2024 6:35 PM, Michal Wajdeczko wrote:
> If possible, we should prefer xe_gt_notice() over drm_notice().
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
> v2: don't fix fw_to_gt (Lucas)
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index b2d385daff4b..13ddabd90eed 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -10,6 +10,7 @@
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_reg_defs.h"
>   #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>   #include "xe_mmio.h"
>   
>   #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
> @@ -20,12 +21,6 @@ fw_to_gt(struct xe_force_wake *fw)
>   	return fw->gt;
>   }
>   
> -static struct xe_device *
> -fw_to_xe(struct xe_force_wake *fw)
> -{
> -	return gt_to_xe(fw_to_gt(fw));
> -}
> -
>   static void domain_init(struct xe_force_wake_domain *domain,
>   			enum xe_force_wake_domain_id id,
>   			struct xe_reg reg, struct xe_reg ack)
> @@ -135,7 +130,6 @@ static int domain_sleep_wait(struct xe_gt *gt,
>   int xe_force_wake_get(struct xe_force_wake *fw,
>   		      enum xe_force_wake_domains domains)
>   {
> -	struct xe_device *xe = fw_to_xe(fw);
>   	struct xe_gt *gt = fw_to_gt(fw);
>   	struct xe_force_wake_domain *domain;
>   	enum xe_force_wake_domains tmp, woken = 0;
> @@ -153,8 +147,8 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>   		ret = domain_wake_wait(gt, domain);
>   		ret2 |= ret;
>   		if (ret)
> -			drm_notice(&xe->drm, "Force wake domain (%d) failed to ack wake, ret=%d\n",
> -				   domain->id, ret);
> +			xe_gt_notice(gt, "Force wake domain (%d) failed to ack wake, ret=%d\n",
> +				     domain->id, ret);
>   	}
>   	fw->awake_domains |= woken;
>   	spin_unlock_irqrestore(&fw->lock, flags);
> @@ -165,7 +159,6 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>   int xe_force_wake_put(struct xe_force_wake *fw,
>   		      enum xe_force_wake_domains domains)
>   {
> -	struct xe_device *xe = fw_to_xe(fw);
>   	struct xe_gt *gt = fw_to_gt(fw);
>   	struct xe_force_wake_domain *domain;
>   	enum xe_force_wake_domains tmp, sleep = 0;
> @@ -183,8 +176,8 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>   		ret = domain_sleep_wait(gt, domain);
>   		ret2 |= ret;
>   		if (ret)
> -			drm_notice(&xe->drm, "Force wake domain (%d) failed to ack sleep, ret=%d\n",
> -				   domain->id, ret);
> +			xe_gt_notice(gt, "Force wake domain (%d) failed to ack sleep, ret=%d\n",
> +				     domain->id, ret);
>   	}
>   	fw->awake_domains &= ~sleep;
>   	spin_unlock_irqrestore(&fw->lock, flags);
