Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6272560A5BCE
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 15:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=Vl7OoGo8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DD110E5A6;
	Thu, 19 Nov 2026 15:47:26 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249221125CD
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1795103237;
 bh=blmw5J6at4FDWPW+IU49GPxf+guv8HANTk38ggmfMmc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Vl7OoGo8LbsmznwUrm3yLWxeYjvBD69UARVzVOP0Md+TVGjUKTQpy6wAnLVtvmzk6
 u1xwYfE+vpRNM2nWcTndEG6Z5NOc/poyojatfF262isTtISXH+cCBo2XdvaWfT00ur
 4UXhjq9Vjck9aAdfE8I7sggPmmlkUH7kqYf5Pqb9IJ6u1WyXX9FLUB84ySIvd0e+5s
 ZrUbfqSuXMjQXFD52nMUf2qYaxcFH5BOtHikZSyYdAGZ4eKwMUbDd3sFAGps7f5vIm
 pzMuzTZhcehssDfsdh9hKNCQWisIWawQsC5hAun9xVr2Qu28ihiW/9mUt9DRGawTbR
 U30uhm5Q5GhaA==
Message-ID: <4fdec542-ca17-4b16-bed3-85c5b650b9cf@lankhorst.se>
Date: Thu, 19 Nov 2026 16:47:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] drm/xe/ggtt: Add xe_ggtt_reserve_area
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20261116122828.266113-8-dev@lankhorst.se>
 <20261116122828.266113-9-dev@lankhorst.se> <av4GBGvSkQttjqfn@intel.com>
 <1719eff8-784a-41f4-904c-bd821eda0ff3@lankhorst.se>
 <av7-R6YyAeyJdseW@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <av7-R6YyAeyJdseW@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/19/26 14:48, Ville Syrjälä wrote:
> On Thu, Nov 19, 2026 at 12:59:55PM +0100, Maarten Lankhorst wrote:
>> Hey,
>>
>> On 11/18/26 21:09, Ville Syrjälä wrote:
>>> On Mon, Nov 16, 2026 at 01:28:30PM +0100, Maarten Lankhorst wrote:
>>>> Create a new function xe_ggtt_reserve_area() which will be used
>>>> for reserving the part of GGTT where the initial framebuffer was
>>>> allocated, while ensuring the reservation fits within mappable
>>>> GGTT boundaries.
>>>>
>>>> This will allow us to either take over the initial mapping, or
>>>> reserve it to have the newly allocated GGTT mapping not overwriting
>>>> the initial mapping, which would cause flickering.
>>>>
>>>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_ggtt.c | 69 +++++++++++++++++++++++++++++++++---
>>>>  drivers/gpu/drm/xe/xe_ggtt.h |  2 ++
>>>>  2 files changed, 67 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>>>> index 9ef2ce743770f..ca38d51f41441 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>>>> @@ -681,14 +681,17 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
>>>>  }
>>>>  
>>>>  /**
>>>> - * xe_ggtt_insert_node - Insert a &xe_ggtt_node into the GGTT
>>>> + * xe_ggtt_insert_node_at - Insert a &xe_ggtt_node into the GGTT
>>>>   * @ggtt: the &xe_ggtt into which the node should be inserted.
>>>>   * @size: size of the node
>>>>   * @align: alignment constrain of the node
>>>> + * @start: Starting offset of range to insert node
>>>> + * @end: Last offset for node insertion
>>>>   *
>>>>   * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
>>>>   */
>>>> -struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
>>>> +static struct xe_ggtt_node *xe_ggtt_insert_node_at(struct xe_ggtt *ggtt, u32 size,
>>>> +						   u32 align, u64 start, u64 end)
>>>>  {
>>>>  	struct xe_ggtt_node *node;
>>>>  	int ret;
>>>> @@ -698,8 +701,19 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
>>>>  		return node;
>>>>  
>>>>  	guard(mutex)(&ggtt->lock);
>>>> -	ret = xe_ggtt_insert_node_locked(node, size, align,
>>>> -					 DRM_MM_INSERT_HIGH);
>>>> +	if (start >= ggtt->start)
>>>> +		start -= ggtt->start;
>>>> +	else
>>>> +		start = 0;
>>>> +
>>>> +	/* Should never happen, but since we handle start, fail graciously for end */
>>>> +	if (end >= ggtt->start)
>>>> +		end -= ggtt->start;
>>>> +	else
>>>> +		end = 0;
>>>> +
>>>> +	ret = drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align,
>>>> +					  0, start, end, DRM_MM_INSERT_HIGH);
>>>>  	if (ret) {
>>>>  		ggtt_node_fini(node);
>>>>  		return ERR_PTR(ret);
>>>> @@ -708,6 +722,53 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
>>>>  	return node;
>>>>  }
>>>>  
>>>> +/**
>>>> + * xe_ggtt_reserve_area - Ensure an area of the GGTT is reserved.
>>>> + * @ggtt: the &xe_ggtt where the area should be reserved.
>>>> + * @start: Starting offset of range to reserve
>>>> + * @size: size of the reservation
>>>> + *
>>>> + * This function ensures the area of [start...start+size)
>>>> + * is reserved, while taking care of any clipping due to start or start+size
>>>> + * falling outside of the adressable GGTT. The size of the returned node may
>>>> + * be smaller if part of the region falls outside the accessible GGTT, or a
>>>> + * NULL node may be returned.
>>>> + *
>>>> + * Return: &xe_ggtt_node or NULL on success or a ERR_PTR on failure.
>>>> + */
>>>> +struct xe_ggtt_node *xe_ggtt_reserve_area(struct xe_ggtt *ggtt, u32 base, u32 size)
>>>> +{
>>>> +	u64 ggtt_start = xe_ggtt_start(ggtt), ggtt_end = ggtt_start + xe_ggtt_size(ggtt);
>>>> +
>>>> +	/* Completely truncated? */
>>>> +	if (base + size <= ggtt_start || base >= ggtt_end)
>>>> +		return NULL;
>>>> +
>>>> +	/* Partially truncated? */
>>>> +	if (base <= ggtt_start) {
>>>> +		size -= ggtt_start - base;
>>>> +		base = ggtt_start;
>>>> +	}
>>>> +
>>>> +	if (base + size >= ggtt_end)
>>>> +		size = ggtt_end - base;
>>>
>>> We seem to be doing the same chop both here and in
>>> xe_ggtt_insert_node_at(). Isn't one place enough?
>> They're complementary, and there for different reasons.
>>
>> The math in node_at() converts the raw ggtt addresses from [0...full_ggtt_size) to the
>> range of [0...ggtt_size) in drm_mm_init.
>>
>> The truncation in reserve_area is there to physically adjust the size
>> to fit inside a valid area, or return a NULL node if it's entirely outside it.
> 
> I find the whole thing rather confusing. So what we're saying here is
> that xe_ggtt_insert_node_at() start/end parameters are to be specified 
> in terms of the full hw ggtt range. And if other users would like to
> call it, they will potentially have to do the drm_mm->hw range conversion
> before calling it. If we leave it like this, then I think it really
> needs to be documented to avoid people shooting themselves in to foot.
> xe_ggtt_reserve_area() docs should also clearly point out that it 
> operates on the full hw ggtt range. Right now it's only implied
> by the statement about clipping.
> 

I think you misunderstand.

When run with SR-IOV VF, the whole GGTT can be moved if the PF suspends,
and resumes at a different offset.

This means that ggtt->start is flexible, and can be changed,
see xe_ggtt_node_addr:

u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
{
	/* pairs with WRITE_ONCE in xe_ggtt_shift_nodes() */
	return node->base.start + READ_ONCE(node->ggtt->start);
}

What you pass to insert_node_at is in *absolute* GGTT coordinates,
but are shifted to *relative* coordinates with offset 0 = ggtt->start.

reserve_area also takes absolute GGTT coordinates, but clips them to fit
inside the area between ggtt->start and end of ggtt. Unlike node_at,
it adjusts size to fit since it is only meant to prevent the area
[start...start+size) from being overwritten. If it's outside the
normally reserved area, this will never happen at all so it is shrunk.

>>
>>>
>>> Sashiko's comments about the 32bit overflow seem potentially valid
>>> to me. I don't recall how high in the ggtt the GOP now places the
>>> FB, but if it's at the very top, and there is no extra padding then
>>> we could have the FB extend all the way to the 4 GiB mark.
>>>
>>> We also have a 32bit 'plane_config->base + plane_config->size' in
>>> both i915 and xe initial plane code, where that overflow would also
>>> hit us.
>>>
>>>> +
>>>> +	return xe_ggtt_insert_node_at(ggtt, size, XE_PAGE_SIZE, base, base + size);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_ggtt_insert_node - Insert a &xe_ggtt_node into the GGTT
>>>> + * @ggtt: the &xe_ggtt into which the node should be inserted.
>>>> + * @size: size of the node
>>>> + * @align: alignment constrain of the node
>>>> + *
>>>> + * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
>>>> + */
>>>> +struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
>>>> +{
>>>> +	return xe_ggtt_insert_node_at(ggtt, size, align, 0, ~0ULL);
>>>> +}
>>>> +
>>>>  /**
>>>>   * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
>>>>   * @node: the &xe_ggtt_node
>>>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>>>> index c864cc975a695..15e62ecec2287 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>>>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>>>> @@ -22,6 +22,8 @@ void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_base);
>>>>  u64 xe_ggtt_start(struct xe_ggtt *ggtt);
>>>>  u64 xe_ggtt_size(struct xe_ggtt *ggtt);
>>>>  
>>>> +struct xe_ggtt_node *
>>>> +xe_ggtt_reserve_area(struct xe_ggtt *ggtt, u32 base, u32 size);
>>>>  struct xe_ggtt_node *
>>>>  xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
>>>>  struct xe_ggtt_node *
>>>> -- 
>>>> 2.55.0
>>>
> 

