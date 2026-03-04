Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8A4EF8FF0
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 14:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26AF10EA2D;
	Wed,  4 Mar 2026 14:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="sB8t5mmI";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210B110EA2C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 14:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AmRQEoeG3ap4ANlvFsu4JKgygMw1mM6qUZdpXCDc7X8=; b=sB8t5mmIjIBg1EnK1iAnzOFCkS
 04bc5HL2lQ1lNvaJCrFvMRNLgIVZZ1LuPbZU4R70is4uh1HpJklMOyUkBX3o9qfsBQYGUWktuCByn
 SRK/YQiYbSTf1knGpk0G7r05XaFjtAot8efWZQORlNhQ9s8jtARAqG25NYfPoSw+X/WAtzzSdoZiI
 26qBLYUe9eLfVTUMUSTblV6zLpMz6o1ze3MZlpGdQ37/XV3m6NOx9P+U248rBtF/6nCdbFmM4allQ
 eSjS1iC79Uyq1KxMLRqyIRGG7GpyqjiDjWbcz1IG5KgGM6aAI/3WmHekCU0xqkR3Z652bvXca1B/Q
 sW1idblQ==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vxnQ1-008xgx-86; Wed, 04 Mar 2026 15:41:45 +0100
Message-ID: <6d2b9c2b-a2bf-47b8-be75-43a5ce3bb3c6@igalia.com>
Date: Wed, 4 Mar 2026 14:41:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 1/9] drm/xe: Rename XE_BO_FLAG_SCANOUT to
 XE_BO_FLAG_FORCE_WC
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20260304130314.6084-1-tvrtko.ursulin@igalia.com>
 <20260304130314.6084-2-tvrtko.ursulin@igalia.com>
 <aag4sgi4vjYh6xUR@intel.com>
 <b839d9de-96f6-40aa-b15f-7a0138922802@igalia.com>
Content-Language: en-GB
In-Reply-To: <b839d9de-96f6-40aa-b15f-7a0138922802@igalia.com>
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


On 04/03/2026 14:23, Tvrtko Ursulin wrote:
> 
> On 04/03/2026 13:50, Rodrigo Vivi wrote:
>> On Wed, Mar 04, 2026 at 01:03:06PM +0000, Tvrtko Ursulin wrote:
>>> Rename XE_BO_FLAG_SCANOUT to XE_BO_FLAG_FORCE_WC so that the usage of 
>>> the
>>> flag can legitimately be expanded to more than just the actual frame-
>>> buffer objects.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/display/intel_fb_bo.c      |  6 +++---
>>>   drivers/gpu/drm/xe/display/intel_fbdev_fb.c   | 12 ++++++++----
>>>   drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |  4 +++-
>>>   drivers/gpu/drm/xe/display/xe_fb_pin.c        |  2 +-
>>>   drivers/gpu/drm/xe/display/xe_initial_plane.c |  2 +-
>>>   drivers/gpu/drm/xe/xe_bo.c                    | 16 +++++++++++-----
>>>   drivers/gpu/drm/xe/xe_bo.h                    |  2 +-
>>>   7 files changed, 28 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/ 
>>> drm/xe/display/intel_fb_bo.c
>>> index db8b1a27b4de..d2e72dc5abd9 100644
>>> --- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
>>> +++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
>>> @@ -45,9 +45,9 @@ int intel_fb_bo_framebuffer_init(struct 
>>> drm_gem_object *obj,
>>>       if (ret)
>>>           goto err;
>>> -    if (!(bo->flags & XE_BO_FLAG_SCANOUT)) {
>>> +    if (!(bo->flags & XE_BO_FLAG_FORCE_WC)) {
>>>           /*
>>> -         * XE_BO_FLAG_SCANOUT should ideally be set at creation, or is
>>> +         * XE_BO_FLAG_FORCE_WC should ideally be set at creation, or is
>>>            * automatically set when creating FB. We cannot change 
>>> caching
>>>            * mode when the bo is VM_BINDed, so we can only set
>>>            * coherency with display when unbound.
>>> @@ -57,7 +57,7 @@ int intel_fb_bo_framebuffer_init(struct 
>>> drm_gem_object *obj,
>>>               ret = -EINVAL;
>>>               goto err;
>>>           }
>>> -        bo->flags |= XE_BO_FLAG_SCANOUT;
>>> +        bo->flags |= XE_BO_FLAG_FORCE_WC;
>>>       }
>>>       ttm_bo_unreserve(&bo->ttm);
>>>       return 0;
>>> diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/ 
>>> gpu/drm/xe/display/intel_fbdev_fb.c
>>> index 87af5646c938..d7030e4d814c 100644
>>> --- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
>>> +++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
>>> @@ -56,9 +56,11 @@ struct drm_gem_object 
>>> *intel_fbdev_fb_bo_create(struct drm_device *drm, int size
>>>       if (intel_fbdev_fb_prefer_stolen(drm, size)) {
>>>           obj = xe_bo_create_pin_map_novm(xe, 
>>> xe_device_get_root_tile(xe),
>>>                           size,
>>> -                        ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
>>> +                        ttm_bo_type_kernel,
>>> +                        XE_BO_FLAG_FORCE_WC |
>>>                           XE_BO_FLAG_STOLEN |
>>> -                        XE_BO_FLAG_GGTT, false);
>>> +                        XE_BO_FLAG_GGTT,
>>> +                        false);
>>>           if (!IS_ERR(obj))
>>>               drm_info(&xe->drm, "Allocated fbdev into stolen\n");
>>>           else
>>> @@ -69,9 +71,11 @@ struct drm_gem_object 
>>> *intel_fbdev_fb_bo_create(struct drm_device *drm, int size
>>>       if (IS_ERR(obj)) {
>>>           obj = xe_bo_create_pin_map_novm(xe, 
>>> xe_device_get_root_tile(xe), size,
>>> -                        ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
>>> +                        ttm_bo_type_kernel,
>>> +                        XE_BO_FLAG_FORCE_WC |
>>>                           
>>> XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
>>> -                        XE_BO_FLAG_GGTT, false);
>>> +                        XE_BO_FLAG_GGTT,
>>> +                        false);
>>>       }
>>>       if (IS_ERR(obj)) {
>>> diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/ 
>>> gpu/drm/xe/display/xe_dsb_buffer.c
>>> index 1c67a950c6ad..a7158c73a14c 100644
>>> --- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
>>> +++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
>>> @@ -54,7 +54,9 @@ static struct intel_dsb_buffer 
>>> *xe_dsb_buffer_create(struct drm_device *drm, siz
>>>                       PAGE_ALIGN(size),
>>>                       ttm_bo_type_kernel,
>>>                       
>>> XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
>>> -                    XE_BO_FLAG_SCANOUT | XE_BO_FLAG_GGTT, false);
>>> +                    XE_BO_FLAG_FORCE_WC |
>>> +                    XE_BO_FLAG_GGTT,
>>> +                    false);
>>>       if (IS_ERR(obj)) {
>>>           ret = PTR_ERR(obj);
>>>           goto err_pin_map;
>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/ 
>>> drm/xe/display/xe_fb_pin.c
>>> index dbbc61032b7f..d4a9eb550cae 100644
>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>> @@ -429,7 +429,7 @@ int intel_plane_pin_fb(struct intel_plane_state 
>>> *new_plane_state,
>>>           return 0;
>>>       /* We reject creating !SCANOUT fb's, so this is weird.. */
>>> -    drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_SCANOUT));
>>> +    drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_FORCE_WC));
>>>       vma = __xe_pin_fb_vma(intel_fb, &new_plane_state->view.gtt, 
>>> alignment);
>>> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/ 
>>> gpu/drm/xe/display/xe_initial_plane.c
>>> index 65cc0b0c934b..8bcae552dddc 100644
>>> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
>>> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
>>> @@ -48,7 +48,7 @@ initial_plane_bo(struct xe_device *xe,
>>>       if (plane_config->size == 0)
>>>           return NULL;
>>> -    flags = XE_BO_FLAG_SCANOUT | XE_BO_FLAG_GGTT;
>>> +    flags = XE_BO_FLAG_FORCE_WC | XE_BO_FLAG_GGTT;
>>>       base = round_down(plane_config->base, page_size);
>>>       if (IS_DGFX(xe)) {
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 8ff193600443..fe560b0a980a 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -515,7 +515,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct 
>>> ttm_buffer_object *ttm_bo,
>>>            * For Xe_LPG and beyond up to NVL-P (excluding), PPGTT PTE
>>>            * lookups are also non-coherent and require a CPU:WC mapping.
>>>            */
>>> -        if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
>>> +        if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_FORCE_WC) ||
>>>                (!xe->info.has_cached_pt && bo->flags & 
>>> XE_BO_FLAG_PAGETABLE))
>>>               caching = ttm_write_combined;
>>>       }
>>> @@ -3196,8 +3196,14 @@ int xe_gem_create_ioctl(struct drm_device 
>>> *dev, void *data,
>>>       if (args->flags & DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING)
>>>           bo_flags |= XE_BO_FLAG_DEFER_BACKING;
>>> +    /*
>>> +     * Display scanout is always non-coherent with the CPU cache.
>>> +     *
>>> +     * For Xe_LPG and beyond up to NVL-P (excluding), PPGTT PTE
>>> +     * lookups are also non-coherent and require a CPU:WC mapping.
>>> +     */
>>
>> I believe this comment should be now removed from the other place.
>> But it doesn't hurt if you decide to keep in both places.
> 
> My bad, I thought you were suggesting a new comment text to add, and 
> while touching the flag in xe_ttm_tt_create apparently I suffered from 
> tunnel vision and did no see the same comment there. I will remove that 
> one but will hold of the respin until more of the series gets comments.

Actually what do you think of having it like this:

--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -510,12 +510,10 @@ static struct ttm_tt *xe_ttm_tt_create(struct 
ttm_buffer_object *ttm_bo,
                 WARN_ON((bo->flags & XE_BO_FLAG_USER) && !bo->cpu_caching);

                 /*
-                * Display scanout is always non-coherent with the CPU 
cache.
-                *
                  * For Xe_LPG and beyond up to NVL-P (excluding), PPGTT PTE
                  * lookups are also non-coherent and require a CPU:WC 
mapping.
                  */
-               if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
+               if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_FORCE_WC) ||
                      (!xe->info.has_cached_pt && bo->flags & 
XE_BO_FLAG_PAGETABLE))
                         caching = ttm_write_combined;
         }
