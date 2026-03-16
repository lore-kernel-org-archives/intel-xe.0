Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7288F506C3
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 12:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8691310E50E;
	Mon, 16 Mar 2026 12:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VOw41BB2";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3569010E50D
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 12:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v3Lgh7V9tBI8qUpoyyGAGRD0zM8fEHsX055dAJWYMxM=; b=VOw41BB2gI5glbchRQOuASlj73
 1IoKVFVsoovvMjQ8etKuFpNLYYuD+/4LpIdQuJALaVcf5YGTrQ/2GqS4aBxMXigNrKBUlJTT4u+iC
 R9j9QSctuy+VNIbWOBbN7Nz2kuiTTkLrsFzJQ9PiEFm69ztGcoexizu4QkuGC2bGqJCAkBrAGzYfF
 Nhv2cXHplK/vUDI2tyr+oFILtLny+Z/ast6N96+AUdlq26Lfxb3Ptu2EtfkJvWqofHUJQ6nKnMwzo
 JXsI0TIsV1wI0JoPPHI4UC9RuxUEKP/ZNZ2VgotgGHmEmRrkAR0Hiyy4RjKF6yOrXuTH8limvKaVY
 XfLGvb+Q==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1w27Hm-00GSMX-AO; Mon, 16 Mar 2026 13:43:06 +0100
Message-ID: <a068ab5e-ddbb-4b2e-9a77-1a4eddd17daf@igalia.com>
Date: Mon, 16 Mar 2026 12:43:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 8/9] drm/xe/display: Add support for AuxCCS
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>
References: <20260310123453.54346-1-tvrtko.ursulin@igalia.com>
 <20260310123453.54346-9-tvrtko.ursulin@igalia.com>
 <abHrndHyYUgm7KoP@intel.com>
 <18cbe11f-b13c-4ff5-85b3-95416e21aa23@igalia.com>
 <IA1PR11MB6347F0C1E667821533FF915EF440A@IA1PR11MB6347.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <IA1PR11MB6347F0C1E667821533FF915EF440A@IA1PR11MB6347.namprd11.prod.outlook.com>
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


Hi Uma,

On 16/03/2026 12:04, Shankar, Uma wrote:
> 
> 
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Tvrtko
>> Ursulin
>> Sent: Thursday, March 12, 2026 5:29 PM
>> To: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>; Thomas Hellström
>> <thomas.hellstrom@linux.intel.com>
>> Cc: intel-xe@lists.freedesktop.org; kernel-dev@igalia.com; Juha-Pekka Heikkila
>> <juhapekka.heikkila@gmail.com>; Ruhl, Michael J <michael.j.ruhl@intel.com>
>> Subject: Re: [PATCH v21 8/9] drm/xe/display: Add support for AuxCCS
>>
>>
>> On 11/03/2026 22:24, Rodrigo Vivi wrote:
>>> On Tue, Mar 10, 2026 at 12:34:52PM +0000, Tvrtko Ursulin wrote:
>>>> Add support for mapping the auxiliary CCS buffer into the DPT page tables.
>>>>
>>>> This will allow for better power efficiency by enabling the render
>>>> compression frame buffer modifiers such as
>>>> I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS in a following patch.
>>>>
>>>> We do this by refactoring the code a bit so handling for the linear
>>>> auxiliary frame buffer can be added in a tidy way. Also replace some
>>>> hardcoded constants.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>
>>> I hope one of them can review this patch.
>>>
>>> To me, it would be easier if we could split this patch into smaller
>>> easier to follow patches.
>>
>> I didn't have any immediate nice ideas on how. Maybe it helps if I paste how the
>> code looks after the patch?
> 
> Hi Tvrtko,
> Change looks good in general, some minor comments:
> 
>> It is like this:
>>
>> static unsigned int
>> write_dpt_padding(struct iosys_map *map, unsigned int dest, unsigned int
>> pad)
>> {
>> 	/* The DE ignores the PTEs for the padding tiles */
>> 	return dest + pad * sizeof(u64);
>> }
>>
>> static unsigned int
>> write_dpt_remapped_linear(struct xe_bo *bo, struct iosys_map *map,
>> 			  unsigned int dest,
>> 			  const struct intel_remapped_plane_info *plane) {
>> 	struct xe_device *xe = xe_bo_device(bo);
>> 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>> 	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
>> 						 xe->pat.idx[XE_CACHE_NONE]);
>> 	unsigned int offset = plane->offset * XE_PAGE_SIZE;
> 
> I think we should consider for greater than 4GB here where potential of overflow is there.

That would be one huge aux plane, no? :) I can do it, no problem, just 
keeping in mind even the current normal view does not handle >4GB 
primary planes:

		u32 x;

		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
			u64 addr = xe_bo_addr(bo, x * XE_PAGE_SIZE, XE_PAGE_SIZE);

