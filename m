Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FD5C44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 15:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF6F10E141;
	Wed, 15 Jul 2026 15:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEBjD+2t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8CF10E141
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 15:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784127782; x=1815663782;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=lVXaKFl67cZ0lnecbeMXun199gyI+zRuFBgIPF9P47I=;
 b=nEBjD+2t21yWTszc4e0Ptz+dzA8VAF6840a2bKIrbTdOZwBCJow83fCT
 AnEEjXESGyWmyAe0jvNW4KJAI3923DC/C7cgzKYiZ41d4r+nPEE6ko8l1
 lDc8tK2qOvVKMRQc7o6KCc+mIECEX1ssyq0gT8xCQrAcgixKrFepjPF81
 EZ8aNoxj4QPiCZBv0//RWV6r78Y9ci06K3sDhg66Nr6UgyAREfCoc3+WX
 HOMAA9wUcEQTprRgJCo4AxdaqqUllqrlDWK1B3RuEfGJPebzP49743ugn
 bhUpyPyjGx8qZ/oaJdGu0KyYyo87NnA80ijIwQRecCPJi3sFBWExVp8La Q==;
X-CSE-ConnectionGUID: PX749pHqTYuNH20f3uzQFg==
X-CSE-MsgGUID: qaLrKJDsRdCE3AMlmHUzGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84726633"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84726633"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 08:03:02 -0700
X-CSE-ConnectionGUID: wZiCFLJ5TJSgyhlcB7jC7w==
X-CSE-MsgGUID: PZDb59clRLyDnVwUq5CFxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="254460277"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.131])
 ([10.245.244.131])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 08:03:01 -0700
Message-ID: <b32d3a0f-e0d8-4aed-9a39-f3c317c33c3c@intel.com>
Date: Wed, 15 Jul 2026 16:02:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xe/userptr: TLB invalidation new pm_runtime ref before
 submit
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260715140133.1811959-1-dnyaneshwar.bhadane@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260715140133.1811959-1-dnyaneshwar.bhadane@intel.com>
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

On 15/07/2026 15:01, Dnyaneshwar Bhadane wrote:
> Take a proper runtime PM reference before TLB invalidation.
> The MMU notifier path has no outer xe_pm_runtime_get()
> protection, but xe_tlb_inval_fence_init() called from
> xe_vm_invalidate_vma_submit() uses xe_pm_runtime_get_noresume()
> which requires an existing reference. The fence itself will
> hold its own noresume ref until it signals.

Is this fixing a real issue? Do you have a link to a bug report or a splat?

I think fault_mode implies LR, and LR vm is always holding an RPM ref 
until destroyed?

> 
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_userptr.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index 1d2ab678faf5..fc7e4b00fe17 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -8,6 +8,7 @@
>   
>   #include <linux/mm.h>
>   
> +#include "xe_pm.h"
>   #include "xe_tlb_inval.h"
>   #include "xe_trace_bo.h"
>   
> @@ -103,6 +104,7 @@ xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma, bool is_d
>   	XE_WARN_ON(err <= 0);
>   
>   	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> +		guard(xe_pm_runtime)(vm->xe);
>   		if (!userptr->finish_inuse) {
>   			/*
>   			 * Defer the TLB wait to an extra pass so the caller

