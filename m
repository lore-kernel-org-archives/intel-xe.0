Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51506C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 06:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F0310EA1E;
	Thu, 16 Mar 2023 06:10:49 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D5E10EA1E
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 06:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678947046; x=1710483046;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dxcUKWa7uV76nX9A1e9fLrYyEQk8hbthI70BP7/7WiE=;
 b=D9ZgcdSLf8235qPC6At7kdjUjjdl+EkDoFVYHHjJq9L+nolnJyhdbyNU
 aifBg3wS/6nPgEXhpc6b79ldeg8TW+g6JmDYJ9cN2pTdBelF2ZbNjGE2/
 55eRHa4UarNKiENyZjLf+n6PVRnGxaaWh4TK92QeTWCCPVJvHhr15mA+j
 9BffUEHizlwtHO7D0L3S2oj/byk/8KeA4taVE0smCdRH6YYy1R1GAO+MO
 iZYpKFSwy4AZMZ9DsIv03JGVK5aWNpcgzo14Jzrs07O3XokmRYbj7ULtp
 bosdYEVLgsBvL2O2+8qZr2+glX7meVnLeeYFQcZ6Al9/XYAEofDLaiZre g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="402771751"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="402771751"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 23:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="925621084"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="925621084"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga006.fm.intel.com with ESMTP; 15 Mar 2023 23:10:43 -0700
Received: from [10.249.159.27] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.159.27])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3B93C2A4A56;
 Mon, 13 Mar 2023 18:18:35 +0000 (GMT)
Message-ID: <f7483e45-d145-4e32-64b8-ea921b3ae393@intel.com>
Date: Mon, 13 Mar 2023 19:18:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
 <20230313081316.2408-2-michal.wajdeczko@intel.com>
 <20230313162348.s3cle2rpnvtgh6yk@ldmartin-desk2.lan>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230313162348.s3cle2rpnvtgh6yk@ldmartin-desk2.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/5] drm/xe: Introduce new selftests framework
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 13.03.2023 17:23, Lucas De Marchi wrote:
> On Mon, Mar 13, 2023 at 09:13:12AM +0100, Michal Wajdeczko wrote:
>> Our initial attempt to run Kunit based tests on live devices is hard
>> to use and will not work well with multiple devices attached.
>>
>> Instead of relying on separate test module and duplicating support
>> for multiple live devices in every test entry point, create new set
>> of helpers and use test->priv to pass reference of the device under
>> test (DUT) directly to every test function.
>>
>> The same use pattern is supported for both mock and live selftests.
>>
>> By using bus_notifier we can start testing each new bound device
>> separatelly, subject to filtering using dut_filter modparam.
>>
>> All test cases can be included directly from .c file, allowing test
>> code to access and use any private functions.
>>
>> As Kunit will attempt to run all suites on module load, including
>> our new live test suites, we may want to allow to execute them on
>> any available device. This is controlled by anonymous_dut modparam.
>>
>> Support for either mock or live selftests, only one at time, is
>> controlled by new Kconfig options.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> drivers/gpu/drm/xe/Kconfig.debug              |  22 ++++
>> drivers/gpu/drm/xe/Makefile                   |  11 ++
>> drivers/gpu/drm/xe/selftests/xe_selftests.h   |  35 ++++++
>> .../gpu/drm/xe/selftests/xe_selftests_auto.c  |  46 +++++++
>> .../drm/xe/selftests/xe_selftests_executor.c  | 118 ++++++++++++++++++
>> .../drm/xe/selftests/xe_selftests_helpers.c   | 101 +++++++++++++++
>> .../drm/xe/selftests/xe_selftests_internal.h  |  22 ++++
>> .../gpu/drm/xe/selftests/xe_selftests_mock.c  |  32 +++++
>> .../drm/xe/selftests/xe_selftests_params.c    |  23 ++++
>> drivers/gpu/drm/xe/xe_module.c                |   2 +
>> 10 files changed, 412 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests.h
>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_params.c
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig.debug
>> b/drivers/gpu/drm/xe/Kconfig.debug
>> index 93b284cdd0a2..aeba43977dca 100644
>> --- a/drivers/gpu/drm/xe/Kconfig.debug
>> +++ b/drivers/gpu/drm/xe/Kconfig.debug
>> @@ -61,6 +61,28 @@ config DRM_XE_SIMPLE_ERROR_CAPTURE
>>
>>       If in doubt, say "N".
>>
>> +config DRM_XE_SELFTESTS_MOCK
>> +    bool "Mock selftests for Xe" if !KUNIT_ALL_TESTS
>> +    depends on DRM_XE && KUNIT
>> +    default KUNIT_ALL_TESTS
>> +    help
>> +        Choose this option to allow the driver to perform mock
>> +        selftests based on the Kunit framework.
>> +
>> +        Recommended for driver developers only.
>> +        If in doubt, say "N".
>> +
>> +config DRM_XE_SELFTESTS_LIVE
>> +    bool "Live selftests for Xe" if !DRM_XE_SELFTESTS_MOCK
> 
> why?  I think we should aim to run live tests in *addition* to
> mock ones.  The mock tests are more testing our SW infra and can be used
> in a true "unit test" sense. While the live ones are testing the
> integration with the HW and making sure they work together.

I've added that just to simplify the code logic as I assumed we will be
running mock tests only in "true kunit" fashion as part of the build.

So then we could avoid mixing mock/live "kunit suites" in single driver
module, especially that as of today there is no nice support to filter
out undesired suites from the execution. Thus adding compile time flag
to only have one category of selftests at time was looking promising.

So I was using .kunitconfig with
	CONFIG_DRM_XE_SELFTESTS_MOCK=y
and normal .config with
	CONFIG_DRM_XE_SELFTESTS_LIVE=y

> 
> I have changes pending to test some WA and RTP infra we added,
> regardless of the HW. But I don't want to have to choose either one or
> the other.

And I guess you still can do that, just it wont be automatically
compiled out, nor you be able to benefit from the helpers, but they will
be executed

> 
> Also Cc Thomas as original author of the kunit integration.
> 
> We also have some overloaded terms that need better explanation:
> mock, selftest, live.

I reused terms from i915, assumed everyone is familiar with that.

"mock selftest" - a kunit test suite to be run on abstract xe device
"live selftest" - a kunit test suite to be executed on real xe device

If you have better suggestions, then you're welcomed

> 
>> +    depends on DRM_XE && KUNIT && EXPERT
>> +    default n
>> +    help
>> +        Choose this option to allow the driver to perform live
>> +        selftests based on the Kunit framework.
>> +
>> +        Recommended for driver developers only.
>> +        If in doubt, say "N".
>> +
>> config DRM_XE_KUNIT_TEST
>>         tristate "KUnit tests for the drm xe driver" if !KUNIT_ALL_TESTS
>>     depends on DRM_XE && KUNIT && DEBUG_FS
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index b94e65c91101..b193af2d9930 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -211,6 +211,17 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
>>     xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
>> endif
>>
>> +xe-$(CONFIG_DRM_XE_SELFTESTS_MOCK) += \
>> +    selftests/xe_selftests_mock.o \
>> +
>> +xe-$(CONFIG_DRM_XE_SELFTESTS_LIVE) += \
>> +    selftests/xe_selftests_auto.o \
>> +    selftests/xe_selftests_executor.o \
>> +    selftests/xe_selftests_params.o \
>> +
>> +xe-$(CONFIG_KUNIT) += \
>> +    selftests/xe_selftests_helpers.o \
>> +
>> obj-$(CONFIG_DRM_XE) += xe.o
>> obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>>
>> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests.h
>> b/drivers/gpu/drm/xe/selftests/xe_selftests.h
>> new file mode 100644
>> index 000000000000..6b13b998e789
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests.h
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SELFTESTS_H_
>> +#define _XE_SELFTESTS_H_
>> +
>> +struct kunit_suite;
>> +struct kunit;
>> +
>> +int xe_selftests_run(const char *dev_name);
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
>> +int init_xe_live_selftest_suite(struct kunit_suite *suite);
>> +#endif
>> +
>> +int init_xe_device_selftest(struct kunit *test);
>> +void exit_xe_device_selftest(struct kunit *test);
>> +
>> +int init_xe_gt_selftest(struct kunit *test);
>> +void exit_xe_gt_selftest(struct kunit *test);
>> +
>> +int init_xe_guc_selftest(struct kunit *test);
>> +void exit_xe_guc_selftest(struct kunit *test);
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
>> +int xe_selftests_module_init(void);
>> +void xe_selftests_module_exit(void);
>> +#else
>> +static inline int xe_selftests_module_init(void) { return 0; }
>> +static inline void xe_selftests_module_exit(void) { }
>> +#endif
>> +
>> +#endif /* _XE_SELFTESTS_H_ */
>> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>> b/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>> new file mode 100644
>> index 000000000000..ef98f3599eac
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>> @@ -0,0 +1,46 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/glob.h>
>> +#include <linux/pci.h>
>> +
>> +#include "xe_drv.h"
>> +#include "selftests/xe_selftests.h"
>> +#include "selftests/xe_selftests_internal.h"
>> +
>> +static int bus_cb(struct notifier_block *nb, unsigned long action,
>> void *data)
>> +{
>> +    struct device *dev = data;
>> +    struct device_driver *drv = dev->driver;
>> +
>> +    if (action != BUS_NOTIFY_BOUND_DRIVER)
>> +        return 0;
>> +
>> +    if (strcmp(DRIVER_NAME, drv->name))
>> +        return 0;
>> +
>> +    /* only matching DUT names will be tested */
>> +    if (!dut_filter || !glob_match(dut_filter, dev_name(dev)))
> 
> "DUT" name could be avoided and just use what exactly it means.
> When I see "DUT" I'm wondering... is this the platform name, the pci ID,
> the pci slot, the device node?

will rename to "dut_name_filter" do the trick ?

or do you want to drop "dut" completely and have "device_name_filter" ?
but then we would need to add "selftest" or similar word somewhere to
give context and then full modparam name will no longer be that friendly

Thanks,
Michal
