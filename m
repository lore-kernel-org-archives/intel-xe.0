Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9198CF9C72
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 16:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E9210E288;
	Mon, 23 Sep 2024 16:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekH5OLzP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B502C10E279
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 16:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727107825; x=1758643825;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lXbgPHUC3J9dxwpbeR+kiEt6Ml90j0vvNE6/XaxImk8=;
 b=ekH5OLzP5uhSqxefeFubTFDlfIBhQGPy2My2cdipy45cmBlYbcogxlQW
 LwZVTVDJKwbCid046nFovvWo+Xr1Be8ODCHf89NFmftfZIQm2YrNvr46y
 x1haroACfmnFO1PGI49Ac2WZKTHq0uac7l8tJCSRGzlbJDolynJPZxe/b
 Y30oOgW7aPAyDJXOPVirgJhZV6IRSJeu7Y7FsnJ1u0KCLI4kpPkkwyytl
 ckM/aNZmHNRhHzxdACMzh2j6iFVbMsLnir27k6HZutNFEjVt4lT6itMRH
 vRVECYPq0vZlxTxVDFl4Bz6V4WUDo7UWAf8iTVVkqtregbhwJS6e5ISpo g==;
X-CSE-ConnectionGUID: RSRI2lglT2m9d3EaH1yTsw==
X-CSE-MsgGUID: qmFcAl+nSLazKopa8lv2ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29850499"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="29850499"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 09:09:04 -0700
X-CSE-ConnectionGUID: X6FGFMMVTT6kb9SJ3TRXjw==
X-CSE-MsgGUID: XBtZfN2ASyWMqoHreCIc2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="108549959"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.37])
 ([10.245.244.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 09:09:04 -0700
Message-ID: <2b406f25-3a2f-4e9c-8617-79641c9e6085@intel.com>
Date: Mon, 23 Sep 2024 17:09:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/queue: move xa_alloc to prevent UAF
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240923125733.62883-3-matthew.auld@intel.com>
 <20240923125733.62883-4-matthew.auld@intel.com>
 <ZvGR4eIX2jsl5sD4@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZvGR4eIX2jsl5sD4@DUT025-TGLU.fm.intel.com>
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

On 23/09/2024 17:05, Matthew Brost wrote:
> On Mon, Sep 23, 2024 at 01:57:35PM +0100, Matthew Auld wrote:
>> Evil user can guess the next id of the queue before the ioctl completes
>> and then call queue destroy ioctl to trigger UAF since create ioctl is
>> still referencing the same queue. Move the xa_alloc all the way to the end
>> to prevent this.
>>
>> Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are captured")
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 7f28b7fc68d5..a1d4b9b0726e 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -635,6 +635,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   		}
>>   	}
>>   
>> +	q->xef = xe_file_get(xef);
> 
> Same comment as last patch, this looks coreect shall I merge my series
> and then you rebase?

Yeah, sounds fine.

> 
> Matt
> 
>> +
>> +	/* user id alloc must always be last in ioctl to prevent UAF */
>>   	mutex_lock(&xef->exec_queue.lock);
>>   	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
>>   	mutex_unlock(&xef->exec_queue.lock);
>> @@ -642,7 +645,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   		goto kill_exec_queue;
>>   
>>   	args->exec_queue_id = id;
>> -	q->xef = xe_file_get(xef);
>>   
>>   	return 0;
>>   
>> -- 
>> 2.46.1
>>