@@ -3196,8 +3194,11 @@ int xe_gem_create_ioctl(struct drm_device *dev, 
void *data,
         if (args->flags & DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING)
                 bo_flags |= XE_BO_FLAG_DEFER_BACKING;

+       /*
+        * Display scanout is always non-coherent with the CPU cache.
+        */
         if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
-               bo_flags |= XE_BO_FLAG_SCANOUT;
+               bo_flags |= XE_BO_FLAG_FORCE_WC;

         if (args->flags & DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION) {
                 if (XE_IOCTL_DBG(xe, GRAPHICS_VER(xe) < 20))

The new comment in xe_gem_create_ioctl() explains the scanount uapi 
flag, while the comment in xe_ttm_tt_create() is partially left to 
explain the XE_BO_FLAG_PAGETABLE angle.

Regards,

Tvrtko

> 
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Thank you!
> 
> Regards,
> 
> Tvrtko
> 
>>
>>>       if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
>>> -        bo_flags |= XE_BO_FLAG_SCANOUT;
>>> +        bo_flags |= XE_BO_FLAG_FORCE_WC;
>>>       if (args->flags & DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION) {
>>>           if (XE_IOCTL_DBG(xe, GRAPHICS_VER(xe) < 20))
>>> @@ -3209,7 +3215,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, 
>>> void *data,
>>>       /* CCS formats need physical placement at a 64K alignment in 
>>> VRAM. */
>>>       if ((bo_flags & XE_BO_FLAG_VRAM_MASK) &&
>>> -        (bo_flags & XE_BO_FLAG_SCANOUT) &&
>>> +        (args->flags & XE_BO_FLAG_FORCE_WC) &&
>>>           !(xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) &&
>>>           IS_ALIGNED(args->size, SZ_64K))
>>>           bo_flags |= XE_BO_FLAG_NEEDS_64K;
>>> @@ -3229,7 +3235,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, 
>>> void *data,
>>>                args->cpu_caching != DRM_XE_GEM_CPU_CACHING_WC))
>>>           return -EINVAL;
>>> -    if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_FLAG_SCANOUT &&
>>> +    if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_FLAG_FORCE_WC &&
>>>                args->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB))
>>>           return -EINVAL;
>>> @@ -3642,7 +3648,7 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>>>       bo = xe_bo_create_user(xe, NULL, args->size,
>>>                      DRM_XE_GEM_CPU_CACHING_WC,
>>>                      
>>> XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
>>> -                   XE_BO_FLAG_SCANOUT |
>>> +                   XE_BO_FLAG_FORCE_WC |
>>>                      XE_BO_FLAG_NEEDS_CPU_ACCESS, NULL);
>>>       if (IS_ERR(bo))
>>>           return PTR_ERR(bo);
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>>> index c914ab719f20..af9a6669c872 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.h
>>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>>> @@ -35,7 +35,7 @@
>>>   #define XE_BO_FLAG_PINNED        BIT(7)
>>>   #define XE_BO_FLAG_NO_RESV_EVICT    BIT(8)
>>>   #define XE_BO_FLAG_DEFER_BACKING    BIT(9)
>>> -#define XE_BO_FLAG_SCANOUT        BIT(10)
>>> +#define XE_BO_FLAG_FORCE_WC        BIT(10)
>>>   #define XE_BO_FLAG_FIXED_PLACEMENT    BIT(11)
>>>   #define XE_BO_FLAG_PAGETABLE        BIT(12)
>>>   #define XE_BO_FLAG_NEEDS_CPU_ACCESS    BIT(13)
>>> -- 
>>> 2.52.0
>>>
> 

