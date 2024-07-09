Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D85EC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 16:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D23A10E5E1;
	Tue,  9 Jul 2024 16:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kzrIZ+iF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D9E10E5E1
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 16:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720541339; x=1752077339;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZNVt8/YUyiwj6VGFKS4zLFo73Jfx1WWprKGTTlrI6bA=;
 b=kzrIZ+iF0CsTdLuO9vbUAkUunH7tbuq2kBrzJouYYaqHnfwacWJB+gbb
 VWU2Pw0i3999Q2PdU2U8FOF/xYIulv+hjsO/uAWlJrV8e55ObpBZTsQ6L
 QNogEkbXEcGOMuGIk10vsX9uHr5+paMzrJ2i9yTBVRErP+xcYLbkyDCV+
 JLyHLGFhMHyXpTKu4qxCOtHnZ21R7BfZh+mrQ54UDqB8SzYtW8XaSSGXx
 IiKG6eTnVX16ELurrFqvMTzFij/lqAMc5Dyd4beCbJM96htlB9mhaCNSI
 W4ju1pKedVNUolNuYVmWPuwZOrep4Z+pKuvrROkjzUQ+H1FlsShDTLbT+ g==;
X-CSE-ConnectionGUID: msWTzzG3T6+8gNjvymnP0w==
X-CSE-MsgGUID: R9n+qNOWSWKZ0LNcNwbaMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="35240029"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="35240029"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 09:08:58 -0700
X-CSE-ConnectionGUID: C/JK8cBiTqeZ2YSoqEhReg==
X-CSE-MsgGUID: QYH7Sj5UTjePN78WEQNaGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="47788290"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.254.89])
 ([10.94.254.89])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 09:08:56 -0700
Message-ID: <b008d72f-8123-4f3e-827f-9e5fd9368983@linux.intel.com>
Date: Tue, 9 Jul 2024 18:08:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Proper GT TLB invalidation layering and new
 coalescing feature.
To: Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, farah.kassabri@intel.com, michal.wajdeczko@intel.com
References: <20240708040331.766264-1-matthew.brost@intel.com>
 <6aba8e53-55fd-4573-ad0c-e8c62ebe1297@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <6aba8e53-55fd-4573-ad0c-e8c62ebe1297@intel.com>
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


On 7/9/2024 11:57 AM, Matthew Auld wrote:
> Hi,
>
> On 08/07/2024 05:03, Matthew Brost wrote:
>> While debuging [1] an issue was identified in which if too many GT TLB
>> invalidations are issued to the GuC, the GuC can get overwhelmed to the
>> point scheduling of jobs starts to stall. To avoid this, hold and
>> coalesce GT TLB invalidations in the KMD if a watermark of pending
>> invalidations is past. Add gitlab for this issue has also been opened
>> [2].
>>
>> Layering issues with GT TLB invalidations are known [3] which needed to
>> be fixed first before adding this new feature.
>>
>> - Patches 1-8 fix the layering.
>> - Patches 9-11 add coalescing feature.
>>
>> We could merge these two as seperate series if needed.
>>
>> CCing various stakeholders (Farah, Michal, Nirmoy) which have raised GT
>> TLB invalidation issues in the past.
>
> Maybe worth mentioning for [1], we try to process TLB invalidations 
> directly from the irq, however we also only process the g2h queue 
> in-order, so if there is something other than TLB invalidation or 
> fault earlier in the queue then we do nothing useful from the irq and 
> just return, that is until the wq can eventually process those earlier 
> items that couldn't be processed directly from the irq. In the past 

Seen this recently :

<3> [3763.731822] xe 0000:03:00.0: [drm] *ERROR* GT0: g2h outstanding: 611
<snip>
<6> [3727.857273] [IGT] xe_evict: executing
<3> [3730.165480] xe 0000:03:00.0: [drm] *ERROR* TILE0 [GTT] GT0: TLB 
invalidation time'd out, seqno=26858, recv=2685

Which I think fits your description. This series should help but not 
sure how much.


Regards,

Nirmoy

> I have seen TLB timeouts where the TLB invalidation is clearly in the 
> g2h queue (and has been for a while), but is stuck behind something 
> earlier in the queue that needs the wq, but system is under such a 
> heavy load that the wq can't be scheduled in a timely manner.
>
>>
>> v2:
>>   - Fix CI issues
>>   - Clean up some of the series / patch structure
>>
>> Matt
>>
>> [1] 
>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497
>> [2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162
>> [3] https://patchwork.freedesktop.org/series/133001/
>>
>> Matthew Brost (11):
>>    drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
>>    drm/xe: Drop xe_gt_tlb_invalidation_wait
>>    drm/xe: s/tlb_invalidation.lock/tlb_invalidation.fence_lock
>>    drm/xe: Add tlb_invalidation.seqno_lock
>>    drm/xe: Add xe_gt_tlb_invalidation_done_handler
>>    drm/xe: Add send tlb invalidation helpers
>>    drm/xe: Add xe_guc_tlb_invalidation layer
>>    drm/xe: Add multi-client support for GT TLB invalidations
>>    drm/xe: Add GT TLB invalidation coalescing
>>    drm/xe: Add GT TLB invalidation coalesce tracepoints
>>    drm/xe: Add GT TLB invalidation watermark debugfs
>>
>>   drivers/gpu/drm/xe/Makefile                   |   1 +
>>   drivers/gpu/drm/xe/xe_debugfs.c               |  38 ++
>>   drivers/gpu/drm/xe/xe_device.c                |   3 +
>>   drivers/gpu/drm/xe/xe_device_types.h          |   5 +
>>   drivers/gpu/drm/xe/xe_ggtt.c                  |  21 +-
>>   drivers/gpu/drm/xe/xe_ggtt_types.h            |   5 +
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 641 ++++++++++++------
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  26 +-
>>   .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  41 ++
>>   drivers/gpu/drm/xe/xe_gt_types.h              |  43 +-
>>   drivers/gpu/drm/xe/xe_guc_ct.c                |   2 +-
>>   drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c  | 145 ++++
>>   drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h  |  18 +
>>   drivers/gpu/drm/xe/xe_pt.c                    |  33 +-
>>   drivers/gpu/drm/xe/xe_trace.h                 |  10 +
>>   drivers/gpu/drm/xe/xe_vm.c                    |  45 +-
>>   drivers/gpu/drm/xe/xe_vm_types.h              |   3 +
>>   17 files changed, 801 insertions(+), 279 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h
>>
