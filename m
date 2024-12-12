Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00D0E77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 21:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F7110E21D;
	Thu, 12 Dec 2024 21:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDDDtA4Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B1010E214
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 21:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734040121; x=1765576121;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ckwx0vXSx1UJQYmicybxr9xm8vWNNU8TAFZN4TGFSfc=;
 b=DDDDtA4Zq9Fk6ml64KbzboEq9PPlbQXOLTAj670XsUr7nGf6p40t7voK
 cRy3kWJXvfUNjPgu0ATovnUG9ePnJuXKkxH1e6P+5tJGYaaHX8o4jPAXX
 31noZALKxb6qGZLLInB0WKU9+46xBDWJ+1t/nkgDR/KkArhAAOQNO6suR
 OimlCwT1hFdDfFMEJ1/Oz6jJNMSaXCWJWPrfbJZTbb/SALFgRhNC12ldu
 4czbqjG/EyOcACTcNIV+3IxoCotUQRh4jwQFqr/4kwNna5JZepEa1e+it
 TjOki9FMPcUz+qIBC1VCdZr1QpGjVgvMGHQcwCr7OV7Qapb/0wxKxUJ+a w==;
X-CSE-ConnectionGUID: GGc/1+sHRN+2Fsbhnku5vA==
X-CSE-MsgGUID: hvPlmTtlS2uH9UnBUorkMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34612497"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="34612497"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 13:48:38 -0800
X-CSE-ConnectionGUID: dtnRtnE6SiaMJf2jsyLdDA==
X-CSE-MsgGUID: yetb+nFjRhO0T+TJgNL3/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127355865"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2024 13:48:36 -0800
Received: from [10.246.21.182] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.21.182])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 5049428780;
 Thu, 12 Dec 2024 21:48:35 +0000 (GMT)
Message-ID: <c6578aa3-1449-4469-8e4c-b7231e81529b@intel.com>
Date: Thu, 12 Dec 2024 22:48:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] drm/xe/guc: Introduce the GuC Buffer Cache
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-11-michal.wajdeczko@intel.com>
 <Z1pY8LNHWTWFm+4f@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Z1pY8LNHWTWFm+4f@lstrano-desk.jf.intel.com>
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



On 12.12.2024 04:30, Matthew Brost wrote:
> On Thu, Dec 12, 2024 at 02:01:38AM +0100, Michal Wajdeczko wrote:

...

>> diff --git a/drivers/gpu/drm/xe/xe_guc_buf_types.h b/drivers/gpu/drm/xe/xe_guc_buf_types.h
>> new file mode 100644
>> index 000000000000..9e123d71c064
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_buf_types.h
>> @@ -0,0 +1,28 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_BUF_TYPES_H_
>> +#define _XE_GUC_BUF_TYPES_H_
>> +
>> +struct drm_suballoc;
>> +struct xe_sa_manager;
>> +
>> +/**
>> + * struct xe_guc_buf_cache - GuC Data Buffer Cache.
>> + */
>> +struct xe_guc_buf_cache {
>> +	/* private: internal sub-allocation manager */
> 
> I think this generate kerenl doc complaints.
> 

or maybe not, see [1] which says:

"Inside a struct or union description, you can use the private: and
public: comment tags. Structure fields that are inside a private: area
are not listed in the generated output documentation."

and CI.hooks is also fine with it

[1] https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#members

> i.e. Should be:
> 
> /* @sam: private - internal sub-allocation manager */
> 
>> +	struct xe_sa_manager *sam;
>> +};
>> +
>> +/**
>> + * struct xe_guc_buf - GuC Data Buffer Reference.
>> + */
>> +struct xe_guc_buf {
>> +	/* private: internal sub-allocation reference */
> 
> Same here.
> 
> Matt
> 
>> +	struct drm_suballoc *sa;
>> +};
>> +
>> +#endif
