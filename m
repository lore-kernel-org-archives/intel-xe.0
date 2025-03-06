Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91DAC282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 09:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A4B10E926;
	Thu,  6 Mar 2025 09:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QyJF+SiP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D6D10E926
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 09:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741254462; x=1772790462;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rzeCwxPAF3HkNQy6fiuhGRt0EXEZFE8XDraf2j7fwWs=;
 b=QyJF+SiP4yJwoBgKcPoith2zzf6FSNfUie9ZIbEnTucO4ewqE9S97tKn
 Qa4iMOz2ovPzLKhXNl9tGVkMajpMNi/G0cApLypXoy6tdKRCVF/iOrN88
 C+h59GsIjQaoC13u9nR6OghOwracou1TPWFHN8iR3ml34qP7yuRghDe0u
 fyrAOHXRXlyxQefxYnpKEkXNQyr5+xO/QuX44Q0X+Fl3JzfoLR6y8wuc1
 apPEMWAvqUF5/kfSVvh1OW3u307CTC2ZgfkwR9gpxw5K8TJfow4hhtKy2
 NN5g7yqSV5Mdtn1PurAnRUA9f5kaNwJpcQezsF/JOyys8B9XX+y/Fq6ZT A==;
X-CSE-ConnectionGUID: mkU9mwA2RASMQXeMoXIiNA==
X-CSE-MsgGUID: F4nxHEWgQHmaO5M2PYXyeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42279458"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="42279458"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:47:40 -0800
X-CSE-ConnectionGUID: tg6dC7g8T4KMPp3+Ynx2AA==
X-CSE-MsgGUID: fmJcsFxdR4+N7ZM6D90faA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119497604"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.234.91])
 ([10.247.234.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:47:38 -0800
Message-ID: <816f679f-e981-4ee5-9c19-31b2881b11e4@linux.intel.com>
Date: Thu, 6 Mar 2025 15:17:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/pcode: stop logging mailbox status as error
To: Raag Jadav <raag.jadav@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 intel-xe@lists.freedesktop.org
References: <20250304061727.452100-1-raag.jadav@intel.com>
 <29d173b4-4cac-4765-a13e-8723b44f5270@linux.intel.com>
 <Z8ljepyswfhWhl05@black.fi.intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <Z8ljepyswfhWhl05@black.fi.intel.com>
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


On 06-03-2025 14:27, Raag Jadav wrote:
> On Thu, Mar 06, 2025 at 10:08:07AM +0530, Aravind Iddamsetty wrote:
>> Hi Raag,
>>
>> On 04-03-2025 11:47, Raag Jadav wrote:
>>> Since we're expecting many platform specific mailbox commands that
>>> might not be widely supported, stop logging them as errors. With this
>>> we can avoid unnecessary platform checks and use the return value of
>>> mailbox without enraging CI.
>> are you saying there are cases where we send a command that is not supported
>> on a particular platform?
> Yes. First instance on [1], which will be expanded with more commands.
>
> [1] https://lore.kernel.org/r/20250210100515.2205584-1-raag.jadav@intel.com/

But why should we expose the interface which is not supported on that HW.

Thanks,
Aravind.
>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_pcode.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>>> index 9333ce776a6e..280f69119ff1 100644
>>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>>> @@ -46,7 +46,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>>>  
>>>  	err = xe_mmio_read32(&tile->mmio, PCODE_MAILBOX) & PCODE_ERROR_MASK;
>>>  	if (err) {
>>> -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
>>> +		drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
>>>  			err_decode[err].str ?: "Unknown");
>>>  		return err_decode[err].errno ?: -EPROTO;
>>>  	}
