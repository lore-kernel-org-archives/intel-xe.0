Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945D0C369B2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 09:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5628510E508;
	Mon, 14 Apr 2025 09:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qdvzpDEe";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12F610E508
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Apr 2025 09:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=caxSnH5DYt09nt4s56XQnE/NYIbzWBe3B53Qu9XJcwA=; b=qdvzpDEeKkXxQy/G1NfK/gfoeS
 xJNGvM8CjDRxcnsmf4OjGn6YPWg+PBm+IHgN7HDu1TKnli/rnoqyl/okDZ3nC6Jhxucplwytjv94+
 56c6S8/urVJpUKdZdxzqiCKUGOH61Bwb6rZ0D3jOx4bjfJbhk331fsl+8zgrqKTvPKVtPUDmTmEP0
 QYmkUisH/2rZg4BpJ6RBVFN4TRwlLiwKji40gYryqLFSFY0HKxxuN9sDKEbpdsRk9/20W4peC8PPL
 tLj8txVdNOaWHqHURo1EN4nFLc+OwOuj0kemJEHlZwDd3M6orgA6tlgBwjQtt5AfSstX5xlHrwldy
 Z4WCypxg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u4GMr-00GJ3p-FZ; Mon, 14 Apr 2025 11:44:41 +0200
Message-ID: <c1fb3403-98e3-4230-ac17-bdc3e6e0dd66@igalia.com>
Date: Mon, 14 Apr 2025 10:44:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] drm/xe: Force flush system memory AuxCCS
 framebuffers before scan out
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250403190317.6064-1-tvrtko.ursulin@igalia.com>
 <20250403190317.6064-15-tvrtko.ursulin@igalia.com>
 <Z_AGzT44PmAp9JFk@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <Z_AGzT44PmAp9JFk@intel.com>
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


Hi Ville,

On 04/04/2025 17:20, Ville Syrjälä wrote:
> On Thu, Apr 03, 2025 at 08:03:14PM +0100, Tvrtko Ursulin wrote:
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
> 
> This doesn't make any sense to me. If you need a cflush for this
> then you should need a clflush for all framebuffers.
> 
> So feels like there's some kind of coherency bug somewhere. What
> that would be I'm not sure. Eg. I don't recall there being a separate
> MOCS field for aux. And clearly if you just have to do this for the
> first pin then we must be using correct UC accesses for subsequent
> rendering.

I did not find much sense in it either. Only on extensive 
cross-referencing found that i915 has this one time flush. Whether or 
not it is deliberate or accidental I did not figure out.

> intel_fb_bo_framebuffer_init() also seems to have some hacks for
> the case when the SCANOUT flag wasn't already set at time of
> creation, but it doesn't do anything with caching stuff AFAICS.
> So if you create a bo w/o the SCANOUT flag, dirty the caches,
> and then feed it to the display do you see the cache dirt?

For the flag itself (XE_BO_FLAG_SCANOUT), I also don't see that setting 
it early or late would make a difference.

I tried it out, but also needed to force DRM_XE_GEM_CPU_CACHING_WC when 
creating objects, otherwise IGT will set WB for the BO and try to use UC 
PAT which is the combination xe rejects. With that cache dirt is still 
there, but again, I don't think that changes anything under the hood.

Regards,

Tvrtko

>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 13 +++++++++++++
>>   drivers/gpu/drm/xe/xe_bo_types.h       | 14 +++++++++-----
>>   2 files changed, 22 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index d11a003880dc..13030fd2728a 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -332,6 +332,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>>   	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
>>   	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
>>   	struct xe_bo *bo = gem_to_xe_bo(obj);
>> +	bool first_pin;
>>   	int ret;
>>   
>>   	if (!vma)
>> @@ -363,6 +364,9 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>>   	if (ret)
>>   		goto err;
>>   
>> +	first_pin = !bo->display_pin;
>> +	bo->display_pin = true;
>> +
>>   	if (IS_DGFX(xe))
>>   		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
>>   	else
>> @@ -383,6 +387,15 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
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
>> index 15a92e3d4898..b900cb290b01 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -68,11 +68,6 @@ struct xe_bo {
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
>> @@ -84,6 +79,15 @@ struct xe_bo {
>>   	/** @devmem_allocation: SVM device memory allocation */
>>   	struct drm_gpusvm_devmem devmem_allocation;
>>   
>> +	/** @created: Whether the bo has passed initial creation */
>> +	bool created : 1;
>> +
>> +	/** @ccs_cleared */
>> +	bool ccs_cleared : 1;
>> +
>> +	/** @display_pin: Was it ever pinned to display */
>> +	bool display_pin : 1;
>> +
>>   	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
>>   		struct list_head vram_userfault_link;
>>   
>> -- 
>> 2.48.0
> 

