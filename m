Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B4AE77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 21:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F7410E104;
	Wed, 18 Dec 2024 21:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Imuplagi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E539F10E104
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734555834; x=1766091834;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=k1TO772TBYeWBziwI1OtBWU6vBON0EOnXD9Pblwt2uo=;
 b=Imuplagi4B/hOqvcdolV3e21U21O93pL+XMrURInx8sLiLq4MVXwNSbs
 gn26OWikbFkZsqKCsAOFqteemy5saHWGuEYpd82oFnUFTe7rpZfgDsXgR
 vHERVc4SgGytcxgS4IRM36/hdhplqJPqJJwU5iidLx3E+HXU3tK/zKUw8
 J/Xmaq10NeygeTSMHZxtLUY5VaO36ZmoPFS8sFOSPSVt7I5iRDkz4fcAd
 dmWJWNjyDq/L4aJ3szd9hic80zOxv08G+fPKCO2E9gLnKIxW54xaroImv
 nDorzU7zhT+Ik+b+RjzTyvrjmvrx0R3G9QX7PP3VDSgLP4mkTP8hOIuDG g==;
X-CSE-ConnectionGUID: 7CDgQtzVR8exmeM9XzDbpA==
X-CSE-MsgGUID: Hxc0XNIMQFGo+wgVsXYZTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34952136"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34952136"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:03:54 -0800
X-CSE-ConnectionGUID: goqDgbsUTpyXWS3+FharuA==
X-CSE-MsgGUID: 2YjfJH7WSqC2TlQ9grZSHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98793051"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 18 Dec 2024 13:03:52 -0800
Received: from [10.246.0.69] (mwajdecz-MOBL.ger.corp.intel.com [10.246.0.69])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8CA402711F;
 Wed, 18 Dec 2024 21:03:51 +0000 (GMT)
Message-ID: <05d474ac-9d04-4c2e-9f0b-e24eb39fef39@intel.com>
Date: Wed, 18 Dec 2024 22:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] drm/xe/guc: Introduce the GuC Buffer Cache
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-11-michal.wajdeczko@intel.com>
 <Z1pY8LNHWTWFm+4f@lstrano-desk.jf.intel.com>
 <c6578aa3-1449-4469-8e4c-b7231e81529b@intel.com>
 <Z1x/Dd9WaaKTcABC@lstrano-desk.jf.intel.com> <Z1yVX8wtuPn_6X9V@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Z1yVX8wtuPn_6X9V@intel.com>
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



On 13.12.2024 21:13, Rodrigo Vivi wrote:
> On Fri, Dec 13, 2024 at 10:38:05AM -0800, Matthew Brost wrote:
>> On Thu, Dec 12, 2024 at 10:48:34PM +0100, Michal Wajdeczko wrote:
>>>
>>>
>>> On 12.12.2024 04:30, Matthew Brost wrote:
>>>> On Thu, Dec 12, 2024 at 02:01:38AM +0100, Michal Wajdeczko wrote:
>>>
>>> ...
>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_buf_types.h b/drivers/gpu/drm/xe/xe_guc_buf_types.h
>>>>> new file mode 100644
>>>>> index 000000000000..9e123d71c064
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_buf_types.h
>>>>> @@ -0,0 +1,28 @@
>>>>> +/* SPDX-License-Identifier: MIT */
>>>>> +/*
>>>>> + * Copyright © 2024 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#ifndef _XE_GUC_BUF_TYPES_H_
>>>>> +#define _XE_GUC_BUF_TYPES_H_
>>>>> +
>>>>> +struct drm_suballoc;
>>>>> +struct xe_sa_manager;
>>>>> +
>>>>> +/**
>>>>> + * struct xe_guc_buf_cache - GuC Data Buffer Cache.
>>>>> + */
>>>>> +struct xe_guc_buf_cache {
>>>>> +	/* private: internal sub-allocation manager */
>>>>
>>>> I think this generate kerenl doc complaints.
>>>>
>>>
>>> or maybe not, see [1] which says:
>>>
>>> "Inside a struct or union description, you can use the private: and
>>> public: comment tags. Structure fields that are inside a private: area
>>> are not listed in the generated output documentation."
>>>
>>> and CI.hooks is also fine with it
>>>
>>> [1] https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#members
>>>
>>
>> Ah, ok. However AFIAK we don't use this style anywhere in Xe so maybe
>> double check with the maintainers on there preference.
> 
> As long as it is in-line member doc comment we should be okay.
> 
> But do you intend to expand these 2 structs later? It is kind of strange

no, they are just simple wrappers around SA types, but allows strict
type checks to avoid mismatch with ordinary SA objects

> that they are exported in a _types.h with only 'private' members. In
> the current way it doesn't look like we need this _types.h at all and
> only static struct in .h or .c itself....

can't be static in .c since we need full definition externally

and IMO we shouldn't define them in .h either as our "rule" is to keep
all type definitions in _types.h, since some types, xe_guc_buf_cache,
will be referenced directly by other _types.h files (guc_types.h)

> 
>>
>> Matt 
>>
>>>> i.e. Should be:
>>>>
>>>> /* @sam: private - internal sub-allocation manager */
>>>>
>>>>> +	struct xe_sa_manager *sam;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct xe_guc_buf - GuC Data Buffer Reference.
>>>>> + */
>>>>> +struct xe_guc_buf {
>>>>> +	/* private: internal sub-allocation reference */
>>>>
>>>> Same here.
>>>>
>>>> Matt
>>>>
>>>>> +	struct drm_suballoc *sa;
>>>>> +};
>>>>> +
>>>>> +#endif

