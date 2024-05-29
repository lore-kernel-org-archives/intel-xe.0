Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362AAC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 11:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFDA112EC5;
	Wed, 29 May 2024 11:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfyqLgCe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF3A112EC5
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716981943; x=1748517943;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KRv97oGG9DqIYhpUnJ7akjC9boZJtItC0q70lQfSTTo=;
 b=jfyqLgCeUZsgyJQrzUM2FFmJiS3S9EyjjlGDJX2E72vECGz7dTkvgd52
 Q3TmocBpULk7rqarBa46bSTBGHTMH6Pz5wJgjSoJMwhr2DbSqSnm3bI3Y
 WxoCnw++I4CPFq4Qy6X6FfMPVDctZp+dmDhUDbQwKvLGCNUvOLSCUSl7I
 oLjWSlhQW0fPPSO7TyQ+Q0fNJft8MuTNsu5gSD4AewVKHsiK5Xe5JAZBV
 xU2QEGT7k6LV9BQiGOjnHZBYNHgqsNHbIko9jFE9w5Ud3MYB6Q9blcCCM
 vnk1jHAYj7rU+f6kzCjAwvF/41RhMh1KGdbUll1wklb/nDXC4w4bhQtVB Q==;
X-CSE-ConnectionGUID: /nGdJeCbTXGAQCt0KwmHNg==
X-CSE-MsgGUID: gEq+eScUSGq0SO0ViZ+VKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13506399"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13506399"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 04:25:42 -0700
X-CSE-ConnectionGUID: jr/Xr1SkSHOrpSdHVz/IwA==
X-CSE-MsgGUID: 1muTUeSjTTuPw6CB1eYq9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35377482"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 29 May 2024 04:25:33 -0700
Received: from [10.245.119.62] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.119.62])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id AE79627BB3;
 Wed, 29 May 2024 12:25:23 +0100 (IST)
Message-ID: <46164a96-f72c-4991-a41d-eea299540d75@intel.com>
Date: Wed, 29 May 2024 13:25:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/xe: Rename internal vram helper function
To: Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
 <20240527173554.1108-5-michal.wajdeczko@intel.com>
 <20240528213515.GI4990@mdroper-desk1.amr.corp.intel.com>
 <ZlZXaouXdtj852Aq@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZlZXaouXdtj852Aq@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
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

++ maintainers

On 29.05.2024 00:15, Matthew Brost wrote:
> On Tue, May 28, 2024 at 02:35:15PM -0700, Matt Roper wrote:
>> On Mon, May 27, 2024 at 07:35:53PM +0200, Michal Wajdeczko wrote:
>>> Drop no longer applicable "xe_mmio_" prefix and downgrade the
>>> existing kernel-doc for internal function to normal comment.
>>
>> As noted on the previous patch, there are several other functions with
>> "xe_" prefixes even though they're static (xe_resize_vram_bar,
>> xe_pci_resource_valid, xe_determine_lmem_bar_size, and the
>> xe_mmio_tile_vram_size you're updating here).  Maybe we should drop the
>> "xe_" prefix from all of them (and "xe_mmio" from this one) before the
>> movement of VRAM code to a new file?

agree on doing all renames for consistency, but this time I just didn't
want to make too many cleanups in one shot, my focus was to do clear
code separation first

>>
> 
> We have talked about this before and I think the consensous was "xe_"
> prefixes for static functions are fine, perhaps even desired. I can't

IMO use of "xe_foo" prefix for static functions is inconsistent (as its
name suggests that it is public function while OTOH it is declared as
static) and may mislead that it could be used in other compilation unit.

thus use of "xe_" (for static) should be rather discouraged but also at
the same time it shouldn't be treated as showstopper (with the hope
better name will be provided later)

> find a reference but I do recall a discussion on the list about this.
> 
> I think the maintainers should make / document a rule wrt to "xe_"
> prefixes before we start making changes in this area as it is not clear.

before we start writing rules for static functions, better to focus only
on rules for public naming convention for the components, like:

files:
	GOOD
		xe_foo.ch
		xe_foo_types.h
		xe_foo_helpers.h
	FINE
		xe_gt_foo.ch
	BAD
		foo.ch

types:
	GOOD
		struct xe_foo_xxx
		enum xe_foo_yyy
		typedef xe_foo_zzz
	BAD
		struct foo
		struct xe_bar

functions:
	GOOD
		xe_foo_bar(struct xe_foo *foo, ...)
	FINE
		xe_foo_bar(struct xe_device *xe, ...)
		xe_gt_foo_bar(struct xe_gt *gt, ...)
	BAD
		xe_foo_bar(..., struct xe_foo *foo)
		xe_bar_foo(struct xe_foo *foo, ...)

> 
> Matt
> 
>>
>> Matt
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_vram.c | 12 ++++++------
>>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>>> index d8b81e4e050c..411e8d23fd4d 100644
>>> --- a/drivers/gpu/drm/xe/xe_vram.c
>>> +++ b/drivers/gpu/drm/xe/xe_vram.c
>>> @@ -192,8 +192,8 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
>>>  	return offset;
>>>  }
>>>  
>>> -/**
>>> - * xe_mmio_tile_vram_size() - Collect vram size and offset information
>>> +/*
>>> + * tile_vram_size() - Collect vram size and offset information
>>>   * @tile: tile to get info for
>>>   * @vram_size: available vram (size - device reserved portions)
>>>   * @tile_size: actual vram size
>>> @@ -211,8 +211,8 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
>>>   * NOTE: multi-tile bases will include the tile offset.
>>>   *
>>>   */
>>> -static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>>> -				  u64 *tile_size, u64 *tile_offset)
>>> +static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>>> +			  u64 *tile_size, u64 *tile_offset)
>>>  {
>>>  	struct xe_device *xe = tile_to_xe(tile);
>>>  	struct xe_gt *gt = tile->primary_gt;
>>> @@ -287,7 +287,7 @@ int xe_vram_probe(struct xe_device *xe)
>>>  
>>>  	/* Get the size of the root tile's vram for later accessibility comparison */
>>>  	tile = xe_device_get_root_tile(xe);
>>> -	err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
>>> +	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
>>>  	if (err)
>>>  		return err;
>>>  
>>> @@ -302,7 +302,7 @@ int xe_vram_probe(struct xe_device *xe)
>>>  
>>>  	/* tile specific ranges */
>>>  	for_each_tile(tile, xe, id) {
>>> -		err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
>>> +		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
>>>  		if (err)
>>>  			return err;
>>>  
>>> -- 
>>> 2.43.0
>>>
>>>
>>
>> -- 
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation
