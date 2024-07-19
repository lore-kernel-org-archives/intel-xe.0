Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FD5C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 17:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F40510E8E3;
	Fri, 19 Jul 2024 17:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITs7hwQt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4574810E8E3
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 17:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721409643; x=1752945643;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lJ0Y8Tw4tNBa6J68bNO1zU4Re461wERbpkYOWwpN4Pc=;
 b=ITs7hwQtU8na6e8JlQC84dg2dauoo8n4f/CQswfiLBWm+sVSuaHQtmP7
 8isA8N1WVDYLmVwlC98v6b0eFyPv4ymLPk0DomD9rSxUzNiTA4FbTwI/x
 wjmRq93vm/KzFVaFCMtbgaQvVqGw9OVJFkfIKh8NZJXGKRHeSbpneVzHv
 eu22UHIYgyCqOq7/GpmryYJhRlNe/yXIqksaER3vb6+OnbDYm5thsxMB5
 PXcF3Rc0e/H86g9QKzlCsbrd98aD5W7aVgjiB+FrKVQtaTa5lA7U9MfGz
 JAWFSJgJwIyNPKG+xZD96HhVFwaG487ve0DoCG50xtPXO78XvHLO8C/Zl g==;
X-CSE-ConnectionGUID: 0s/F5ECYR7u/g0j/S92CUg==
X-CSE-MsgGUID: 0x/3Sm+gTFalxwXNOIDlAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18880611"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="18880611"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 10:20:41 -0700
X-CSE-ConnectionGUID: FvDFyCsSSD6SdvllLsESOg==
X-CSE-MsgGUID: gto+G7bSQB+qcsDBLJJ2aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="88661682"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 19 Jul 2024 10:20:39 -0700
Received: from [10.245.82.99] (mwajdecz-MOBL.ger.corp.intel.com [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 9268F284ED;
 Fri, 19 Jul 2024 18:20:38 +0100 (IST)
Message-ID: <653951c8-e922-448d-928f-d2213e9a5045@intel.com>
Date: Fri, 19 Jul 2024 19:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] drm/xe/tests: Add helpers for use in live tests
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <20240717195155.442-3-michal.wajdeczko@intel.com>
 <oobqld5nhkmzotfrmcr6o55vpto2jagrybddrurojsfvrfrd2h@m5vcqrlxkdts>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <oobqld5nhkmzotfrmcr6o55vpto2jagrybddrurojsfvrfrd2h@m5vcqrlxkdts>
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



On 19.07.2024 18:37, Lucas De Marchi wrote:
> On Wed, Jul 17, 2024 at 09:51:50PM GMT, Michal Wajdeczko wrote:
>> Instead of iterating over available Xe devices within a testcase,
>> without being able to distinguish potential failures from different
>> devices on system with many Xe devices, introduce helpers that will
>> allow to treat each Xe device as a parameter for the testcase like:
>>
>> static void bar(struct kunit *test)
>> {
>>     struct xe_device *xe = test->priv;
>>     ...
>> }
>>
>> struct kunit_case foo_live_tests[] = {
>>     KUNIT_CASE_PARAM(bar, xe_pci_live_device_gen_param),
>>     {}
>> };
>>
>> struct kunit_suite foo_suite = {
>>     .name = "foo_live",
>>     .test_cases = foo_live_tests,
>>     .init = xe_kunit_helper_xe_device_live_test_init,
>> };
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> v2: can't rely on test->priv in .exit helper (CI)
>>    for cleanup use kunit_add_action_or_reset() instead
>> ---
>> drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 39 +++++++++++++++++++++
>> drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  2 ++
>> drivers/gpu/drm/xe/tests/xe_pci.c           | 30 ++++++++++++++++
>> drivers/gpu/drm/xe/tests/xe_pci_test.h      |  2 ++
>> 4 files changed, 73 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> index fefe79b3b75a..bc5156966ce9 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> @@ -12,7 +12,9 @@
>>
>> #include "tests/xe_kunit_helpers.h"
>> #include "tests/xe_pci_test.h"
>> +#include "xe_device.h"
>> #include "xe_device_types.h"
>> +#include "xe_pm.h"
>>
>> /**
>>  * xe_kunit_helper_alloc_xe_device - Allocate a &xe_device for a KUnit
>> test.
>> @@ -88,3 +90,40 @@ int xe_kunit_helper_xe_device_test_init(struct
>> kunit *test)
>>     return 0;
>> }
>> EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_test_init);
>> +
>> +KUNIT_DEFINE_ACTION_WRAPPER(put_xe_pm_runtime, xe_pm_runtime_put,
>> struct xe_device *);
>> +
>> +/**
>> + * xe_kunit_helper_xe_device_live_test_init - Prepare a &xe_device for
>> + *                                            use in a live KUnit test.
>> + * @test: the &kunit where live &xe_device will be used
>> + *
>> + * This function expects pointer to the &xe_device in the
>> &test.param_value,
>> + * like it is prepared by the &xe_pci_live_device_gen_param and
>> stores that
>> + * pointer as &kunit.priv to allow the test code to access it.
>> + *
>> + * This function makes sure that device is not wedged and then
>> resumes it
>> + * to avoid waking up the device inside the test. It uses deferred
>> cleanup
>> + * action to release a runtime_pm reference.
>> + *
>> + * This function can be used as custom implementation of
>> &kunit_suite.init.
>> + *
>> + * This function uses KUNIT_ASSERT to detect any failures.
>> + *
>> + * Return: Always 0.
>> + */
>> +int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
>> +{
>> +    struct xe_device *xe = xe_device_const_cast(test->param_value);
>> +
>> +    KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>> +    kunit_info(test, "running on %s device\n", xe->info.platform_name);
>> +
>> +    KUNIT_ASSERT_FALSE(test, xe_device_wedged(xe));
>> +    xe_pm_runtime_get(xe);
>> +    KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test,
>> put_xe_pm_runtime, xe));
>> +
>> +    test->priv = xe;
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_live_test_init);
>> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>> b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>> index 067a1babf049..83665f7b1254 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>> @@ -14,4 +14,6 @@ struct xe_device
>> *xe_kunit_helper_alloc_xe_device(struct kunit *test,
>>                           struct device *dev);
>> int xe_kunit_helper_xe_device_test_init(struct kunit *test);
>>
>> +int xe_kunit_helper_xe_device_live_test_init(struct kunit *test);
>> +
>> #endif
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c
>> b/drivers/gpu/drm/xe/tests/xe_pci.c
>> index f62809ca8b51..ab570dbb71ac 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>> @@ -167,3 +167,33 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>>     return 0;
>> }
>> EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
>> +
>> +/**
>> + * xe_pci_live_device_gen_param - Helper to iterate Xe devices as a
>> KUnit parameters
> 
> s/a KUnit parameters/KUnit parameters/ , or remove plural.
> 
> Can we filter by device or is this something coming in future?

not now, but it's the same gap as today, where we do live testing of all
found xe devices, without any way to apply any filter

last year I was looking how to add support at kunit level to filter
tests by parameter names, but didn't finish that nor post anything -
will try again if time permits

alternatively we can quickly add something specific to
xe_pci_live_device_gen_param(), like custom xe.modparam, to allow
filtering devices that will be generated as params

> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Lucas De Marchi
