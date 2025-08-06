Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A3CC87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 14:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F98A10E18A;
	Wed,  6 Aug 2025 14:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DeRDrAsr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2617F10E18A
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 14:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754491540; x=1786027540;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NokR3ZAmpwV0VQhIvBOYenFmlaMfRPVmP4d8fccYYPw=;
 b=DeRDrAsriN+sDqrcVuiQUwQbsGLueuV2CyEXPg4jlVdYFU4rP3IVF/fq
 J8VHevwQ7VzZOdaUExjrFIW+FH6D1bZYzYVE3WpedNI1rhRJ4wUWGhnRo
 RBuiTWEbk3YK5vRsX5Vsed+93MiDyz4zzhzIhd0HBgHwgaATQer1oG6Vu
 nsOhr6+GXEhCKtm1XFS4ahttO7jz0JaMWJug6JXkUL3nMr161brssl6PN
 HB4OE4tbIkkDP2T8/o5qUizZ2/Uwn4ZPChbrsEaeDWdR4hhScEOs5hG//
 BsksRICqBADg6TO9x5N9X4Lt1VttJ6CEvzU55bTC+vh0HMz5vj9Yzo6wV w==;
X-CSE-ConnectionGUID: W3suD0HVT5KibOnDyqUFtA==
X-CSE-MsgGUID: nONloZfhRhGzTlD4bK0Fdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56774918"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56774918"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 07:45:39 -0700
X-CSE-ConnectionGUID: A8/1FhcwQnehAVnn4oKWeg==
X-CSE-MsgGUID: pdYvXdZEQgOLmHAmvJdUyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="170165517"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.172])
 ([10.245.244.172])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 07:45:38 -0700
Message-ID: <ea4e6f59-e09e-4de4-8d65-0f33943d4f8c@intel.com>
Date: Wed, 6 Aug 2025 15:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Defer buffer object shrinker write-backs and
 GPU waits
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: melvyn <melvyn2@dnsense.pub>, Summers Stuart <stuart.summers@intel.com>
References: <20250805074842.11359-1-thomas.hellstrom@linux.intel.com>
 <c4346dd6-ec12-46cc-93c2-7bc3aa16c6c4@intel.com>
 <3e90708318a368704a8aa7aa89682fb3743d7f3f.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <3e90708318a368704a8aa7aa89682fb3743d7f3f.camel@linux.intel.com>
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

