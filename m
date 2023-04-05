Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD08C7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62A110E9EF;
	Wed,  5 Apr 2023 15:31:20 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9159610E9EF
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680708679; x=1712244679;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VDVirRtbLWsjQkjgC96YP6oWSTpnoTq4q96qFXYBsec=;
 b=PnFU+0RB+V/+OMVgtKm1IFZQIZi9abxNo5b24PhZIHftg7Oh82si1BiD
 HJKSqg31wH7/vZkXskqSLXXU8vW/Z1csvdWTp3D/fVIvVRUdiBGXX4jUC
 J9HMPWp0upECqijr3FubOOPhjxrUcFjickIB2emBAQd84cq880LnQExIu
 FjYvh0TgN0QTGR5eEzebhGV9Tm0UceiQb4SWx9ty1faWUSXsi4sqIhRc8
 3qAVUUdLTBwbVnum5xP37tUXEDrqHbDLvqVg9oEiYBFpTAS7HeQy8+SWn
 r63kFBp3l5jusypmGe3O3v83uWvKwmM0cBu/pyQVSSM7cBVjE//AunLXW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="326522113"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="326522113"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:31:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="1016505907"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="1016505907"
Received: from dcolomor-mobl1.ger.corp.intel.com (HELO [10.249.33.69])
 ([10.249.33.69])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:31:17 -0700
Message-ID: <5ef57cd7-0c59-20b0-ba58-ad415c31963b@linux.intel.com>
Date: Wed, 5 Apr 2023 17:31:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230404014228.3738347-1-matthew.brost@intel.com>
 <fc2de32e-9774-e5b0-3b43-e0e3eab74241@linux.intel.com>
 <ZCw6lTSIFd9FAaoC@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZCw6lTSIFd9FAaoC@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v5 0/8] Port Xe to use GPUVA and implement
 NULL VM binds
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

