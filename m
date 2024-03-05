Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEADDC54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 11:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A086610E463;
	Tue,  5 Mar 2024 11:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MEi+8ZK2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549E610E44B
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709638167; x=1741174167;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=CZ3Hwn5wmoCGvPcnOpxscCdmEybs4UgJ0aSF4p/nvOg=;
 b=MEi+8ZK2QMyJFXjVAr0vZa5Kkm6J4YM4EjTVSfg1e492Ge0nmxbkpib1
 LCm9LWxPzNSGa8mh6f3J7yYPyEUJQfGrx7ekva5CREZCZ5MXq0dd5CyZ0
 Ud/vgBwNKwKoThkjCmoOFGE6wHfTKRju098cQAhy8yMYj+5tbkzT1VjEc
 ee9VROOUEOuFkSMh/G7WyNJQpeccA4LlxX0dWmSmC4D0o9gZIxVkHcHY1
 nomNq5eSw+OnDtdkv/2Cx5cNLYgMTZaz5xszwtjhMv/GuuRWqRHtS/fiv
 ZDdQgrCNjjLLAP6VkyktbhR5g0MBKZEKfoEKvdvrlREzVFaAZmAYqGLad w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4345549"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4345549"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 03:29:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9762391"
Received: from pkunieck-mobl.ger.corp.intel.com (HELO [10.249.140.91])
 ([10.249.140.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 03:29:26 -0800
Message-ID: <d5af5b39-75a1-47e2-b41a-23d6c23b62ea@intel.com>
Date: Tue, 5 Mar 2024 11:29:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] drm/xe: Convert xe_gem_fault to use direct
 xe_pm_runtime calls
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
 <20240304182154.42611-2-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240304182154.42611-2-rodrigo.vivi@intel.com>
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

On 04/03/2024 18:21, Rodrigo Vivi wrote:
> The gem page fault is one of the outer bound protections where
> we want to ensure that the hardware is in D0 before proceeding
> with memory access. Let's convert it towards the xe_pm_runtime
> functions directly so we can then convert the mem_access to be
> inner protection only and then Kill it for good.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Not strictly related to this, but FYI there is:

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1100
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1300

Which is on the GPU fault path. Looks like VM is maybe nuked before the 
worker can process the fault from the GuC? In that case there no RPM ref.

> ---
>   drivers/gpu/drm/xe/xe_bo.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6603a0ea79c5..def68528cd40 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -22,6 +22,7 @@
>   #include "xe_gt.h"
>   #include "xe_map.h"
>   #include "xe_migrate.h"
> +#include "xe_pm.h"
>   #include "xe_preempt_fence.h"
>   #include "xe_res_cursor.h"
>   #include "xe_trace.h"
> @@ -1144,7 +1145,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>   	int idx, r = 0;
>   
>   	if (needs_rpm)
> -		xe_device_mem_access_get(xe);
> +		xe_pm_runtime_get(xe);
>   
>   	ret = ttm_bo_vm_reserve(tbo, vmf);
>   	if (ret)
> @@ -1184,7 +1185,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>   	dma_resv_unlock(tbo->base.resv);
>   out:
>   	if (needs_rpm)
> -		xe_device_mem_access_put(xe);
> +		xe_pm_runtime_put(xe);
>   
>   	return ret;
>   }
