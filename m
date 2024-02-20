Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA9CC48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 18:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2996D10E377;
	Tue, 20 Feb 2024 18:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ex+xP7tu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A7710E377
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708452424; x=1739988424;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tiFQwUF3Au/JEtC55fvLcZlMysEXYM++2Rakel5rIbg=;
 b=Ex+xP7tu7NX29nvOYP3a1cVj5glVcDatpLXL5NdacF7llTI8J7vr1/7h
 4cZEZbvYimr4ZB5JI9lwO0B49fdZTyiWaKJzIzL3YZxA7tRAYlNUwJINg
 RlJr0Ry6y+FGVRgKvPKCZufLj4qlXRYLzvjlsl5EFhC6wLpOCnoYuzXVK
 QTkpZGcdWom3DbYaQoRfmKA72Xu1YFXPdZT2ckiqOLtePaJjpjlK3aNa1
 U+qrtNEhkWFK93h6nyw/5Sd7YA5OAUeJkFBTHNmLfWDXKkRgRuhwp3jPH
 QvqfqIwXMLsoWskvHBsbpt3HVY3fnTjgPStOWxifA1A1Np/aAZqV1mTyk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2435843"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2435843"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 10:07:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4897470"
Received: from jleijten-mobl.ger.corp.intel.com (HELO [10.252.22.45])
 ([10.252.22.45])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 10:07:03 -0800
Message-ID: <996d9944-e355-407c-bcbc-ae3deabca6b4@intel.com>
Date: Tue, 20 Feb 2024 18:07:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Skip TLB invalidation time out log if ct is
 disabled
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240220021356.3514454-1-shuicheng.lin@intel.com>
 <ZdS/t2KKI79Kyy7C@DUT025-TGLU.fm.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZdS/t2KKI79Kyy7C@DUT025-TGLU.fm.intel.com>
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

On 20/02/2024 15:05, Matthew Brost wrote:
> On Tue, Feb 20, 2024 at 02:13:56AM +0000, Shuicheng Lin wrote:
>> Suspend may cause the TLB invalidation time out as below log.
>> Skip the log print if ct is disabled to make log clean.
>> "
>> [  228.812266] xe_gt_tlb_invalidation_wait enter
>> [  228.812311] xe_gt_suspend enter
>> [  228.812782] xe 0000:03:00.0: [drm] GT0: suspended
>> [  228.812786] xe_gt_suspend enter
>> [  228.813508] xe 0000:03:00.0: [drm] GT1: suspended
>> …
>> [  229.067007] xe 0000:03:00.0: [drm] *ERROR* TILE0 [GTT] GT0: TLB invalidation time'd out, seqno=321, recv=319
>> [  229.067099] xe 0000:03:00.0: [drm] *ERROR* GT0: CT disabled
>> "
>>
> 
> This doesn't look right for a few reasons.
> - The timeout still can race suspend and then a resume
> - The xe_guc_ct_enabled check also supresses the -ETIME return
> - I think this message it actually valid
> 
> What should probably be done is signal all pending TLB invalidations on
> suspend. I think we are doing a bit of rework in [1] in this area too.
> I'd say let's get [1] to land and if this is still an issue fixup the
> suspend path to signal all TLB invalidation waiters. Signaling all
> waiters on suspend shoud avoid having this message be printed.

I think [1] will only help with rpm, also currently all callers of 
xe_gt_tlb_invalidation_wait() will always have an rpm ref anyway, 
AFAICT. There is the forced suspend path which is quite a different 
beast though, so likely it is there where we need to be more solid?

> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/series/129217/
> 
>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index 7b3a54748b49..8aac12efea84 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -330,11 +330,18 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>>   	if (!ret) {
>>   		struct drm_printer p = xe_gt_err_printer(gt);
>>   
>> -		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
>> -					    "GT%u: TLB invalidation time'd out, seqno=%d, recv=%d",
>> -					    gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
>> -		xe_guc_ct_print(&guc->ct, &p, true);
>> -		return -ETIME;
>> +		/*
>> +		 * guc ct may be disabled during the waiting period and lead to the timeout.
>> +		 * Such as power suspend just after this tlb invalidation wait.
>> +		 * Skip the error log print if ct is disabled.
>> +		 */
>> +		if (xe_guc_ct_enabled(&guc->ct)) {
>> +			xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
>> +						    "GT%u: TLB invalidation time'd out, seqno=%d, recv=%d",
>> +						    gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
>> +			xe_guc_ct_print(&guc->ct, &p, true);
>> +			return -ETIME;
>> +		}
>>   	}
>>   
>>   	return 0;
>> -- 
>> 2.25.1
>>
