Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADA1C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 09:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2A110E24E;
	Mon, 30 Oct 2023 09:01:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A22010E24E
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 09:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698656496; x=1730192496;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RX02iWSciG3INmqzvKPvI8TDauc2c/OQp2SKhXnpexY=;
 b=LAcN8pp1u+eSj5zl8eyc7qYTXI01ke9A6CK3MjwSpcRfe1htbKUn9IPV
 j7uTAgdPS1D8v+NunfOfMHljB6hbCdodv2mL3EI8g+pRFxQnfC53Hjn4N
 hsLx6iG83bMCwktsdkWYXoQyKCDIk0KInDFRrtC58huoJoKwhiAKeB2I+
 FNcJkb9cQgHwRWfwxhzPT/cy7nq0Lv/cMUqmU8m6Easf1l59hx9qaFc7y
 uwl7PJREJrsB4dCXR2G4FbMkKpcY/C2KOTetVKdT2YyrV6O8+Ys7GR3e+
 1b5lQ+Liznx312dKtq1elHlAyGLFu2jZ/Or1eCZ8u5XmXOxzpjFD0UiBx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="877074"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="877074"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 02:01:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="763854831"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="763854831"
Received: from vishvend-mobl2.ger.corp.intel.com (HELO [10.252.19.8])
 ([10.252.19.8])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 02:01:14 -0700
Message-ID: <14af6ddc-198a-834b-f942-9bc01314c4fd@intel.com>
Date: Mon, 30 Oct 2023 09:01:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231027104810.310819-5-matthew.auld@intel.com>
 <20231027104810.310819-8-matthew.auld@intel.com>
 <e15ddbfe-29e1-1a60-5ff3-44311a96d096@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <e15ddbfe-29e1-1a60-5ff3-44311a96d096@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe/bo: sync kernel fences for KMD
 buffers
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

On 27/10/2023 15:17, Thomas Hellström wrote:
> 
> On 10/27/23 12:48, Matthew Auld wrote:
>> With things like pipelined evictions, VRAM pages can be marked as free
>> and yet still have some active kernel fences, with the idea that the
>> next caller to allocate the memory will respect them. However it looks
>> like we are missing synchronisation for KMD internal buffers, like
>> page-tables, lrc etc. For userspace objects we should already have the
>> required synchronisation for CPU access via the fault handler, and
>> likewise for GPU access when vm_binding them.
>>
>> To fix this synchronise against any kernel fences for all KMD objects at
>> creation. This should resolve some severe corruption seen during
>> evictions.
>>
>> v2 (Matt B):
>>    - Revamp the comment explaining this. Also mention why USAGE_KERNEL is
>>      correct here.
>>
>> Closes: ?
>> Testcase: igt@xe-evict-ccs
>> Reported-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 61789c0e88fb..d8afcae0780f 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1272,6 +1272,27 @@ struct xe_bo *__xe_bo_create_locked(struct 
>> xe_device *xe, struct xe_bo *bo,
>>       else
>>           ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
>> +    /*
>> +     * The VRAM pages underneath are potentially still being accessed 
>> by the
>> +     * GPU, as per async GPU clearing and async evictions. However 
>> TTM makes
>> +     * sure to add any corresponding move/clear fences into the objects
>> +     * dma-resv using the DMA_RESV_USAGE_KERNEL slot.
>> +     *
>> +     * For KMD internal buffers we don't care about GPU clearing, 
>> however we
>> +     * still need to handle async evictions, where the VRAM is still 
>> being
>> +     * accessed by the GPU. Most internal callers are not expecting 
>> this,
>> +     * since they are missing the required synchronisation before 
>> accessing
>> +     * the memory. To keep things simple just sync wait any kernel 
>> fences
>> +     * here, if the buffer is designated KMD internal.
>> +     *
>> +     * For normal userspace objects we should already have the required
>> +     * pipelining or sync waiting elsewhere, since we already have to 
>> deal
>> +     * with things like async GPU clearing.
>> +     */
>> +    if (type == ttm_bo_type_kernel)
>> +        dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
>> +                      false, MAX_SCHEDULE_TIMEOUT);
>> +
> 
> Oh, BTW, we should probably use "ctx->interruptible" instead of "false". 
> That will add a late point-of-failure, but won't be hit very often.

Ah right. Will fix.

> 
> /Thomas
> 
> 
