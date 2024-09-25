Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AA8C369B9
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 09:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C7D10E2FD;
	Wed, 25 Sep 2024 09:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ni/zyqEV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEA110E2DA
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 09:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727257884; x=1758793884;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fOqKYB0bGcgElHW2FLp/nnpQiSf+ILcg4xQKXYVgPyE=;
 b=ni/zyqEV8KUCGeJ4dkwq+2/u+23kvkaXKncR9pKgLdZlaop9zubTCoME
 MqH96VRiqYNQVaBKNTGLHZBEl/jA5jFZxX9t7ZTF2mODXc08rhH1h8wWh
 sDY9bMIlvEPxmDR/2zwMPLO4HGOP3ByjbVO6fiLY6ZzPnAE9HjFJFc3+E
 up0S0K5FdKv2gyD4awDYOUU29rGaR7HWy+NaPqGq5FY/fyVDO0xVS01vu
 LcP9f2veYdOKzYmYBNv6LzQuEo6XzF7PghjHusHTss7r7kP3FFulx4oxc
 m2OlG0ztHzHgV4CDs1KtWz7eWdlZDuBysHA3avaMxWX2a1/BuJg5TVa/d g==;
X-CSE-ConnectionGUID: UOQ5ByXnRwSGdpcZv1b90Q==
X-CSE-MsgGUID: Mtc7j5UyTweF5ytvCyqV0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="37652567"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="37652567"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 02:51:24 -0700
X-CSE-ConnectionGUID: TyCF7npgR6GnwUKJvdzuKg==
X-CSE-MsgGUID: kQtE77VwQqSjvz8g8KRWWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="72540038"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.244.236])
 ([10.245.244.236])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 02:51:22 -0700
Message-ID: <8f3dda30-b6ea-4800-b357-4332bd8c5be4@intel.com>
Date: Wed, 25 Sep 2024 10:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/queue: move xa_alloc to prevent UAF
To: Nirmoy Das <nirmoy.das@linux.intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20240925071426.144015-3-matthew.auld@intel.com>
 <20240925071426.144015-4-matthew.auld@intel.com>
 <598b2e8c-a50f-42ec-a6c0-749b0ae507b6@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <598b2e8c-a50f-42ec-a6c0-749b0ae507b6@linux.intel.com>
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

On 25/09/2024 10:33, Nirmoy Das wrote:
> 
> On 9/25/2024 9:14 AM, Matthew Auld wrote:
>> Evil user can guess the next id of the queue before the ioctl completes
>> and then call queue destroy ioctl to trigger UAF since create ioctl is
>> still referencing the same queue. Move the xa_alloc all the way to the end
>> to prevent this.
> 
> The commit message doesn't match the diff, xa_alloc already happening at 
> the end here.

It's not at the end. It is dereferencing the q to set xef after the 
xa_alloc, but that needs to happen before it is visible to userspace.

> 
>> v2:
>>   - Rebase
>>
>> Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are captured")
>> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 7743ebdcbf4b..d098d2dd1b2d 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -635,12 +635,14 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   		}
>>   	}
>>   
>> +	q->xef = xe_file_get(xef);
>> +
>> +	/* user id alloc must always be last in ioctl to prevent UAF */
>>   	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
>>   	if (err)
>>   		goto kill_exec_queue;
>>   
>>   	args->exec_queue_id = id;
>> -	q->xef = xe_file_get(xef);
>>   
>>   	return 0;
>>   
