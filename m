Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71208606A327
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=fotBV2h3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2D310E2FC;
	Fri, 23 Oct 2026 12:30:51 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A82C10E2FC
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 12:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1792758642;
 bh=rslR3JPdPqtXqMF/hlQKKg0WrLsAgqePSNtDkHFvyqU=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=fotBV2h3tSFZVE3xxOsFWCwRTendVtNyMg6y3SGBeuRxZQs+0rSyklepk0KN0JV27
 9yoLQ2E0gd+I4z6ZW7NoE6rHu07cnbb2i5Spesuq83dQv5Oxr9JWI/BHRtxXP0zNUj
 7g5yNOVh8q6oKPTK9ULzCivHpWtZjd9/cFeh447nniKLq0z0PPvYmnZvzbtbDjDQnA
 fNhjFRr10tEipwvKd6lyqSsDzViwYguDpAuh2R4vG8ka66nSFU1TK/9OX592pPLhf1
 +tk7S7qKnKIRaOJFaspfnbj3RBEuyK/O8dHSsoMMtMja+yttRBTA0d03gZBeP2XV33
 n3IFuyQs+p7Rw==
Message-ID: <03772e8b-8a33-424a-bb8d-effbfc6b1e71@lankhorst.se>
Date: Fri, 23 Oct 2026 14:30:41 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/display: Use xe_bo_addr_iter in remapped
 DPT pinning
To: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
References: <20261023114616.735366-1-dev@lankhorst.se>
 <20261023114616.735366-2-dev@lankhorst.se> <sashiko-outbox-182746@kernel.org>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <sashiko-outbox-182746@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/23/26 13:59, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] drm/xe/display: 32-bit overflow in write_dpt_remapped_tiled() size calculation
> --
>
> commit 061485566c342a900f9594f9a2b0fa400ea6f8c5
> Author: Maarten Lankhorst <dev@lankhorst.se>
>
> drm/xe/display: Use xe_bo_addr_iter in remapped DPT pinning
>
> This patch replaces per-page xe_bo_addr() lookups in
> write_dpt_remapped_linear() and write_dpt_remapped_tiled() with
> xe_bo_addr_iter_first() and xe_bo_addr_iter_addr() cursor iteration to
> reduce pinning complexity from O(N^2) to O(N).
>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index 15fbd3fe6cbb7..7d53f77308a46 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -17,6 +17,7 @@
>>  #include "xe_ggtt.h"
>>  #include "xe_pat.h"
>>  #include "xe_pm.h"
>> +#include "xe_res_cursor.h"
>>  #include "xe_vram_types.h"
>>  
>>  static void
>> @@ -68,14 +69,14 @@ write_dpt_remapped_linear(struct xe_bo *bo, struct iosys_map *map,
>>  	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
>>  						 xe_cache_pat_idx(xe, XE_CACHE_NONE));
>>  	unsigned int offset = plane->offset * XE_PAGE_SIZE;
>> -	unsigned int size = plane->size;
>> +	unsigned int size = plane->size * XE_PAGE_SIZE;
>> +	struct xe_res_cursor cur;
>>  
>> -	while (size--) {
>> -		u64 addr = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
>> +	for (xe_bo_addr_iter_first(bo, &cur, offset, size); cur.remaining; xe_res_next(&cur, XE_PAGE_SIZE)) {
>> +		u64 addr = xe_bo_addr_iter_addr(&cur);
>>  
>>  		iosys_map_wr(map, dest, u64, addr | pte);
>>  		dest += sizeof(u64);
>> -		offset += XE_PAGE_SIZE;
>>  	}
>>  
>>  	return dest;
>> @@ -90,20 +91,22 @@ write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map,
>>  	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>>  	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
>>  						 xe_cache_pat_idx(xe, XE_CACHE_NONE));
>> -	unsigned int offset, column, row;
>> +	u32 offset = plane->offset * XE_PAGE_SIZE;
>> +	struct xe_res_cursor cur;
>>  
>> -	for (row = 0; row < plane->height; row++) {
>> -		offset = (plane->offset + plane->src_stride * row) *
>> -			 XE_PAGE_SIZE;
>> -
>> -		for (column = 0; column < plane->width; column++) {
>> -			u64 addr = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
>> +	xe_bo_addr_iter_first(bo, &cur, offset, plane->height * plane->src_stride * XE_PAGE_SIZE);
>> +	while (cur.remaining) {
> [Severity: Critical]
> Can the size calculation in write_dpt_remapped_tiled() overflow a 32-bit
> signed int and cause an out-of-bounds write past the end of map?
No, framebuffers are 32-bits.
>
> In include/drm/intel/gtt_view_types.h, struct intel_remapped_plane_info
> defines height and src_stride as u16:
>
> include/drm/intel/gtt_view_types.h:
> 	struct intel_remapped_plane_info {
> 		/* in gtt pages */
> 		u32 offset:31;
> 		u32 linear:1;
> 		union {
> 			/* in gtt pages for !linear */
> 			struct {
> 				u16 width;
> 				u16 height;
> 				u16 src_stride;
> 				u16 dst_stride;
> 			};
>
> 			/* in gtt pages for linear */
> 			u32 size;
> 		};
> 	} __packed;
>
> And in drivers/gpu/drm/xe/xe_bo.h, XE_PAGE_SIZE is a signed int expression:
>
> 	#define XE_PTE_SHIFT			12
> 	#define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
>
> In write_dpt_remapped_tiled(), plane->height and plane->src_stride undergo
> standard C integer promotion from u16 to 32-bit signed int, so the product
> plane->height * plane->src_stride * XE_PAGE_SIZE is evaluated in 32-bit
> signed arithmetic before being converted to u64 for xe_bo_addr_iter_first().
>
> When userspace pins a maximum-dimension tiled framebuffer via
> drm_mode_addfb2 -> intel_framebuffer_init() -> intel_fill_fb_info() and
> xe_fb_pin_to_ggtt() -> xe_pin_fb_vma_dpt() -> write_dpt_remapped_tiled()
> (for example, a 16384x16384 4-tiled or Y-tiled plane with a 128 KiB pitch
> where plane->height is 512 and plane->src_stride is 1024, totaling 524,288
> pages or 2 GiB), the multiplication 512 * 1024 * 4096 overflows INT_MAX to
> -0x80000000 and sign-extends to u64 as 0xffffffff80000000ULL.
>
> Because the outer loop condition was changed from row < plane->height to
> while (cur.remaining), cur.remaining starts at 0xffffffff80000000ULL and does
> not reach zero after all plane->height rows are written. This causes the loop
> to overrun the BO resource cursor in xe_res_next() and write PTEs past the
> end of the DPT iosys_map via iosys_map_wr().
>
> Similarly, in both write_dpt_remapped_linear() and
> write_dpt_remapped_tiled(), multiplying plane->offset and plane->size by
> XE_PAGE_SIZE in 32-bit unsigned int / u32 variables truncates byte offsets
> and sizes at or above 4 GiB. Should these byte offset and size calculations
> use u64 arithmetic (or mul_u32_u32() / a 64-bit page size constant)?
>
