Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273D0C71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 19:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFD510E9A6;
	Fri, 13 Jun 2025 19:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lK/HuFq0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAB210EA45
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 19:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749842468; x=1781378468;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=VC2k16EruImw332eNcX9VuwGOcA2m0z7jr3VD4Ej0r8=;
 b=lK/HuFq0hUojNNWq/2RnOhZEaQlGHiVc36X+OFLqzBUvwXUQAZi1CLFV
 UfeGV0wF2kqK1hi1cCbofyAcyKF8EVeEUMcsRepd/tuWMLl6TO5+L9NvH
 7EBIOMkcvqnM2yznelRNHWvsqPBPpJjRAx3Dp0IPKob0tLDuEVEJG7qIa
 4YokJXMbVxXrPl3FdjD6v18FN+1FtLPJDxF2ET+vQA84f+m8c9ztYuBXR
 spHT9QH+flv9OOE/V9hBcs3kMNa2zp4xIxrL/KNhATb6WcESc6uJNMOkL
 /pYvqK8RbEvEykoL5gwhyFWW1sc/5Ey69cbSYkrkx+5lzkXW8rVfUlsvP A==;
X-CSE-ConnectionGUID: rIgjEqezTd2fHkvO5IETeA==
X-CSE-MsgGUID: Q4sqTCzeRsyXhDqfKNuLjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69509610"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="69509610"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:21:08 -0700
X-CSE-ConnectionGUID: eB5z5LKOSdWpaRiMCsl59A==
X-CSE-MsgGUID: G+lqTLsuQTW9WF1ym7KTFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="153191780"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 13 Jun 2025 12:21:07 -0700
Received: from [10.245.96.176] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.176])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4B77B3432F;
 Fri, 13 Jun 2025 20:21:04 +0100 (IST)
Message-ID: <380760e0-dc0f-48b6-b20e-d501167e3c83@intel.com>
Date: Fri, 13 Jun 2025 21:21:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe/tests/pci: Ensure all platforms have a valid
 GT/tile count
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20250613001438.678728-7-matthew.d.roper@intel.com>
 <20250613001438.678728-10-matthew.d.roper@intel.com>
 <de11c42c-98b4-4ae8-a91e-ed2f06cc8337@intel.com>
Content-Language: en-US
In-Reply-To: <de11c42c-98b4-4ae8-a91e-ed2f06cc8337@intel.com>
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



On 13.06.2025 19:59, Michal Wajdeczko wrote:
> 
> 
> On 13.06.2025 02:14, Matt Roper wrote:
>> Add a simple kunit test to ensure each platform's GT per tile count is
>> non-zero and does not exceed the global XE_MAX_GT_PER_TILE definition.
>>
>> We need to move 'struct xe_subplatform_desc' from the .c file to the
>> types header to ensure it is accessible from the kunit test.
>>
> 
> ...
> 
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>> index ede46800aff1..5abbf522f7a8 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>> @@ -14,13 +14,16 @@
>>  struct xe_device;
>>  struct xe_graphics_desc;
>>  struct xe_media_desc;
>> +struct xe_device_desc;
>>  
>>  typedef int (*xe_device_fn)(struct xe_device *);
> 
> note: this is not used, can be dropped/replaced
> 
>>  typedef void (*xe_graphics_fn)(const struct xe_graphics_desc *);
>>  typedef void (*xe_media_fn)(const struct xe_media_desc *);
>> +typedef void (*xe_platform_fn)(const struct xe_device_desc *);
> 
> this is more like 'device_desc' function, so either:
> 
> 	xe_device_desc_fn
> or
> 	xe_device_fn
> 
> since previous typedef is not used anywhere
> 
>>  
>>  void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn);
>>  void xe_call_for_each_media_ip(xe_media_fn xe_fn);
>> +void xe_call_for_each_platform(xe_platform_fn xe_fn);
> 
> to match above pattern maybe:
> 
> 	void xe_call_for_each_device_desc(xe_device_desc_fn fn);
> 
> then later we could add really something like:
> 
> 	typedef void (*xe_platform_fn)(enum xe_platform platform,
> 				       enum xe_subplatform subplatform);
> 
> 	void xe_call_for_each_platform(xe_platform_fn xe_fn);
> 
> which would help us create new tests based on per-platform pattern.
> 
> or maybe we should already start converting existing tests that use
> xe_call_for_each() into parametrized tests that use generators instead?

please see https://patchwork.freedesktop.org/series/150254/

