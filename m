Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C09C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 08:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF78110E2E7;
	Mon, 13 May 2024 08:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+dPqRZI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D91110E2E7
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 08:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715588871; x=1747124871;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FoCM2Eo2IjwschERvb2jgjZVh9WHnGvdzTejQ3dHP8o=;
 b=i+dPqRZIAhzGLeG7AKRMMQsZFMd3qyrTEXEEyDsRoIM5MxZa5jUsMTLV
 hiVLt0CoBQLpQfHLL52hBn2Ry2E/RmmJNwIyEapi9nQiOk/XyX+D3FmQo
 CKKA2MfYe75E+PNOa00IKbaSExV5fftvMBlCLQh0wa0R2c8DyvBEXz3n1
 L+J5ynQRJSlTm1DHVOlL7Mnd/Wu6uvpWZNFddBPiefjdXcRabOiEw3ODB
 tmZRS+qqnB2AiwNSISa9P23uONy6/lIHLrKwnBmfKtZ15SSWUZU2nte0F
 +ZlFmw7kKwMj90gyL/6E65JRiYBC6Kv0+mVnI/VSTm0E4RxVQnSgBRRU9 g==;
X-CSE-ConnectionGUID: cdiFb8nGTaKwSdcqbUsMdw==
X-CSE-MsgGUID: l7L6j0MATUi/A11nETMI7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="15304453"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="15304453"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:27:50 -0700
X-CSE-ConnectionGUID: 4iBZGbilSZyT09Oi9ua51g==
X-CSE-MsgGUID: /NtwNZPISbCzzZ6nm4i03A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30386271"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.243])
 ([10.245.244.243])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:27:49 -0700
Message-ID: <d30174f3-b1af-4311-b441-8f9fbeae3978@intel.com>
Date: Mon, 13 May 2024 09:27:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/20] drm/xe/display: stop calling domains_driver_remove
 twice
To: Andrzej Hajda <andrzej.hajda@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-41-matthew.auld@intel.com>
 <c6395f41-462e-4ad7-bedf-67828e255469@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <c6395f41-462e-4ad7-bedf-67828e255469@intel.com>
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

On 13/05/2024 09:19, Andrzej Hajda wrote:
> On 10.05.2024 20:12, Matthew Auld wrote:
>> Unclear why we call this twice.
> 
> Hmm, where is another call, I couldn't find one.

In intel_display_driver_remove_nogem it is already called.

> 
> Andrzej
> 
> 
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_display.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c 
>> b/drivers/gpu/drm/xe/display/xe_display.c
>> index 6d74c9f55b0a..734bddbb8932 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -134,7 +134,6 @@ static void xe_display_fini_noirq(void *arg)
>>           return;
>>       intel_display_driver_remove_noirq(xe);
>> -    intel_power_domains_driver_remove(xe);
> 
> 
>>   }
>>   int xe_display_init_noirq(struct xe_device *xe)
> 
