Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EF7C7EE22
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC53C10E06C;
	Mon,  8 May 2023 21:10:29 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF6E10E06C
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683580228; x=1715116228;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xnM81hdFWL4IZMuj4SP01/Omp5LgA8mhzCqSw9f5Z/g=;
 b=LxiEx3LOiEs/lg0dwOSM9d27ds+RqIDBXMOL+6Bf2rZor4E1g5BjGU6d
 kJRdHf71HTiBLXEjC/j6oVqROv10v8IlG9aj2TtA6ZW1IeDkWgLioZ24O
 RthOabCIc/m9om6uLfzXbSGE7QMZVBn6U7Wi53lNF/4M5LGvafEO7J5bo
 MhKqcznXopmXHCzcZD5ODxW1oG8E9F17OumLbNkswBiob1e41a/wmauYO
 cb9kW6idcxj1crfA5lH0jYzkmc98KjjWpbGMPkmbn5OQuSn8Q4zm7KGQl
 J0B1aok/meSfpzmPq2nErspzjVjLa7KLdwUQ9RnXGMfPgfIQV3R+o1H3A w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="348583536"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="348583536"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:10:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="763536411"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="763536411"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga008.fm.intel.com with ESMTP; 08 May 2023 14:10:27 -0700
Received: from [10.249.140.9] (mwajdecz-MOBL.ger.corp.intel.com [10.249.140.9])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 5E37527BA1;
 Mon,  8 May 2023 22:10:26 +0100 (IST)
Message-ID: <edb8a4d0-99ab-0d4c-d866-e6e6e94cd472@intel.com>
Date: Mon, 8 May 2023 23:10:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>, Nirmoy Das <nirmoy.das@intel.com>
References: <20230505133433.9642-1-nirmoy.das@intel.com>
 <ZFUI3YyB87jY899o@rdvivi-mobl4>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZFUI3YyB87jY899o@rdvivi-mobl4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Print GT info on TLB inv failure
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



On 05.05.2023 15:47, Rodrigo Vivi wrote:
> On Fri, May 05, 2023 at 03:34:33PM +0200, Nirmoy Das wrote:
>> Print GT info on TLB inv failure for better debugbility.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
>> ---
>>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index 604f189dbd70..9e7fe8d9bca4 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -34,8 +34,8 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>  			break;
>>  
>>  		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
>> -		drm_err(&gt_to_xe(gt)->drm, "TLB invalidation fence timeout, seqno=%d",
>> -			fence->seqno);
>> +		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d",
>> +			gt->info.id, fence->seqno);
>>  
>>  		list_del(&fence->link);
>>  		fence->base.error = -ETIME;
>> @@ -285,8 +285,8 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>>  				 tlb_invalidation_seqno_past(gt, seqno),
>>  				 TLB_TIMEOUT);
>>  	if (!ret) {
>> -		drm_err(&xe->drm, "TLB invalidation time'd out, seqno=%d, recv=%d\n",
>> -			seqno, gt->tlb_invalidation.seqno_recv);
>> +		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
>> +			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);

as a reminder, there is pending series with gt log wrappers [1] that
could be used also here to avoid manual addition of "gt%u" prefix

[1] https://patchwork.freedesktop.org/series/115083/

>>  		return -ETIME;
>>  	}
>>  
>> -- 
>> 2.39.0
>>
