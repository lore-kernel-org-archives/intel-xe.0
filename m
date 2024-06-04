Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F25C25B7E
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 12:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C2F10E46B;
	Tue,  4 Jun 2024 12:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIG4tz/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53FD10E46B
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717502636; x=1749038636;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2od7ZyQqzpp+ZlJQKbZZ8kHM8KoDAZz+e/kE+7YYdxo=;
 b=HIG4tz/nYGIyf0FbEDy3IlNEyDAWaPnHplcyS1pWKPWEDY/ShrN+7cRz
 ZmyoqpZYrxpsGZMC+0LpDiZenxV5hu20w9FXhMvHabk9GEJyoTJbAMV8h
 JJYhZvnCMeCyJusNhvOQwnWwlUxXEPKp8jNnYLqKCSz1AEVnLqi8cLkI9
 DUlzzMpJQ13kfx4lPcDBOI6FtBY0z9tGEbGy2iFQsQ85QyKEqQucOMdU0
 UZ1EH6GVNAl7IO5rL8c4A5x4sD597S4xKZxfVtmVet+NWsH8KWR8+SBGf
 LPKHm+2kDWSGXj69Aaz1tvV/nkwfORTCmbswSkcB2kl8OE/kVfg0nO7+o g==;
X-CSE-ConnectionGUID: 1rCkVk7lSrK8Yl9gnRbYKQ==
X-CSE-MsgGUID: ekiZQMSfScuZvNOSWjqAFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24618763"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="24618763"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 05:03:55 -0700
X-CSE-ConnectionGUID: 2hbi35J5RW2CebJkWFa1+Q==
X-CSE-MsgGUID: QIq8vKotRReUaaPjdcdsuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37151302"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 04 Jun 2024 05:03:54 -0700
Received: from [10.94.248.185] (mwajdecz-MOBL.ger.corp.intel.com
 [10.94.248.185])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2669C1241A;
 Tue,  4 Jun 2024 13:03:52 +0100 (IST)
Message-ID: <6ff79cf8-9132-4163-92e4-9d6cda9e8189@intel.com>
Date: Tue, 4 Jun 2024 14:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Drop redundant ARAT timer enabling
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
References: <20240603190747.1372-1-michal.wajdeczko@intel.com>
 <Zl5jO5P4M4/0ckga@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Zl5jO5P4M4/0ckga@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 04.06.2024 02:43, Matthew Brost wrote:
> On Mon, Jun 03, 2024 at 09:07:47PM +0200, Michal Wajdeczko wrote:
>> This interrupt is enabled by default and there is no need to
>> re-enable it as there is no other code in the Xe driver that
>> could change this setting.
>>
> 
> I agree this is likely the wrong location but also think it is little
> unsafe to rely on default values. I recall having to add this in in i915
> at one point and without this GuC submission doesn't work. How about
> moving it to the IRQ layer plus a comment along the lines of should be
> enabled by default but let's be paranoid and set it anyways?

but on i915 restoring the value of the ARAT_EXPIRED_INTRMSK was likely
more legit as there was another code that could modify this register
(see intel_rps.c) but on Xe driver we don't have any similar code, so
not sure if we need to be paranoid

> 
> Matt 
> 
>> Bspec: 52572
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 086a048876ba..f4d728350694 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -862,9 +862,6 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>>  			return err;
>>  	}
>>  
>> -	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK,
>> -		      ARAT_EXPIRED_INTRMSK, 0);
>> -
>>  	err = xe_guc_ct_enable(&guc->ct);
>>  	if (err)
>>  		return err;
>> -- 
>> 2.43.0
>>
