Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAF2C5B552
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 08:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D617610E00A;
	Wed,  4 Jun 2025 08:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ubeapa1U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A3A10E00A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 08:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749026931; x=1780562931;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=79Pkacqu+EYBBzY2Yb6Y7ItOlZBQc+gvMApQkp/p11M=;
 b=Ubeapa1U/41wWu9hUMnT5AvYHjrkmQjeKoxaLK5UkT12BqePh/VMTuwp
 +N7/EdTmf9B5SPoyvMiumccYJK528kvYsEdYCidFAsaXARk869OXGvNSP
 qI3tQV8BfvTzpkt2ig1wVX9veYz/ZbVkXqot7BEzxbkhKhm0hNuwkB8Jx
 yona2vacEcY5Mz4Af0jd8QUAKzT4JdMLD0MkGQAy5D5LH35zXQe6r7QIf
 9sNhe02xCSV+ukW0xW92Hic/CzamiVznNDHV1dKsD+r7OGntHOXoOK2NQ
 KBsLqPCBr0PX9IwP8CzysCEJy4U5GHxPHUuwT6QApd9fWDNlHyc40hJ+H Q==;
X-CSE-ConnectionGUID: pdRiiAKRTKCf6Wb7uMnqIA==
X-CSE-MsgGUID: u59UjAViTNWyuNiZ8uwdLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68648500"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="68648500"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 01:48:51 -0700
X-CSE-ConnectionGUID: iVUM9No3Q1yj/ld3MdFzmA==
X-CSE-MsgGUID: 9zBulKxsQgCRDunkMh68Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="145014428"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 04 Jun 2025 01:48:49 -0700
Received: from [10.245.253.198] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.253.198])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4193E32EC9;
 Wed,  4 Jun 2025 09:48:48 +0100 (IST)
Message-ID: <0654b5be-3a42-4254-b057-199049429e9e@intel.com>
Date: Wed, 4 Jun 2025 10:48:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Disable ct on xe micro hardware init error
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
References: <20250603234510.612162-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250603234510.612162-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 04.06.2025 01:45, Zhanjun Dong wrote:
> Disable ct if xe micro controller hardware init failed.

s/ct/GuC communication
s/xe/Xe
s/init/initialization

> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917
> ---
>  drivers/gpu/drm/xe/xe_uc.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 3a8751a8b92d..ba72c1b30f2f 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> +#include "xe_guc_ct.h"
>  #include "xe_guc_pc.h"
>  #include "xe_guc_engine_activity.h"
>  #include "xe_huc.h"
> @@ -189,27 +190,27 @@ int xe_uc_init_hw(struct xe_uc *uc)

while possibly it's not a problem today, can you also update
vf_uc_init_hw() to have same logic in both variants?

>  
>  	ret = xe_huc_upload(&uc->huc);
>  	if (ret)
> -		return ret;
> +		goto err;
>  
>  	ret = xe_guc_upload(&uc->guc);
>  	if (ret)
> -		return ret;
> +		goto err;

before below line it doesn't make any sense to do cleanup and disable
communication as it was not enabled yet

>  
>  	ret = xe_guc_enable_communication(&uc->guc);
>  	if (ret)
> -		return ret;
> +		goto err;
>  
>  	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
>  	if (ret)
> -		return ret;
> +		goto err;
>  
>  	ret = xe_guc_post_load_init(&uc->guc);
>  	if (ret)
> -		return ret;
> +		goto err;
>  
>  	ret = xe_guc_pc_start(&uc->guc.pc);
>  	if (ret)
> -		return ret;
> +		goto err;
>  
>  	xe_guc_engine_activity_enable_stats(&uc->guc);
>  
> @@ -221,6 +222,9 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  	xe_gsc_load_start(&uc->gsc);
>  
>  	return 0;
> +err:
> +	xe_guc_ct_disable(&uc->guc.ct);

it's little unclear and unbalanced since above we have potentially
larger scope xe_guc_enable_communication(), not just xe_guc_ct_enable()

can you add xe_guc_disable_communication() wrapper to have right pair of
enable/disable functions like we have elsewhere ?


> +	return ret;
>  }
>  
>  int xe_uc_fini_hw(struct xe_uc *uc)