> 
>> 	unsigned int size = plane->size;
>>
>> 	while (size--) {
>> 		u64 addr = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
>>
>> 		iosys_map_wr(map, dest, u64, addr | pte);
>> 		dest += sizeof(u64);
>> 		offset += XE_PAGE_SIZE;
>> 	}
>>
>> 	return dest;
>> }
>>
>> static unsigned int
>> write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map,
>> 			 unsigned int dest,
>> 			 const struct intel_remapped_plane_info *plane) {
>> 	struct xe_device *xe = xe_bo_device(bo);
>> 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>> 	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
>> 						 xe->pat.idx[XE_CACHE_NONE]);
>> 	unsigned int offset, column, row;
>>
>> 	for (row = 0; row < plane->height; row++) {
>> 		offset = (plane->offset + plane->src_stride * row) *
>> 			 XE_PAGE_SIZE;
> 
> Here as well.

Same thing, the current code does not handle it. I can change it, as 
long as someone does not object to it.

> 
>>
>> 		for (column = 0; column < plane->width; column++) {
>> 			u64 addr = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
>>
>> 			iosys_map_wr(map, dest, u64, addr | pte);
>> 			dest += sizeof(u64);
>> 			offset += XE_PAGE_SIZE;
>> 		}
>>
>> 		dest = write_dpt_padding(map, dest,
>> 					 plane->dst_stride - plane->width);
>> 	}
>>
>> 	return dest;
>> }
>>
>> static void
>> write_dpt_remapped(struct xe_bo *bo,
>> 		   const struct intel_remapped_info *remap_info,
>> 		   struct iosys_map *map)
>> {
>> 	unsigned int i, dest = 0;
>>
>> 	for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++) {
>> 		const struct intel_remapped_plane_info *plane =
>> 						&remap_info->plane[i];
>>
>> 		if (!plane->width && !plane->height && !plane->linear)
>> 			continue;
>>
>> 		if (remap_info->plane_alignment) {
>> 			const unsigned int index = dest / sizeof(u64);
>> 			const unsigned int pad =
>> 				ALIGN(index, remap_info->plane_alignment) -
>> 				index;
>>
>> 			dest = write_dpt_padding(map, dest, pad);
>> 		}
>>
>> 		if (plane->linear)
>> 			dest = write_dpt_remapped_linear(bo, map, dest, plane);
>> 		else
>> 			dest = write_dpt_remapped_tiled(bo, map, dest, plane);
>> 	}
>> }
>>
>> Essentially moving the plane loop to a helper and adding support for aux/linear
>> plane, while attempting to have the lower level helpers with consistent function
>> signatures.
>>
>> If the paste does not help I can revisit and try to somehow split it. It has been
>> more than a year that I originally wrote this so some details have evaporated from
>> my head by now.
>>
>> Regards,
>>
>> Tvrtko
>>
>>>> ---
>>>>    drivers/gpu/drm/xe/display/xe_fb_pin.c | 111 ++++++++++++++++++-------
>>>>    1 file changed, 81 insertions(+), 30 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> index df7d305c6fcd..fe4b66e5c3ad 100644
>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> @@ -49,33 +49,94 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map
>> *map, u32 *dpt_ofs, u32 bo_
>>>>    	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>>>>    }
>>>>
>>>> +static unsigned int
>>>> +write_dpt_padding(struct iosys_map *map, unsigned int dest, unsigned
>>>> +int pad) {
>>>> +	/* The DE ignores the PTEs for the padding tiles */
>>>> +	return dest + pad * sizeof(u64);
>>>> +}
>>>> +
>>>> +static unsigned int
>>>> +write_dpt_remapped_linear(struct xe_bo *bo, struct iosys_map *map,
>>>> +			  unsigned int dest,
>>>> +			  const struct intel_remapped_plane_info *plane) {
>>>> +	struct xe_device *xe = xe_bo_device(bo);
>>>> +	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>>>> +	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
>>>> +						 xe->pat.idx[XE_CACHE_NONE]);
>>>> +	unsigned int offset = plane->offset * XE_PAGE_SIZE;
>>>> +	unsigned int size = plane->size;
>>>> +
>>>> +	while (size--) {
>>>> +		u64 addr = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
>>>> +
>>>> +		iosys_map_wr(map, dest, u64, addr | pte);
>>>> +		dest += sizeof(u64);
>>>> +		offset += XE_PAGE_SIZE;
>>>> +	}
>>>> +
>>>> +	return dest;
>>>> +}
>>>> +
>>>> +static unsigned int
>>>> +write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map,
>>>> +			 unsigned int dest,
>>>> +			 const struct intel_remapped_plane_info *plane) {
>>>> +	struct xe_device *xe = xe_bo_device(bo);
>>>> +	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>>>> +	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
>>>> +						 xe->pat.idx[XE_CACHE_NONE]);
>>>> +	unsigned int offset, column, row;
>>>> +
>>>> +	for (row = 0; row < plane->height; row++) {
>>>> +		offset = (plane->offset + plane->src_stride * row) *
>>>> +			 XE_PAGE_SIZE;
>>>> +
>>>> +		for (column = 0; column < plane->width; column++) {
>>>> +			u64 addr = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
>>>> +
>>>> +			iosys_map_wr(map, dest, u64, addr | pte);
>>>> +			dest += sizeof(u64);
>>>> +			offset += XE_PAGE_SIZE;
>>>> +		}
>>>> +
>>>> +		dest = write_dpt_padding(map, dest,
>>>> +					 plane->dst_stride - plane->width);
>>>> +	}
>>>> +
>>>> +	return dest;
>>>> +}
>>>> +
>>>>    static void
>>>> -write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
>>>> -		   u32 bo_ofs, u32 width, u32 height, u32 src_stride,
>>>> -		   u32 dst_stride)
>>>> +write_dpt_remapped(struct xe_bo *bo,
>>>> +		   const struct intel_remapped_info *remap_info,
>>>> +		   struct iosys_map *map)
>>>>    {
>>>> -	struct xe_device *xe = xe_bo_device(bo);
>>>> -	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>>>> -	u32 column, row;
>>>> -	u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe-
>>> pat.idx[XE_CACHE_NONE]);
>>>> +	unsigned int i, dest = 0;
>>>>
>>>> -	for (row = 0; row < height; row++) {
>>>> -		u32 src_idx = src_stride * row + bo_ofs;
>>>> +	for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++) {
>>>> +		const struct intel_remapped_plane_info *plane =
>>>> +						&remap_info->plane[i];
>>>>
>>>> -		for (column = 0; column < width; column++) {
>>>> -			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE,
>> XE_PAGE_SIZE);
>>>> -			iosys_map_wr(map, *dpt_ofs, u64, pte | addr);
>>>> +		if (!plane->width && !plane->height && !plane->linear)
> 
> Since linear doesn't have width and height explicitly but we go with size, I think it would be
> good to flip the checks a bit
> 
> if (!plane->linear && !plane->width && !plane->height)

Done locally.

Btw between last Thursday and now I went and started splitting this 
patch up between. Locally this patch is now four patches:

drm/xe/display: Move remapped plane loop out of __xe_pin_fb_vma_dpt
drm/xe/display: Change write_dpt_remapped_tiled function signature
drm/xe/display: Respect remapped plane alignment
drm/xe/display: Add support for AuxCCS

I can send this out now or wait for the verdict on the >4GB planes handling.

Regards,

Tvrtko

> 
> Other than above, changes look good to me.
> @juhapekka.heikkila@gmail.com Can you also check and ack once.
> 
> Regards,
> Uma Shankar
> 
>>>> +			continue;
>>>>
>>>> -			*dpt_ofs += 8;
>>>> -			src_idx++;
>>>> +		if (remap_info->plane_alignment) {
>>>> +			const unsigned int index = dest / sizeof(u64);
>>>> +			const unsigned int pad =
>>>> +				ALIGN(index, remap_info->plane_alignment) -
>>>> +				index;
>>>> +
>>>> +			dest = write_dpt_padding(map, dest, pad);
>>>>    		}
>>>>
>>>> -		/* The DE ignores the PTEs for the padding tiles */
>>>> -		*dpt_ofs += (dst_stride - width) * 8;
>>>> +		if (plane->linear)
>>>> +			dest = write_dpt_remapped_linear(bo, map, dest, plane);
>>>> +		else
>>>> +			dest = write_dpt_remapped_tiled(bo, map, dest, plane);
>>>>    	}
>>>> -
>>>> -	/* Align to next page */
>>>> -	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>>>>    }
>>>>
>>>>    static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>>>> @@ -138,17 +199,7 @@ static int __xe_pin_fb_vma_dpt(const struct
>> intel_framebuffer *fb,
>>>>    			iosys_map_wr(&dpt->vmap, x * 8, u64, pte | addr);
>>>>    		}
>>>>    	} else if (view->type == I915_GTT_VIEW_REMAPPED) {
>>>> -		const struct intel_remapped_info *remap_info = &view-
>>> remapped;
>>>> -		u32 i, dpt_ofs = 0;
>>>> -
>>>> -		for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
>>>> -			write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
>>>> -					   remap_info->plane[i].offset,
>>>> -					   remap_info->plane[i].width,
>>>> -					   remap_info->plane[i].height,
>>>> -					   remap_info->plane[i].src_stride,
>>>> -					   remap_info->plane[i].dst_stride);
>>>> -
>>>> +		write_dpt_remapped(bo, &view->remapped, &dpt->vmap);
>>>>    	} else {
>>>>    		const struct intel_rotation_info *rot_info = &view->rotated;
>>>>    		u32 i, dpt_ofs = 0;
>>>> --
>>>> 2.52.0
>>>>
> 

