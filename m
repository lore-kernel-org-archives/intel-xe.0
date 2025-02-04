Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F762C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 12:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC9110E320;
	Tue,  4 Feb 2025 12:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="oE6VQ9KK";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3E110E320
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 12:31:43 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43618283d48so40892845e9.1
 for <intel-xe@lists.freedesktop.org>; Tue, 04 Feb 2025 04:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1738672302; x=1739277102;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tuW9eKdKEwPRNGfVkrfgRbOQdlbg6qSpdDYS3VJ2iuI=;
 b=oE6VQ9KKvHgtoNfHZIzBJrObAZdY32+Yv77d3zxDBLZl3MaF0XTvBJM6IviAdBVhrx
 VvGMB0SUyB+f6Q0Y1yxw5iQG8ewSBI4aWYxVWcSSPRBUgruFXFWMVK+cofLpUB1NBFuP
 nmCacLZGa1Q935p0hR+lhnmopcBjVwCSckftuF4W2BS9bARn1MrmIIhiym849YXa+/ca
 ZSmkR1l5Qz5zFxKarkc4wHuaCDpJESuF7dmbqMVGiFpRFPha1PWWQwx0FzpQ5ieeUHmN
 dGb//3RdpMOPGizAtwlWllRNPhu3aPJuY8zb+vq5ctoK9jQrs6Hjz9Pp8YrvQ1Aawn4M
 OrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738672302; x=1739277102;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tuW9eKdKEwPRNGfVkrfgRbOQdlbg6qSpdDYS3VJ2iuI=;
 b=ub3djpE3Bt9CHHwgeHMSd+YiRVN3aZlZRy+6aNeQLuzzrFuGNo6e7gRUM+LgnHFuHp
 YZA6g+J+Mta/MyWe3PzLczSfC0Roogk0nUNdeTIWS/MuQ1Te/OovRcdsvQEJLJe6SOQy
 9c3qC+EmnZsme7O05WODi2NukwPPwmdEFVJhLJoV9Vf05gfqL7I5xY09qWFSpdD27sIZ
 3t6HEIjFxDHgkQ/O6q2MHjj3Da//kKzE7Av9ZuUEq+L6onzo2seZ8OVPofaA5YCBjCfi
 YpwD1E9gW17XDr0aLFkHFw9vHY5aB1Nq7CLWQAgQBbInhVdFS8Zz/aC9zm721rhiMqhZ
 6gxw==
X-Gm-Message-State: AOJu0Yy7DQ1FqRgf4iwSiCZQiHu6R440F3Qj4bPXFr/8bEcEBwgh30pp
 ZlRavLUrokbzv6AClSkgrqVVbqILj7w2OOTRhr7YZhTvCzw9EH7zWEXqIFwLrQ8=
X-Gm-Gg: ASbGnct9pgUN4Py/0lRfUNfIQ9kdv9V7cxsWnjxthkse4pFT5FDeztce1HKtc77M5aS
 UfCLETbUPyn787tw0FJNAJjm5QNaWEUZorOGoCooZ/iX77r1waow9CfZ+6XRF97LnnEdC8/To50
 zZuVLLVbnc1/YjJviHDhOT42H2lK+P2Azst0LHwmCeM6mMjBO/8WjdUInFqynicEU7ROcL2AGdN
 +3PtfDZ9ZIhZbrYbMlF5ASN1j8kD1TAcRiK9J8f2HVEW7eclCX1GD3mGIWvoL2pCQcwGnzzh1wM
 M3LrmTCwIUmXA8juy3gvVtbDGA//qvQ=
X-Google-Smtp-Source: AGHT+IELBXEu0Ot7akBmonFfTOQkC5wk+82DJ9pKsgBMtfZMmSvxp2LtDoPfiTWkv3af4P0Bo3DkWg==
X-Received: by 2002:a05:600c:4e01:b0:435:136:75f6 with SMTP id
 5b1f17b1804b1-438dc34b179mr252227935e9.0.1738672301864; 
 Tue, 04 Feb 2025 04:31:41 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc265c0sm223405665e9.10.2025.02.04.04.31.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 04:31:40 -0800 (PST)
