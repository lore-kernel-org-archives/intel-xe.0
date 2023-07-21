Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069E6EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 16:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A635610E05A;
	Fri, 21 Jul 2023 16:42:04 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0AC10E05A
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 16:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689957723; x=1721493723;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lZIolF6XxCJal0UKt/4MjlznPE5sKuV9IBPPTQJ6tD8=;
 b=T7p5p7zij9N4q+R/ufXY12UG823P1kuod9OBDGNqVfOSFTGF+9FehYII
 JvPujLDtgNuxHWra7HWOkXB40aOUsloqKmzdovJEb2yLJRV35SjhenB0Q
 3pM72ZX4tjibPu55hDP+7xKIC7C3FAnEt5D6i/pqLxzAg3eGQqV6bSWk3
 WQjNK2S419STEu1usAyAgBif1MPU1KuvYs9m1k757VVEBzLU/RPIwPeol
 HF26LvWXhf2BSPKgyozUlz2+vKlXckldKSzC0PCK50sMZmnduoLVg6T7N
 FbYZ9OcVs7npe/mRi1RGNie8PtKf+PaBQyQyVk6RdzgT5BG4Hk0Zh7ZlT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="351946077"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="351946077"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 09:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="898758150"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="898758150"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.36.58])
 ([10.249.36.58])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 09:42:00 -0700
Message-ID: <6e04ba7a-1015-1f0b-4b6e-c04ed5f24a76@linux.intel.com>
Date: Fri, 21 Jul 2023 18:41:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20230721140745.16187-1-nirmoy.das@intel.com>
 <4etyiovcv7ds5k5zizgy7hlhavkmbkaw3ld4qtkzljoj3ceffe@it5n22pfuoeq>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <4etyiovcv7ds5k5zizgy7hlhavkmbkaw3ld4qtkzljoj3ceffe@it5n22pfuoeq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Set AE PTE bit if enabled on smem
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
Cc: joonas.lahtinen@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Lucas,

On 7/21/2023 6:14 PM, Lucas De Marchi wrote:
> On Fri, Jul 21, 2023 at 04:07:44PM +0200, Nirmoy Das wrote:
>> Set AE PTE bit on smem if the platform is supported and
>> enabled device scoped atomics on system memory by a
>> user with madvise ioctl.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_pt.c | 4 ++++
>> 1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 457f1363ec67..d43c91cf4776 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -774,6 +774,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct 
>> xe_vma *vma,
>>         xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
>>         xe_walk.cache = XE_CACHE_WB;
>>     } else {
>> +        if (tile_to_xe(tile)->info.platform != XE_PVC &&
>
> why the platform check?


PVC doesn't support atomics on smem. Should I move the check in the 
madvise ioctl instead ?


Regards,

Nirmoy

>
> Lucas De Marchi
>
>> +            (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT))
>> +            xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>> +
>>         if (!xe_vma_has_no_bo(vma) && bo->flags & XE_BO_SCANOUT_BIT)
>>             xe_walk.cache = XE_CACHE_WT;
>>         else
>> -- 
>> 2.39.0
>>
