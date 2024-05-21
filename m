Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D870C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 14:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249D010E05B;
	Tue, 21 May 2024 14:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9Qi1LDJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAD510E05B
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 14:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716303169; x=1747839169;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SpyAeYZHtxQTB+5zsYkS2FH85pHGGd3URyJQ7V/388g=;
 b=T9Qi1LDJ6J/N3OcKdxoj/wdPgjTZqSVvEipLQgJrMOk0yc5ST393fRiB
 LOrXq4cEaf1N/wQmmvInGw1TVrjQXjWYIzA2WKkdLgEkUzwPxcPQ2/Awi
 7yFH7OS0FbOufwqL/6bx62yqjTR1iRUvvdxB6m1y+NTTPvgMdI7PzrAWh
 nZ7LxymRav7ejG4kNUgaY31lf9XIH40qMR0X1lhECRoSWEmQ0SZh+uSX6
 STiY0D8E9k2eKGDL7DYpsRPQCFMCToUYx1n5GbtxpyOq06MDDHHQDgodj
 ilI2WcjQnEgkfyogxgXVypIqwiqPwfQfQPilg/NRk1hRe0vKpEs1fTRNi A==;
X-CSE-ConnectionGUID: B2seViTQSHOmYUmBUpWhTQ==
X-CSE-MsgGUID: 1tM+4O1rRxmjdK/xJBkhMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16331530"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="16331530"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 07:52:49 -0700
X-CSE-ConnectionGUID: t3yXndqkTyS0WjCQwWWTRQ==
X-CSE-MsgGUID: QbcshQm0RhuguusjQ7r0Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="64174109"
Received: from unknown (HELO [10.245.245.25]) ([10.245.245.25])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 07:52:47 -0700
Message-ID: <552219db-7505-4dff-851c-71ed534f884e@intel.com>
Date: Tue, 21 May 2024 15:52:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add warn when level can not be zero.
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240521103623.11645-1-nirmoy.das@intel.com>
 <Zkyq4Tzh73D9yeXD@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Zkyq4Tzh73D9yeXD@DUT025-TGLU.fm.intel.com>
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

On 21/05/2024 15:08, Matthew Brost wrote:
> On Tue, May 21, 2024 at 12:36:23PM +0200, Nirmoy Das wrote:
>> At xe_pt_zap_ptes_entry() and xe_pt_stage_unbind_entry, the level cannot
>> be 0. Therefore, add an independent check for the level. Since the level
>> cannot be zero at this point, there is no need to check for `is_compact`,
>> so remove that instead.
>>
> 
> This doesn't look right. Both xe_pt_zap_ptes_entry &
> xe_pt_stage_unbind_entry can be at level 0 is 4K page entries are used,
> right? CI looks good though so confused by that. I think maybe 2
> independent VMAs would have to mapped within a 2M range for these paths
> to decend to level 0. Maybe we don't have tests in place that do this.

Not too sure, but in both cases this is followed by doing a level-1 
which is then used as the index into some array AFAICT. So if level can 
indeed by zero here then that would be a serious bug. Improving the 
assert here to catch that looked reasonable to me.

> 
> Regardless please don't merge this until my concerns are addresesed.
> 
> Matt
> 
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 11dd0988ffda..cd60c009b679 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -763,7 +763,7 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
>>   	pgoff_t end_offset;
>>   
>>   	XE_WARN_ON(!*child);
>> -	XE_WARN_ON(!level && xe_child->is_compact);
>> +	XE_WARN_ON(!level);
>>   
>>   	/*
>>   	 * Note that we're called from an entry callback, and we're dealing
>> @@ -1445,7 +1445,7 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>>   	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
>>   
>>   	XE_WARN_ON(!*child);
>> -	XE_WARN_ON(!level && xe_child->is_compact);
>> +	XE_WARN_ON(!level);
>>   
>>   	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
>>   
>> -- 
>> 2.42.0
>>
