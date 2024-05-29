Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51893C25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 09:00:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903F410F894;
	Wed, 29 May 2024 09:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/uQeOcD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D874113594
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 09:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716973218; x=1748509218;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=T03EStM3e5B9o9zCR5Iy0CKEvpxaMEDZbK1pG2z6re8=;
 b=a/uQeOcD0LaufdJVTuyXbOTPhTenxXfiUMv0mouxAyixmsEqkbJEK7w0
 jYF7xlvRvjgp+T3qmiStoDFn6k2bI/dAyB5m1nJ9kLKxraNAZYKHnjug+
 9GOMO+ezCbnrjJ2e8HS/62lM0GrioiXRkz3vXP1MrVI5z07ur660DGeQA
 kKOpE+DKcVIF17AnmGjuF9bGAPk+zZcCD1zazOD6iCyW/V7KIi8v7bCe+
 o6S28kbBUudFo+j7NJVE+y8PGi8RvB+uiKgvwOC7OzvvtWvR5OjS2+qgk
 7AYnqZOuZDEF9bH8w3c+iC7H4cH7upohldaYiI9KKY31hO6MvyJmYwbEY g==;
X-CSE-ConnectionGUID: YtBca2gPSkS1mKeXVzn23g==
X-CSE-MsgGUID: DMYIYfVqRIqK5nmoRxZ/xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13212069"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13212069"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 02:00:17 -0700
X-CSE-ConnectionGUID: eY4gnb7rTdK6DaA5u5MTfw==
X-CSE-MsgGUID: MM+gl51zQqaIHVO66TKWxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="72812160"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.51.28])
 ([10.246.51.28])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 02:00:16 -0700
Message-ID: <70963845-202d-4c23-a7ad-f0db7a49b4a2@linux.intel.com>
Date: Wed, 29 May 2024 11:00:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Add engine name to the engine reset and
 cat-err log
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20240528101445.27688-1-nirmoy.das@intel.com>
 <ZlZDbe15A88vX5OB@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZlZDbe15A88vX5OB@DUT025-TGLU.fm.intel.com>
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


On 5/28/2024 10:49 PM, Matthew Brost wrote:
> On Tue, May 28, 2024 at 12:14:45PM +0200, Nirmoy Das wrote:
>> Add engine name to the engine reset and cat error log
>> which should be useful while debugging.
>>
>> v2: Add logical mask and engine class(Matt)
>>      Use xe_gt_{info|dbg} (Michal)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
> Sending to correct version:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Merged to drm-xe-next.

Thanks,

Nirmoy

>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 72aa2f91832c..e22bd6b09a74 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1681,6 +1681,7 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>   
>>   int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>   {
>> +	struct xe_gt *gt = guc_to_gt(guc);
>>   	struct xe_device *xe = guc_to_xe(guc);
>>   	struct xe_exec_queue *q;
>>   	u32 guc_id = msg[0];
>> @@ -1694,7 +1695,8 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>   	if (unlikely(!q))
>>   		return -EPROTO;
>>   
>> -	drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
>> +	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
>> +		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>>   
>>   	/* FIXME: Do error capture, most likely async */
>>   
>> @@ -1716,6 +1718,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>   int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>   					       u32 len)
>>   {
>> +	struct xe_gt *gt = guc_to_gt(guc);
>>   	struct xe_device *xe = guc_to_xe(guc);
>>   	struct xe_exec_queue *q;
>>   	u32 guc_id = msg[0];
>> @@ -1729,7 +1732,9 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>   	if (unlikely(!q))
>>   		return -EPROTO;
>>   
>> -	drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
>> +	xe_gt_dbg(gt, "Engine memory cat error: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
>> +		  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>> +
>>   	trace_xe_exec_queue_memory_cat_error(q);
>>   
>>   	/* Treat the same as engine reset */
>> -- 
>> 2.42.0
>>
