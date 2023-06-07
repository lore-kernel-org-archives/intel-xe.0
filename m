Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04F1C7EE29
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 10:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE2210E4AF;
	Wed,  7 Jun 2023 10:28:44 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59AB10E4AF;
 Wed,  7 Jun 2023 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686133721; x=1717669721;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yI0oWbhMYjcvha473YTaVqyBUDz+gjTWIegqhBmO3ZI=;
 b=jRSRzeLvWwD3yyvvT22zZbwNK7WUJTUruU1TI2KWtqhGG8k2YWgaRA4w
 7M7UIZmw50WqSRLiURjpQXGEHMCZwTZkjb3R/5zRhRokLZ5lB5LHoQsVA
 rooh10k2FZWCpHPUoTwc5Q+NirWyHkpJirE3hSFuzsbcpmwJKEKaqHJmg
 BrzvS1qbwDGs3Wehc4Jt9vdm45CVFnzIaaOVeeaA6BivjuA27Aetf0s6H
 XdfKRxyEJg3yp4noz4aU9xshaVYkf21jlergRHo8OVEHr6b5f/koj2DYD
 F3rj02GT7qodaYVOHzuT9Z0V3Fsd89TbQ5uJJjK4QGvbI1sjx+BWtyc12 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="359418562"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="359418562"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 03:28:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="774496405"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="774496405"
Received: from unknown (HELO [10.252.4.215]) ([10.252.4.215])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 03:27:43 -0700
Message-ID: <cd537b6b-6d2b-4d9d-4bc1-444e1a1d6d40@intel.com>
Date: Wed, 7 Jun 2023 11:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230602114817.849486-1-matthew.auld@intel.com>
 <20230607095508.xhpireixyx5jxzpj@zkempczy-mobl2>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230607095508.xhpireixyx5jxzpj@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH i-g-t] tests/xe/xe_intel_bb: ensure valid
 next page
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 07/06/2023 10:55, Zbigniew Kempczyński wrote:
> On Fri, Jun 02, 2023 at 12:48:17PM +0100, Matthew Auld wrote:
>> Due to over-fetch, recommendation is to ensure we have a single valid
>> extra page beyond the batch. We currently lack this which seems to
>> explain why xe_intel_bb@full-batch generates CAT errors.
>>
>> Currently we allow using the last GTT page, but this looks to be no-go,
>> since the next page will be beyond the actual GTT, in the case of
>> full-batch. The i915 path looks to already account for this. However
>> even with that fixed, Xe doesn't use scratch pages by default so the
>> next page will still not be valid.
>>
>> With Xe rather expect that callers know about HW over-fetch, ensuring
>> that the batch has an extra page, if needed. Alternatively we could
>> apply the DRM_XE_VM_CREATE_SCRATCH_PAGE when creating the vm, but really
>> we want to get away from such things.
>>
>> Bspec: 60223
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/262
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> I observe this not only on the last page. I've introduced
> 
> index 3cd680072e..ef3f782df7 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -947,7 +947,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>   
>                  /* Limit to 48-bit due to MI_* address limitation */
>                  ibb->gtt_size = 1ull << min_t(uint32_t, xe_va_bits(fd), 48);
> -               end = ibb->gtt_size;
> +               end = ibb->gtt_size - xe_get_default_alignment(fd)*2;
> 
> or even:
> 
> +               end = ibb->gtt_size/2;
> 
> Having:
> 
> ADLP:~/igt-upstream/build/tests# ./xe_intel_bb --run full-batch --debug
> IGT-Version: 1.27.1-NO-GIT (x86_64) (Linux: 6.3.0-xe+ x86_64)
> Opened device: /dev/dri/card0
> (xe_intel_bb:11420) drmtest-DEBUG: Test requirement passed: !(fd<0)
> (xe_intel_bb:11420) intel_bufops-DEBUG: generation: 12, supported tiles: 0x3f, driver: xe
> Starting subtest: full-batch
> (xe_intel_bb:11420) intel_allocator_simple-DEBUG: Using simple allocator
> (xe_intel_bb:11420) intel_batchbuffer-DEBUG: Run on DRM_XE_ENGINE_CLASS_COPY
> (xe_intel_bb:11420) intel_batchbuffer-DEBUG: bind: MAP
> (xe_intel_bb:11420) intel_batchbuffer-DEBUG:   handle: 1, offset: ffffffffd000, size: 1000
> (xe_intel_bb:11420) intel_batchbuffer-DEBUG: bind: UNMAP
> (xe_intel_bb:11420) intel_batchbuffer-DEBUG:   offset: ffffffffd000, size: 1000
> 
> And I still observe failure, what means problem is with prefetching from
> next page, regardless location.

