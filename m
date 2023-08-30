Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D068FC83F14
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 09:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749E610E10F;
	Wed, 30 Aug 2023 09:32:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FA610E10F
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 09:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693387956; x=1724923956;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wzREBvtj6/8h/knvF9mkpwrKPU10Yrww9vofgz2/9us=;
 b=AJOHNo5g6SIz6q5tIhkO+n5Jkd444fcdiAMCS/Qkk37L9AM4I+mVHdI/
 q2M7+Pk19fEjMZ/jyJwo3lgw52OXbJGHvAsnQkqk908PYKy09sH6EO5bm
 QwlR/OkcLxP3bEeVZTIKboSiPlu1Ac9/maQVBdVCq3DzJcRDg7WnB94R9
 UnNVF1EAIspapqOaSJf4YpMH/zraB0I/fqelquq7sLPqcy38rl0JsOm59
 MROpqYDIX76PxCAPlqLBgtrATEDGtTA+f2prCKcpJ9BoZ/4HJCej3AuLT
 zfM6gVtNzxOCcMlC0v+6qjATy1bWjlSsYSjPwGnHN5362okFGssSeaYE3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="365800449"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="365800449"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 02:32:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="768350781"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="768350781"
Received: from mhanlon1-mobl.ger.corp.intel.com (HELO [10.252.22.82])
 ([10.252.22.82])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 02:32:33 -0700
