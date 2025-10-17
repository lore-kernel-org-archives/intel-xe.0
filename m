Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C50CCD19A
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 11:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB1810EBB8;
	Fri, 17 Oct 2025 11:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZqNYNf+z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B395A10EBB8
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 11:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760700209; x=1792236209;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Hxp/kkkJ4GiQN48aux1/QX+OqJdFYM5wQ5OhF69d6yc=;
 b=ZqNYNf+zPrjxc8A0CMtnIPeBcoj7abqpOD1yaDkWvmpFRMQwo004/+oi
 iT+lx2dftAOLReIeAOaN7N0NZ7ELd32Euw1XQrVQKau6FkU4A3rEsBt93
 W1HAZ9n1J2Ahtw6EFEcdDKmW0J1R13ePFP+5hynWPSA3fNyLB+RY5W/Ym
 yYoEKn6jK4YQLTipBt0L1q1UQVjAl3cdnMIJA0VZujTYUTCMY8Y3C5zNh
 XHNADMYbwqTM01kg4g3vx/nDJZ6PTrimRhNzSIj2w77Ix9NTxbLinJRD/
 fePzJTQAH09HAQzD8awvMxGjxfjyYgDNR+Hs6KzE5g7Bm6bUuV5Z7ik0V A==;
X-CSE-ConnectionGUID: 8SrouxySSD6otYgZSKukkA==
X-CSE-MsgGUID: nwGh7b8yQeyZsBAGwH/1Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62957307"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="62957307"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 04:23:28 -0700
X-CSE-ConnectionGUID: UbkRhM9NSia8Kp/VLLgJjw==
X-CSE-MsgGUID: 8YkPt7E2TJayARV2BK8+JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="183119550"
Received: from agladkov-desk.ger.corp.intel.com (HELO [10.245.244.103])
 ([10.245.244.103])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 04:23:27 -0700
Message-ID: <075044e3-ee98-49f9-b83f-1f937850e47d@intel.com>
Date: Fri, 17 Oct 2025 12:23:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/xe/migrate: support MEM_COPY instruction
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20251015141929.123637-8-matthew.auld@intel.com>
 <20251015141929.123637-13-matthew.auld@intel.com>
 <aPBDTh2RA33TPaM8@lstrano-desk.jf.intel.com>
 <3950cf17-a681-4541-98af-c03ce8d64ce5@intel.com>
 <aPE9jWAlrUfmb4ve@lstrano-desk.jf.intel.com>
 <aPFi+mThPIgY27Us@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <aPFi+mThPIgY27Us@lstrano-desk.jf.intel.com>
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

On 16/10/2025 22:26, Matthew Brost wrote:
> On Thu, Oct 16, 2025 at 11:46:37AM -0700, Matthew Brost wrote:
>> On Thu, Oct 16, 2025 at 10:41:33AM +0100, Matthew Auld wrote:
>>> On 16/10/2025 01:58, Matthew Brost wrote:
>>>> On Wed, Oct 15, 2025 at 03:19:35PM +0100, Matthew Auld wrote:
>>>>> Make this the default on xe2+ when doing a copy. This has a few
>>>>> advantages over the exiting copy instruction:
>>>>>
>>>>> 1) It has a special PAGE_COPY mode that claims to be optimised for
>>>>>      page-in/page-out, which is the vast majority of current users.
>>>>>
>>>>> 2) It also has a simple BYTE_COPY mode that supports byte granularity
>>>>>      copying without any restrictions.
>>>>>
>>>>> With 2) we can now easily skip the bounce buffer flow when copying
>>>>> buffers with strange sizing/alignment, like for memory_access. But that
>>>>> is left for the next patch.
>>>>>
>>>>
>>>> How you tested if this series has an affect on bandwidth of copies?
>>>
>>> I only tested it from functionaly pov. Main interest for this series was
>>> with 2) atm.
>>>
>>>>
>>>> We have some SVM tests which can measure this bandwidth rather
>>>> effectively. I can give these tests a try a but it may take a few days.
>>>>
>>>> With that, feel free to breakout the first 4 patches into an individual
>>>> series while we explore the affects on bandwidth for th last two
>>>> patches.
>>>
>>> Sounds good. Can you point me to those SVM tests? I see some fault and
>>> pre-fetch benchmarks in IGT, is it those? I can try them.
>>>
>>
>> Yes, the prefetch benchmark test is a good one but it is software
>> limited atm so might not give the best view.
>>
>> Running 'xe_exec_system_allocator --r many-large-malloc' and then
>> looking at the GT stats the copy bandwidth can be derived. I have
>> scripts that do this, I believe Francios uploaded these somewhere
>> internally but here is a public link to a script which parses these [1].
>>
>> I can try to find time to see the bandwidth before / after this series
>> today and report back.
>>
> 
> I didn’t observe a noticeable performance drop when using MEM_COPY_CMD
> in the SVM tests. However, for various reasons, this path is still
> software-limited in the KMD. Once we land additional software
> optimizations to accelerate the copies, switching between commands will
> be straightforward. So, there’s no performance concern with these
> changes.