Yeah, AFAICT the CAT error will trigger for any overfetch that hits an 
bogus GTT address. Either because it goes beyond the GTT boundary or 
because the PTE is marked as invalid and we aren't able to fault it in it.

> 
> That means imo umd and any consumer have to overallocate to avoid
> hitting:
> 
> [ 1406.062731] xe 0000:00:02.0: [drm] Engine memory cat error: guc_id=2
> [ 1406.070519] xe 0000:00:02.0: [drm] Timedout job: seqno=4294967169, guc_id=2, flags=0x4
> [ 1406.070535] xe 0000:00:02.0: [drm:xe_devcoredump [xe]] Multiple hangs are occurring, but only the first snapshot was taken
> [ 1406.071182] xe 0000:00:02.0: [drm] Engine reset: guc_id=2
> 
> So from my perspective you've avoided failure but that wasn't my intention
> when I've written this test. Do you maybe know does umd has mitigation
> code which prevents of entering area which starts prefetching from next
> page?

Userspace should be aware of such HW behaviour I think. In Mesa + Xe I 
think it still currently forces scratch pages, but AFAIK they want to 
get rid of that once they are sure that all potential overfetch can't 
trigger CAT errors or similar. If the vm doesn't have scratch pages, 
then I think it's up to userspace to deal with overfetch, and I think 
that must involve inflating the batch size or somehow ensuring the next 
page always has something valid bound.

Do you know if this test is specifically trying to poke at the overfetch 
behaviour, or does this test just want a PAGE_SIZE worth of NOOPS + 
BB_END? I wasn't sure given that currently on DG2/ATS-M the batch is 
always going to be 64K underneath, and so the overfetch is never going 
to find issues on such platforms.

If the test cares specifically about triggering overfetch we could maybe 
enable scratch pages for the vm in full-batch, and on DG2/ATS-M also do 
s/PAGE_SIZE/64K/ or use system memory for the batch. And then ofc ensure 
the last GTT page is never given out. If we later decide to remove 
scratch pages completely in Xe then I guess we just remove the test. 
What do you think?

> 
> --
> Zbigniew
> 
> 
>> ---
>>   lib/intel_batchbuffer.c | 6 ++++++
>>   tests/xe/xe_intel_bb.c  | 8 +++++++-
>>   2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
>> index 3cd680072..035facfc4 100644
>> --- a/lib/intel_batchbuffer.c
>> +++ b/lib/intel_batchbuffer.c
>> @@ -881,6 +881,12 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
>>    * passed in. If this is the case, it copies the information over to the
>>    * newly created batch buffer.
>>    *
>> + * NOTE: On Xe scratch pages are not used by default. Due to over-fetch (~512
>> + * bytes) there might need to be a valid next page to avoid hangs or CAT errors
>> + * if the batch is quite large and approaches the end boundary of the batch
>> + * itself.  Inflate the @size to ensure there is a valid next page in such
>> + * cases.
>> + *
>>    * Returns:
>>    *
>>    * Pointer the intel_bb, asserts on failure.
>> diff --git a/tests/xe/xe_intel_bb.c b/tests/xe/xe_intel_bb.c
>> index 755cc530e..af8462af5 100644
>> --- a/tests/xe/xe_intel_bb.c
>> +++ b/tests/xe/xe_intel_bb.c
>> @@ -952,7 +952,13 @@ static void full_batch(struct buf_ops *bops)
>>   	struct intel_bb *ibb;
>>   	int i;
>>   
>> -	ibb = intel_bb_create(xe, PAGE_SIZE);
>> +	/*
>> +	 * Add an extra page to ensure over-fetch always sees a valid next page,
>> +	 * which includes not going beyond the actual GTT, and ensuring we have
>> +	 * a valid GTT entry, given that on xe we don't use scratch pages by
>> +	 * default.
>> +	 */
>> +	ibb = intel_bb_create(xe, 2 * PAGE_SIZE);
>>   	if (debug_bb)
>>   		intel_bb_set_debug(ibb, true);
>>   
>> -- 
>> 2.40.1
>>
