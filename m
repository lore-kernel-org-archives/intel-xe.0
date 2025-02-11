Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10266C0219B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 11:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A354110E677;
	Tue, 11 Feb 2025 11:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="dBRKq6c1";
	dkim-atps=neutral
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39C610E677
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 11:22:29 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-38ddc36b81dso1508455f8f.1
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 03:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1739272948; x=1739877748;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=25snU76w0FF0Hb8hPu6mkzyrtBSm3MR128/2OFj6myA=;
 b=dBRKq6c1DRbGMhnG+IwpG6cSxYtpkSPf3DCv7ZBJFNQXq0u+HveEXAsPzOr0WLu+tG
 7xJoGAGSKqZ9LHqvnHgmaP3AZN5aTKlXBVnofeh04dpjIxTQ7Jx0OZ/FlEmy1F3Np/8I
 OsuMMwafaXyFAKI6c/Pb+0cnnRx8n1mZWgvLgLoyjiTTFIMz5iWZMw5UBje4kwsvlbY/
 k8vQBQAn0bAtLYdO8K/Bk0TfN5z+7lmabHpK8hXA8EOwAbxQUyW5lgvfbS3UaG4AtIoQ
 dj05ZaJNA6Zh4uRE7DpHO8MiiVdCtzADGiVyZYIIrf2kUaZcCZvlK5hB4s2GLIkWl2hV
 qRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739272948; x=1739877748;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=25snU76w0FF0Hb8hPu6mkzyrtBSm3MR128/2OFj6myA=;
 b=nLCgOaGRDYcOwmo6f69XNgs0gLCbLxGkvT0ZqeBpAYZHgrVU3lIpxXEOTTSk2o8mkb
 Z3Hg3VWdMV/SU4LyroMXn//hMQNwul7fDHru5GpMFVH4RfcPXTyluGGHy4iBiA/h5EcU
 GeTyfZE+39UpJbJIB+8fJBg1wNS5P8YNeUXMQLuMrQhs8mFjcvhfysKzR92DGPZAZjdr
 7YD9Ewtr+cLE7cTKM/xqsUdltlQINAyOVjJCYE6Q+9F722RUYFt+eiAOF/cR0bYk11eP
 vLZ2HbW7556VCc2s1Kw4pCu0+sNPZmc+2LpgLheeeY7fmzAmDtRIK7LQzF6d8cZDVA0C
 bLDQ==
X-Gm-Message-State: AOJu0Yy03E1S5/1TODxESGd82lyAsWfK5ptT58+PLv6akO8LqJ6xzmXc
 vtdSD9S7BuUgMQzg9PXcXmk7GsCKO9XNtjzwKLrcHVkWH/OyxiV8owWz/aDhxNYsHuupFVqaxab
 9
X-Gm-Gg: ASbGncupssfbcDEEqxiLkUYe1DJQKN8a074IHrK/CSjG/UhqFTEHix/8tkTj+8Ly6a8
 cgzxePG8O9vVT+9T0X+/WXAzNGGQOtDS1O5Bs8lbcu4Pz5VZLb0jnkPw6CPcArm6fhY88FtzLrV
 +Vk9qbMdvWOvDkpqceLcNj50NcUw5v4aLzd+s2acPhpW/2s3Z9Fvui8OLKVeO7/EVdQEjrRD6g2
 zc/c//m8o/+25WJj4IP4Ckh3t48v9yw4GTwy1/pgAEwBc3eJ42p6BKxhnW8cMSm5rRuWt8kOj4S
 0iw6VKCiIMIPxeAaZl2lJFPyeSI6CdQ=
X-Google-Smtp-Source: AGHT+IEs7HZIx3QhOo4ZNYnAmsRUqUy0lY3eKHsQ4eAwask1SClcTaNkgirxHahR5ppxgLl+SBSIZQ==
X-Received: by 2002:a5d:648b:0:b0:38d:e259:4d10 with SMTP id
 ffacd0b85a97d-38de43aa5cfmr2823977f8f.13.1739272947910; 
 Tue, 11 Feb 2025 03:22:27 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcaf3e4bcsm11622526f8f.41.2025.02.11.03.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 03:22:27 -0800 (PST)
