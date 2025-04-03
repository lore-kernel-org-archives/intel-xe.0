Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A43C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 16:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2167810E2BE;
	Thu,  3 Apr 2025 16:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jwf/vlJD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861CE10E2BC
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 16:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743698992; x=1775234992;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=WayWbLOCiGCpBX8ulwyOGdXT241ytMx5MqEfsDpw4EM=;
 b=Jwf/vlJDsI6WndJko/nxEoPEBb3yB39d3aqQZAAJ636le9t2cUf/T/sK
 iF/kTXnl1WmRPen1HK4g3kb1PDbrz0MHzNbidE+xpHAP8thasg0j1YSxs
 JlAlkGLatDWhvOdJ3OQaerm/CrijfLkz2AXdhVq28DEVxIlucVmblfcOS
 JvGhe4cDQm02V16eGOmXqD1lrdFZhigmDm81DIGssR5L++G1k6BVZgU1B
 /hj6zpYa7YQU15PJ61QRVNwa2MfpngLFPldHqe+C6hDJ2jLiLRdITGVqG
 D+OHIzyNC+xCa01crDbUuz+5AQM+ZTgoS4bkAXErVWYyggSohfgmrJw3T A==;
X-CSE-ConnectionGUID: 0AD9x+9dTPu+Zi1SfkDhhA==
X-CSE-MsgGUID: 9fPhHFkYRySJnLU9tvbZFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44833629"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="44833629"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 09:49:52 -0700
X-CSE-ConnectionGUID: MybvF7MiR6+yMZKU/D2ZAg==
X-CSE-MsgGUID: iJlJ3v30SVuDfvjzD8cx6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="131917566"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 03 Apr 2025 09:49:51 -0700
Received: from [10.245.114.177] (unknown [10.245.114.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A61913494F;
 Thu,  3 Apr 2025 17:49:49 +0100 (IST)
Message-ID: <9635fe3f-038b-40fa-be18-aaa4cb8fbd78@intel.com>
Date: Thu, 3 Apr 2025 18:49:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/vf: Don't update GuC reset policy when
 changing wedged mode
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org
References: <20250403094141.25941-1-lukasz.laguna@intel.com>
 <20250403094141.25941-3-lukasz.laguna@intel.com>
 <285deebb-2cd0-4a85-84ce-35d4514cd793@intel.com>
 <0b7b846b-f39d-49ef-9afa-56d818a0e69d@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <0b7b846b-f39d-49ef-9afa-56d818a0e69d@intel.com>
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



On 03.04.2025 17:17, Laguna, Lukasz wrote:
> 
> On 4/3/2025 13:05, Michal Wajdeczko wrote:
>>
>> On 03.04.2025 11:41, Lukasz Laguna wrote:
>>> Prevent the VF from attempting to update the GuC reset policy when
>>> changing the wedged mode, as this operation is not supported for VFs.
>>>
>>> Log a message to indicate that GuC may still cause engine reset even
>>> with wedged_mode=2.
>>>
>>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_debugfs.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/
>>> xe_debugfs.c
>>> index d0503959a8ed..062668d02365 100644
>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>> @@ -171,6 +171,11 @@ static ssize_t wedged_mode_set(struct file *f,
>>> const char __user *ubuf,
>>>         xe->wedged.mode = wedged_mode;
>>>   +    if (IS_SRIOV_VF(xe)) {
>>> +        drm_info_once(&xe->drm, "VF can't change GuC's engine reset
>>> policy. GuC may still cause engine reset even with wedged_mode=2\n");
>> never use drm_info_once() logs for places where multiple different
>> devices can be reached, as then doing something similar on next device
>> there will be no trace at all
> 
> ok
> 
>>
>> also should we change xe->wedged.mode if it is N/A for VF?
> 
> We can't change engine reset policy, but I wouldn't say that wedged.mode
> is N/A for VFs.
> 
> We can still disable it (mode=0), or use mode=2 to easily wedge device
> with simple exec timeout in order to e.g. validate whether driver
> behavior in case of wedged device is correct (all IOCTLs are blocked
> until rebind).

I was referring to the code where first there is an assignment of the
new wedged mode and then we abort and eventually print message that it
wasn't applied - IMO this is wrong

> 
>> btw, what is our approach if someone on the PF already set some policy
>> on GuC will not do engine reset? or it is n/a after a VF switch?
> 
> It's global policy - engine resets will be disabled for PF and VFs, and
> that's something I would expect.

my question is whether ordinary VF user expects that such policy could
be set differently on different setups (or changed at any time on PF)

maybe for the production PF case we shouldn't allow changing PF wedge
mode (something like we do for EUDBG or CCS mode case in PF w/VFs)

> 
>>> +        return size;
>> shouldn't we return -EPERM instead?
> 
> I returned size on purpose, as it's expected that VF is not able to
> change reset policy. 

hmm, but by returning 'size' you're saying "OK"
not that VF can't change it

when read back, there will new wedge mode visible
(well, it won't work as expected, though)

> Still, informed user that GuC may cause engine
> resets even in mode=2. I can add extra info, that if needed, engine
> resets needs to be disabled by PF.

I'm not sure we need detailed messages for that in dmesg
good release notes about 'wedge_mode' should be sufficient

> 
>>
>>> +    }
>>> +
>>>       xe_pm_runtime_get(xe);
>>>       for_each_gt(gt, xe, id) {
>>>           ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt-
>>> >uc.guc.ads);

