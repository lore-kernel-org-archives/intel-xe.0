Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDDAC67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 09:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6C611231D;
	Mon,  8 Apr 2024 09:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihRFdh/r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3877D11231D
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712567193; x=1744103193;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oH/WUys/nptTV1r134mI7+xWZYIkEQFf9R20oVS1gQQ=;
 b=ihRFdh/rTX4wAonvbo9aHJZKEMt1JN3uqg+9XBI00LKzn2EVZddc3zE0
 LXQWevH04iY3/xvrEmxcEUWAOAzLGz1dutoKeajVkTuxU3Wen43YNriBa
 JdBrmlg5o2GEGaZtu9o7whYoB1uiwE6NsGNJn1t40QQnVop7tq5JbFrHX
 yIWmwJW2oISidR+34fXzXcm3Yag3XsqSpujyTkUKcomzF0Z/IpfAEaYBc
 hVE7SiWwU6kaeepJnZikMOBe28VhYdwWrYQgCk4xK3+QUWbhClFZ89HPc
 XzjObDY6sabMe2Y6KA151PvQEuMn5/Rot6qvXpMykuZ9vQQPkJVicnKbm w==;
X-CSE-ConnectionGUID: NmoN0E8sQ9i8klR8HKwpyQ==
X-CSE-MsgGUID: bGrvzeLGRPa49t1oyzT3MQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7936165"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7936165"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:06:32 -0700
X-CSE-ConnectionGUID: Q2nzezSSQY+lTygq8X/9eA==
X-CSE-MsgGUID: 9f1/4giYTd2tGIrBV/YKeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="20254623"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 08 Apr 2024 02:06:31 -0700
Received: from [10.249.158.202] (unknown [10.249.158.202])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7527327BBD;
 Mon,  8 Apr 2024 10:06:29 +0100 (IST)
Message-ID: <13d417c7-365a-419a-8f9b-c6aaf695f1e6@intel.com>
Date: Mon, 8 Apr 2024 11:06:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Check pat.ops before dumping PAT settings
Content-Language: en-US
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240405143625.935-1-michal.wajdeczko@intel.com>
 <20240408072348.rvt333l6ckepylc4@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240408072348.rvt333l6ckepylc4@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 08.04.2024 09:23, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-kwi-05 16:36:25 +0200]:
>> We may leave pat.ops unset when running on brand new platform or
>> when running as a VF.  While the former is unlikely, the latter
>> is valid (future) use case and will cause NPD when someone will
>> try to dump PAT settings by debugfs.
>>
>> It's better to check pointer to pat.ops instead of specific .dump
>> hook, as we have this hook always defined for every .ops variant.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pat.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 66d8e3dd8237..f0031c2e9818 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -447,7 +447,7 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
>>  {
>>  	struct xe_device *xe = gt_to_xe(gt);
>>  
>> -	if (!xe->pat.ops->dump)
>> +	if (!xe->pat.ops)
> 
> You are right that we currently have a dump pointer set for each xe_pat_ops structure,
> and in this situation it is enough to check the ops for the cases you listed.
> But I assume that since we are verifying the dump pointer here, that formally, for some
> future case, we may not set this pointer.
> Therefore, it seems to me that it would be more correct for you to check both pointers
> here: ops and dump.

that was also my first choice but after looking at xe_pat_init() and
reviewing existing ops that choice didn't hold as IMO keeping runtime
check for future potential lack of .dump hook is very questionable

what I was considered instead was to add to xe_pat_init_early():

	xe_assert(xe, !xe->pat.ops || xe->pat.ops.dump);

to perform early checkout of the selected .ops and make sure that we
didn't miss to setup .dump hoot but then realized that the other hook
.program_media is used without any extra runtime or debug check while
some .ops may have it unset. so finally decided to just go with quick
fix to close existing gap, postpone further fixes to follow up series
(that likely could be done by the PAT code owners)

Michal

> 
> Thanks,
> Piotr
> 
>>  		return;
>>  
>>  	xe->pat.ops->dump(gt, p);
>> -- 
>> 2.43.0
>>
> 
