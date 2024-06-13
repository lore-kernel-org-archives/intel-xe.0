Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A482C27C75
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 15:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C3210E00B;
	Thu, 13 Jun 2024 15:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mftp8lUs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7EC10E00B
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718293207; x=1749829207;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3mdx88NuzEbCiaJrGHSiGJ/B4jZTsF4y+2ZGxqd7brw=;
 b=mftp8lUsWSSbFWbgO1LYrK2YPmnC6DZwp7GDo3ubW7hwPO46nIEV7j9R
 FGhjUECTH/s/+3eADX49XCK+Kiu3/YroJCLUT2rNdaAJgRIi0/lTgNXG0
 x3q55dLYTM554l0rhTX6ROzDXs35pXyvneuNlm151EYfx64Wg6VPsuaHP
 n+FwuSGEuuOkabGvVRTDzX68+OTP6iWc3uupWFWd6qRGHa8+YWwC6ga8d
 O7vptrIp2J49JIS7tqKKqTFN9/Sa7SVOjFEJH0+qYGeEKijz3L+uu5qW9
 TUobs1ZNGcZAnVAPsHa5mZWc4wnnCLK4CPLv6Ci5Fwdb5ULevOF6cz0iA A==;
X-CSE-ConnectionGUID: C5hVhcF9Sh6Iv7cj0KRW3g==
X-CSE-MsgGUID: A/MCBsVOS4+zWKFRPUeGcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26247796"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="26247796"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:40:05 -0700
X-CSE-ConnectionGUID: Eo+dc9VXQk+52J/ygs9TfQ==
X-CSE-MsgGUID: bmjm4m1vS0SdjxhQ4mfKKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="44612184"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jun 2024 08:40:03 -0700
Received: from [10.245.119.62] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.119.62])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 5E39E28779;
 Thu, 13 Jun 2024 16:39:58 +0100 (IST)
Message-ID: <11e9ad2a-7eab-400e-abb8-b3cf2f2a2207@intel.com>
Date: Thu, 13 Jun 2024 17:39:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] drm/xe/oa/uapi: Add OA data formats
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240607204322.1966831-1-ashutosh.dixit@intel.com>
 <20240607204322.1966831-4-ashutosh.dixit@intel.com>
 <35b5e693-edf1-4924-85f2-56f3ba146206@intel.com>
 <871q5229zo.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <871q5229zo.wl-ashutosh.dixit@intel.com>
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



On 12.06.2024 04:03, Dixit, Ashutosh wrote:
> On Sat, 08 Jun 2024 03:54:16 -0700, Michal Wajdeczko wrote:

...

>>> diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
>>> new file mode 100644
>>> index 000000000000..a2f301e2be57
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_oa.h
>>> @@ -0,0 +1,16 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_OA_H_
>>> +#define _XE_OA_H_
>>> +
>>> +#include "xe_oa_types.h"
>>
>> don't include full header if you already have required forward decl
> 
> This one is unrelated. xe_oa.h is included in other files such as
> xe_device.c and those files need declarations in xe_oa_types.h. So I have
> left this as is. This is the same pattern as followed e.g. in
> xe_bb.h/xe_bb_types.h, xe_bo.h/xe_bo_types.h, xe_device.h/xe_device_types.h
> etc.
> 

I didn't know that we have that pattern defined as BKM, usually extra
includes are defined only if you provide some inline helpers that would
need them, so I would ask Lucas for opinion here

Michal


>
>> +
>> +struct xe_device;
>> +
>> +int xe_oa_init(struct xe_device *xe);
>> +void xe_oa_fini(struct xe_device *xe);
>> +
>> +#endif
