Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF0DC27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 14:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC0710E402;
	Mon, 17 Jun 2024 14:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZ0bosZU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3900410E402
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 14:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718636135; x=1750172135;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Xl3RhhGUKaT/diOtDhBxa0E8JLskQX0f8EYocWbtiGo=;
 b=EZ0bosZUJLe+0yVWNkS4mB9TnEqyUd0V4aGFNyBTOFhqyQQk506hN9n+
 f9cOVpQI+WJsn6VBAUPz2Bq4USgGTtnTZrCOYm0Dz/cStDu8nyZBxn0lv
 OBxdoVGyp061Wl6ko4U9bCtVKWD5oCHxyM9ItirrYylVYnfrHwoTvIYXW
 nxBD8mqJ3zIspLkWAT1GbdBsE4lSdfywVaQcsn18r6BSYoeGWysB2lgIh
 kxIs7xc+Kv6y2BWWjuAQIuHU4+WLvzUOLmQrjUuQeEvgT9PYEWRKELV65
 X2Nr7F6nLIYNiK1z0HV4dke9w0Dac7BK48UbHjksRUIGeVRTHDVPE7fEl w==;
X-CSE-ConnectionGUID: JWka+sTkS0azJw6M+bp8/w==
X-CSE-MsgGUID: AnBanxYeQLWzj7JKLN7rnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15306443"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="15306443"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:55:35 -0700
X-CSE-ConnectionGUID: ipADegw6SiagSF4X7Cq89w==
X-CSE-MsgGUID: /0kRzrECSEugpeDSVernlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41333765"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 17 Jun 2024 07:55:33 -0700
Received: from [10.245.119.62] (unknown [10.245.119.62])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 79EDD333F7;
 Mon, 17 Jun 2024 15:55:31 +0100 (IST)
Message-ID: <b6181da9-abc4-4756-b476-81f34fe6f06e@intel.com>
Date: Mon, 17 Jun 2024 16:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] drm/xe: Introduce PM guard classes
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240617140120.597-1-michal.wajdeczko@intel.com>
 <20240617140120.597-2-michal.wajdeczko@intel.com>
 <kczbmwizw3vd5sw4yj34sftjfgif5yyoomo4tmlbd7lq2xwy77@punlz6twxwvl>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <kczbmwizw3vd5sw4yj34sftjfgif5yyoomo4tmlbd7lq2xwy77@punlz6twxwvl>
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



On 17.06.2024 16:37, Lucas De Marchi wrote:
> On Mon, Jun 17, 2024 at 04:01:19PM GMT, Michal Wajdeczko wrote:
>> There is support for 'classes' with constructor and destructor
>> semantics that can be used for scope-based resource management,
>> like our device power management.
>>
>> Use provided macros from linux/cleanup.h to generate required
>> code definitions.
>>
>> This should allow us to use:
>>
>>     scoped_guard(xe_pm, xe)
>>         foo();
>> or
>>     CLASS(xe_pm, var)(xe);
>>
>> without any concern of leaking the pm reference.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_pm.h | 5 +++++
>> 1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>> index 104a21ae6dfd..26293a3b18af 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.h
>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>> @@ -6,6 +6,7 @@
>> #ifndef _XE_PM_H_
>> #define _XE_PM_H_
>>
>> +#include <linux/cleanup.h>
> 
> Cool, I didn't know we had  helpers in the kernel for attribute cleanup
> and friends.
> 
>> #include <linux/pm_runtime.h>
>>
>> #define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
>> @@ -33,4 +34,8 @@ int xe_pm_set_vram_threshold(struct xe_device *xe,
>> u32 threshold);
>> void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
>> struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
>>
>> +DEFINE_GUARD(xe_pm, struct xe_device *, xe_pm_runtime_get(_T),
>> xe_pm_runtime_put(_T))
> 
> per linux/cleanup.h doc it seems DEFINE_GUARD() was intended
> specifically for locks though:
> 
>  * DEFINE_GUARD(name, type, lock, unlock):
>  *      trivial wrapper around DEFINE_CLASS() above specifically
>  *      for locks.
> 
> we probably shouldn't abuse it or get the doc changed

probably the latter as this is exactly what we want

besides, maybe we can argue that what we do is actually 'locking' since
this is a required step, like obtaining mutex, before we start to use
the device

> 
> Lucas De Marchi
> 
>> +DEFINE_GUARD_COND(xe_pm, _if_active, xe_pm_runtime_get_if_active(_T))
>> +DEFINE_GUARD_COND(xe_pm, _if_in_use, xe_pm_runtime_get_if_in_use(_T))
>> +
>> #endif
>> -- 
>> 2.43.0
>>