Message-ID: <7986b395-e495-4c6a-96b4-f9c623fc666b@ursulin.net>
Date: Tue, 11 Feb 2025 11:22:26 +0000
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
 <ca83eabe-d2cf-4ee9-a51d-82809d07a447@ursulin.net>
 <CAJ=qYWSUabag3Xcw-zyAPjtFbxqyyfHSP=72tEtV+MZobiEETw@mail.gmail.com>
 <bfe83139-0d16-4dcb-b3cc-d43c3d365e89@ursulin.net>
 <CAJ=qYWQ0FEtH8vNL2MYBbBgRQJwef=HJYV7WJ1HqHNSy1KBzZg@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <CAJ=qYWQ0FEtH8vNL2MYBbBgRQJwef=HJYV7WJ1HqHNSy1KBzZg@mail.gmail.com>
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


On 07/02/2025 14:33, Juha-Pekka Heikkilä wrote:
> On Tue, Feb 4, 2025 at 8:05 PM Tvrtko Ursulin <tursulin@ursulin.net> wrote:
>>
>>
>> On 04/02/2025 13:11, Juha-Pekka Heikkilä wrote:
>>> On Tue, Feb 4, 2025 at 2:31 PM Tvrtko Ursulin <tursulin@ursulin.net> wrote:
>>>>
>>>>
>>>> On 04/02/2025 12:10, Juha-Pekka Heikkilä wrote:
>>>>> On Tue, Feb 4, 2025 at 1:38 PM Tvrtko Ursulin <tursulin@ursulin.net> wrote:
>>>>>>
>>>>>>
>>>>>> On 04/02/2025 11:25, Tvrtko Ursulin wrote:
>>>>>>>
>>>>>>> On 14/01/2025 18:04, Juha-Pekka Heikkila wrote:
>>>>>>>> Unify writing of remapped and straight DPTs. Take out writing of
>>>>>>>> rotated DPT since Xe doesn't support any platform that does
>>>>>>>> 90 degree rotated framebuffers.
>>>>>>>
>>>>>>> Consider giving my series which fixes AuxCSS a look instead? Given there
>>>>>>> is external interest to have all that work on ADL-P. I could respin with
>>>>>>> rotated cleaned up in a similar fashion I did for remapped. Maintenance
>>>>>>> cost is minimal since it is all very contained.
>>>>>>
>>>>>> Oh ADL-P does not support hardware rotation. I missed the fact it is
>>>>>> display version 13..
>>>>>>
>>>>>> But the point regarding changes to remapping code are still valid I
>>>>>> think, since to suport aux plane the refactoring from this patch looks
>>>>>> in the wrong direction.
>>>>>>
>>>>>
>>>>> Yea, I kinda agree here with Tvrtko. I did earlier mention this to
>>>>> JSaa. That aux thing will need to be checked.
>>>>
>>>> Ah cool, fingers crossed.
>>>>
>>>>> Though, how far are we with your set Tvrtko? It did seem lot kms_ccs
>>>>> tests failed.
>>>>> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v1/shards-all.html?testfilter=kms_ccs.*crc.*gen12&hosts=adlp
>>>>>
>>>>> Did you check you had compression when you had clean image on your
>>>>> machine? (aux surface was not zeroes) Those failures on my link ci are
>>>>> with failing crc which mean the picture on screen was not correct.
>>>>
>>>> I was looking into this just this morning and posted some
>>>> half-conclusions here:
>>>>
>>>> https://lore.kernel.org/intel-xe/eb3a3729-e8ef-4868-b8ff-b6efd66ef4fa@igalia.com/T/#u
>>>>
>>>> When you say test with a clear image that I did not. I smoke tested it
>>>> in desktop usage and looked at kms_flip_tiling which visually looks
>>>> correct but as the above msg-id talks about, something is potentially
>>>> fishy with crc collections and/or vblank handling. Since display isn't
>>>> my area of expertise that is as far as I could get.
>>>
>>> Those test explicitly testing for flipping and such may show there
>>> something interesting but imo unrelated to this situation (for now).
>>>
>>> If you have adlp machine where you see the screen you could try those
>>> kms_ccs crc tests, you can run the tests in interactive mode with
>>> '--i' parameter where the test always stop at commit so you'll see
>>> what's there on screen. On kms_ccs I would not expect any vblank/other
>>> issues to interfere crc because kms_ccs uses
>>> igt_pipe_crc_collect_crc() to get the crc, what this mean is once the
>>> test image is on screen crc counting is started, collected one crc and
>>> crc counting is stopped .. to get the first crc this way few vblanks
>>> have passed already since getting image on screen. Then on kms_ccs
>>> test there is -c flag which should check there is something written on
>>> aux surface. Getting these to work reliably I think is the first
>>> thing...and on that subject I'd at first concentrate just one gen12rc
>>> ccs, not ccs-cc and not mc ccs. I'd get these results by myself but
>>> I'm bit of recovering at home and don't have needed hw in my hands.
>>
>> kms_crc with and without -c are both a complete pass.
> 
> I tried this too, the result is..interesting. I tried adlp and mtlp.
> Reading crc on adlp seems to do something unexpected for display on
> Xe. If you run kms_ccs on adlp with interactive parameter and step
> forward those images you'll likely see lot of broken images but crc
> still matches as if image was correct.
> 
> On adlp it look like image is given to display hw too early, some
> timing somewhere go wrong, I often saw images where primary surface
> was written but aux surface was not yet fully written (you'll get
> compression markers on screen from main surface because unwritten aux
> says nothing is compressed). If I fix kms_ccs to read crcs
> continuously it will never pass crc checks, same as is seen in many
> other tests. It did look like enabling crc creation caused update on
> frontbuffer which fixed the image since at that moment compressors
> were already done. It did seem mc ccs was much more easy to get this
> effect to show, rc ccs was 50-50 on Lenovo laptop I tried while mc ccs
> was far more frequent.
> 
> I did also try run kms_plane pixel-format tests and there I see lot of
> broken images. On pixel-format tests there's supposing to be 64x64 fb
> with either horizontal lines or full color (for planar formats) but I
> see lot of broken images which make me think this issue is not about
> ccs but maybe some timing or caching issue. Essential difference with
> kms_plane pixel format tests and kms_ccs is kms_ccs use render engine
> (and media engine for mc) while pixel format tests use copy engine and
> they failed quite equally.
> 
> On mtlp there are similar issues but mc ccs cannot run at all, any try
> to use media engine (which is needed to compress mc ccs) just crashed
> the engine. Probably nobody ever tried any of these with Xe.
> 
>>
>>> On that lore.kernel.org thread where you mention "Bad CRC also varies
>>> run to run, while visually things look fine to me on screen. Also a
>>> delay before collecting the crc seems to improve things." could be
>>> quite much anything, my first quess with those always is some
>>> alignment missed somewhere.
>>
>> Going back to kms_flip_tiling it is hard to figure out what's up. Good
>> news is that I have spotted some visual glitching but it mostly only
>> happens withing the first few frames after commit of the reference frame.
>>
>> For instance when I add a loop such as:
>>
>> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
>> index e937c21716ad..5538fe88c5a0 100644
>> --- a/tests/intel/kms_flip_tiling.c
>> +++ b/tests/intel/kms_flip_tiling.c
>> @@ -131,7 +131,10 @@ test_flip_tiling(data_t *data, enum pipe pipe,
>> igt_output_t *output, uint64_t mo
>>                         "commit failed with " IGT_MODIFIER_FMT "\n",
>>                         IGT_MODIFIER_ARGS(modifier[1]));
>>           pipe_crc_new(data, pipe);
>> -       igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc,
>> &reference_crc);
>> +       ret = 20;
>> +       while (ret--)
>> +               igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc,
>> +                                        &reference_crc);
> 
> This matches to what I saw, on adlp/mtlp framebuffers are given to
> display too early or something need to be triggered before display get
> correct image. Once the image is in frontbuffer it is on screen and if
> caches/engines/.. were not ready then that show on screen as broken
> image.
> 
>>
>>           /* Commit the first fb. */
>>           igt_plane_set_fb(primary, &data->fb[0]);
>>
>> All tests pass.
>>
>> Could this be interacting with some other display feature like fbc or psr?
> 
> I wouldn't expect this to be fbc/psr issue. While those can be source
> for screen glithes, when I see partially ccs compressed images on
> screen I know all updating was correct for fbc/psr, just that the
> original was broken.
> 
>>
>> There is also something interesting with CRC if I put a sleep into that
>> loop. Apparently something gets powered off and CRC garbage such as
>> 0xffffffff starts appearing. But only if there is a sleep for like
>> 250ms. A busy loop can go for 3000 frames and not hit that.
> 
> I have hunch this relate to intel_crtc_crc_setup_workarounds but can't
> say for sure. I've been trying to find crc setup related bugs
> recently.
> 
> Anyway, with those random bugs it's difficult to say how far adlp is
> from being supported on Xe and not sure how media engine really work
> there since it doesn't work at all on mtlp with Xe.

