Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1682C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 13:10:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC9E10E09B;
	Tue, 23 May 2023 13:10:19 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FE110E09B
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 13:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684847418; x=1716383418;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=G/GWGspy4cv1+zzrbN5asb14CA2VQmB2AUJdhrQAkXs=;
 b=hILUol8Z3Ds39pwH/McH/r0ySm/HjURP1O4+9xO+/LwEHnGAicg6u9VC
 /TQwtkG+fnf/H7zCM7Tc6MTgvlA7ThbMbJdfLhsjvivItA1brdWE1PcKY
 c/3Q7l5lX62VOU062N3wF8WUAYgMWx+Xs2sw0gjFSVdRInWJIUVENQ6Q/
 s5YKEqnrPGhT3tIVFu3Hm9JPaGrvnWBmkC7p1v00PSA2cZS0317gtvXaB
 8yZY62VvVmv0K9x/yx6NnGwxzRDMO7npLax0ePObthvmAMETQCCzHcYbD
 XTG7gw+GMeUSa+CSOj6T2svh8dao29qmADOAhCLrK01FJ3iF2u3zQiR3e Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="352074390"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="352074390"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 06:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="848265334"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="848265334"
Received: from eakeogh-mobl1.ger.corp.intel.com (HELO [10.252.0.142])
 ([10.252.0.142])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 06:10:16 -0700
Message-ID: <c3c82ead-bc3b-54e6-91b8-d8ace778506f@intel.com>
Date: Tue, 23 May 2023 14:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
References: <20230523094727.162266-1-matthew.auld@intel.com>
 <20230523094727.162266-6-matthew.auld@intel.com>
 <ZGy5yFMJdo511ljs@rdvivi-mobl4>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZGy5yFMJdo511ljs@rdvivi-mobl4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v9 6/8] drm/xe/ct: drop mem_access_get from
 g2h_worker_func()
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 23/05/2023 14:04, Rodrigo Vivi wrote:
> On Tue, May 23, 2023 at 10:47:25AM +0100, Matthew Auld wrote:
>> In the next patch we track the current task executing the runtime_pm
>> callbacks, if any, in order to prevent the runtime_pm code waiting for
>> itself and deadlocking when called from the callbacks. However with
>> g2h_worker_func() we are processing g2h packets from a workqueue when
>> receiving an interrupt. The runtime callbacks needs to talk to the GuC
>> and so rely on this, however since these are processed from a workqueue
>> the current task will be different and when calling something like
>> mem_access_get() we deadlock. Callers should
> 
>> in theory
> 
> should we at least add an assert?

If we assert it will trigger in the resume callback, since "current" has 
changed :(

But it seems there are more issues. I need to rethink this patch...

> 
>> already be
>> holding an access.ref when talking to the GuC (CT communication looks to
>> be disabled when suspending the GT).
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 7a8c9d6a03f3..6e0d2d06b7f5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1081,7 +1081,6 @@ static void g2h_worker_func(struct work_struct *w)
>>   	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
>>   	int ret;
>>   
>> -	xe_device_mem_access_get(ct_to_xe(ct));
>>   	do {
>>   		mutex_lock(&ct->lock);
>>   		ret = dequeue_one_g2h(ct);
>> @@ -1095,7 +1094,6 @@ static void g2h_worker_func(struct work_struct *w)
>>   			kick_reset(ct);
>>   		}
>>   	} while (ret == 1);
>> -	xe_device_mem_access_put(ct_to_xe(ct));
>>   }
>>   
>>   static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
>> -- 
>> 2.40.1
>>
