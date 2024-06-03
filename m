Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973A2C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 10:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89DA10E0C2;
	Mon,  3 Jun 2024 10:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+d8c4ZD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7F010E0C2
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 10:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717412311; x=1748948311;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gEoeEFKBLyXSVFnInkqEX9w9HI9J/owSdcgCkzfD8IQ=;
 b=I+d8c4ZD6YaXINlA/Dzc8fD8GD7DnpaySzWjL93mG/w/VEOKF4MyYzZS
 xRPxc9P0a54Ar0qW9kVuKXKAyLUm4eTxWy/+CYR2QUtg6gjnkTGs+tuEa
 K7nkojk0jvnSg/eaN7tBZDyNW0AJS8eiuRqemkPKblb6+JY7zZInUOPzO
 cqfcqrUNbs+VHOFcWSSPs2vTSriFKhf7ruCSkZo1rSIhE29qSBy3QMEqO
 qiSb0UH+riR1bT8t912Z2sap8FR1MkjP0tBrmem0VQGV3joVLelERRQdZ
 Oy9WqeTDXAGONC4y5lQtbIDkeCLvvqI+aZoQq+4FFKIo0Nh71UUGMWZ/d A==;
X-CSE-ConnectionGUID: CBdPEbaYQ/GRSjP8yHwbDQ==
X-CSE-MsgGUID: wKIPozJGSK2DaFyiunlGQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14019613"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="14019613"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 03:58:31 -0700
X-CSE-ConnectionGUID: UFrR4WNbSAWTiDAnDpd0Tw==
X-CSE-MsgGUID: 4Nvko22vTCiemNPJ2eVPOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="37465105"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.33.194])
 ([10.246.33.194])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 03:58:29 -0700
Message-ID: <02afae56-3ce4-49a2-a9bf-f67e679f6ffb@linux.intel.com>
Date: Mon, 3 Jun 2024 12:58:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/client: Check return value of xe_force_wake_get
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240603083108.32346-1-nirmoy.das@intel.com>
 <bc097deb-d1d1-4f81-a90e-403414ca3e11@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <bc097deb-d1d1-4f81-a90e-403414ca3e11@intel.com>
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


On 6/3/2024 11:07 AM, Ghimiray, Himal Prasad wrote:
>
> On 03-06-2024 14:01, Nirmoy Das wrote:
>> xe_force_wake_get() can return error so check it's return value
>> before reading gpu_timestamp value.
>>
>> v2: set HWE to NULL instead of setting timestamp to 0(Lucas)
>>      Add a warn on for xe_force_wake_put(Himal)
>>
>> Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_drm_client.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c 
>> b/drivers/gpu/drm/xe/xe_drm_client.c
>> index 4a19b771e3a0..4bdb909eabfc 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -264,9 +264,13 @@ static void show_run_ticks(struct drm_printer 
>> *p, struct drm_file *file)
>>           if (!hwe)
>>               continue;
>>   -        xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +        if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT)) {
>
> Since xe_force_wake_get will increase the ref count irrespective of 
> acknowledgment from forcewake ack register fails or succeeds.

General pattern is to skip xe_force_wake_put() though at some places we 
do call xe_force_wake_put() when the caller is unabortable.

I don't know the exact reason but I  guess failure to wake a domain is 
serious enough so we want to  keep already woken domains  in wake state 
for system stability.


Regards,

Nirmoy


>
> It is required to decrement the ref count taken by xe_force_wake_get 
> by calling xe_force_wake_put before break.
>
> something like :
>
> if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
>
> hwe = NULL;
>
> else
>
> gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>
> XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>
>
>> +            hwe = NULL;
>> +            break;
>> +        }
>> +
>>           gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>> -        xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>           break;
>>       }
