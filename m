Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FD21075290
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 10:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F79010E13A;
	Thu, 19 Mar 2026 10:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="W114R5NL";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9919710E13A
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 10:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GewFhWL2I8Bta5U/T0iN+Kkom6gqImkL8WnBMSR+ex0=; b=W114R5NLi6HDRSEBzdDkNw8qMJ
 x08MQxXGm3NFD6M+Mu8Tsv7emHxqIc9qXtuwDhRPGpEeAk/nNjYIXniOxDXD9M3wzremyjY1g8OL4
 38Oux0vtJdqv+G9M1pZX7tQfFbk8xJWNOypj4ICTgsBGyblZjQGBQPOz4ArlzBrzFW/dejLLPwLyF
 zsTM9r2qpGtv5L9dhs6VJ8R1J/MJ1J9bsW81RH4NBflgcwGFjRdvzxnfoqfamZ3u7eONRESi5vsSK
 aYd7GacRngKhEa5ptNQEmGX6MC1HETubf5wx0gtZaQ5yJCucx1C+6u9fARTETWXzzHq96VLC6Acq7
 PKmu4CBw==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1w3ADE-003HUw-GC; Thu, 19 Mar 2026 11:02:44 +0100
Message-ID: <7279b47c-cb24-4776-823d-4d9c36140cf8@igalia.com>
Date: Thu, 19 Mar 2026 10:02:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 09/12] drm/xe/display: Change write_dpt_remapped_tiled
 function signature
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20260316152929.1247-1-tvrtko.ursulin@igalia.com>
 <20260316152929.1247-10-tvrtko.ursulin@igalia.com>
 <DM4PR11MB636004852F380D5701FD587FF44EA@DM4PR11MB6360.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <DM4PR11MB636004852F380D5701FD587FF44EA@DM4PR11MB6360.namprd11.prod.outlook.com>
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


On 18/03/2026 19:09, Shankar, Uma wrote:
>> -----Original Message-----
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Sent: Monday, March 16, 2026 8:59 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: kernel-dev@igalia.com; Shankar, Uma <uma.shankar@intel.com>; Tvrtko
>> Ursulin <tvrtko.ursulin@igalia.com>; Juha-Pekka Heikkila
>> <juhapekka.heikkila@gmail.com>; Ruhl, Michael J <michael.j.ruhl@intel.com>;
>> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Thomas Hellström
>> <thomas.hellstrom@linux.intel.com>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>
>> Subject: [PATCH v22 09/12] drm/xe/display: Change write_dpt_remapped_tiled
>> function signature
>>
>> In preparation for adding support for the auxccs plane lets change the function
>> signature of write_dpt_remapped_tiled(). This will enable a tidier way of extending
>> it subsequent patches.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 58 +++++++++++++++-----------
>>   1 file changed, 34 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index 331f3c1da444..fd3715708c8b 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -49,33 +49,44 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map
>> *map, u32 *dpt_ofs, u32 bo_
>>   	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>>   }
>>
>> -static void
>> -write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map, u32
>> *dpt_ofs,
>> -			 u32 bo_ofs, u32 width, u32 height, u32 src_stride,
>> -			 u32 dst_stride)
>> +static unsigned int
>> +write_dpt_padding(struct iosys_map *map, unsigned int dest, unsigned
>> +int pad) {
>> +	/* The DE ignores the PTEs for the padding tiles */
>> +	return dest + pad * sizeof(u64);
>> +}
>> +
>> +static unsigned int
>> +write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map,
>> +			 unsigned int dest,
>> +			 const struct intel_remapped_plane_info *plane)
>>   {
>>   	struct xe_device *xe = xe_bo_device(bo);
>>   	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>> -	u32 column, row;
>> -	u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe-
>>> pat.idx[XE_CACHE_NONE]);
>> +	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
>> +						 xe->pat.idx[XE_CACHE_NONE]);
>> +	unsigned int offset, column, row;
>>
>> -	for (row = 0; row < height; row++) {
>> -		u32 src_idx = src_stride * row + bo_ofs;
>> +	for (row = 0; row < plane->height; row++) {
>> +		offset = (plane->offset + plane->src_stride * row) *
>> +			 XE_PAGE_SIZE;
>>
>> -		for (column = 0; column < width; column++) {
>> -			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE,
>> XE_PAGE_SIZE);
>> -			iosys_map_wr(map, *dpt_ofs, u64, pte | addr);
>> +		for (column = 0; column < plane->width; column++) {
>> +			u64 addr = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
>>
>> -			*dpt_ofs += 8;
>> -			src_idx++;
>> +			iosys_map_wr(map, dest, u64, addr | pte);
>> +			dest += sizeof(u64);
>> +			offset += XE_PAGE_SIZE;
>>   		}
>>
>> -		/* The DE ignores the PTEs for the padding tiles */
>> -		*dpt_ofs += (dst_stride - width) * 8;
>> +		dest = write_dpt_padding(map, dest,
>> +					 plane->dst_stride - plane->width);
>>   	}
>>
>>   	/* Align to next page */
>> -	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>> +	dest = ALIGN(dest, XE_PAGE_SIZE);
>> +
>> +	return dest;
>>   }
>>
>>   static void
>> @@ -83,15 +94,14 @@ write_dpt_remapped(struct xe_bo *bo,
>>   		   const struct intel_remapped_info *remap_info,
>>   		   struct iosys_map *map)
>>   {
>> -	u32 i, dpt_ofs = 0;
>> +	unsigned int i, dest = 0;
>>
>> -	for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
>> -		write_dpt_remapped_tiled(bo, map, &dpt_ofs,
>> -				   remap_info->plane[i].offset,
>> -				   remap_info->plane[i].width,
>> -				   remap_info->plane[i].height,
>> -				   remap_info->plane[i].src_stride,
>> -				   remap_info->plane[i].dst_stride);
>> +	for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++) {
>> +		const struct intel_remapped_plane_info *plane =
>> +				&remap_info->plane[i];
>> +
>> +		write_dpt_remapped_tiled(bo, map, dest, plane);
> 
> We seem to ignore the return value here. dest will remain 0.
> Please check.

Rebase error while splitting up into multiple patches, well spotted, 
thank you!

Will send the updated series shortly.

Regards,

Tvrtko

>> +	}
>>   }
>>
>>   static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>> --
>> 2.52.0
> 

