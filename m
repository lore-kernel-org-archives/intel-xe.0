Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD70C636D4
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 11:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6698110EF6C;
	Fri, 17 Feb 2023 11:20:56 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056CB10EF6C
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 11:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676632854; x=1708168854;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tlZ/behlNWqOcXTqFzBjXwvzZTlWeXC9cu4z3IPk8VU=;
 b=VBANL113xZslPTTuv34U410D4QU/QMIYkkOLkkaedlVDghQagq00e16i
 IZLsL8eiztuvlxmCN3iSvdfPpsoAzH5T58Gf0bPeefs1da41DeSN1RTRa
 9S1nGae43dW/DtqReNEasP4S2/72nVqDT62+8BnYvSxSeu1Rut7BxugzO
 o6e5GhZkMRMTeSlFJn4g/+O+5Bnb0jS4TnuOiTQ81a1fC/spEwdzk3H2z
 QS/8o0fbsyG6zU8D7ltMrCC6QorVakRPzOW2gF5N1a/o6EHlHOe9tLXnS
 k2F62PniPKPfehwHUZrvbzyR9ivGscGVt/MwybTXOW2S7NHuBYxmtdlfV A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="359413199"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="359413199"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 03:20:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="759343402"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="759343402"
Received: from atalaman-mobl.ger.corp.intel.com (HELO [10.252.19.39])
 ([10.252.19.39])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 03:20:52 -0800
Message-ID: <6c00722b-42aa-b9d9-4167-99fcf62fefb4@intel.com>
Date: Fri, 17 Feb 2023 11:20:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-3-lucas.demarchi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230217005226.106499-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 02/11] drm/xe: Sort includes
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
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 17/02/2023 00:52, Lucas De Marchi wrote:
> Sort includes and split them in blocks:
> 
> 1) .h corresponding to the .c. Example: xe_bb.c should have a "#include
>     "xe_bb.h" first.
> 2) #include <linux/...>
> 3) #include <drm/...>
> 4) local includes
> 5) i915 includes
> 
> This is accomplished by running
> `clang-format --style=file -i --sort-includes drivers/gpu/drm/xe/*.c`

Neat.

> and ignoring all the changes after the includes. There are also some
> manual tweaks to split the blocks.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

<snip>

>   
>   #include "gt/intel_gt_regs.h"
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 7886c8b85397..a27e6c1a6aff 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -3,13 +3,13 @@
>    * Copyright © 2022 Intel Corporation
>    */
>   
> +#include "xe_uc.h"

Needs new block here?

>   #include "xe_device.h"
> -#include "xe_huc.h"
>   #include "xe_gt.h"
>   #include "xe_guc.h"
>   #include "xe_guc_pc.h"
>   #include "xe_guc_submit.h"
> -#include "xe_uc.h"
> +#include "xe_huc.h"
>   #include "xe_uc_fw.h"
>   #include "xe_wopcm.h"
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7276a375e2e0..a0e35627e45e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -25,8 +25,8 @@
>   #include "xe_preempt_fence.h"
>   #include "xe_pt.h"
>   #include "xe_res_cursor.h"
> -#include "xe_trace.h"
>   #include "xe_sync.h"
> +#include "xe_trace.h"
>   
>   #define TEST_VM_ASYNC_OPS_ERROR
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 1e4e3a1b0631..29815852985a 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -3,13 +3,15 @@
>    * Copyright © 2021 Intel Corporation
>    */
>   
> -#include <drm/xe_drm.h>
> -#include <drm/ttm/ttm_tt.h>
> +#include "xe_vm_madvise.h"
> +
>   #include <linux/nospec.h>
>   
> +#include <drm/ttm/ttm_tt.h>
> +#include <drm/xe_drm.h>
> +
>   #include "xe_bo.h"
>   #include "xe_vm.h"
> -#include "xe_vm_madvise.h"
>   
>   static int madvise_preferred_mem_class(struct xe_device *xe, struct xe_vm *vm,
>   				       struct xe_vma **vmas, int num_vmas,
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index 8fe182afa06c..e9ac560be57f 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -3,13 +3,13 @@
>    * Copyright © 2022 Intel Corporation
>    */
>   
> +#include "xe_wopcm.h"

And here?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt.h"
>   #include "xe_guc_reg.h"
>   #include "xe_mmio.h"
>   #include "xe_uc_fw.h"
> -#include "xe_wopcm.h"
>   
>   /**
>    * DOC: Write Once Protected Content Memory (WOPCM) Layout
