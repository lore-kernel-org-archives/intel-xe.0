Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D06C282C6
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 14:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D959A10E5F0;
	Tue,  4 Mar 2025 14:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kvNCAd88";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39C110E5F0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Mar 2025 14:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s9/p0cRct13mUEiEDuvU2K1Nv5W1ClI0SO/bY6VhlS4=; b=kvNCAd88ijY0FGYtyFPaV257P3
 bfM24rYZpbHRlx+6RnzIIf2kkDynGJb6IV4AZdsN6jR+ZEgsi7ftoJn9Ie0BeJiW0UekGtg+KNxom
 DbjpJoTuHV2e5pl6YmsgCkuBVEZiIJkY8Pf9cAUh+4smkJ0ONKDQ/BHGRPFOidabjZ6ndX8BKgmUZ
 C5WQPC/e+CFa58lZJwsbjdHMOiymLy78xOSVhGWGRqqHtBssCjzCWFAbmzrUB9G7sJKooC4EMdADK
 XpXZZpiYJHyrBa/R4+I2Ph5BjcZCwuqa8QtUckZYVqkBHIZXyeyXmxexUKR/RnegPESKv8BDWgzEY
 Gd2Uz2VA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tpT9H-003kYD-Se; Tue, 04 Mar 2025 15:21:37 +0100
Message-ID: <ea4e999d-aa1c-419f-ac45-e0313fe461b1@igalia.com>
Date: Tue, 4 Mar 2025 14:21:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] drm/xe: Force flush system memory AuxCCS
 framebuffers before scan out
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
 <20250221101736.78986-11-tvrtko.ursulin@igalia.com>
 <Z8IPw4njV3JFQDm8@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <Z8IPw4njV3JFQDm8@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 28/02/2025 19:34, Rodrigo Vivi wrote:
> On Fri, Feb 21, 2025 at 10:17:29AM +0000, Tvrtko Ursulin wrote:
>> Even though frame buffer objects are created as write-combined, in
>> practice, on top of all the ring buffer flushing, an additional clflush
>> seems to be needed before display engine can coherently scan out the
>> AuxCCS compressed data without transient artifacts.
>>
>> If for comparison we look at how i915 handles things (where AuxCCS works
>> fine), as it happens it has this same clflush before a frame buffer is
>> pinned for display for the first time, courtesy the dynamic tracking of
>> the buffer cache mode and setting the latter to uncached before handing
>> to display.
>>
>> Since xe considers the buffer object caching mode as static we can
>> implement the same approach by adding a flag telling us if the buffer
>> was ever pinned for display and flush on the first pin. Subsequent re-pins
>> will not repeat the clflush but so far I have not observed any glitching
>> after the first pin.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 13 +++++++++++++
>>   drivers/gpu/drm/xe/xe_bo_types.h       | 14 +++++++++-----
>>   2 files changed, 22 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index a32f3603751a..5e7813154733 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -331,6 +331,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>>   	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
>>   	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
>>   	struct xe_bo *bo = gem_to_xe_bo(obj);
>> +	bool first_pin;
>>   	int ret;
>>   
>>   	if (!vma)
>> @@ -362,6 +363,9 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>>   	if (ret)
>>   		goto err;
>>   
>> +	first_pin = !bo->display_pin;
>> +	bo->display_pin = true;
>> +
>>   	if (IS_DGFX(xe))
>>   		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
>>   	else
>> @@ -382,6 +386,15 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>>   
>>   	/* Ensure DPT writes are flushed */
>>   	xe_device_l2_flush(xe);
>> +
>> +	/*
>> +	 * Force flush frame buffer data for non-coherent display access when
>> +	 * AuxCCS formats are used.
>> +	 */
>> +	if (first_pin && !xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo) &&
>> +	    intel_fb_is_ccs_modifier(fb->base.modifier))
>> +		drm_clflush_sg(xe_bo_sg(bo));
>> +
>>   	return vma;
>>   
>>   err_unpin:
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>> index 60c522866500..f518becb78c9 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -67,11 +67,6 @@ struct xe_bo {
>>   	struct llist_node freed;
>>   	/** @update_index: Update index if PT BO */
>>   	int update_index;
>> -	/** @created: Whether the bo has passed initial creation */
>> -	bool created;
>> -
>> -	/** @ccs_cleared */
>> -	bool ccs_cleared;
>>   
>>   	/**
>>   	 * @cpu_caching: CPU caching mode. Currently only used for userspace
>> @@ -80,6 +75,15 @@ struct xe_bo {
>>   	 */
>>   	u16 cpu_caching;
>>   
>> +	/** @created: Whether the bo has passed initial creation */
>> +	bool created : 1;
>> +
>> +	/** @ccs_cleared */
>> +	bool ccs_cleared : 1;
>> +
>> +	/** @display_pin: Was it ever pinned to display */
>> +	bool display_pin : 1;
> 
> Is there any way that we could have this contained within display domains
> instead of spreading display specific things to the core part?

On a mechanical level could put it in struct intel_framebuffer->"was 
this fb ever pinned before". (Assuming fb->bo is invariant for its 
lifetime?) But would that be any better I don't have a strong opinion. 
Perhaps partly because it is currently unknown to be why is this extra 
CPU flush even needed on the first pin. Like which HW component is the 
root cause.

Regards,

Tvrtko

> 
>> +
>>   	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
>>   		struct list_head vram_userfault_link;
>>   
>> -- 
>> 2.48.0
>>

