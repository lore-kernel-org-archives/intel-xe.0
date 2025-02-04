Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C25C02196
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 15:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EB410E159;
	Tue,  4 Feb 2025 15:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3vBhFnp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E6510E159
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 15:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738681867; x=1770217867;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FKXp7Z1sMQLN5mTrquvYp8CpyYDQO/KQseIiqYop6rY=;
 b=h3vBhFnpq9IxXggDyvOXGZFHvCKP0ZoBU7Mrz9oIUAyDz2abmuijJJBM
 xByewe1ROyu5aOJM6E1GPKjALE+9W5kmdR4K3rAdpm8o8vbn78IWTYl9q
 8RUalWKgt+nc0sZykS92hweDgUQJUWX10l4Py4RI11ihHj5fcut73D6Q7
 yaVRH5JX7DKPXg2bUtObK9pnW99O8UEMAoIsoBNGCPc99bHFMlpsKHE6Y
 V5L6QA8/kJYxe6UDLw6FQGihVGxGaOnTfw9TI3QGoGC390270H72fZV1K
 B8vCMnxKfIaDo0Oc+2ZUUnv4kU4K+3nyCcywhrskV4CmAp+FHOelTXvRe Q==;
X-CSE-ConnectionGUID: Ys6LVwebRh6qLaByG6CP4g==
X-CSE-MsgGUID: YVbkOpO5RRaQYQ3WALxRMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39244389"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39244389"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 07:11:06 -0800
X-CSE-ConnectionGUID: s2ffjI+/Qnej2akyF561HQ==
X-CSE-MsgGUID: l8gBTQJzRImTGJZPEty3Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="110500688"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.139])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 07:11:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
In-Reply-To: <iqfwraitkhmzhjiga2vfwwgqwlcawdbksmde2oqggh5rl5mzap@jrwrmzlk6x5b>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
 <87o6zj6utf.fsf@intel.com>
 <xi5ybwn5vzqeoukafh2rbepe5emvotghbp64bz63ofgzhvb736@766j7qcwvis6>
 <87zfj2573g.fsf@intel.com>
 <iqfwraitkhmzhjiga2vfwwgqwlcawdbksmde2oqggh5rl5mzap@jrwrmzlk6x5b>
Date: Tue, 04 Feb 2025 17:11:00 +0200
Message-ID: <87ldul68zf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 04 Feb 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Tue, Feb 04, 2025 at 12:37:07PM +0200, Jani Nikula wrote:
>>On Mon, 03 Feb 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> On Mon, Feb 03, 2025 at 03:07:08PM +0200, Jani Nikula wrote:
>>>>On Tue, 14 Jan 2025, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
>>>>> Simplify __xe_pin_fb_vma_dpt() by moving dpt allocation into helper.
>>>>> This also fixes bug where dpt could have been allocated from system
>>>>> memory when on dgfx.
>>>
>>> I'd also get the fix in place that will also be needed in stable for
>>> platforms like BMG. Then the second patch to move it to this helper.
>>
>>Let me clarify, are you asking for changes before merging?
>
> the reply I gave was very confusing, sorry. What I meant is that there
> are 2 things here:
>
> 1) A fix, so it doesn't try to to allocate dpt from system memory on
> dgfx
> 2) Move the code to a separate function.
>
> For backporting to stable we'd only need (1), which is trivial, rather
> than also needing (2) which may have more conflicts.
>
> I'll leave that up to you to decide though.

Now there's also the conversation with Tvrtko, and I've lost track
whether this should be merged at all. ;D

J.