Message-ID: <ca83eabe-d2cf-4ee9-a51d-82809d07a447@ursulin.net>
Date: Tue, 4 Feb 2025 12:31:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/display: Unify display page table mapping
To: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
 <20250114180403.896587-2-juhapekka.heikkila@gmail.com>
 <64decd28-e020-4a53-9766-7d57a5137c86@ursulin.net>
 <221a2230-1fff-4f9c-9be4-7a2ef4db2776@ursulin.net>
 <CAJ=qYWTotU_P6X-HOtkBCNzG4hEcw-=Ch5ymHYyBh0POa8HUQw@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <CAJ=qYWTotU_P6X-HOtkBCNzG4hEcw-=Ch5ymHYyBh0POa8HUQw@mail.gmail.com>
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


On 04/02/2025 12:10, Juha-Pekka Heikkilä wrote:
> On Tue, Feb 4, 2025 at 1:38 PM Tvrtko Ursulin <tursulin@ursulin.net> wrote:
>>
>>
>> On 04/02/2025 11:25, Tvrtko Ursulin wrote:
>>>
>>> On 14/01/2025 18:04, Juha-Pekka Heikkila wrote:
>>>> Unify writing of remapped and straight DPTs. Take out writing of
>>>> rotated DPT since Xe doesn't support any platform that does
>>>> 90 degree rotated framebuffers.
>>>
>>> Consider giving my series which fixes AuxCSS a look instead? Given there
>>> is external interest to have all that work on ADL-P. I could respin with
>>> rotated cleaned up in a similar fashion I did for remapped. Maintenance
>>> cost is minimal since it is all very contained.
>>
>> Oh ADL-P does not support hardware rotation. I missed the fact it is
>> display version 13..
>>
>> But the point regarding changes to remapping code are still valid I
>> think, since to suport aux plane the refactoring from this patch looks
>> in the wrong direction.
>>
> 
> Yea, I kinda agree here with Tvrtko. I did earlier mention this to
> JSaa. That aux thing will need to be checked.

Ah cool, fingers crossed.

> Though, how far are we with your set Tvrtko? It did seem lot kms_ccs
> tests failed.
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v1/shards-all.html?testfilter=kms_ccs.*crc.*gen12&hosts=adlp
> 
> Did you check you had compression when you had clean image on your
> machine? (aux surface was not zeroes) Those failures on my link ci are
> with failing crc which mean the picture on screen was not correct.

I was looking into this just this morning and posted some 
half-conclusions here:

https://lore.kernel.org/intel-xe/eb3a3729-e8ef-4868-b8ff-b6efd66ef4fa@igalia.com/T/#u

When you say test with a clear image that I did not. I smoke tested it 
in desktop usage and looked at kms_flip_tiling which visually looks 
correct but as the above msg-id talks about, something is potentially 
fishy with crc collections and/or vblank handling. Since display isn't 
my area of expertise that is as far as I could get.

Regards,

Tvrtko

