Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A248C25B76
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 19:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015B710E3D2;
	Mon,  3 Jun 2024 19:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZLWxl9S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C2210E3D2
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 19:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717444605; x=1748980605;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6zOGuXEa75fbNptFUjNkmxyREIHfdPrD1D3NkmS9UTE=;
 b=WZLWxl9Se6myKj9sej12wuPf250vQaH+b9qtrgTM76X/wBL50d9PLhgK
 GYUC2DpWEoFXG1gkh2gxQLlibcim5nNTXE4w74br1VRVMuC7sJpCSLle8
 GEmDrhaF8Am64F1yZrP77frC6Tp0yCpzkoJOfF38qbWYYs8Z2IagQmBpH
 6kVOVMuMvPuuKHUgcEFsi5AHsLY1MVUTJH3F4+eBrI+9GI3sV1B8IwUlj
 7oiGX7rn7YL2clDs4ZRd9741bTInuIJSe09xlBbYXxHAomqinqFp6Dvy0
 dk2ga06I9+qcx9AjdolzAchjazZYvOif8wBbxQqU+obtZfckAgJCrbNeP w==;
X-CSE-ConnectionGUID: 3+htcE9WRre839/Q52t5Eg==
X-CSE-MsgGUID: Yf/9FGfJQIKfadNi3xIWtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13803878"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="13803878"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 12:56:45 -0700
X-CSE-ConnectionGUID: sexRdfZhSVOFkpzNFUtXIQ==
X-CSE-MsgGUID: BBXV6QYYTmG+YwNLV632Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="41430943"
Received: from tsessler-mobl.ger.corp.intel.com (HELO [10.246.51.46])
 ([10.246.51.46])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 12:56:43 -0700
Message-ID: <be21dc65-efc8-45b6-94e5-449b9ace3445@linux.intel.com>
Date: Mon, 3 Jun 2024 21:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/client: Check return value of xe_force_wake_get
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240603083108.32346-1-nirmoy.das@intel.com>
 <bc097deb-d1d1-4f81-a90e-403414ca3e11@intel.com>
 <02afae56-3ce4-49a2-a9bf-f67e679f6ffb@linux.intel.com>
 <f60336f4-eb91-435e-abaf-454c384ae4e9@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <f60336f4-eb91-435e-abaf-454c384ae4e9@intel.com>
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

Hi Himal,

On 6/3/2024 1:34 PM, Ghimiray, Himal Prasad wrote:
>
>
> On 03-06-2024 16:28, Nirmoy Das wrote:
>>
>> On 6/3/2024 11:07 AM, Ghimiray, Himal Prasad wrote:
>>>
>>> On 03-06-2024 14:01, Nirmoy Das wrote:
>>>> xe_force_wake_get() can return error so check it's return value
>>>> before reading gpu_timestamp value.
>>>>
>>>> v2: set HWE to NULL instead of setting timestamp to 0(Lucas)
>>>>      Add a warn on for xe_force_wake_put(Himal)
>>>>
>>>> Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_drm_client.c | 8 ++++++--
>>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c 
>>>> b/drivers/gpu/drm/xe/xe_drm_client.c
>>>> index 4a19b771e3a0..4bdb909eabfc 100644
>>>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>>>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>>> @@ -264,9 +264,13 @@ static void show_run_ticks(struct drm_printer 
>>>> *p, struct drm_file *file)
>>>>           if (!hwe)
>>>>               continue;
>>>>   -        xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>> +        if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT)) {
>>>
>>> Since xe_force_wake_get will increase the ref count irrespective of 
>>> acknowledgment from forcewake ack register fails or succeeds.
>>
>> General pattern is to skip xe_force_wake_put() though at some places 
>> we do call xe_force_wake_put() when the caller is unabortable.
>>
>> I don't know the exact reason but I  guess failure to wake a domain 
>> is serious enough so we want to  keep already woken domains  in wake 
>> state for system stability.
>
> If you break without xe_force_Wake_put, subsequent force_wake_get will 
> assume domain is awake(which might not be true, because there was no 
> acknowledgment)
>
> Please consider below scenario:
>
> function a:
> xe_force_wake_get ---> increased domain ref from 0 to 1 -----> wake 
> domain ---> timedout the acknowledgment -> failed and returned without 
> decreasing the ref count
>
> read/write operations  -> not called
> xe_force_wake_put -> not called
>
> function b : called after function a
> xe_force_wake_get -----> domain ref increased to 2 ----> exit success
> read/write operations -> executed but domain was not awake
> xe_force_wake_put ----> domain ref decreased to 1 again.


I assumed this was known to everyone as a known side effect, as we 
mostly skip calling xe_force_wake_put(), but I guess it is not.

Had a chat with Rodrigo about this, and he acknowledged the current 
inconsistency and the need for cleanup. Going to create a series

to add the missing xe_force_wake_put() calls where we haven't been doing it.


Thanks,

Nirmoy

>
> BR
> Himal
>
>
>>
>>
>> Regards,
>>
>> Nirmoy
>>
>>
>>>
>>> It is required to decrement the ref count taken by xe_force_wake_get 
>>> by calling xe_force_wake_put before break.
>>>
>>> something like :
>>>
>>> if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
>>>
>>> hwe = NULL;
>>>
>>> else
>>>
>>> gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>>
>>> XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>
>>>
>>>> +            hwe = NULL;
>>>> +            break;
>>>> +        }
>>>> +
>>>>           gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>>> -        xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>> +        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>>           break;
>>>>       }