On 4/4/23 16:56, Matthew Brost wrote:
> On Tue, Apr 04, 2023 at 03:20:47PM +0200, Thomas Hellström wrote:
>> Hi, Matthew,
>>
>>
>> On 4/4/23 03:42, Matthew Brost wrote:
>>> GPUVA is common code written primarily by Danilo with the idea being a
>>> common place to track GPUVAs (VMAs in Xe) within an address space (VMs
>>> in Xe), track all the GPUVAs attached to GEMs, and a common way
>>> implement VM binds / unbinds with MMAP / MUNMAP semantics via creating
>>> operation lists. All of this adds up to a common way to implement VK
>>> sparse bindings.
>>>
>>> This series pulls in the GPUVA code written by Danilo plus some small
>>> fixes by myself into 1 large patch. Once the GPUVA makes it upstream, we
>>> can rebase and drop this patch. I believe what lands upstream should be
>>> nearly identical to this patch at least from an API perspective.
>>>
>>> The last three patches port Xe to GPUVA and add support for NULL VM binds
>>> (writes dropped, read zero, VK sparse support). An example of the
>>> semantics of this is below.
>> Going through thew new code in xe_vm.c I'm still concerned about our error
>> handling. In the cases we attempt to handle, for example an -ENOMEM, the
>> sync ioctl appears to be doing a fragile unwind whereas the async worker
>> puts the VM in an error state that can only be exited by a RESTART ioctl
>> (pls correct me if I'm wrong here). We could of course do the same for sync
>> ioctls, but I'm still wondering what happens if, for example a MAP operation
>> on a dual-gt VM fails after binding on the first gt?
>>
> So sync mode we don't allow advanced binds (more than 1 map operation)
> but I failed to take into account dual-gt VMs, yea that might be an
> issue foe sync binds. This should just for work async though. Maybe we
> depreciate the sync mode except for unbinds when in an error state.

I think we need to separate this from sync/async and what's in the 
current code. I've started to dig into the Nouveau code a bit to get 
things right in the async VM_BIND document, but the error handling 
should really be agnostic as to whether we're async or not. We should be 
able to run RESTART also after a failing sync VM_BIND if the decision is 
to put the VM in a recoverable error state rather than to clean 
everything up after each failure.

>
>> I think we need to clearly define the desired behaviour in the uAPI and then
>> make sure we do the necessary changes with that in mind, and Even if I
>> prefer the !async_worker solution this can be don orthogonally to that
>> discussion. Ideally I'd see we find a way to *not* put the VM  in an error
>> state like this, and I figure there are various ways to aid in this, for
>> example keeping a progress cookie in the user-space data or deferring any
>> failed bind operations to the next rebind worker or exec, but in the end I
>> think this boils down to allocating all needed resources up-front for
>> operations or groups of operations that are not allowed to fail once we
>> start to modify the page-tables.
>>
> Agree on clearly defined uAPI behavior, I'm not sure if I have answer
> for the error handling. Personally I like the stop / restart mechanism
> as it essentially mean binds never can fail with a well behavied user.
> wrt to Allocating up front, I think that is what Nouveau is doing? We
> could study that code but allocating everything up front will be a
> pretty large change.
>
> Obviously we need to do some work here and this is one of our biggest
> opens left but I don't view this as a true blocker until we remove force
> probe. GPUVA regardless is a step in the right direction which will make
> any changes going forward easier + enable VK to get sparse implemented.
> I'd say let's get GPUVA merged and next focus on these issues you have
> raised.

I think we need a pretty major rewrite here, and I think moving over to 
GPUVA would be cleaner with that done and possibilities of a clean error 
recovery in place. I stumbled on these WARN_ON(err) when starting to 
review, when it's IMO perfectly possible for that err to be non-zero, 
and since we're not in POC mode anymore I'm reluctant to Ack something 
that we know might blow up.

What I can do, though is to dig more into, Nouveau to see how they 
handle the error unwind, and start implementing a clean unwind also in 
our driver and rebase the GPUVA stuff on top.

/Thomas


>
> Also another VM bind issue we need address soon:
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/41
>
> Matt
>
>> Thoughts?
>>
>> /Thomas
>>
>>
>>
>>
>>> MAP 0x0000-0x8000 to NULL 	- 0x0000-0x8000 writes dropped + read zero
>>> MAP 0x4000-0x5000 to a GEM 	- 0x0000-0x4000, 0x5000-0x8000 writes dropped + read zero; 0x4000-0x5000 mapped to a GEM
>>> UNMAP 0x3000-0x6000		- 0x0000-0x3000, 0x6000-0x8000 writes dropped + read zero
>>> UNMAP 0x0000-0x8000		- Nothing mapped
>>>
>>> No changins to existing behavior, rather just new functionality./
>>>
>>> v2: Fix CI build failure
>>> v3: Export mas_preallocate, add patch to avoid rebinds
>>> v5: Bug fixes, rebase, xe_vma size optimizations
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>
>>> Danilo Krummrich (2):
>>>     maple_tree: split up MA_STATE() macro
>>>     drm: manager to keep track of GPUs VA mappings
>>>
>>> Matthew Brost (6):
>>>     maple_tree: Export mas_preallocate
>>>     drm/xe: Port Xe to GPUVA
>>>     drm/xe: NULL binding implementation
>>>     drm/xe: Avoid doing rebinds
>>>     drm/xe: Reduce the number list links in xe_vma
>>>     drm/xe: Optimize size of xe_vma allocation
>>>
>>>    Documentation/gpu/drm-mm.rst                |   31 +
>>>    drivers/gpu/drm/Makefile                    |    1 +
>>>    drivers/gpu/drm/drm_debugfs.c               |   56 +
>>>    drivers/gpu/drm/drm_gem.c                   |    3 +
>>>    drivers/gpu/drm/drm_gpuva_mgr.c             | 1890 ++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_bo.c                  |   10 +-
>>>    drivers/gpu/drm/xe/xe_bo.h                  |    1 +
>>>    drivers/gpu/drm/xe/xe_device.c              |    2 +-
>>>    drivers/gpu/drm/xe/xe_exec.c                |    4 +-
>>>    drivers/gpu/drm/xe/xe_gt_pagefault.c        |   29 +-
>>>    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   14 +-
>>>    drivers/gpu/drm/xe/xe_guc_ct.c              |    6 +-
>>>    drivers/gpu/drm/xe/xe_migrate.c             |    8 +-
>>>    drivers/gpu/drm/xe/xe_pt.c                  |  176 +-
>>>    drivers/gpu/drm/xe/xe_trace.h               |   10 +-
>>>    drivers/gpu/drm/xe/xe_vm.c                  | 1947 +++++++++----------
>>>    drivers/gpu/drm/xe/xe_vm.h                  |   76 +-
>>>    drivers/gpu/drm/xe/xe_vm_madvise.c          |   87 +-
>>>    drivers/gpu/drm/xe/xe_vm_types.h            |  276 ++-
>>>    include/drm/drm_debugfs.h                   |   24 +
>>>    include/drm/drm_drv.h                       |    7 +
>>>    include/drm/drm_gem.h                       |   75 +
>>>    include/drm/drm_gpuva_mgr.h                 |  734 +++++++
>>>    include/linux/maple_tree.h                  |    7 +-
>>>    include/uapi/drm/xe_drm.h                   |    8 +
>>>    lib/maple_tree.c                            |    1 +
>>>    26 files changed, 4203 insertions(+), 1280 deletions(-)
>>>    create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
>>>    create mode 100644 include/drm/drm_gpuva_mgr.h
>>>
