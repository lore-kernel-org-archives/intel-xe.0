Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571CDC0219D
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 10:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2327F10EAB3;
	Fri,  7 Feb 2025 10:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBXsFw2g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A0A10EA97
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 10:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738923622; x=1770459622;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=m46ZPx4CHhgWi6AHtGOc+5nWnnSUvCRvz9qZ09s63C4=;
 b=QBXsFw2gVHF4K9bVcfNyhI4C+twm0F9SkC25BcBIxBkxRl0Gy6fdIgMQ
 KFmWpkt+kB9GLrDpacrwNuhxEjj+ADSVnj8hyqluJZMmGxVXaGQSrwDgo
 684ByrD23S2HaBYVYpAS/9u6NWemaNm+3bPijnoe4ouNAgiuT76Ll4I9p
 KncN169ayG3NAm7SOUKHfFZ8XVQwpPivbZ51XItMPWluoVUQo7RFRREme
 oIUyWWuIXsBWT5Y9p13+V9LGkgL8ESns+4YWzdxYa9pW1DliE6CAdOGRQ
 eywAM2t9her/Kak+/1kKQnyYtIvREhCTUD8gFEa+a53LeYl16+htPoV5U g==;
X-CSE-ConnectionGUID: pSyXlDuAR2qHRtS+AXJxLg==
X-CSE-MsgGUID: LIpZXNKwTW+BcvO+8+spzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43222197"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="43222197"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 02:20:22 -0800
X-CSE-ConnectionGUID: hIblrYM3TMe07lBpzxrFZA==
X-CSE-MsgGUID: EKZg47eDTgKXx8D9GjsP1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111339188"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.74])
 ([10.245.244.74])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 02:20:20 -0800
Message-ID: <286f74fa-1021-478b-b8db-74acd4f320cb@intel.com>
Date: Fri, 7 Feb 2025 10:20:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/14] drm/xe/hwmon: Fix mutex destroy
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>
References: <20250206232333.2660325-1-lucas.demarchi@intel.com>
 <20250206232333.2660325-14-lucas.demarchi@intel.com>
 <h3qkpwdljkdfi22j3ldgqenhlb6j6k6wuksmazdfnuy3twapjn@umhq67gyaekc>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <h3qkpwdljkdfi22j3ldgqenhlb6j6k6wuksmazdfnuy3twapjn@umhq67gyaekc>
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

On 07/02/2025 03:27, Lucas De Marchi wrote:
> On Thu, Feb 06, 2025 at 03:23:31PM -0800, Lucas De Marchi wrote:
>> Since the mutex is used if userspace kept the fd open, it can't be
>> released together with the dev cleanup and needs to be delayed. Also,

Where is that? I would have thought here that 
devm_hwmon_device_register_with_info() would ensure nothing can reach 
that lock once the physical device is detached, since everything 
contained in xe->hwmon is tied to that, including the lock. It looks a 
little weird but seems like it should be fine?

>> there's no need to add an action just to release the mutex: use the
>> specific drmm_mutex_init() that should be smarter if mutex_destroy() is
>> actually a nop.
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Karthik Poosa <karthik.poosa@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> oops... 3a13c2de442d6bfaef9c102cd1092e6cae22b753
> 
> the reasoning is true, but the entire thing is in struct devm allocated.
> Then CI complains:
> 
> <4> [321.873848] WARNING: CPU: 13 PID: 12544 at kernel/locking/mutex- 
> debug.c:114 mutex_destroy+0x5b/0x60
 > >
> Lucas De Marchi
> 
>> ---
>> drivers/gpu/drm/xe/xe_hwmon.c | 10 +---------
>> 1 file changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/ 
>> xe_hwmon.c
>> index 7f327e3342123..0fc91c184570d 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -869,13 +869,6 @@ xe_hwmon_get_preregistration_info(struct 
>> xe_device *xe)
>>             xe_hwmon_energy_get(hwmon, channel, &energy);
>> }
>>
>> -static void xe_hwmon_mutex_destroy(void *arg)
>> -{
>> -    struct xe_hwmon *hwmon = arg;
>> -
>> -    mutex_destroy(&hwmon->hwmon_lock);
>> -}
>> -
>> void xe_hwmon_register(struct xe_device *xe)
>> {
>>     struct device *dev = xe->drm.dev;
>> @@ -895,8 +888,7 @@ void xe_hwmon_register(struct xe_device *xe)
>>
>>     xe->hwmon = hwmon;
>>
>> -    mutex_init(&hwmon->hwmon_lock);
>> -    if (devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon))
>> +    if (drmm_mutex_init(&xe->drm, &hwmon->hwmon_lock))
>>         return;
>>
>>     /* There's only one instance of hwmon per device */
>> -- 
>> 2.48.1
>>

