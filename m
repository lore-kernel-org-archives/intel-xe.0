Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D774AC02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 10:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BE210E2DB;
	Tue,  4 Feb 2025 10:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uu+WqUNF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E925410E2DB
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 10:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738665433; x=1770201433;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4nWhUkYVixYz1G+9rCFdtqM60fgO/47yv6uMlNw5+e4=;
 b=Uu+WqUNF0d0m18sJDK2/OTpV+jO/deNcirBgoAsKyoAaoIJKdv2Qe2wv
 O9uQzrZnMopAqvZKYRXJ2WorXQwtc7TrD7lm4B+nF1Sh+RzSSeUqPbNFh
 IANx+uMQMI10EiptJ2QyOURnLV/7e7CwuirbHadiy/a01o9kgNLT6RFGg
 M7X7KWIBm45ApCYr/kdjHjVXwEmpH4BTCz2+MrQ87dt7Qc3PdrnleaV9B
 /LvMEn1Y4YWRO3EXBMAWgqczMmeI+vbQlVpe5xnZj9/S5yyY0lF1qMvo9
 mcBn8tHs/ezNsNj6jEfCW5zYQeN2FguwAVk4qXfVhl/bsgx4HSHhUq3I0 Q==;
X-CSE-ConnectionGUID: toBS6E5FQCqVyQDkCPuiAA==
X-CSE-MsgGUID: cqaDUR6HSaC/SXW0LiUeKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50180526"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="50180526"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 02:37:13 -0800
X-CSE-ConnectionGUID: f9M0LH4CQ3C3U1ymNWceHQ==
X-CSE-MsgGUID: kV4vzS40SNCI/eWvXesKJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="141443696"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.139])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 02:37:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
In-Reply-To: <xi5ybwn5vzqeoukafh2rbepe5emvotghbp64bz63ofgzhvb736@766j7qcwvis6>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
 <87o6zj6utf.fsf@intel.com>
 <xi5ybwn5vzqeoukafh2rbepe5emvotghbp64bz63ofgzhvb736@766j7qcwvis6>
Date: Tue, 04 Feb 2025 12:37:07 +0200
Message-ID: <87zfj2573g.fsf@intel.com>
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

On Mon, 03 Feb 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Mon, Feb 03, 2025 at 03:07:08PM +0200, Jani Nikula wrote:
>>On Tue, 14 Jan 2025, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
>>> Simplify __xe_pin_fb_vma_dpt() by moving dpt allocation into helper.
>>> This also fixes bug where dpt could have been allocated from system
>>> memory when on dgfx.
>
> I'd also get the fix in place that will also be needed in stable for
> platforms like BMG. Then the second patch to move it to this helper.

Let me clarify, are you asking for changes before merging?


>
>>
>>Cc: Rodrigo, Lucas, Maarten
>>
>>Should this be merged via drm-intel or drm-xe?
>
> I'd say.... if it's possible, through drm-intel since it's under
> display/. However this only uses xe stuff and may have conflict if
> drm-intel is not in sync, so it may need a backmerge from drm-next.
>
> Since it only deals with xe-stuff, landing it through drm-xe should be
> good too.

I'd generally err towards merging all of display through drm-intel, but
just asking as a courtesy here because it only touches xe side of
things.

BR,
Jani.



>
> Lucas De Marchi
>
>>
>>>
>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>> ---
>>>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 67 +++++++++++++++++---------
>>>  1 file changed, 43 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>> index 9fa51b84737c..c28885316986 100644
>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>> @@ -77,6 +77,47 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
>>>  	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>>>  }
>>>
>>> +static struct xe_bo *xe_alloc_dpt_bo(struct xe_device *xe,
>>> +				     struct xe_tile *tile0, u64 size,
>>> +				     u64 physical_alignment)
>>> +{
>>> +	struct xe_bo *dpt;
>>> +
>>> +	/*
>>> +	 * If DGFX: try VRAM0 only
>>> +	 */
>>> +	if (IS_DGFX(xe)) {
>>> +		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>> +						      size, ~0ull,
>>> +						      ttm_bo_type_kernel,
>>> +						      XE_BO_FLAG_VRAM0 |
>>> +						      XE_BO_FLAG_GGTT |
>>> +						      XE_BO_FLAG_PAGETABLE,
>>> +						      physical_alignment);
>>> +	} else {
>>> +		/*
>>> +		 * For IGFX: first try STOLEN. on fail try SYSTEM.
>>> +		 */
>>> +		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>> +						      size, ~0ull,
>>> +						      ttm_bo_type_kernel,
>>> +						      XE_BO_FLAG_STOLEN |
>>> +						      XE_BO_FLAG_GGTT |
>>> +						      XE_BO_FLAG_PAGETABLE,
>>> +						      physical_alignment);
>>> +		if (IS_ERR(dpt)) {
>>> +			dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>> +							      size, ~0ull,
>>> +							      ttm_bo_type_kernel,
>>> +							      XE_BO_FLAG_SYSTEM |
>>> +							      XE_BO_FLAG_GGTT |
>>> +							      XE_BO_FLAG_PAGETABLE,
>>> +							      physical_alignment);
>>> +		}
>>> +	}
>>> +	return dpt;
>>> +}
>>> +
>>>  static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>>>  			       const struct i915_gtt_view *view,
>>>  			       struct i915_vma *vma,
>>> @@ -99,30 +140,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>>>  		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
>>>  				 XE_PAGE_SIZE);
>>>
>>> -	if (IS_DGFX(xe))
>>> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>> -						      dpt_size, ~0ull,
>>> -						      ttm_bo_type_kernel,
>>> -						      XE_BO_FLAG_VRAM0 |
>>> -						      XE_BO_FLAG_GGTT |
>>> -						      XE_BO_FLAG_PAGETABLE,
>>> -						      physical_alignment);
>>> -	else
>>> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>> -						      dpt_size,  ~0ull,
>>> -						      ttm_bo_type_kernel,
>>> -						      XE_BO_FLAG_STOLEN |
>>> -						      XE_BO_FLAG_GGTT |
>>> -						      XE_BO_FLAG_PAGETABLE,
>>> -						      physical_alignment);
>>> -	if (IS_ERR(dpt))
>>> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>> -						      dpt_size,  ~0ull,
>>> -						      ttm_bo_type_kernel,
>>> -						      XE_BO_FLAG_SYSTEM |
>>> -						      XE_BO_FLAG_GGTT |
>>> -						      XE_BO_FLAG_PAGETABLE,
>>> -						      physical_alignment);
>>> +	dpt = xe_alloc_dpt_bo(xe, tile0, dpt_size, physical_alignment);
>>> +
>>>  	if (IS_ERR(dpt))
>>>  		return PTR_ERR(dpt);
>>
>>-- 
>>Jani Nikula, Intel

-- 
Jani Nikula, Intel
