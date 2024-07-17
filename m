Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B97EC3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 21:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D430B10E468;
	Wed, 17 Jul 2024 21:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kWSBH/I/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284A410E469
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 21:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721253282; x=1752789282;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=x6pmtoKe5iUNIEpVHNKGS5bpGGZBEv2IWuDhG/iRGgQ=;
 b=kWSBH/I/GSY6+hMBtzfYUdSQf8Gbjml+RrBpegkfByg99vouTqTnHsX9
 O5NYswfgyBy1G6oEHj53y5gmLVNNr8AnD58SdO/FCoOlXCoiAksTD76ou
 fbI0SBQCGl6ZRLeMLee4Z+4T9FRs4Ie8WoBKHDmAZpI2J9dO73DDH/pFt
 HPMQRxSSqDDqP9XSbjFoGiAE9OZ/tHcTGuEkNINSUwsMXDpUimsIw/5q0
 NHbF7PDayC5kqanTBCE9UYJkSljVo4bdkI0pEfhCkvjXLNrNDPXmj9Fwy
 Da3FN9nHl8zn8M1ZOc4RcP1RU6fMlgWYQm4pcZwz/rCaN4KS16cioolGL Q==;
X-CSE-ConnectionGUID: 2UEaadeDQiedye2yOzMl2A==
X-CSE-MsgGUID: dAkyWuOBRrCx/od17ad1tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29944015"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="29944015"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 14:54:41 -0700
X-CSE-ConnectionGUID: A+praXyOQTGfVRbbV2NJvA==
X-CSE-MsgGUID: FrIjcnVjS+G+ZOTS/arhrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="50593652"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 17 Jul 2024 14:54:40 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 082732878E;
 Wed, 17 Jul 2024 22:54:38 +0100 (IST)
Message-ID: <8088e74f-d753-4acd-a679-4f5d2fbab94b@intel.com>
Date: Wed, 17 Jul 2024 23:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/xe/tests: Convert xe_dma_buf live tests
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <20240717195155.442-5-michal.wajdeczko@intel.com>
 <CH0PR11MB5444E83BC6DE82E5141F711DE5A32@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB5444E83BC6DE82E5141F711DE5A32@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 17.07.2024 22:17, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> Sent: Wednesday, July 17, 2024 12:52 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Subject: [PATCH v2 4/7] drm/xe/tests: Convert xe_dma_buf live tests
>>
>> Convert xe_dma_buf live tests to parameterized style.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Just read this after the third patch.  I wonder if it wouldn't be better
> to perform this parameterization on all unparameterized tests in the
> same patch?  There's probably some benefit to keeping them
> separate, just in case one set of tests needs to get reverted back to
> the old style, though, so no blocks from me here.

IMO its easier to review small patches, so if we can split changes into
separate standalone patches, keeping in mind what is a 'logical change',
then we should do it.

[1]
https://docs.kernel.org/process/submitting-patches.html#separate-your-changes

> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt

Thanks!

> 
>> ---
>>  drivers/gpu/drm/xe/tests/xe_dma_buf.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> index 4f9dc41e13de..c24c8509227e 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> @@ -8,6 +8,7 @@
>>  #include <kunit/test.h>
>>  #include <kunit/visibility.h>
>>  
>> +#include "tests/xe_kunit_helpers.h"
>>  #include "tests/xe_pci_test.h"
>>  
>>  #include "xe_pci.h"
>> @@ -275,11 +276,13 @@ static int dma_buf_run_device(struct xe_device *xe)
>>  
>>  static void xe_dma_buf_kunit(struct kunit *test)
>>  {
>> -	xe_call_for_each_device(dma_buf_run_device);
>> +	struct xe_device *xe = test->priv;
>> +
>> +	dma_buf_run_device(xe);
>>  }
>>  
>>  static struct kunit_case xe_dma_buf_tests[] = {
>> -	KUNIT_CASE(xe_dma_buf_kunit),
>> +	KUNIT_CASE_PARAM(xe_dma_buf_kunit, xe_pci_live_device_gen_param),
>>  	{}
>>  };
>>  
>> @@ -287,5 +290,6 @@ VISIBLE_IF_KUNIT
>>  struct kunit_suite xe_dma_buf_test_suite = {
>>  	.name = "xe_dma_buf",
>>  	.test_cases = xe_dma_buf_tests,
>> +	.init = xe_kunit_helper_xe_device_live_test_init,
>>  };
>>  EXPORT_SYMBOL_IF_KUNIT(xe_dma_buf_test_suite);
>> -- 
>> 2.43.0
>>
>>
