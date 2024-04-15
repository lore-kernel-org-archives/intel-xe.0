Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D77EC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 09:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5AF1123B5;
	Mon, 15 Apr 2024 09:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AjF4GiFI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDF41123B5
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713171685; x=1744707685;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=YhFDnc5cn6UJAyM1ilAGa6a59at/opbnoy0Ke8beWag=;
 b=AjF4GiFIlZVfMog1qF4veDBgNpE6u7l1eZmwUllOTbZQgaRLjfkIyWzC
 zEUm8/pw/Gs7EfgOOa5xQWvt/Y6BKPe2bwkR8A97hxYB26SxqFtKlrlzj
 gIVTEQ+JPaco5eiQN6qSrtP6SXqyNQFxz/ZKmI3I46iC4yg2kZDsPOoqk
 NPRuP7YR6n45xzsjvb7pu6WCZGYYX2lvYtA9RnheUNsFMmdQVCsF1C41u
 YwRVbU8u45LDl6P0ii+LdmKqvLg4K2l3UPt4mIPcgEZRR/gLiZqYtfAoB
 0nPqbExmH1PcEIV+OzGLhTTk0u5ju7+vQsQiBa2RX3atx3EigVVcDwCFA A==;
X-CSE-ConnectionGUID: Mzffq9STR7OFi00FqdiPiA==
X-CSE-MsgGUID: bMpEV0aXTe6DkXJ85Mo1rw==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="33938768"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="33938768"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 02:01:24 -0700
X-CSE-ConnectionGUID: mRibPkjpQG+IDhEOD2PNRg==
X-CSE-MsgGUID: ZK4wEPdMTY6elBG7u6FPMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="26521919"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 15 Apr 2024 02:01:23 -0700
Received: from [10.252.44.99] (mwajdecz-MOBL.ger.corp.intel.com [10.252.44.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id DB036332DB;
 Mon, 15 Apr 2024 10:01:21 +0100 (IST)
Message-ID: <a49558af-c6d5-42c4-b942-68fda8bec3b5@intel.com>
Date: Mon, 15 Apr 2024 11:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/xe: Allow to assign GGTT region to the VF
Content-Language: en-US
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
 <20240414190137.1243-3-michal.wajdeczko@intel.com>
 <f3151915-3057-4fe8-981f-cf58ced43b04@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <f3151915-3057-4fe8-981f-cf58ced43b04@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 15.04.2024 06:49, Ghimiray, Himal Prasad wrote:
> 
> On 15-04-2024 00:31, Michal Wajdeczko wrote:
>> VF's drivers can't modify GGTT PTEs except the range explicitly
>> assigned by the PF driver. To allow hardware enforcement of this
>> requirement, each GGTT PTE has a field with the VF number that
>> identifies which VF can modify that particular GGTT PTE entry.
>>
>> Only PF driver can modify this field and PF driver shall do that
>> before VF drivers will be loaded. Add function to prepare PTEs.
>> Since it will be used only by the PF driver, make it available
>> only for CONFIG_PCI_IOV=y.
>>
>> Bspec: 45015
>> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  2 ++
>>   drivers/gpu/drm/xe/xe_ggtt.c          | 44 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ggtt.h          |  4 +++
>>   3 files changed, 50 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
>> b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
>> index 558519ce48c7..4389e5a76f89 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
>> @@ -9,6 +9,8 @@
>>   #define XELPG_GGTT_PTE_PAT0    BIT_ULL(52)
>>   #define XELPG_GGTT_PTE_PAT1    BIT_ULL(53)
>>   +#define GGTT_PTE_VFID        GENMASK_ULL(11, 2)
> 
> Patch looks good to me.
> 
> Just to confrim, based on BSPEC, this MASK applies to GRAPHICS_VER >=
> 12.50. For versions before this, the applicable mask is (4, 2). I infer
> that since SRIOV support on XE is expected beyond GRAPHICS_VER version
> 12.50, you are using mask (11, 2).

true, but even on earlier versions, which we may want to use as SDV,
where real mask is (4, 2) this extended mask (11, 2) should be still
harmless as number of VFs would be then always less than 7 so it will
fit only into (4, 2)

> 
>> +
>>   #define GUC_GGTT_TOP        0xFEE00000
>>     #define XELPG_PPGTT_PTE_PAT3        BIT_ULL(62)
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index ff2239c0eda5..f090cab065b8 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -460,6 +460,50 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt,
>> struct xe_bo *bo)
>>                   bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
>>   }
>>   +#ifdef CONFIG_PCI_IOV
>> +static u64 xe_encode_vfid_pte(u16 vfid)
>> +{
>> +    return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
>> +}
>> +
>> +static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct
>> drm_mm_node *node, u16 vfid)
>> +{
>> +    u64 start = node->start;
>> +    u64 size = node->size;
>> +    u64 end = start + size - 1;
>> +    u64 pte = xe_encode_vfid_pte(vfid);
>> +
>> +    lockdep_assert_held(&ggtt->lock);
>> +
>> +    if (!drm_mm_node_allocated(node))
>> +        return;
>> +
>> +    while (start < end) {
>> +        xe_ggtt_set_pte(ggtt, start, pte);
>> +        start += XE_PAGE_SIZE;
>> +    }
>> +
>> +    xe_ggtt_invalidate(ggtt);
>> +}
>> +
>> +/**
>> + * xe_ggtt_assign - assign a GGTT region to the VF
>> + * @ggtt: the &xe_ggtt where the node belongs
>> + * @node: the &drm_mm_node to update
>> + * @vfid: the VF identifier
>> + *
>> + * This function is used by the PF driver to assign a GGTT region to
>> the VF.
>> + * In addition to PTE's VFID bits 11:2 also PRESENT bit 0 is set as
>> on some
>> + * platforms VFs can't modify that either.
> 
> This info regarding bit 0 not being modifiable by VF's on some platforms
> is missing in Bspec.

Piotr reminded me of another page:

Bspec: 52395

> 
>> + */
>> +void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node
>> *node, u16 vfid)
>> +{
>> +    mutex_lock(&ggtt->lock);
>> +    xe_ggtt_assign_locked(ggtt, node, vfid);
>> +    mutex_unlock(&ggtt->lock);
>> +}
>> +#endif
>> +
>>   int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
>>   {
>>       int err;
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>> index 8306ef74abc6..4a41a1762358 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>> @@ -33,4 +33,8 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct
>> xe_bo *bo);
>>     int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
>>   +#ifdef CONFIG_PCI_IOV
>> +void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node
>> *node, u16 vfid);
>> +#endif
>> +
>>   #endif