On 05/08/2025 17:27, Thomas Hellström wrote:
> On Tue, 2025-08-05 at 14:40 +0100, Matthew Auld wrote:
>> On 05/08/2025 08:48, Thomas Hellström wrote:
>>> When the xe buffer-object shrinker allows GPU waits and write-back,
>>> (typically from kswapd), perform multiple passes, skipping
>>> subsequent passes if the shrinker number of scanned objects target
>>> is reached.
>>>
>>> 1) Without GPU waits and write-back
>>> 2) Without write-back
>>> 3) With both GPU-waits and write-back
>>>
>>> This is to avoid stalls and costly write- and readbacks unless they
>>> are really necessary.
>>>
>>> v2:
>>> - Don't test for scan completion twice. (Stuart Summers)
>>> - Update tags.
>>>
>>> Reported-by: melvyn <melvyn2@dnsense.pub>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5557
>>> Cc: Summers Stuart <stuart.summers@intel.com>
>>> Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
>>> Cc: <stable@vger.kernel.org> # v6.15+
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_shrinker.c | 51
>>> +++++++++++++++++++++++++++++---
>>>    1 file changed, 47 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
>>> b/drivers/gpu/drm/xe/xe_shrinker.c
>>> index 1c3c04d52f55..90244fe59b59 100644
>>> --- a/drivers/gpu/drm/xe/xe_shrinker.c
>>> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
>>> @@ -54,10 +54,10 @@ xe_shrinker_mod_pages(struct xe_shrinker
>>> *shrinker, long shrinkable, long purgea
>>>    	write_unlock(&shrinker->lock);
>>>    }
>>>    
>>> -static s64 xe_shrinker_walk(struct xe_device *xe,
>>> -			    struct ttm_operation_ctx *ctx,
>>> -			    const struct xe_bo_shrink_flags flags,
>>> -			    unsigned long to_scan, unsigned long
>>> *scanned)
>>> +static s64 __xe_shrinker_walk(struct xe_device *xe,
>>> +			      struct ttm_operation_ctx *ctx,
>>> +			      const struct xe_bo_shrink_flags
>>> flags,
>>> +			      unsigned long to_scan, unsigned long
>>> *scanned)
>>>    {
>>>    	unsigned int mem_type;
>>>    	s64 freed = 0, lret;
>>> @@ -93,6 +93,48 @@ static s64 xe_shrinker_walk(struct xe_device
>>> *xe,
>>>    	return freed;
>>>    }
>>>    
>>> +/*
>>> + * Try shrinking idle objects without writeback first, then if not
>>> sufficient,
>>> + * try also non-idle objects and finally if that's not sufficient
>>> either,
>>> + * add writeback. This avoids stalls and explicit writebacks with
>>> light or
>>> + * moderate memory pressure.
>>
>> Just one question here, with writeback=false it doesn't really
>> influence
>> which objects are chosen for shrinking, unlike with no_wait_gpu,
>> right?
>> Will having another pass just with writeback=true yield anything
>> different, assuming here that the previous two passes would have
>> already
>> hoovered ~everything up that was a possible candidate, so this pass
>> won't really find anything in practice? If so, does that also mean we
>> never really end up using the writeback=true behaviour any more?
> 
> Good point.
> 
> The assumption is that if allocating shmem backing-store fails during
> shrinking, we'd see an -ENOMEM and fail our target, and the next pass
> with writeback would help avoiding that.

Ah right, since on completion of writeback it would then allow giving 
back the folio/page straight away? So it's hopefully only in obscure 
cases where you might re-trigger ENOMEM on writeback=true, where setting 
writeback earlier could have helped?

> 
> Ofc that requires that a shmem_read_folio() from within reclaim returns
> an ERR_PTR(-ENOMEM) if the kernel reserves are depleted rather than to
> invoke the OOM killer. I should perhaps test that.
> 
> Other options would ofc be to include the writeback in pass 2, which
> would be similar to what the i915 shrinker does.
> 
> Thoughts?

Potentially merging with pass 2 sounds reasonable to me, if with that 
change it still helps the user. But not a blocker or anything, I was 
more just curious from my end.

> 
> Thanks,
> Thomas
> 
> 
> 
>>
>>> + */
>>> +static s64 xe_shrinker_walk(struct xe_device *xe,
>>> +			    struct ttm_operation_ctx *ctx,
>>> +			    const struct xe_bo_shrink_flags flags,
>>> +			    unsigned long to_scan, unsigned long
>>> *scanned)
>>> +{
>>> +	bool no_wait_gpu = true;
>>> +	struct xe_bo_shrink_flags save_flags = flags;
>>> +	s64 lret, freed;
>>> +
>>> +	swap(no_wait_gpu, ctx->no_wait_gpu);
>>> +	save_flags.writeback = false;
>>> +	lret = __xe_shrinker_walk(xe, ctx, save_flags, to_scan,
>>> scanned);
>>> +	swap(no_wait_gpu, ctx->no_wait_gpu);
>>> +	if (lret < 0 || *scanned >= to_scan)
>>> +		return lret;
>>> +
>>> +	freed = lret;
>>> +	if (!ctx->no_wait_gpu) {
>>> +		lret = __xe_shrinker_walk(xe, ctx, save_flags,
>>> to_scan, scanned);
>>> +		if (lret < 0)
>>> +			return lret;
>>> +		freed += lret;
>>> +		if (*scanned >= to_scan)
>>> +			return freed;
>>> +	}
>>> +
>>> +	if (flags.writeback) {
>>> +		lret = __xe_shrinker_walk(xe, ctx, flags, to_scan,
>>> scanned);
>>> +		if (lret < 0)
>>> +			return lret;
>>> +		freed += lret;
>>> +	}
>>> +
>>> +	return freed;
>>> +}
>>> +
>>>    static unsigned long
>>>    xe_shrinker_count(struct shrinker *shrink, struct shrink_control
>>> *sc)
>>>    {
>>> @@ -199,6 +241,7 @@ static unsigned long xe_shrinker_scan(struct
>>> shrinker *shrink, struct shrink_con
>>>    		runtime_pm = xe_shrinker_runtime_pm_get(shrinker,
>>> true, 0, can_backup);
>>>    
>>>    	shrink_flags.purge = false;
>>> +
>>>    	lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
>>>    				nr_to_scan, &nr_scanned);
>>>    	if (lret >= 0)
>>
> 

