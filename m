Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E42C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 09:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C4510F1AD;
	Tue,  9 Apr 2024 09:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D11RgLwo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C0110F1AD
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 09:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712656117; x=1744192117;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=vUeuaJa3e+gGMXlOwg8mD2qwnbx4ExUR8FI3uo0MqdY=;
 b=D11RgLwoqfMShb4lD1PnfvehShbGNqaqGgT0fquMNk+E8dGiv/9sNAYK
 R1SOj0hQSx9Mf56V/LnYUL82JoDVRKbGi5oD2NVDCDWjQZncLoC3fyuoh
 VGFn4DFgNudFRKZ7hexzpl3nUXU8ZEDPdyqkKBu91p1nZYThJIRMXeeRn
 spMScGtzdT01W1h2Q4828JbkbMNOYrWtwfQFu2ETmmFcwCFOzM+togvyQ
 zfqZP03iUSa7GP0+vt9jyfCFOQXnDjPm0tnynGu7PIvX/VFI73/qYastU
 s/oLGJ6vMd8VgSeEzpKxHoA19AWlrtyqryqtNfGcsBCVNoGWyd3YEn9WZ Q==;
X-CSE-ConnectionGUID: GfaiC1x4SySiwXO64cZfNQ==
X-CSE-MsgGUID: k0rQMtX4S0aEb0AaxogMqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19393744"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="19393744"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 02:48:37 -0700
X-CSE-ConnectionGUID: lNMAWiMXSxqjRirZ1dADrQ==
X-CSE-MsgGUID: HL1TvZVqQ06rJi8VyEIOhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="20086734"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 09 Apr 2024 02:48:34 -0700
Received: from [10.249.158.230] (unknown [10.249.158.230])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3390E27BCD;
 Tue,  9 Apr 2024 10:48:33 +0100 (IST)
Message-ID: <a4c4603d-ed67-4b0b-8652-740f5f986689@intel.com>
Date: Tue, 9 Apr 2024 11:48:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/kunit: Add tests for GuC KLV helpers
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, intel-xe@lists.freedesktop.org
References: <20240408181408.1023-1-michal.wajdeczko@intel.com>
 <20240408181408.1023-3-michal.wajdeczko@intel.com>
 <d650d03a-19a9-4b4e-b050-8d2a522195ac@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <d650d03a-19a9-4b4e-b050-8d2a522195ac@intel.com>
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



On 09.04.2024 00:01, John Harrison wrote:
> Seems like a lot of effort for a couple of debug print helpers. Are
> these helpers actually expected to be used in a shipping driver for more
> than just error messages?

writing unit tests is not that big effort these days, and those helpers
will be also used in diagnostic messages, not just errors, to show VF's
provisioning details, and can also be used when writing live tests
against the GuC, so why don't make sure that helpers are correct?

> 
> John.
> 
> 
> On 4/8/2024 11:14, Michal Wajdeczko wrote:
>> We should make sure that recently added GuC KLV helpers are always
>> working as expected.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   .../drm/xe/tests/xe_guc_klv_helpers_test.c    | 200 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |   4 +
>>   2 files changed, 204 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_test.c
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_test.c
>> b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_test.c
>> new file mode 100644
>> index 000000000000..094cd9922c73
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_test.c
>> @@ -0,0 +1,200 @@
>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <kunit/test.h>
>> +
>> +static void bad_key_to_string(struct kunit *test)
>> +{
>> +    u16 key = 0xFFFF;
>> +
>> +    KUNIT_EXPECT_NOT_NULL(test, xe_guc_klv_key_to_string(key));
>> +    KUNIT_EXPECT_STREQ(test, xe_guc_klv_key_to_string(key),
>> "(unknown)");
>> +}
>> +
>> +static void good_key_to_string(struct kunit *test)
>> +{
>> +    u16 key = 0x0001; /* GUC_KLV_VF_CFG_GGTT_START */
>> +
>> +    KUNIT_EXPECT_NOT_NULL(test, xe_guc_klv_key_to_string(key));
>> +    KUNIT_EXPECT_STRNEQ(test, xe_guc_klv_key_to_string(key),
>> "(unknown)");
>> +}
>> +
>> +static void __to_buf_printfn(struct drm_printer *p, struct va_format
>> *vaf)
>> +{
>> +    char *buf = p->arg;
>> +
>> +     sprintf(buf, "%pV", vaf);
>> +}
>> +
>> +static struct drm_printer buf_printer(char *buf)
>> +{
>> +    struct drm_printer p = {
>> +        .printfn = __to_buf_printfn,
>> +        .arg = buf,
>> +    };
>> +    return p;
>> +}
>> +
>> +static void print_empty_klv(struct kunit *test)
>> +{
>> +    char buf[128] = {};
>> +    struct drm_printer p = buf_printer(buf);
>> +    u32 klv[] = {
>> +        FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
>> +    };
>> +
>> +    KUNIT_EXPECT_STREQ(test, buf, "");
>> +    xe_guc_klv_print(klv, ARRAY_SIZE(klv), &p);
>> +    KUNIT_EXPECT_STRNEQ(test, buf, "");
>> +    KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "key"));
>> +    KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "no value"));
>> +    kunit_info(test, "%s", buf);
>> +}
>> +
>> +static void print_klv32(struct kunit *test)
>> +{
>> +    char buf[128] = {};
>> +    struct drm_printer p = buf_printer(buf);
>> +    u32 klv[] = {
>> +        FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 1),
>> +        12345678,
>> +    };
>> +
>> +    KUNIT_EXPECT_STREQ(test, buf, "");
>> +    xe_guc_klv_print(klv, ARRAY_SIZE(klv), &p);
>> +    KUNIT_EXPECT_STRNEQ(test, buf, "");
>> +    KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "key"));
>> +    KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "32b value"));
>> +    KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "12345678"));
>> +    kunit_info(test, "%s", buf);
>> +}
>> +
>> +static void print_klv64(struct kunit *test)
>> +{
>> +    char buf[128] = {};
>> +    struct drm_printer p = buf_printer(buf);
>> +    u32 klv[] = {
>> +        FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 2),
>> +        0x87654321,
>> +        0x12345678,
>> +    };
>> +
>> +    KUNIT_EXPECT_STREQ(test, buf, "");
>> +    xe_guc_klv_print(klv, ARRAY_SIZE(klv), &p);
>> +    KUNIT_EXPECT_STRNEQ(test, buf, "");
>> +    KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "key"));
>> +    KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "64b value"));
>> +    KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "0x1234567887654321"));
>> +    kunit_info(test, "%s", buf);
>> +}
>> +
>> +static void print_big_klv(struct kunit *test)
>> +{
>> +    char buf[128] = {};
>> +    struct drm_printer p = buf_printer(buf);
>> +    u32 klv[] = {
>> +        FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 3),
>> +        0x11111111,
>> +        0x22222222,
>> +        0x33333333,
>> +    };
>> +
>> +    KUNIT_EXPECT_STREQ(test, buf, "");
>> +    xe_guc_klv_print(klv, ARRAY_SIZE(klv), &p);
>> +    KUNIT_EXPECT_STRNEQ(test, buf, "");
>> +    KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "key"));
>> +    KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "bytes"));
>> +    KUNIT_EXPECT_NULL(test, strstr(buf, "truncated"));
>> +    kunit_info(test, "%s", buf);
>> +}
>> +
>> +static void print_truncated_klv(struct kunit *test)
>> +{
>> +    char buf[128] = {};
>> +    struct drm_printer p = buf_printer(buf);
>> +    u32 klv[] = {
>> +        FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 2),
>> +        0x04030201,
>> +    };
>> +
>> +    KUNIT_EXPECT_STREQ(test, buf, "");
>> +    xe_guc_klv_print(klv, ARRAY_SIZE(klv), &p);
>> +    KUNIT_EXPECT_STRNEQ(test, buf, "");
>> +    KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "key"));
>> +    KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "truncated"));
>> +    KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "bytes"));
>> +    kunit_info(test, "%s", buf);
>> +}
>> +
>> +static void count_no_klvs(struct kunit *test)
>> +{
>> +    u32 klvs[GUC_KLV_LEN_MIN];
>> +
>> +    KUNIT_EXPECT_EQ(test, 0, xe_guc_klv_count(NULL, 0));
>> +    KUNIT_EXPECT_EQ(test, 0, xe_guc_klv_count(klvs, 0));
>> +}
>> +
>> +static void count_empty_klvs(struct kunit *test)
>> +{
>> +    u32 klvs[] = {
>> +        FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
>> +        FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
>> +        FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
>> +        FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
>> +    };
>> +    size_t n;
>> +
>> +    for (n = 1; n <= ARRAY_SIZE(klvs); n++)
>> +        KUNIT_EXPECT_EQ(test, n, xe_guc_klv_count(klvs, n));
>> +}
>> +
>> +static void count_mixed_klvs(struct kunit *test)
>> +{
>> +    u32 klvs[] = {
>> +        FIELD_PREP(GUC_KLV_0_KEY, 1) | FIELD_PREP(GUC_KLV_0_LEN, 0),
>> +        FIELD_PREP(GUC_KLV_0_KEY, 2) | FIELD_PREP(GUC_KLV_0_LEN, 1),
>> +        1,
>> +        FIELD_PREP(GUC_KLV_0_KEY, 3) | FIELD_PREP(GUC_KLV_0_LEN, 2),
>> +        1, 2,
>> +        FIELD_PREP(GUC_KLV_0_KEY, 4) | FIELD_PREP(GUC_KLV_0_LEN, 3),
>> +        1, 2, 3,
>> +        FIELD_PREP(GUC_KLV_0_KEY, 5) | FIELD_PREP(GUC_KLV_0_LEN, 0),
>> +    };
>> +
>> +    KUNIT_EXPECT_NE(test, 5, ARRAY_SIZE(klvs));
>> +    KUNIT_EXPECT_EQ(test, 5, xe_guc_klv_count(klvs, ARRAY_SIZE(klvs)));
>> +}
>> +
>> +static void count_truncated_klvs(struct kunit *test)
>> +{
>> +    u32 klvs[] = {
>> +        FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
>> +        FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 2),
>> +    };
>> +
>> +    KUNIT_EXPECT_GT(test, 0, xe_guc_klv_count(klvs, ARRAY_SIZE(klvs)));
>> +}
>> +
>> +static struct kunit_case guc_klv_helpers_test_cases[] = {
>> +    KUNIT_CASE(bad_key_to_string),
>> +    KUNIT_CASE(good_key_to_string),
>> +    KUNIT_CASE(print_empty_klv),
>> +    KUNIT_CASE(print_klv32),
>> +    KUNIT_CASE(print_klv64),
>> +    KUNIT_CASE(print_big_klv),
>> +    KUNIT_CASE(print_truncated_klv),
>> +    KUNIT_CASE(count_no_klvs),
>> +    KUNIT_CASE(count_empty_klvs),
>> +    KUNIT_CASE(count_mixed_klvs),
>> +    KUNIT_CASE(count_truncated_klvs),
>> +    {}
>> +};
>> +
>> +static struct kunit_suite guc_klv_helpers_suite = {
>> +    .name = "guc_klv",
>> +    .test_cases = guc_klv_helpers_test_cases,
>> +};
>> +
>> +kunit_test_suites(&guc_klv_helpers_suite);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> index c39fda08afcb..bc98a80cc209 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> @@ -131,3 +131,7 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
>>         return num_dwords ? -ENODATA : num_klvs;
>>   }
>> +
>> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
>> +#include "tests/xe_guc_klv_helpers_test.c"
>> +#endif
> 
