Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4710C072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 15:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC2410E2F7;
	Fri, 17 Nov 2023 15:38:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0860F10E2F8
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 15:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700235498; x=1731771498;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Yu33DI+o9QE2z6bm6a7KR3dyCV6zbyw9LdxNzOWGcbc=;
 b=DuNIQ2Ra7zSvSg1MQfouTegok6Fnmj9aIcaZ804ly2wh8AuhnIltudcz
 tow5HkGkDflPB8Arr6r/4TUE1QmiJNZuflMAG/mEhTDBnEm3i273RGl2U
 y32apwcLEgYQuF71iGY9nP3hY3dosy/F9vJL3S7XJFnMfKzf0wsHBY3AK
 ilqdI/9P41qd/n9LFUzs7Og3oT6gpqadAdR6f1r2nVJ7AJbA8FDlAALPV
 OF1y8/SMYYw9l2izqwlX9qzvrg1/iCqwflpYe/lzjjpP/g+V3eKfkFQS1
 TLHJuXbwM0T5I5o1rh/knbYfabjNIJWq7isbvEbgyGkY75+jVtMBASrMk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="422411140"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="422411140"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 07:38:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="6870289"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 17 Nov 2023 07:38:16 -0800
Received: from [10.249.153.147] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.153.147])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B704632ED8;
 Fri, 17 Nov 2023 15:38:14 +0000 (GMT)
Message-ID: <92551146-9a5b-442f-853a-7c00f363a7a9@intel.com>
Date: Fri, 17 Nov 2023 16:38:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20231115115816.1993-1-michal.wajdeczko@intel.com>
 <k44j466umocyafacwppftvjgfiosfqar7yvfql6d6jzo4dfgzd@l34dku4avpjb>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <k44j466umocyafacwppftvjgfiosfqar7yvfql6d6jzo4dfgzd@l34dku4avpjb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/kunit: Return number of iterated
 devices
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 17.11.2023 16:18, Lucas De Marchi wrote:
> On Wed, Nov 15, 2023 at 12:58:16PM +0100, Michal Wajdeczko wrote:
>> In xe_call_for_each_device() we are already counting number of
>> iterated devices. Lets make that available to the caller too.
> 
> anything useful to do with the return? Is there a follow up patch here?

there is, but down the road together with some SR-IOV tests

but IMO even if there would be none tests right now, if information is
available at no cost we should make make functions as useful as possible
to allow future new use cases

> 
> Lucas De Marchi
> 
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> drivers/gpu/drm/xe/tests/xe_pci.c | 6 +++---
>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c
>> b/drivers/gpu/drm/xe/tests/xe_pci.c
>> index a40879da2fbe..306ff8cb35cb 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>> @@ -42,8 +42,8 @@ static int dev_to_xe_device_fn(struct device *dev,
>> void *__data)
>>  * function. Across each function call, drm_dev_enter() /
>> drm_dev_exit() is
>>  * called for the corresponding drm device.
>>  *
>> - * Return: Zero or the error code of a call to @xe_fn returning an error
>> - * code.
>> + * Return: Number of devices iterated or
>> + *         the error code of a call to @xe_fn returning an error code.
>>  */
>> int xe_call_for_each_device(xe_device_fn xe_fn)
>> {
>> @@ -59,7 +59,7 @@ int xe_call_for_each_device(xe_device_fn xe_fn)
>>     if (!data.ndevs)
>>         kunit_skip(current->kunit_test, "test runs only on hardware\n");
>>
>> -    return ret;
>> +    return ret ?: data.ndevs;
>> }
>>
>> /**
>> -- 
>> 2.25.1
>>
