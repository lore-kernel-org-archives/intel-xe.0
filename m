Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B7AC44529
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 20:27:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9646410E184;
	Mon, 20 Jul 2026 20:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="RvPLHn5o";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D46010E184;
 Mon, 20 Jul 2026 20:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784579263;
 bh=OqyjMkCoPfiGoMPZuoc6630/AjhL/6Cb8oB0p4bSTLk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RvPLHn5od88TLRkgAM+T/oEAFLQi+Y3Yj1+e2Tvo8rjf0QXMYalf6zz5u0WWgeyLm
 mWhFrpOf9ULJlSq00W/YZYLQLj34P6DCNBBe+mHSoaiyk7/vcEjo9LP5gBKMuPrrRZ
 bDpIGZtogHON3YDOChv6G82x5Zr+haBYR0/9ZfWUJoQX7BnRv87BFE/fNCMxX5qB4C
 tVBrl1FiCxaoBDDKmAH4BnXNMgnk69Af4jex/frLXaYChloG33r4+2aqHx4P4FpsVU
 qyQGbyDYI9U7UQ2EAChYRWDoTq/0xVcvDvRUXlLZqDhJdOElTtYEvpSal5tM/KJInz
 mzTCbo9jLzykw==
Message-ID: <7b74c243-2e61-430c-a2eb-81a15c47cf8d@lankhorst.se>
Date: Mon, 20 Jul 2026 22:28:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] drm/xe/migrate: Support copying between sysmem and
 stolen
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20260720161451.384968-13-dev@lankhorst.se>
 <20260720161451.384968-21-dev@lankhorst.se>
 <al5yelaY34ls2/vw@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <al5yelaY34ls2/vw@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hey,

On 7/20/26 21:09, Matthew Brost wrote:
> On Mon, Jul 20, 2026 at 06:15:00PM +0200, Maarten Lankhorst wrote:
>> In order to copy out the stolen BO, we have to add some support to
>> xe_migrate_copy, since otherwise it tries to use the VRAM identity
>> mapping on integrated, which obviously doesn't do the right thing.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/xe/xe_migrate.c | 29 +++++++++++++++++++++--------
>>  1 file changed, 21 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index c84e14e86a823..b346e743025b7 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -559,6 +559,7 @@ static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
>>  
>>  #define PTE_UPDATE_FLAG_IS_VRAM		BIT(0)
>>  #define PTE_UPDATE_FLAG_IS_COMP_PTE	BIT(1)
>> +#define PTE_UPDATE_FLAG_ALLOW_IDENTITY	BIT(2)
>>  
>>  static u32 pte_update_size(struct xe_migrate *m,
>>  			   u32 flags,
>> @@ -570,9 +571,10 @@ static u32 pte_update_size(struct xe_migrate *m,
>>  	u32 cmds = 0;
>>  	bool is_vram = PTE_UPDATE_FLAG_IS_VRAM & flags;
>>  	bool is_comp_pte = PTE_UPDATE_FLAG_IS_COMP_PTE & flags;
>> +	bool allow_identity = PTE_UPDATE_FLAG_ALLOW_IDENTITY & flags;
>>  
>>  	*L0_pt = pt_ofs;
>> -	if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
>> +	if (is_vram && allow_identity && xe_migrate_allow_identity(*L0, cur)) {
>>  		/* Offset into identity map. */
>>  		*L0_ofs = xe_migrate_vram_ofs(tile_to_xe(m->tile),
>>  					      cur->start + vram_region_gpu_offset(res),
>> @@ -858,6 +860,14 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>>  	return flush_flags;
>>  }
>>  
>> +static bool is_devmem(struct xe_bo *bo, struct ttm_resource *res)
>> +{
>> +	if (mem_type_is_vram(res->mem_type) || res->mem_type == XE_PL_STOLEN)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>>  static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>>  					   struct xe_bo *src_bo,
>>  					   struct xe_bo *dst_bo,
>> @@ -878,8 +888,8 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>>  	int err;
>>  	bool src_is_pltt = src->mem_type == XE_PL_TT;
>>  	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
>> -	bool src_is_vram = mem_type_is_vram(src->mem_type);
>> -	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
>> +	bool src_is_vram = is_devmem(src_bo, src);
>> +	bool dst_is_vram = is_devmem(dst_bo, dst);
>>  	bool type_device = src_bo->ttm.type == ttm_bo_type_device;
>>  	bool needs_ccs_emit = type_device && xe_migrate_needs_ccs_emit(xe);
>>  	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
>> @@ -939,6 +949,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>>  
>>  		pte_flags = src_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
>>  		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
>> +		pte_flags |= IS_DGFX(xe) ? PTE_UPDATE_FLAG_ALLOW_IDENTITY : 0;
> 
> Can we make allow identity a stack variable?
> 
>>  		batch_size += pte_update_size(m, pte_flags, src, &src_it, &src_L0,
>>  					      &src_L0_ofs, &src_L0_pt, 0, 0,
>>  					      avail_pts);
>> @@ -946,6 +957,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>>  			dst_L0_ofs = src_L0_ofs;
>>  		} else {
>>  			pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
>> +			pte_flags |= IS_DGFX(xe) ? PTE_UPDATE_FLAG_ALLOW_IDENTITY : 0;
>>  			batch_size += pte_update_size(m, pte_flags, dst,
>>  						      &dst_it, &src_L0,
>>  						      &dst_L0_ofs, &dst_L0_pt,
>> @@ -972,13 +984,13 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>>  			goto err_sync;
>>  		}
>>  
>> -		if (src_is_vram && xe_migrate_allow_identity(src_L0, &src_it))
>> +		if (src_is_vram && IS_DGFX(xe) && xe_migrate_allow_identity(src_L0, &src_it))
> 
> Then use it here too or maybe update xe_migrate_allow_identity to accept
> an 'xe' argument which does IS_DGFX(xe) check?
> 
> I basically don't like the duplicate IS_DGFX(xe) scattered over these
> functions.

Yeah that would probably work better. src/dst_identity checks likely work a lot better than these changes.
Come to think of it, there's no point in allowing identity for stolen, we don't allow a copy between discrete stolen and sysmem.
A check for disallowing res->mem_type == XE_PL_STOLEN there would probably be cleaner, as we only care for the integrated case.

This was actually done in an earlier locaion version of this patch, lets see how that works.

Kind regards,
~Maarten Lankhorst
