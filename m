Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957C6C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 06:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6549B10E120;
	Tue,  4 Apr 2023 06:59:33 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D67910E120
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 06:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680591571; x=1712127571;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=j/C8OayZjxmK3KIxghudXu5p1EBgGJwZ366DbU0ZWZM=;
 b=XmTE1ebdkYFvnMUaIC6XYCedrHAgX26TGLMwbOpwOD5JuzmECu4SnNFD
 yYod9a4Ltze5votRW6KM8yJDi27YC7VHo90TJMjLE1XZQ9rquYckeUlIt
 0+i+abwkJ/rQd6hI12nHXl9XuLoE3sAltiD3lWg3rQ8DTt8c1xanjCGEJ
 S+CX5wxRzpT2r1iOaTD2WAoM80SshKN8YhSFc4JhVbXbW5DRP21cNZgF+
 dW6Ik7nQBzK/RbPGlfQiuqxKZ3LAUgw9vXW7rRdKxJIkPualTscv+f5fE
 AM6oRDlb9OPQmDQDHCfxM2B5FPq8z1Gv3ajiMCuyj8Pj75LLeqctqw3rL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="344669310"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="344669310"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 23:59:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="716543910"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="716543910"
Received: from bdallmer-mobl.ger.corp.intel.com (HELO [10.249.32.152])
 ([10.249.32.152])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 23:59:29 -0700
Message-ID: <fb5a81af-e95e-cbca-ec5b-7a98bafdcc34@linux.intel.com>
Date: Tue, 4 Apr 2023 08:59:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
 <20230331102419.521392-3-maarten.lankhorst@linux.intel.com>
 <20230403202725.GX4085390@mdroper-desk1.amr.corp.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230403202725.GX4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe: Use full_gt batchbuffer
 allocation for media tiles.
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 2023-04-03 22:27, Matt Roper wrote:
> On Fri, Mar 31, 2023 at 12:24:15PM +0200, Maarten Lankhorst wrote:
>> This fixes an oops on media tiles, because we don't initialise the
>> bb pool.
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index bc821f431c45..c7a2e9baabfb 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -237,6 +237,10 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>>   		struct xe_engine *e, *nop_e;
>>   		struct xe_vm *vm;
>>   		void *default_lrc;
>> +		struct xe_gt *full_gt = gt;
>> +
>> +		if (xe_gt_is_media_type(gt))
>> +			full_gt = xe_find_full_gt(gt);
>>   
>>   		if (gt->default_lrc[hwe->class])
>>   			continue;
>> @@ -262,7 +266,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>>   		}
>>   
>>   		/* Prime golden LRC with known good state */
>> -		err = emit_wa_job(gt, e);
>> +		err = emit_wa_job(full_gt, e);
> If we pass the primary GT here, then we'll take the wrong path in
> bb_prefetch().  That doesn't actually matter very much (we'll just
> overestimate the padding needed for media engines, which is safe and
> something we already do for BCS engines), but we should probably just
> drop !xe_gt_is_media_type(gt) condition there as part of this patch
> since it will always be true now.

Yeah makes sense. That check doesn't strictly speaking seem to be 
needed, so I'm fine with dropping it.

We could always request the engine to be specified, but I don't think we 
really use those batchbuffers beyond initialisation outside of 
migration/VM_BIND,

which is done on a BCS engine anyway.

Can I have your r-b with that check removed?

~Maarten