Many thanks for checking this.

> 
>> Matt
>>
>> [1] https://pastebin.com/rZZN5sgh
>>
>>>>
>>>> Matt
>>>>
>>>>> BSpec: 57561
>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>    .../gpu/drm/xe/instructions/xe_gpu_commands.h |  6 ++
>>>>>    drivers/gpu/drm/xe/xe_migrate.c               | 64 ++++++++++++++++---
>>>>>    2 files changed, 61 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>>>> index 8cfcd3360896..5d41ca297447 100644
>>>>> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>>>> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>>>> @@ -31,6 +31,12 @@
>>>>>    #define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
>>>>>    #define   XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK	GENMASK(23, 20)
>>>>> +#define MEM_COPY_CMD (2 << 29 | 0x5a << 22 | 0x8)
>>>>> +#define   MEM_COPY_PAGE_COPY_MODE REG_BIT(19)
>>>>> +#define   MEM_COPY_MATRIX_COPY REG_BIT(17)
>>>>> +#define   MEM_COPY_SRC_MOCS_INDEX_MASK	GENMASK(31, 28)
>>>>> +#define   MEM_COPY_DST_MOCS_INDEX_MASK	GENMASK(6, 3)
>>>>> +
>>>>>    #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
>>>>>    #define   PVC_MEM_SET_CMD_LEN_DW	7
>>>>>    #define   PVC_MEM_SET_MATRIX		REG_BIT(17)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>>>> index 3801152b7f8f..da1fefb96070 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>>> @@ -699,37 +699,83 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>>>>    }
>>>>>    #define EMIT_COPY_DW 10
>>>>> -static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
>>>>> -		      u64 src_ofs, u64 dst_ofs, unsigned int size,
>>>>> -		      unsigned int pitch)
>>>>> +static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>>>>> +			      u64 dst_ofs, unsigned int size,
>>>>> +			      unsigned int pitch)
>>>>>    {
>>>>>    	struct xe_device *xe = gt_to_xe(gt);
>>>>> -	u32 mocs = 0;
>>>>>    	u32 tile_y = 0;
>>>>> +	xe_gt_assert(gt, GRAPHICS_VER(xe) < 20);
>>>>>    	xe_gt_assert(gt, !(pitch & 3));
>>>>>    	xe_gt_assert(gt, size / pitch <= S16_MAX);
>>>>>    	xe_gt_assert(gt, pitch / 4 <= S16_MAX);
>>>>>    	xe_gt_assert(gt, pitch <= U16_MAX);
>>>>> -	if (GRAPHICS_VER(xe) >= 20)
>>>>> -		mocs = FIELD_PREP(XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK, gt->mocs.uc_index);
>>>>> -
> 
> Can we keep this part in case we want to experiment with switching
> between commands on Xe2+? It isn't a huge amount of code to carry in
> emit_xy_fast_copy to support Xe2+.
> 
>>>>>    	if (GRAPHICS_VERx100(xe) >= 1250)
>>>>>    		tile_y = XY_FAST_COPY_BLT_D1_SRC_TILE4 | XY_FAST_COPY_BLT_D1_DST_TILE4;
>>>>>    	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
>>>>> -	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch | tile_y | mocs;
>>>>> +	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch | tile_y;
>>>>>    	bb->cs[bb->len++] = 0;
>>>>>    	bb->cs[bb->len++] = (size / pitch) << 16 | pitch / 4;
>>>>>    	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
>>>>>    	bb->cs[bb->len++] = upper_32_bits(dst_ofs);
>>>>>    	bb->cs[bb->len++] = 0;
>>>>> -	bb->cs[bb->len++] = pitch | mocs;
>>>>> +	bb->cs[bb->len++] = pitch;
>>>>>    	bb->cs[bb->len++] = lower_32_bits(src_ofs);
>>>>>    	bb->cs[bb->len++] = upper_32_bits(src_ofs);
>>>>>    }
>>>>> +static void emit_mem_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>>>>> +			  u64 dst_ofs, unsigned int size, unsigned int pitch)
>>>>> +{
>>>>> +	u32 mode, copy_type, width;
>>>>> +
>>>>> +	xe_gt_assert(gt, IS_ALIGNED(size, pitch));
>>>>> +	xe_gt_assert(gt, pitch <= U16_MAX);
>>>>> +	xe_gt_assert(gt, size);
>>>>> +
>>>>> +	if (IS_ALIGNED(size, 256) &&
>>>>> +	    IS_ALIGNED(lower_32_bits(src_ofs), 256) &&
>>>>> +	    IS_ALIGNED(lower_32_bits(dst_ofs), 256)) {
> 
> s/256/SZ_256 or perhaps a define for page copy mode alignment
> requirements?
> 
> Nits aside, everything LGTM.
> Matt
> 
>>>>> +		mode = MEM_COPY_PAGE_COPY_MODE;
>>>>> +		copy_type = 0; /* linear copy */
>>>>> +		width = size / 256;
>>>>> +	} else {
>>>>> +		xe_gt_assert(gt, size / pitch <= U16_MAX);
>>>>> +		mode = 0; /* BYTE_COPY */
>>>>> +		copy_type = MEM_COPY_MATRIX_COPY;
>>>>> +		width = pitch;
>>>>> +	}
>>>>> +
>>>>> +	xe_gt_assert(gt, width <= U16_MAX);
>>>>> +
>>>>> +	bb->cs[bb->len++] = MEM_COPY_CMD | mode | copy_type;
>>>>> +	bb->cs[bb->len++] = width - 1;
>>>>> +	bb->cs[bb->len++] = size / pitch - 1; /* ignored by hw for page copy above */
>>>>> +	bb->cs[bb->len++] = pitch - 1;
>>>>> +	bb->cs[bb->len++] = pitch - 1;
>>>>> +	bb->cs[bb->len++] = lower_32_bits(src_ofs);
>>>>> +	bb->cs[bb->len++] = upper_32_bits(src_ofs);
>>>>> +	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
>>>>> +	bb->cs[bb->len++] = upper_32_bits(dst_ofs);
>>>>> +	bb->cs[bb->len++] = FIELD_PREP(MEM_COPY_SRC_MOCS_INDEX_MASK, gt->mocs.uc_index) |
>>>>> +			    FIELD_PREP(MEM_COPY_DST_MOCS_INDEX_MASK, gt->mocs.uc_index);
>>>>> +}
>>>>> +
>>>>> +static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
>>>>> +		      u64 src_ofs, u64 dst_ofs, unsigned int size,
>>>>> +		      unsigned int pitch)
>>>>> +{
>>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>>> +
>>>>> +	if (GRAPHICS_VER(xe) >= 20)
> 
> Would it be better to stick this in xe_pci.c / xe_device.info rather
> than inline IP version check?
> 
> Nits aside, patch looks correct.
> 
> Matt
> 
>>>>> +		emit_mem_copy(gt, bb, src_ofs, dst_ofs, size, pitch);
>>>>> +	else
>>>>> +		emit_xy_fast_copy(gt, bb, src_ofs, dst_ofs, size, pitch);
>>>>> +}
>>>>> +
>>>>>    static u64 xe_migrate_batch_base(struct xe_migrate *m, bool usm)
>>>>>    {
>>>>>    	return usm ? m->usm_batch_base_ofs : m->batch_base_ofs;
>>>>> -- 
>>>>> 2.51.0
>>>>>
>>>