Message-ID: <fcb77cfe-bca3-799d-ba37-17e426d02da3@intel.com>
Date: Wed, 30 Aug 2023 10:32:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-GB
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <20230829162840.73444-11-matthew.auld@intel.com>
 <20230829210839.GM1529860@mdroper-desk1.amr.corp.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230829210839.GM1529860@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC 4/5] drm/xe/pat: annotate pat_index with
 coherency mode
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
Cc: Filip Hazubski <filip.hazubski@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Effie Yu <effie.yu@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 29/08/2023 22:08, Matt Roper wrote:
> On Tue, Aug 29, 2023 at 05:28:45PM +0100, Matthew Auld wrote:
>> Future uapi needs to give userspace the ability to select the pat_index
>> for a given vm_bind. However we need to be able to extract the coherency
>> mode from the provided pat_index to ensure it matches the coherency mode
>> set at object creation. There are various security reasons for why this
>> matters.  However the pat_index itself is very platform specific, so
>> seems reasonable to annotate each platform definition of the pat table.
>> On some older platforms there is no explicit coherency mode, so we just
>> pick whatever makes sense.
>>
>> Bspec: 45101, 44235 #xe
>> Bspec: 70552, 71582, 59400 #xe2
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> Cc: Filip Hazubski <filip.hazubski@intel.com>
>> Cc: Carl Zhang <carl.zhang@intel.com>
>> Cc: Effie Yu <effie.yu@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 +-
>>   drivers/gpu/drm/xe/xe_pat.c          | 67 ++++++++++++++++------------
>>   drivers/gpu/drm/xe/xe_pat.h          |  6 +++
>>   3 files changed, 46 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 06235da647bb..53520ae30b33 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -238,7 +238,7 @@ struct xe_device {
>>   		/** @enable_display: display enabled */
>>   		u8 enable_display:1;
>>   
>> -		const u32 *pat_table;
>> +		const struct xe_pat_table_entry *pat_table;
>>   		int pat_table_n_entries;
>>   
>>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index f19f5d8dcd94..9e72c1b4b41f 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -4,6 +4,8 @@
>>    */
>>   
>>   
>> +#include <drm/xe_drm.h>
>> +
>>   #include "regs/xe_reg_defs.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_mcr.h"
>> @@ -33,34 +35,34 @@
>>   #define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
>>   #define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
>>   
>> -static const u32 tgl_pat_table[] = {
>> -	[0] = TGL_PAT_WB,
>> -	[1] = TGL_PAT_WC,
>> -	[2] = TGL_PAT_WT,
>> -	[3] = TGL_PAT_UC,
>> -	[4] = TGL_PAT_WB,
>> -	[5] = TGL_PAT_WB,
>> -	[6] = TGL_PAT_WB,
>> -	[7] = TGL_PAT_WB,
>> +static const struct xe_pat_table_entry tgl_pat_table[] = {
>> +	[0] = { TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
>> +	[1] = { TGL_PAT_WC, XE_GEM_COHERENCY_NONE },
>> +	[2] = { TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
>> +	[3] = { TGL_PAT_UC, XE_GEM_COHERENCY_NONE },
>> +	[4] = { TGL_PAT_WB }, /* zero coh_mode to indicate invalid from userspace */
>> +	[5] = { TGL_PAT_WB },
>> +	[6] = { TGL_PAT_WB },
>> +	[7] = { TGL_PAT_WB },
> 
> Should we just not even include 4-7?  That's basically the approach
> we've taken with MTL (which has 32 entries in hardware, but we only
> provide a table of the first 5).
> 
>>   };
>>   
>> -static const u32 pvc_pat_table[] = {
>> -	[0] = TGL_PAT_UC,
>> -	[1] = TGL_PAT_WC,
>> -	[2] = TGL_PAT_WT,
>> -	[3] = TGL_PAT_WB,
>> -	[4] = PVC_PAT_CLOS(1) | TGL_PAT_WT,
>> -	[5] = PVC_PAT_CLOS(1) | TGL_PAT_WB,
>> -	[6] = PVC_PAT_CLOS(2) | TGL_PAT_WT,
>> -	[7] = PVC_PAT_CLOS(2) | TGL_PAT_WB,
>> +static const struct xe_pat_table_entry pvc_pat_table[] = {
>> +	[0] = { TGL_PAT_UC, XE_GEM_COHERENCY_NONE },
>> +	[1] = { TGL_PAT_WC, XE_GEM_COHERENCY_NONE },
>> +	[2] = { TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
>> +	[3] = { TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
> 
> Is 2-way correct here?  Although GPU reads snoop the CPU cache and GPU
> writes invalidate the CPU cache, I don't think the reverse is true (CPU
> operations don't automatically snoop/invalidate the GPU cache).  So
> wouldn't this be just 1-way coherent?

Yeah, I wasn't too sure about this. The Bspec says something like:

Discrete GPUs do not support caching of system memory in the device. 
Therefore, the coherency mode that is supported in discrete GPUs are the 
one-way coherency mode with no caching of system memory inside the 
discrete GPU.  Setting Coherency Mode to 10 or 11 in discrete GPUs 
results in this same behaviour.

My interpretation is that 1way and 2way do the same thing on dgpu, so I 
figured I could cheat here and claim it's 2way and then we don't need 
separate tables or special logic for dgpu vs igpu. I can change it to 
1way if you prefer though?

> 
> By the same logic, once we add in coherency the TGL table above probably
> isn't correct anymore for DG1/DG2 where we only have PCI snooping
> instead of a truly shared LLC cache.
> 
>> +	[4] = { PVC_PAT_CLOS(1) | TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
>> +	[5] = { PVC_PAT_CLOS(1) | TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
>> +	[6] = { PVC_PAT_CLOS(2) | TGL_PAT_WT, XE_GEM_COHERENCY_NONE },
>> +	[7] = { PVC_PAT_CLOS(2) | TGL_PAT_WB, XE_GEM_COHERENCY_2WAY },
>>   };
>>   
>> -static const u32 mtl_pat_table[] = {
>> -	[0] = MTL_PAT_0_WB,
>> -	[1] = MTL_PAT_1_WT,
>> -	[2] = MTL_PAT_3_UC,
>> -	[3] = MTL_PAT_0_WB | MTL_2_COH_1W,
>> -	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
>> +static const struct xe_pat_table_entry mtl_pat_table[] = {
>> +	[0] = { MTL_PAT_0_WB, XE_GEM_COHERENCY_NONE },
>> +	[1] = { MTL_PAT_1_WT, XE_GEM_COHERENCY_NONE },
>> +	[2] = { MTL_PAT_3_UC, XE_GEM_COHERENCY_NONE },
>> +	[3] = { MTL_PAT_0_WB | MTL_2_COH_1W, XE_GEM_COHERENCY_1WAY },
>> +	[4] = { MTL_PAT_0_WB | MTL_3_COH_2W, XE_GEM_COHERENCY_2WAY },
> 
> Although this is labelled "2 way" in the bspec, the reality is that it's
> a bit of a lie.  From bspec 63884:
> 
>          "2-way Coherent (GPU <-> CPU Snooping) honored only for atomics,
>          else 1-way coh"
> 
> and also:
> 
>          "Except for system atomics, setting Coherency Mode to 10 or 11
>          results in this same one-way coherenct behavior.  Full CPU-GPU
>          coherency is maintained for system atomics with Coherency Mode =
>          11, with no caching."

Ok, I didn't know that. So what should we put here for MTL_3_COH_2W? 
Just mark it as 1way? AFAICT 1way vs 2way doesn't really matter all that 
much from KMD pov, just so long as the coherency level ensures that 
swap-in and clearing can't ever be bypassed. So maybe all that matters 
here is that this matches the bspec, and exactly what 2way means for the 
platform we don't really care? Or perhaps we don't even need the 2way 
and can just mark stuff as NONE or AT_LEAST_1WAY?

> 
> 
> Matt
> 
>>   };
>>   
>>   static const u32 xelp_pte_pat_table[XE_CACHE_LAST] = {
>> @@ -82,27 +84,35 @@ static const u32 xelpg_pte_pat_table[XE_CACHE_LAST] = {
>>   	[XE_CACHE_WB_1_WAY] = XELPG_PAT_WB_CACHE_1_WAY,
>>   };
>>   
>> +u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u32 pat_index)
>> +{
>> +	WARN_ON(pat_index >= xe->info.pat_table_n_entries);
>> +	return xe->info.pat_table[pat_index].coh_mode;
>> +}
>> +
>>   unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)
>>   {
>>   	WARN_ON(cache >= XE_CACHE_LAST);
>>   	return (xe->pat_table).pte_pat_table[cache];
>>   }
>>   
>> -static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
>> +static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
>> +			int n_entries)
>>   {
>>   	for (int i = 0; i < n_entries; i++) {
>>   		struct xe_reg reg = XE_REG(_PAT_INDEX(i));
>>   
>> -		xe_mmio_write32(gt, reg, table[i]);
>> +		xe_mmio_write32(gt, reg, table[i].value);
>>   	}
>>   }
>>   
>> -static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
>> +static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry table[],
>> +			    int n_entries)
>>   {
>>   	for (int i = 0; i < n_entries; i++) {
>>   		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
>>   
>> -		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i]);
>> +		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);
>>   	}
>>   }
>>   
>> @@ -115,6 +125,7 @@ int xe_pat_fill_info(struct xe_device *xe)
>>   		xe->info.pat_table = pvc_pat_table;
>>   		xe->info.pat_table_n_entries = ARRAY_SIZE(pvc_pat_table);
>>   	} else if (GRAPHICS_VERx100(xe) <= 1210) {
>> +		WARN_ON_ONCE(!IS_DGFX(xe) && !xe->info.has_llc);
>>   		xe->info.pat_table = tgl_pat_table;
>>   		xe->info.pat_table_n_entries = ARRAY_SIZE(tgl_pat_table);
>>   	} else {
>> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>> index 9ab059758ad1..e2fabde2c730 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.h
>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>> @@ -28,9 +28,15 @@
>>   struct xe_gt;
>>   struct xe_device;
>>   
>> +struct xe_pat_table_entry {
>> +	u32 value;
>> +	u16 coh_mode;
>> +};
>> +
>>   int xe_pat_fill_info(struct xe_device *xe);
>>   void xe_pat_init(struct xe_gt *gt);
>>   void xe_pte_pat_init(struct xe_device *xe);
>>   unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
>> +u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u32 pat_index);
>>   
>>   #endif
>> -- 
>> 2.41.0
>>
> 
