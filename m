Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A229C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 20:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDF810E952;
	Mon, 25 Mar 2024 20:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5h/2IfV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE0F10E902
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 20:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711400076; x=1742936076;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OI4pgdcL28yruJRtuZcAs4Ej4mEjZmhqmfQAi30ITB4=;
 b=b5h/2IfVlKX0eEeu570Mgn6TKf1Ii/k5V8ID7nrbzc1thyEUPBCPO8Mz
 dsocw0QJZIYEPkcGvM5iff+g4x5uIVkvx/0Z+OozC+lQR9PT70mk377jA
 8ZWaPiojAkBgIdIJi3cWpomUIVlR00vOTn0pqGXic02G7ZDRFxuDmkyOz
 ynBu79Up9qfIkUYc1dnZBWGOGlhT6ggSrcRcQsNLYqkC6M8VGXLtA6VmO
 6XdSTKlnoRuBSO0nJY7EMwm76oBJvvHOiNVje9E9SoD3vsGsbzXo6iBBi
 8NNdKpPNlfFNCyXf0lXyQO1Uia+WMFD0uqq30im6m6EcIthxHHFTLlKRe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="9392763"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="9392763"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 13:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="16172022"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.52.33])
 ([10.246.52.33])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 13:54:34 -0700
Message-ID: <8c521ff9-950f-480e-911b-9c6210ff6416@linux.intel.com>
Date: Mon, 25 Mar 2024 21:54:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Create a helper function to init job's user
 fence
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20240321161142.4954-1-nirmoy.das@intel.com>
 <vgkvzpqwyku2q5lomqvytpeuz7hvybykd4rnetzkgy3siy3c57@jclsubzhsmts>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <vgkvzpqwyku2q5lomqvytpeuz7hvybykd4rnetzkgy3siy3c57@jclsubzhsmts>
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

Hi Lucas,

On 3/22/2024 5:11 PM, Lucas De Marchi wrote:
> On Thu, Mar 21, 2024 at 05:11:42PM +0100, Nirmoy Das wrote:
>> Refactor xe_sync_entry_signal so it doesn't have to
>> modify xe_sched_job struct instead create a new helper function
>> to set user fence values for a job.
>>
>> v2: Move the sync type check to xe_sched_job_init_user_fence(Lucas)
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_exec.c      |  9 +++++----
>> drivers/gpu/drm/xe/xe_sched_job.c | 18 ++++++++++++++++++
>> drivers/gpu/drm/xe/xe_sched_job.h |  3 +++
>> drivers/gpu/drm/xe/xe_sync.c      |  7 +------
>> drivers/gpu/drm/xe/xe_sync.h      |  1 -
>> drivers/gpu/drm/xe/xe_vm.c        | 10 +++++-----
>> 6 files changed, 32 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>> index 7692ebfe7d47..9d53ef8c49cc 100644
>> --- a/drivers/gpu/drm/xe/xe_exec.c
>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>> @@ -249,7 +249,7 @@ int xe_exec_ioctl(struct drm_device *dev, void 
>> *data, struct drm_file *file)
>>                 goto err_unlock_list;
>>             }
>>             for (i = 0; i < num_syncs; i++)
>> -                xe_sync_entry_signal(&syncs[i], NULL, fence);
>> +                xe_sync_entry_signal(&syncs[i], fence);
>>             xe_exec_queue_last_fence_set(q, vm, fence);
>>             dma_fence_put(fence);
>>         }
>> @@ -359,9 +359,10 @@ int xe_exec_ioctl(struct drm_device *dev, void 
>> *data, struct drm_file *file)
>>         drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, 
>> &job->drm.s_fence->finished,
>>                      DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
>>
>> -    for (i = 0; i < num_syncs; i++)
>> -        xe_sync_entry_signal(&syncs[i], job,
>> -                     &job->drm.s_fence->finished);
>> +    for (i = 0; i < num_syncs; i++) {
>> +        xe_sync_entry_signal(&syncs[i], &job->drm.s_fence->finished);
>> +        xe_sched_job_init_user_fence(job, &syncs[i]);
>> +    }
>>
>>     if (xe_exec_queue_is_lr(q))
>>         q->ring_ops->emit_job(job);
>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c 
>> b/drivers/gpu/drm/xe/xe_sched_job.c
>> index 8151ddafb940..bfbce9b69087 100644
>> --- a/drivers/gpu/drm/xe/xe_sched_job.c
>> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
>> @@ -5,6 +5,7 @@
>>
>> #include "xe_sched_job.h"
>>
>> +#include <drm/xe_drm.h>
>> #include <linux/dma-fence-array.h>
>> #include <linux/slab.h>
>>
>> @@ -17,6 +18,7 @@
>> #include "xe_macros.h"
>> #include "xe_trace.h"
>> #include "xe_vm.h"
>> +#include "xe_sync_types.h"
>
> wrong placement, otherwise lgtm
>
> Feel free to carry by Reviewed-by: Lucas De Marchi 
> <lucas.demarchi@intel.com>
> with that fixed.

Could you please help me merge this patch.  I am having issue with my 
dev machine which I use to merge patches.

I can re-send with the above change as you have suggested.

Regards,

Nirmoy

>
> thanks
> Lucas De Marchi
