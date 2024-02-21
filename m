Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCE2C48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 19:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD1010E10D;
	Wed, 21 Feb 2024 19:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LuTNXwuz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F8210E10D
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 19:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708543653; x=1740079653;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=5zS0weGusQT4fpeAcsLN5TGPqG66sKcHcDC4KVcBaSI=;
 b=LuTNXwuzkqSW9EtUOogqxNCK3WHN0NfHQmmq+2WkT2Pfm9ZVwdc889Ii
 cQ/WGmvx4OaYLvi+wlts9V69L8Y8zAjF9qvPtRSH3eqxtK8XyprpsqT+7
 Lq+YRXDQaEctzRR6+YoX8Ku4lENdrv5DRiMMBBMRVl22D8w8RKgRUveS2
 sHc54FLyguqObpgP+w7qt/fsVurHCBpTooC07hzExhqmtaKQbKyICOuMm
 /5RWzho4JpZ7Ik5OW4c56M5KJ4ALZskmENZjja8ocX3qjFYb6/WSPlkVc
 W0tf7RFfKcSuSWKJg83Xm6fIOsZUU+buSA+ph7HsL+VRoWwT/wZC/khvI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13429128"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="13429128"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 11:27:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5532728"
Received: from pruslan-mobl1.ger.corp.intel.com (HELO [10.252.45.219])
 ([10.252.45.219])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 11:27:31 -0800
Message-ID: <c70a43f5-2813-48f1-b813-ed2c383f3828@linux.intel.com>
Date: Wed, 21 Feb 2024 20:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/9] drm/xe: Move lrc snapshot capturing to xe_lrc.c
Content-Language: en-US
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240221133024.898315-1-maarten.lankhorst@linux.intel.com>
 <20240221133024.898315-7-maarten.lankhorst@linux.intel.com>
 <436f229b67e7120c7fd35ca100059e94837fba12.camel@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <436f229b67e7120c7fd35ca100059e94837fba12.camel@intel.com>
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

Hey,

On 2024-02-21 18:56, Souza, Jose wrote:
> On Wed, 2024-02-21 at 14:30 +0100, Maarten Lankhorst wrote:
>> This allows the dumping of HWSP and HW Context without exporting more
>> functions.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c       | 33 ++++++-----------
>>   drivers/gpu/drm/xe/xe_guc_submit_types.h | 13 +------
>>   drivers/gpu/drm/xe/xe_lrc.c              | 45 ++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_lrc.h              |  4 +++
>>   drivers/gpu/drm/xe/xe_lrc_types.h        |  2 ++
>>   5 files changed, 63 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index ff77bc8da1b27..7348689ec5aef 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1814,21 +1814,14 @@ xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job)
>>   	snapshot->sched_props.preempt_timeout_us =
>>   		q->sched_props.preempt_timeout_us;
>>   
>> -	snapshot->lrc = kmalloc_array(q->width, sizeof(struct lrc_snapshot),
>> +	snapshot->lrc = kmalloc_array(q->width, sizeof(struct xe_lrc_snapshot *),
>>   				      GFP_ATOMIC);
>>   
>>   	if (snapshot->lrc) {
>>   		for (i = 0; i < q->width; ++i) {
>>   			struct xe_lrc *lrc = q->lrc + i;
>>   
>> -			snapshot->lrc[i].context_desc =
>> -				lower_32_bits(xe_lrc_ggtt_addr(lrc));
>> -			snapshot->lrc[i].head = xe_lrc_ring_head(lrc);
>> -			snapshot->lrc[i].tail.internal = lrc->ring.tail;
>> -			snapshot->lrc[i].tail.memory =
>> -				xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
>> -			snapshot->lrc[i].start_seqno = xe_lrc_start_seqno(lrc);
>> -			snapshot->lrc[i].seqno = xe_lrc_seqno(lrc);
>> +			snapshot->lrc[i] = xe_lrc_snapshot_capture(lrc);
>>   		}
>>   	}
>>   
>> @@ -1894,18 +1887,9 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>>   	drm_printf(p, "\tPreempt timeout: %u (us)\n",
>>   		   snapshot->sched_props.preempt_timeout_us);
>>   
>> -	for (i = 0; snapshot->lrc && i < snapshot->width; ++i) {
>> -		drm_printf(p, "\tHW Context Desc: 0x%08x\n",
>> -			   snapshot->lrc[i].context_desc);
>> -		drm_printf(p, "\tLRC Head: (memory) %u\n",
>> -			   snapshot->lrc[i].head);
>> -		drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
>> -			   snapshot->lrc[i].tail.internal,
>> -			   snapshot->lrc[i].tail.memory);
>> -		drm_printf(p, "\tStart seqno: (memory) %d\n",
>> -			   snapshot->lrc[i].start_seqno);
>> -		drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->lrc[i].seqno);
>> -	}
>> +	for (i = 0; snapshot->lrc && i < snapshot->width; ++i)
>> +		xe_lrc_snapshot_print(snapshot->lrc[i], p);
>> +
>>   	drm_printf(p, "\tSchedule State: 0x%x\n", snapshot->schedule_state);
>>   	drm_printf(p, "\tFlags: 0x%lx\n", snapshot->exec_queue_flags);
> 
> can you please print this before xe_lrc_snapshot_print()? to make the file easier to read.
Yeah, will do so.

I've pushed patches 1-6, that should at least be in time for merge 
window closing now.

Cheers,
~Maarten