>
>>
>>
>>>
>>>>
>>>>Cc: Rodrigo, Lucas, Maarten
>>>>
>>>>Should this be merged via drm-intel or drm-xe?
>>>
>>> I'd say.... if it's possible, through drm-intel since it's under
>>> display/. However this only uses xe stuff and may have conflict if
>>> drm-intel is not in sync, so it may need a backmerge from drm-next.
>>>
>>> Since it only deals with xe-stuff, landing it through drm-xe should be
>>> good too.
>>
>>I'd generally err towards merging all of display through drm-intel, but
>>just asking as a courtesy here because it only touches xe side of
>>things.
>
> yeah, I think it makes sense to prefer drm-intel. Ack for that.
>
>
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>
> Lucas De Marchi
>
>>
>>BR,
>>Jani.
>>
>>
>>
>>>
>>> Lucas De Marchi
>>>
>>>>
>>>>>
>>>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>>> ---
>>>>>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 67 +++++++++++++++++---------
>>>>>  1 file changed, 43 insertions(+), 24 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>> index 9fa51b84737c..c28885316986 100644
>>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>> @@ -77,6 +77,47 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
>>>>>  	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>>>>>  }
>>>>>
>>>>> +static struct xe_bo *xe_alloc_dpt_bo(struct xe_device *xe,
>>>>> +				     struct xe_tile *tile0, u64 size,
>>>>> +				     u64 physical_alignment)
>>>>> +{
>>>>> +	struct xe_bo *dpt;
>>>>> +
>>>>> +	/*
>>>>> +	 * If DGFX: try VRAM0 only
>>>>> +	 */
>>>>> +	if (IS_DGFX(xe)) {
>>>>> +		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>>> +						      size, ~0ull,
>>>>> +						      ttm_bo_type_kernel,
>>>>> +						      XE_BO_FLAG_VRAM0 |
>>>>> +						      XE_BO_FLAG_GGTT |
>>>>> +						      XE_BO_FLAG_PAGETABLE,
>>>>> +						      physical_alignment);
>>>>> +	} else {
>>>>> +		/*
>>>>> +		 * For IGFX: first try STOLEN. on fail try SYSTEM.
>>>>> +		 */
>>>>> +		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>>> +						      size, ~0ull,
>>>>> +						      ttm_bo_type_kernel,
>>>>> +						      XE_BO_FLAG_STOLEN |
>>>>> +						      XE_BO_FLAG_GGTT |
>>>>> +						      XE_BO_FLAG_PAGETABLE,
>>>>> +						      physical_alignment);
>>>>> +		if (IS_ERR(dpt)) {
>>>>> +			dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>>> +							      size, ~0ull,
>>>>> +							      ttm_bo_type_kernel,
>>>>> +							      XE_BO_FLAG_SYSTEM |
>>>>> +							      XE_BO_FLAG_GGTT |
>>>>> +							      XE_BO_FLAG_PAGETABLE,
>>>>> +							      physical_alignment);
>>>>> +		}
>>>>> +	}
>>>>> +	return dpt;
>>>>> +}
>>>>> +
>>>>>  static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>>>>>  			       const struct i915_gtt_view *view,
>>>>>  			       struct i915_vma *vma,
>>>>> @@ -99,30 +140,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>>>>>  		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
>>>>>  				 XE_PAGE_SIZE);
>>>>>
>>>>> -	if (IS_DGFX(xe))
>>>>> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>>> -						      dpt_size, ~0ull,
>>>>> -						      ttm_bo_type_kernel,
>>>>> -						      XE_BO_FLAG_VRAM0 |
>>>>> -						      XE_BO_FLAG_GGTT |
>>>>> -						      XE_BO_FLAG_PAGETABLE,
>>>>> -						      physical_alignment);
>>>>> -	else
>>>>> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>>> -						      dpt_size,  ~0ull,
>>>>> -						      ttm_bo_type_kernel,
>>>>> -						      XE_BO_FLAG_STOLEN |
>>>>> -						      XE_BO_FLAG_GGTT |
>>>>> -						      XE_BO_FLAG_PAGETABLE,
>>>>> -						      physical_alignment);
>>>>> -	if (IS_ERR(dpt))
>>>>> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>>> -						      dpt_size,  ~0ull,
>>>>> -						      ttm_bo_type_kernel,
>>>>> -						      XE_BO_FLAG_SYSTEM |
>>>>> -						      XE_BO_FLAG_GGTT |
>>>>> -						      XE_BO_FLAG_PAGETABLE,
>>>>> -						      physical_alignment);
>>>>> +	dpt = xe_alloc_dpt_bo(xe, tile0, dpt_size, physical_alignment);
>>>>> +
>>>>>  	if (IS_ERR(dpt))
>>>>>  		return PTR_ERR(dpt);
>>>>
>>>>--
>>>>Jani Nikula, Intel
>>
>>-- 
>>Jani Nikula, Intel

-- 
Jani Nikula, Intel