Thanks for looking into this!

I explored a bit more and eventually figured out it is most probably 
about the missing AuxCCS invalidation. I'll have a go transplanting that 
code over from i915 and see how that will go.

Regards,

Tvrtko

>> Regards,
>>
>> Tvrtko
>>
>>>>>>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/xe/display/xe_fb_pin.c | 141 +++++++++----------------
>>>>>>>>      1 file changed, 48 insertions(+), 93 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>>>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>>>> index c28885316986..70322f28eee5 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>>>> @@ -14,66 +14,44 @@
>>>>>>>>      #include "xe_ggtt.h"
>>>>>>>>      #include "xe_pm.h"
>>>>>>>> -static void
>>>>>>>> -write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32
>>>>>>>> *dpt_ofs, u32 bo_ofs,
>>>>>>>> -          u32 width, u32 height, u32 src_stride, u32 dst_stride)
>>>>>>>> +static void encode_and_write_pte(struct xe_bo *bo, struct iosys_map
>>>>>>>> *map,
>>>>>>>> +                 u32 *ofs, u32 src_idx, struct xe_device *xe)
>>>>>>>>      {
>>>>>>>> -    struct xe_device *xe = xe_bo_device(bo);
>>>>>>>>          struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>>>>>>>> -    u32 column, row;
>>>>>>>> -
>>>>>>>> -    /* TODO: Maybe rewrite so we can traverse the bo addresses
>>>>>>>> sequentially,
>>>>>>>> -     * by writing dpt/ggtt in a different order?
>>>>>>>> -     */
>>>>>>>> -
>>>>>>>> -    for (column = 0; column < width; column++) {
>>>>>>>> -        u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
>>>>>>>> -
>>>>>>>> -        for (row = 0; row < height; row++) {
>>>>>>>> -            u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx *
>>>>>>>> XE_PAGE_SIZE,
>>>>>>>> -                                  xe->pat.idx[XE_CACHE_NONE]);
>>>>>>>> -
>>>>>>>> -            iosys_map_wr(map, *dpt_ofs, u64, pte);
>>>>>>>> -            *dpt_ofs += 8;
>>>>>>>> -            src_idx -= src_stride;
>>>>>>>> -        }
>>>>>>>> -
>>>>>>>> -        /* The DE ignores the PTEs for the padding tiles */
>>>>>>>> -        *dpt_ofs += (dst_stride - height) * 8;
>>>>>>>> -    }
>>>>>>>> -
>>>>>>>> -    /* Align to next page */
>>>>>>>> -    *dpt_ofs = ALIGN(*dpt_ofs, 4096);
>>>>>>>> +    u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
>>>>>>>> +                          xe->pat.idx[XE_CACHE_NONE]);
>>>>>>>> +    iosys_map_wr(map, *ofs, u64, pte);
>>>>>>>> +    *ofs += 8;
>>>>>>>>      }
>>>>>>>> -static void
>>>>>>>> -write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32
>>>>>>>> *dpt_ofs,
>>>>>>>> -           u32 bo_ofs, u32 width, u32 height, u32 src_stride,
>>>>>>>> -           u32 dst_stride)
>>>>>>>> +static void write_dpt(struct xe_bo *bo, struct iosys_map *map, u32
>>>>>>>> *dpt_ofs,
>>>>>>>> +              const struct intel_remapped_plane_info *plane,
>>>>>>>> +              enum i915_gtt_view_type type)
>>>>>>>>      {
>>>>>>>>          struct xe_device *xe = xe_bo_device(bo);
>>>>>>>> -    struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>>>>>>>> -    u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
>>>>>>>> -        = ggtt->pt_ops->pte_encode_bo;
>>>>>>>> -    u32 column, row;
>>>>>>>> -
>>>>>>>> -    for (row = 0; row < height; row++) {
>>>>>>>> -        u32 src_idx = src_stride * row + bo_ofs;
>>>>>>>> -
>>>>>>>> -        for (column = 0; column < width; column++) {
>>>>>>>> -            iosys_map_wr(map, *dpt_ofs, u64,
>>>>>>>> -                     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
>>>>>>>> -                     xe->pat.idx[XE_CACHE_NONE]));
>>>>>>>> -
>>>>>>>> -            *dpt_ofs += 8;
>>>>>>>> -            src_idx++;
>>>>>>>> +    const u32 dpt_even = (plane->dst_stride - plane->width) * 8;
>>>>>>>> +    const u32 dest_width = plane->width;
>>>>>>>> +    const u32 dest_height = plane->height;
>>>>>>>> +    u32 src_idx;
>>>>>>>> +
>>>>>>>> +    for (u32 row = 0; row < dest_height; ++row) {
>>>>>>>> +        for (u32 column = 0; column < dest_width; ++column) {
>>>>>>>> +            switch (type) {
>>>>>>>> +            case I915_GTT_VIEW_NORMAL:
>>>>>>>> +                src_idx = plane->offset + column;
>>>>>>>> +                break;
>>>>>>>> +            case I915_GTT_VIEW_REMAPPED:
>>>>>>>> +                src_idx = plane->offset +
>>>>>>>> +                    row * plane->src_stride + column;
>>>>>>>> +                break;
>>>>>>>> +            default:
>>>>>>>> +                WARN(1, "Unsupported GTT view type: %d", type);
>>>>>>>> +                return;
>>>>>>>> +            }
>>>>>>>> +            encode_and_write_pte(bo, map, dpt_ofs, src_idx, xe);
>>>>>>>>              }
>>>>>>>> -
>>>>>>>> -        /* The DE ignores the PTEs for the padding tiles */
>>>>>>>> -        *dpt_ofs += (dst_stride - width) * 8;
>>>>>>>> +        *dpt_ofs += dpt_even;
>>>>>>>>          }
>>>>>>>> -
>>>>>>>> -    /* Align to next page */
>>>>>>>>          *dpt_ofs = ALIGN(*dpt_ofs, 4096);
>>>>>>>>      }
>>>>>>>> @@ -125,59 +103,36 @@ static int __xe_pin_fb_vma_dpt(const struct
>>>>>>>> intel_framebuffer *fb,
>>>>>>>>      {
>>>>>>>>          struct xe_device *xe = to_xe_device(fb->base.dev);
>>>>>>>>          struct xe_tile *tile0 = xe_device_get_root_tile(xe);
>>>>>>>> -    struct xe_ggtt *ggtt = tile0->mem.ggtt;
>>>>>>>>          struct drm_gem_object *obj = intel_fb_bo(&fb->base);
>>>>>>>>          struct xe_bo *bo = gem_to_xe_bo(obj), *dpt;
>>>>>>>>          u32 dpt_size, size = bo->ttm.base.size;
>>>>>>>> +    const struct intel_remapped_plane_info *plane;
>>>>>>>> +    u32 i, plane_count, dpt_ofs = 0;
>>>>>>>> +    struct intel_remapped_plane_info normal_plane;
>>>>>>>> -    if (view->type == I915_GTT_VIEW_NORMAL)
>>>>>>>> +    if (view->type == I915_GTT_VIEW_NORMAL) {
>>>>>>>>              dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
>>>>>>>> -    else if (view->type == I915_GTT_VIEW_REMAPPED)
>>>>>>>> -        dpt_size =
>>>>>>>> ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
>>>>>>>> -                 XE_PAGE_SIZE);
>>>>>>>> -    else
>>>>>>>> -        /* display uses 4K tiles instead of bytes here, convert to
>>>>>>>> entries.. */
>>>>>>>> -        dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
>>>>>>>> +        normal_plane.offset = 0;
>>>>>>>> +        normal_plane.width = size / XE_PAGE_SIZE;
>>>>>>>> +        normal_plane.height = 1;
>>>>>>>> +        normal_plane.src_stride = size / XE_PAGE_SIZE;
>>>>>>>> +        normal_plane.dst_stride = size / XE_PAGE_SIZE;
>>>>>>>> +        plane = &normal_plane;
>>>>>>>> +        plane_count = 1;
>>>>>>>> +    } else {
>>>>>>>> +        dpt_size = ALIGN(intel_remapped_info_size(&view->remapped) * 8,
>>>>>>>>                       XE_PAGE_SIZE);
>>>>>>>> +        plane = view->remapped.plane;
>>>>>>>> +        plane_count = ARRAY_SIZE(view->remapped.plane);
>>>>>>>> +    }
>>>>>>>>          dpt = xe_alloc_dpt_bo(xe, tile0, dpt_size, physical_alignment);
>>>>>>>>          if (IS_ERR(dpt))
>>>>>>>>              return PTR_ERR(dpt);
>>>>>>>> -    if (view->type == I915_GTT_VIEW_NORMAL) {
>>>>>>>> -        u32 x;
>>>>>>>> -
>>>>>>>> -        for (x = 0; x < size / XE_PAGE_SIZE; x++) {
>>>>>>>> -            u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
>>>>>>>> -                                  xe->pat.idx[XE_CACHE_NONE]);
>>>>>>>> -
>>>>>>>> -            iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
>>>>>>>> -        }
>>>>>>>> -    } else if (view->type == I915_GTT_VIEW_REMAPPED) {
>>>>>>>> -        const struct intel_remapped_info *remap_info = &view->remapped;
>>>>>>>> -        u32 i, dpt_ofs = 0;
>>>>>>>> -
>>>>>>>> -        for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
>>>>>>>> -            write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
>>>>>>>> -                       remap_info->plane[i].offset,
>>>>>>>> -                       remap_info->plane[i].width,
>>>>>>>> -                       remap_info->plane[i].height,
>>>>>>>> -                       remap_info->plane[i].src_stride,
>>>>>>>> -                       remap_info->plane[i].dst_stride);
>>>>>>>> -
>>>>>>>> -    } else {
>>>>>>>> -        const struct intel_rotation_info *rot_info = &view->rotated;
>>>>>>>> -        u32 i, dpt_ofs = 0;
>>>>>>>> -
>>>>>>>> -        for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
>>>>>>>> -            write_dpt_rotated(bo, &dpt->vmap, &dpt_ofs,
>>>>>>>> -                      rot_info->plane[i].offset,
>>>>>>>> -                      rot_info->plane[i].width,
>>>>>>>> -                      rot_info->plane[i].height,
>>>>>>>> -                      rot_info->plane[i].src_stride,
>>>>>>>> -                      rot_info->plane[i].dst_stride);
>>>>>>>> -    }
>>>>>>>> +    for (i = 0; i < plane_count; i++)
>>>>>>>> +        write_dpt(bo, &dpt->vmap, &dpt_ofs, &plane[i], view->type);
>>>>>>>>          vma->dpt = dpt;
>>>>>>>>          vma->node = dpt->ggtt_node[tile0->id];

