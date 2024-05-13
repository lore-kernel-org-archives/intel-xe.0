Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63599C25B75
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 09:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264D910E554;
	Mon, 13 May 2024 09:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRPot+0Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724A410E554
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 09:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715591879; x=1747127879;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=V6y2tY8daR4CI7uDVHrIiViUCpMM75UA4TX/OdbAuZU=;
 b=mRPot+0Y60YEMhuXXC3mR2KiSTXV0cKGdWjIf3jfzoLhNv0SoVOn9Fez
 uT4TogMe4bNMYTgq5laShu0MxtlH35sAZpg8ygsuA0Kuae2ymLTgK92Y4
 EH+1+KT34m3eLcqeVZXySmABzFNCLlW9J7k0YA1fbch1B7BK6WiH2FnTO
 TLzrvcl+yTQTTALXcGd2N2jvr0uUjpXf5p7l8Nrf3LcjTFl5xaQ8tvUZ/
 iJcdr2oXxHeBnHf43FJliqvgMFdJ4a//UL8F7Qm6iQuJnFv5WVFLsjd6j
 ARF7h1Iw6z0JDgr+QgJ1VEySlyMXBmmR8SCbFkXI1DDTOFG3FuFN9fkfv w==;
X-CSE-ConnectionGUID: Bfl8AU2EQAWGJRQ3wT3oyw==
X-CSE-MsgGUID: rZZFss31QruM4TTGtpNjHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="14463526"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="14463526"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 02:17:58 -0700
X-CSE-ConnectionGUID: mhyjhOEDS/WPtVmuuD+Q0w==
X-CSE-MsgGUID: Jksz28qTRzqQnZqHlFwSqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30264538"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 02:17:57 -0700
Message-ID: <ad1f15fb-47a0-4ffd-96e2-5f94ba9daef4@intel.com>
Date: Mon, 13 May 2024 11:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/20] drm/xe/display: stop calling domains_driver_remove
 twice
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-41-matthew.auld@intel.com>
 <c6395f41-462e-4ad7-bedf-67828e255469@intel.com>
 <d30174f3-b1af-4311-b441-8f9fbeae3978@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <d30174f3-b1af-4311-b441-8f9fbeae3978@intel.com>
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



On 13.05.2024 10:27, Matthew Auld wrote:
> On 13/05/2024 09:19, Andrzej Hajda wrote:
>> On 10.05.2024 20:12, Matthew Auld wrote:
>>> Unclear why we call this twice.
>>
>> Hmm, where is another call, I couldn't find one.
>
> In intel_display_driver_remove_nogem it is already called.

Apparently I have some outdated sources.


>
>>
>> Andrzej
>>
>>
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>>> ---
>>>   drivers/gpu/drm/xe/display/xe_display.c | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c 
>>> b/drivers/gpu/drm/xe/display/xe_display.c
>>> index 6d74c9f55b0a..734bddbb8932 100644
>>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>>> @@ -134,7 +134,6 @@ static void xe_display_fini_noirq(void *arg)
>>>           return;
>>>       intel_display_driver_remove_noirq(xe);
>>> -    intel_power_domains_driver_remove(xe);
>>
>>
>>>   }
>>>   int xe_display_init_noirq(struct xe_device *xe)
>>

