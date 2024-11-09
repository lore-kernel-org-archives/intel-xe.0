Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F5DD5E372
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 14:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A3010E08D;
	Sat,  9 Nov 2024 14:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grPrioUp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBD210E2BF
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Nov 2024 14:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731161967; x=1762697967;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=x3XK9U6SUYQD8SthFnvZpkOz4Hh4kJmDvWSlTAZGHK8=;
 b=grPrioUpXP6e6boCMQmE7PhKi6bIDZuP5pren7dmV2N0tL79GsJPfpGz
 o0ZCZm9BHfM7Y5uDpZ4CZQB4DMWF9mhUSoVQ0kRd0JgmWvUMbeJuB5kUm
 D1lA91RGKGrMnvzM4NQCiYEdX9IZ3YweLlQyZS1namqdSQ3z3Igx3NlX/
 /8R0RRhty0s2JWTK3A/yFJIUZ31iTn8R7mlBXhvkf7jAdvfyT4rYG5eXK
 +UQFMvBmnlaGgKskfuxP8FfKdqtTna8pdDwOkDU8Ctoc/Dot9kqK+Z1Os
 CaUeJGsmgDfPNGUVZd2TWHG0MPsBJoHfIiomTNp9sZKON7iaKYq+PrMch w==;
X-CSE-ConnectionGUID: oVRA7nGLSf6j9Twva1K3pg==
X-CSE-MsgGUID: 6BG99BkFRIiUeCtV89KXuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="30426849"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; d="scan'208";a="30426849"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 06:19:27 -0800
X-CSE-ConnectionGUID: KWza2E5vSYW/YIbiL7XZkQ==
X-CSE-MsgGUID: RzbF07mbRYKU5jOI9ANIoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; d="scan'208";a="86380076"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 09 Nov 2024 06:19:26 -0800
Received: from [10.246.2.138] (mwajdecz-MOBL.ger.corp.intel.com [10.246.2.138])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 5276428197;
 Sat,  9 Nov 2024 14:19:24 +0000 (GMT)
Message-ID: <6899cf74-3cee-41b3-b4df-d293fe9d1930@intel.com>
Date: Sat, 9 Nov 2024 15:19:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/xe/guc: Do not assert CTB state while sending
 MMIO
To: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20241107151357.1623733-1-tomasz.lis@intel.com>
 <20241107151357.1623733-2-tomasz.lis@intel.com>
 <48da6fac-2693-4fad-871c-d990f2da0bc6@intel.com>
 <Zy1/zaWCbhI5y8RJ@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Zy1/zaWCbhI5y8RJ@lstrano-desk.jf.intel.com>
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



On 08.11.2024 04:04, Matthew Brost wrote:
> On Thu, Nov 07, 2024 at 05:56:09PM +0100, Michal Wajdeczko wrote:
>>
>>
>> On 07.11.2024 16:13, Tomasz Lis wrote:
>>> During VF post-migration recovery, MMIO communication channel to GuC
>>> is used, despite CTB channel being enabled. This behavior is rooted
>>> in the save-restore architecture specification.
>>>
>>> Therefore, a VF driver cannot assert that CTB is disabled while sending
>>> MMIO messages to GuC. Such assertion needs to be PF only, or be removed.
>>
>> + Matt
>>
> 
> IIRC there was a big arch push to avoid using MMIO communication
> entirely but that was several years ago and lost track of GuC interface
> specifics since then.
> 
>>>
>>> This patch simply removes the assertion.
>>>
>>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>>> Suggested-by: Michał Wajdeczko <michal.wajdeczko@intel.com>
>>
>> in fact I was already trying to fix that [1], but I had to wait until we
>> have some S/R code in place, so I'm fine with it as-is
>>
>> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>
> 
> I'll defer to Michal here as I'm sure you are more well versed expected
> GuC interaction at this point that me.

thanks, pushed as-is to drm-xe-next

> 
> Matt
> 
>> [1] https://patchwork.freedesktop.org/series/128721/#rev1
>>
>>> ---
>>>  drivers/gpu/drm/xe/xe_guc.c | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index 7224593c9ce9..df1ba94cf4ca 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -945,7 +945,6 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>>>  
>>>  	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
>>>  
>>> -	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
>>>  	xe_assert(xe, len);
>>>  	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
>>>  	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
>>