>>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/display/xe_fb_pin.c | 141 +++++++++----------------
>>>>    1 file changed, 48 insertions(+), 93 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> index c28885316986..70322f28eee5 100644
>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> @@ -14,66 +14,44 @@
>>>>    #include "xe_ggtt.h"
>>>>    #include "xe_pm.h"
>>>> -static void
>>>> -write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32
>>>> *dpt_ofs, u32 bo_ofs,
>>>> -          u32 width, u32 height, u32 src_stride, u32 dst_stride)
>>>> +static void encode_and_write_pte(struct xe_bo *bo, struct iosys_map
>>>> *map,
>>>> +                 u32 *ofs, u32 src_idx, struct xe_device *xe)
>>>>    {
>>>> -    struct xe_device *xe = xe_bo_device(bo);
>>>>        struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>>>> -    u32 column, row;
>>>> -
>>>> -    /* TODO: Maybe rewrite so we can traverse the bo addresses
>>>> sequentially,
>>>> -     * by writing dpt/ggtt in a different order?
>>>> -     */
>>>> -
>>>> -    for (column = 0; column < width; column++) {
>>>> -        u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
>>>> -
>>>> -        for (row = 0; row < height; row++) {
>>>> -            u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx *
>>>> XE_PAGE_SIZE,
>>>> -                                  xe->pat.idx[XE_CACHE_NONE]);
>>>> -
>>>> -            iosys_map_wr(map, *dpt_ofs, u64, pte);
>>>> -            *dpt_ofs += 8;
>>>> -            src_idx -= src_stride;
>>>> -        }
>>>> -
>>>> -        /* The DE ignores the PTEs for the padding tiles */
>>>> -        *dpt_ofs += (dst_stride - height) * 8;
>>>> -    }
>>>> -
>>>> -    /* Align to next page */
>>>> -    *dpt_ofs = ALIGN(*dpt_ofs, 4096);
>>>> +    u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
>>>> +                          xe->pat.idx[XE_CACHE_NONE]);
>>>> +    iosys_map_wr(map, *ofs, u64, pte);
>>>> +    *ofs += 8;
>>>>    }
>>>> -static void
>>>> -write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32
>>>> *dpt_ofs,
>>>> -           u32 bo_ofs, u32 width, u32 height, u32 src_stride,
>>>> -           u32 dst_stride)
>>>> +static void write_dpt(struct xe_bo *bo, struct iosys_map *map, u32
>>>> *dpt_ofs,
>>>> +              const struct intel_remapped_plane_info *plane,
>>>> +              enum i915_gtt_view_type type)
>>>>    {
>>>>        struct xe_device *xe = xe_bo_device(bo);
>>>> -    struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>>>> -    u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
>>>> -        = ggtt->pt_ops->pte_encode_bo;
>>>> -    u32 column, row;
>>>> -
>>>> -    for (row = 0; row < height; row++) {
>>>> -        u32 src_idx = src_stride * row + bo_ofs;
>>>> -
>>>> -        for (column = 0; column < width; column++) {
>>>> -            iosys_map_wr(map, *dpt_ofs, u64,
>>>> -                     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
>>>> -                     xe->pat.idx[XE_CACHE_NONE]));
>>>> -
>>>> -            *dpt_ofs += 8;
>>>> -            src_idx++;
>>>> +    const u32 dpt_even = (plane->dst_stride - plane->width) * 8;
>>>> +    const u32 dest_width = plane->width;
>>>> +    const u32 dest_height = plane->height;
>>>> +    u32 src_idx;
>>>> +
>>>> +    for (u32 row = 0; row < dest_height; ++row) {
>>>> +        for (u32 column = 0; column < dest_width; ++column) {
>>>> +            switch (type) {
>>>> +            case I915_GTT_VIEW_NORMAL:
>>>> +                src_idx = plane->offset + column;
>>>> +                break;
>>>> +            case I915_GTT_VIEW_REMAPPED:
>>>> +                src_idx = plane->offset +
>>>> +                    row * plane->src_stride + column;
>>>> +                break;
>>>> +            default:
>>>> +                WARN(1, "Unsupported GTT view type: %d", type);
>>>> +                return;
>>>> +            }
>>>> +            encode_and_write_pte(bo, map, dpt_ofs, src_idx, xe);
>>>>            }
>>>> -
>>>> -        /* The DE ignores the PTEs for the padding tiles */
>>>> -        *dpt_ofs += (dst_stride - width) * 8;
>>>> +        *dpt_ofs += dpt_even;
>>>>        }
>>>> -
>>>> -    /* Align to next page */
>>>>        *dpt_ofs = ALIGN(*dpt_ofs, 4096);
>>>>    }
>>>> @@ -125,59 +103,36 @@ static int __xe_pin_fb_vma_dpt(const struct
>>>> intel_framebuffer *fb,
>>>>    {
>>>>        struct xe_device *xe = to_xe_device(fb->base.dev);
>>>>        struct xe_tile *tile0 = xe_device_get_root_tile(xe);
>>>> -    struct xe_ggtt *ggtt = tile0->mem.ggtt;
>>>>        struct drm_gem_object *obj = intel_fb_bo(&fb->base);
>>>>        struct xe_bo *bo = gem_to_xe_bo(obj), *dpt;
>>>>        u32 dpt_size, size = bo->ttm.base.size;
>>>> +    const struct intel_remapped_plane_info *plane;
>>>> +    u32 i, plane_count, dpt_ofs = 0;
>>>> +    struct intel_remapped_plane_info normal_plane;
>>>> -    if (view->type == I915_GTT_VIEW_NORMAL)
>>>> +    if (view->type == I915_GTT_VIEW_NORMAL) {
>>>>            dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
>>>> -    else if (view->type == I915_GTT_VIEW_REMAPPED)
>>>> -        dpt_size =
>>>> ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
>>>> -                 XE_PAGE_SIZE);
>>>> -    else
>>>> -        /* display uses 4K tiles instead of bytes here, convert to
>>>> entries.. */
>>>> -        dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
>>>> +        normal_plane.offset = 0;
>>>> +        normal_plane.width = size / XE_PAGE_SIZE;
>>>> +        normal_plane.height = 1;
>>>> +        normal_plane.src_stride = size / XE_PAGE_SIZE;
>>>> +        normal_plane.dst_stride = size / XE_PAGE_SIZE;
>>>> +        plane = &normal_plane;
>>>> +        plane_count = 1;
>>>> +    } else {
>>>> +        dpt_size = ALIGN(intel_remapped_info_size(&view->remapped) * 8,
>>>>                     XE_PAGE_SIZE);
>>>> +        plane = view->remapped.plane;
>>>> +        plane_count = ARRAY_SIZE(view->remapped.plane);
>>>> +    }
>>>>        dpt = xe_alloc_dpt_bo(xe, tile0, dpt_size, physical_alignment);
>>>>        if (IS_ERR(dpt))
>>>>            return PTR_ERR(dpt);
>>>> -    if (view->type == I915_GTT_VIEW_NORMAL) {
>>>> -        u32 x;
>>>> -
>>>> -        for (x = 0; x < size / XE_PAGE_SIZE; x++) {
>>>> -            u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
>>>> -                                  xe->pat.idx[XE_CACHE_NONE]);
>>>> -
>>>> -            iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
>>>> -        }
>>>> -    } else if (view->type == I915_GTT_VIEW_REMAPPED) {
>>>> -        const struct intel_remapped_info *remap_info = &view->remapped;
>>>> -        u32 i, dpt_ofs = 0;
>>>> -
>>>> -        for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
>>>> -            write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
>>>> -                       remap_info->plane[i].offset,
>>>> -                       remap_info->plane[i].width,
>>>> -                       remap_info->plane[i].height,
>>>> -                       remap_info->plane[i].src_stride,
>>>> -                       remap_info->plane[i].dst_stride);
>>>> -
>>>> -    } else {
>>>> -        const struct intel_rotation_info *rot_info = &view->rotated;
>>>> -        u32 i, dpt_ofs = 0;
>>>> -
>>>> -        for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
>>>> -            write_dpt_rotated(bo, &dpt->vmap, &dpt_ofs,
>>>> -                      rot_info->plane[i].offset,
>>>> -                      rot_info->plane[i].width,
>>>> -                      rot_info->plane[i].height,
>>>> -                      rot_info->plane[i].src_stride,
>>>> -                      rot_info->plane[i].dst_stride);
>>>> -    }
>>>> +    for (i = 0; i < plane_count; i++)
>>>> +        write_dpt(bo, &dpt->vmap, &dpt_ofs, &plane[i], view->type);
>>>>        vma->dpt = dpt;
>>>>        vma->node = dpt->ggtt_node[tile0->id];
