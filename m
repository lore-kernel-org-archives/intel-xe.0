Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2674C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 12:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702CA10E2AC;
	Tue, 28 May 2024 12:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fpvFcK3S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B9010E2AC
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 12:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716901113; x=1748437113;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nzSQCoaT8J7kpfv/eYyAvaB7yYdkK1+2rcNsruMEiJo=;
 b=fpvFcK3S6W2tGsuDDNmyvpAeRVbcytKu6aryDRqr8k4vZB4snLI2v0Kb
 WEoTuyYijT/T3zEd7uwJ35yBtK3Af/aJGx8TaZ2H8f32VHgN5KIMcaBqE
 qHaIFPowXRMWcRi9PpMeOEiwOe+8pC5b2MaynrOb3qcGr0CFDLQHhct0S
 vbpc7YbbMIXG0rrV8m7+dCGsLacNsjkKw+enjnGD5dXXa9C3Klt2MGeQD
 AAjoF5ouuvp9t2HU2zQtnO0GvBVBplAxjW3rsvX9Xzx5whyvTOSmY0+zg
 HD8XrTqkw3VT5rX7lfq1XOSd2hZys4RnLNCJt0aurMHrFYtlyKdTKe6YB A==;
X-CSE-ConnectionGUID: +GmPvPLpT4aC0tJNqAssyA==
X-CSE-MsgGUID: 2VJj4bkBTVGHDtksDD/Umg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17077116"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="17077116"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:58:31 -0700
X-CSE-ConnectionGUID: MBLBQhhkRdeEPEecVIyj8g==
X-CSE-MsgGUID: RpwDYzurSh2sWeRR5Xd4PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="39909284"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.250.54])
 ([10.94.250.54])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:58:28 -0700
Message-ID: <13a07912-40cb-4f8d-9f0d-9314d07c0b19@linux.intel.com>
Date: Tue, 28 May 2024 14:58:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: allow unaligned start and size xe_res_cursor
 parameters
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 "Kuoppala, Mika" <mika.kuoppala@intel.com>
References: <20240418-xe_res_cursor-no-align-v1-1-8df7834266c9@intel.com>
 <fa111202-bd70-4ec2-bdb5-ac11786693f6@intel.com>
 <d871256ab4f0fcb955ff50c672b4d842f58bd167.camel@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <d871256ab4f0fcb955ff50c672b4d842f58bd167.camel@linux.intel.com>
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


On 5/24/2024 4:46 PM, Thomas Hellström wrote:
> On Fri, 2024-05-24 at 16:26 +0200, Andrzej Hajda wrote:
>> On 18.04.2024 16:03, Andrzej Hajda wrote:
>>> xe_res_cursor code does not depend on the alignment. On the other
>>> side
>>> unaligned accesses are useful from pread/pwrite point of view.
>>>
>>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> Gently ping.
> I think these asserts are aimed at catching weird
> values from the page-table code.
>
> But agree that the res_cursor code works without them AFAICT.
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Merged to  drm-xe-next


Thanks,

Nirmoy

>
>> Regards
>> Andrzej
>>
>>> ---
>>>    drivers/gpu/drm/xe/xe_res_cursor.h | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
>>> b/drivers/gpu/drm/xe/xe_res_cursor.h
>>> index 0a306963aa8e..655af89b31a9 100644
>>> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
>>> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
>>> @@ -157,8 +157,6 @@ static inline void xe_res_first_sg(const struct
>>> sg_table *sg,
>>>    				   struct xe_res_cursor *cur)
>>>    {
>>>    	XE_WARN_ON(!sg);
>>> -	XE_WARN_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
>>> -		   !IS_ALIGNED(size, PAGE_SIZE));
>>>    	cur->node = NULL;
>>>    	cur->start = start;
>>>    	cur->remaining = size;
>>>
>>> ---
>>> base-commit: f9116f658a6217b101e3b4e89f845775b6fb05d9
>>> change-id: 20240418-xe_res_cursor-no-align-a3bd26482244
>>>
>>> Best regards,
