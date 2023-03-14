Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E2AC6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 14:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A56810E0AC;
	Thu, 16 Mar 2023 14:11:21 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2994910E0AC
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678975880; x=1710511880;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=GEWkPF0TuqjbXthDuISI591bb03D2FmGQODfJrPkIwA=;
 b=SFEzF6NGb0krw8fkGM2SIGpkZSteeLGm7xQNjaux4AyO7Gr69TYKa73y
 DzPhjlMKkIyx0RACOhN081LV7ipwQfXb7GavsCwGskaa16Cp3QDYsFK+5
 ceR9CnCU7sz0xh6FcP8qs+A/8p8HPjma5mcyBEndNlYvoH4N9xORBok3C
 7TaS+OkDKXmgyUDYgCPBT4VAfEd9bJbzXbDNjft5HMEFUVzBytNj8NXUh
 m/c9XqCT/5hQY1uNQn1rXNUvCsKsiqDxwmtcjRlax+Zh7gmK3xFv4DbHQ
 dKRBUF+5Idvki0VO+YZc5iQh7UwHIteCdff6kCmKotS5cIzd63hrrLk5m w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="336689312"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
 d="scan'208,223";a="336689312"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 07:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="673174233"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
 d="scan'208,223";a="673174233"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga007.jf.intel.com with ESMTP; 16 Mar 2023 07:10:55 -0700
Received: from [10.249.159.184] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.159.184])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D16B840031;
 Tue, 14 Mar 2023 11:54:26 +0000 (GMT)
Content-Type: multipart/mixed; boundary="------------Vjtt78MUgVMM7iK85IzBy2j7"
Message-ID: <35211814-9690-a073-3366-b8f9f0dcd5e2@intel.com>
Date: Tue, 14 Mar 2023 12:54:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
 <20230313081316.2408-2-michal.wajdeczko@intel.com>
 <994675861f22406bacb92a9f85ac39518d66c51d.camel@linux.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <994675861f22406bacb92a9f85ac39518d66c51d.camel@linux.intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------Vjtt78MUgVMM7iK85IzBy2j7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 13.03.2023 18:22, Thomas Hellström wrote:
> Hi, Michal,
> 
> Some comments below. I don't have time for an in-depth review today,
> but As a general comment, I don't think we should have multiple
> infrastructures for live Kunit selftests, so if we're adopting this, we
> should port the existing ones over.
> 
> On Mon, 2023-03-13 at 09:13 +0100, Michal Wajdeczko wrote:
>> Our initial attempt to run Kunit based tests on live devices is hard
>> to use and will not work well with multiple devices attached.
>>
>> Instead of relying on separate test module and duplicating support
>> for multiple live devices in every test entry point, create new set
>> of helpers and use test->priv to pass reference of the device under
>> test (DUT) directly to every test function.
> 
> Could this be passed directly as a parameter instead? I think the
> test->priv parameter is intended for and very useful to pass
> parameters used by code to provoke test-specific behaviour (see for

parameters are available as test->param_value, see [1]

[1] https://elixir.bootlin.com/linux/latest/source/include/kunit/test.h#L207

> example our dma-buf kunit test). That would BTW be a good live test to
> port over to see if it could be made to work with this new framework.

done, see attached patch

> 
> 
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
> 
> What would it take with this infrastructure to be able to run both
> mock- and live without recompiling on an already loaded module? I think
> that's very convenient.

I had that locally, so doable, but note that without full support for
the suite or test filtering it will potentially rerun everything on any
device probe:

1. MOCK+LIVE(dev1) by kunit executor on module load
2. MOCK+LIVE(dev1) by new framework on device1 probe
3. MOCK+LIVE(dev2) by new framework on device2 probe
.. MOCK+LIVE(devN) by new framework on deviceN probe

but if you still find that convenient (rather than running pure pure
kunit tests using separate kunit build) then we can relax this limitation

Thanks,
Michal

> 
> 
> 
>>
>> Support for either mock or live selftests, only one at time, is
>> controlled by new Kconfig options.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Thanks,
> thomas
> 
> 
>> ---
>>  drivers/gpu/drm/xe/Kconfig.debug              |  22 ++++
>>  drivers/gpu/drm/xe/Makefile                   |  11 ++
>>  drivers/gpu/drm/xe/selftests/xe_selftests.h   |  35 ++++++
>>  .../gpu/drm/xe/selftests/xe_selftests_auto.c  |  46 +++++++
>>  .../drm/xe/selftests/xe_selftests_executor.c  | 118
>> ++++++++++++++++++
>>  .../drm/xe/selftests/xe_selftests_helpers.c   | 101 +++++++++++++++
>>  .../drm/xe/selftests/xe_selftests_internal.h  |  22 ++++
>>  .../gpu/drm/xe/selftests/xe_selftests_mock.c  |  32 +++++
>>  .../drm/xe/selftests/xe_selftests_params.c    |  23 ++++
>>  drivers/gpu/drm/xe/xe_module.c                |   2 +
>>  10 files changed, 412 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests.h
>>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>>  create mode 100644
>> drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
>>  create mode 100644
>> drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
>>  create mode 100644
>> drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
>>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
>>  create mode 100644
>> drivers/gpu/drm/xe/selftests/xe_selftests_params.c
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig.debug
>> b/drivers/gpu/drm/xe/Kconfig.debug
>> index 93b284cdd0a2..aeba43977dca 100644
>> --- a/drivers/gpu/drm/xe/Kconfig.debug
>> +++ b/drivers/gpu/drm/xe/Kconfig.debug
>> @@ -61,6 +61,28 @@ config DRM_XE_SIMPLE_ERROR_CAPTURE
>>  
>>           If in doubt, say "N".
>>  
>> +config DRM_XE_SELFTESTS_MOCK
>> +       bool "Mock selftests for Xe" if !KUNIT_ALL_TESTS
>> +       depends on DRM_XE && KUNIT
>> +       default KUNIT_ALL_TESTS
>> +       help
>> +               Choose this option to allow the driver to perform
>> mock
>> +               selftests based on the Kunit framework.
>> +
>> +               Recommended for driver developers only.
>> +               If in doubt, say "N".
>> +
>> +config DRM_XE_SELFTESTS_LIVE
>> +       bool "Live selftests for Xe" if !DRM_XE_SELFTESTS_MOCK
>> +       depends on DRM_XE && KUNIT && EXPERT
>> +       default n
>> +       help
>> +               Choose this option to allow the driver to perform
>> live
>> +               selftests based on the Kunit framework.
>> +
>> +               Recommended for driver developers only.
>> +               If in doubt, say "N".
>> +
>>  config DRM_XE_KUNIT_TEST
>>          tristate "KUnit tests for the drm xe driver" if
>> !KUNIT_ALL_TESTS
>>         depends on DRM_XE && KUNIT && DEBUG_FS
>> diff --git a/drivers/gpu/drm/xe/Makefile
>> b/drivers/gpu/drm/xe/Makefile
>> index b94e65c91101..b193af2d9930 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -211,6 +211,17 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
>>         xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
>>  endif
>>  
>> +xe-$(CONFIG_DRM_XE_SELFTESTS_MOCK) += \
>> +       selftests/xe_selftests_mock.o \
>> +
>> +xe-$(CONFIG_DRM_XE_SELFTESTS_LIVE) += \
>> +       selftests/xe_selftests_auto.o \
>> +       selftests/xe_selftests_executor.o \
>> +       selftests/xe_selftests_params.o \
>> +
>> +xe-$(CONFIG_KUNIT) += \
>> +       selftests/xe_selftests_helpers.o \
>> +
>>  obj-$(CONFIG_DRM_XE) += xe.o
>>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
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
>> +       struct device *dev = data;
>> +       struct device_driver *drv = dev->driver;
>> +
>> +       if (action != BUS_NOTIFY_BOUND_DRIVER)
>> +               return 0;
>> +
>> +       if (strcmp(DRIVER_NAME, drv->name))
>> +               return 0;
>> +
>> +       /* only matching DUT names will be tested */
>> +       if (!dut_filter || !glob_match(dut_filter, dev_name(dev)))
>> +               return 0;
>> +
>> +       xe_selftests_run(dev_name(dev));
>> +
>> +       return 0;
>> +}
>> +
>> +static struct notifier_block nb = {
>> +       .notifier_call = bus_cb,
>> +};
>> +
>> +int xe_selftests_module_init(void)
>> +{
>> +       return bus_register_notifier(&pci_bus_type, &nb);
>> +}
>> +
>> +void xe_selftests_module_exit(void)
>> +{
>> +       bus_unregister_notifier(&pci_bus_type, &nb);
>> +}
>> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
>> b/drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
>> new file mode 100644
>> index 000000000000..93c3360c9631
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
>> @@ -0,0 +1,118 @@
>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <linux/glob.h>
>> +#include <kunit/test.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_drv.h"
>> +
>> +#include "selftests/xe_selftests.h"
>> +#include "selftests/xe_selftests_internal.h"
>> +
>> +#define DUT_NAME_LEN 32
>> +static char dut_name[DUT_NAME_LEN];
>> +
>> +/* protects @dut_name during live test execution */
>> +static DEFINE_MUTEX(dut_mutex);
>> +
>> +static int match_dev_any(struct device *dev, const void *data)
>> +{
>> +       return 1;
>> +}
>> +
>> +static int match_dev_by_name(struct device *dev, const void *data)
>> +{
>> +       const char *name = data;
>> +       return !strcmp(dev_name(dev), name);
>> +}
>> +
>> +struct xe_device *get_xe_dut(void)
>> +{
>> +       struct device_driver *drv;
>> +       struct device *dev;
>> +
>> +       if (!anonymous_dut && !mutex_is_locked(&dut_mutex))
>> +               return ERR_PTR(-ENOTTY);
>> +
>> +       drv = driver_find(DRIVER_NAME, &pci_bus_type);
>> +       dev = driver_find_device(drv, NULL, dut_name,
>> +                                mutex_is_locked(&dut_mutex) ?
>> match_dev_by_name : match_dev_any);
>> +       if (!dev)
>> +               return ERR_PTR(-ENODEV);
>> +
>> +       return to_xe_device(dev_get_drvdata(dev));
>> +}
>> +
>> +void put_xe_dut(struct xe_device *xe)
>> +{
>> +       put_device(xe->drm.dev);
>> +}
>> +
>> +static int run_test_suites(struct xe_device *xe)
>> +{
>> +       struct device *dev = xe->drm.dev;
>> +       struct device_driver *drv = dev->driver;
>> +       struct module *mod = drv->owner;
>> +       struct kunit_suite **suites = mod->kunit_suites;
>> +       int num_suites = mod->num_kunit_suites;
>> +       int i;
>> +
>> +       pr_info("TAP version 14\n");
>> +       pr_info("1..%u\n", num_suites);
>> +
>> +       /* reset kunit_suite_counter at the start */
>> +       __kunit_test_suites_exit(NULL, 0);
>> +
>> +       for (i = 0; i < num_suites; i++) {
>> +               kunit_run_tests(suites[i]);
>> +       }
>> +
>> +       /* reset kunit_suite_counter at the end */
>> +       __kunit_test_suites_exit(NULL, 0);
>> +
>> +       return num_suites;
>> +}
>> +
>> +/**
>> + * xe_selftests_run - Run selftests on selected device
>> + * @dev_name: The device name on which selftests should be run
>> + *
>> + * This function starts Kunit suites with live selftests on selected
>> + * device (DUT).
>> + *
>> + * Return: 0 on success,
>> + *   -EINVAL if no device name was provided,
>> + *   -EBUSY if tests are already running,
>> + *   -ENODEV if device was not found
>> + *   or any other negative error code on failure.
>> + */
>> +int xe_selftests_run(const char *dev_name)
>> +{
>> +       struct xe_device *xe;
>> +       int ret;
>> +
>> +       if (!dev_name)
>> +               return -EINVAL;
>> +       if (!mutex_trylock(&dut_mutex))
>> +               return -EBUSY;
>> +       strscpy(dut_name, dev_name, sizeof(dut_name));
>> +
>> +       xe = get_xe_dut();
>> +       if (IS_ERR(xe)) {
>> +               ret = PTR_ERR(xe);
>> +               goto cleanup;
>> +       }
>> +
>> +       ret = run_test_suites(xe);
>> +
>> +       put_xe_dut(xe);
>> +
>> +cleanup:
>> +       strscpy(dut_name, "", sizeof(dut_name));
>> +       mutex_unlock(&dut_mutex);
>> +
>> +       return ret;
>> +}
>> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
>> b/drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
>> new file mode 100644
>> index 000000000000..837d28871686
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
>> @@ -0,0 +1,101 @@
>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <linux/mutex.h>
>> +
>> +#include <kunit/test.h>
>> +
>> +#include "xe_device.h"
>> +#include "selftests/xe_selftests_internal.h"
>> +
>> +static struct xe_device *__get_xe(void)
>> +{
>> +       struct xe_device *xe = ERR_PTR(-ENOTTY);
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_MOCK)
>> +       xe = get_xe_mock();
>> +#elif IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
>> +       xe = get_xe_dut();
>> +#endif
>> +       return xe;
>> +}
>> +
>> +static void __put_xe(struct xe_device *xe)
>> +{
>> +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_MOCK)
>> +       put_xe_mock(xe);
>> +#elif IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
>> +       put_xe_dut(xe);
>> +#endif
>> +}
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
>> +int init_xe_live_selftest_suite(struct kunit_suite *suite)
>> +{
>> +       struct xe_device *xe = get_xe_dut();
>> +
>> +       if (IS_ERR(xe))
>> +               return PTR_ERR(xe);
>> +
>> +       kunit_info(suite, "DUT %s", dev_name(xe->drm.dev));
>> +       put_xe_dut(xe);
>> +       return 0;
>> +}
>> +#endif
>> +
>> +int init_xe_device_selftest(struct kunit *test)
>> +{
>> +       struct xe_device *xe = __get_xe();
>> +
>> +       if (IS_ERR(xe))
>> +               return PTR_ERR(xe);
>> +
>> +       test->priv = xe;
>> +       return 0;
>> +}
>> +
>> +void exit_xe_device_selftest(struct kunit *test)
>> +{
>> +       struct xe_device *xe = test->priv;
>> +
>> +       __put_xe(xe);
>> +}
>> +
>> +int init_xe_gt_selftest(struct kunit *test)
>> +{
>> +       struct xe_device *xe = __get_xe();
>> +
>> +       if (IS_ERR(xe))
>> +               return PTR_ERR(xe);
>> +
>> +       test->priv = to_gt(xe);
>> +       return 0;
>> +}
>> +
>> +void exit_xe_gt_selftest(struct kunit *test)
>> +{
>> +       struct xe_gt *gt = test->priv;
>> +
>> +       __put_xe(gt->xe);
>> +}
>> +
>> +int init_xe_guc_selftest(struct kunit *test)
>> +{
>> +       struct xe_device *xe = __get_xe();
>> +
>> +       if (IS_ERR(xe))
>> +               return PTR_ERR(xe);
>> +
>> +       test->priv = &to_gt(xe)->uc.guc;
>> +       return 0;
>> +}
>> +
>> +void exit_xe_guc_selftest(struct kunit *test)
>> +{
>> +       struct xe_guc *guc = test->priv;
>> +       struct xe_gt *gt = container_of(guc, struct xe_gt, uc.guc);
>> +
>> +       __put_xe(gt->xe);
>> +}
>> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
>> b/drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
>> new file mode 100644
>> index 000000000000..841c1a497eed
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SELFTEST_INTERNAL_H_
>> +#define _XE_SELFTEST_INTERNAL_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_device;
>> +
>> +extern char *dut_filter;
>> +extern bool anonymous_dut;
>> +
>> +struct xe_device *get_xe_dut(void);
>> +void put_xe_dut(struct xe_device *xe);
>> +
>> +struct xe_device *get_xe_mock(void);
>> +void put_xe_mock(struct xe_device *xe);
>> +
>> +#endif /* _XE_SELFTEST_INTERNAL_H_ */
>> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
>> b/drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
>> new file mode 100644
>> index 000000000000..c1515e451e99
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
>> @@ -0,0 +1,32 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include "xe_device_types.h"
>> +
>> +#define MOCK_DEV_NAME "MOCK:DEBUG.0"
>> +static struct device __mock_device = {
>> +       .init_name = MOCK_DEV_NAME,
>> +};
>> +
>> +struct xe_device *get_xe_mock(void)
>> +{
>> +       struct xe_device *xe = kzalloc(sizeof(*xe), GFP_KERNEL);
>> +
>> +       if (!xe)
>> +               return ERR_PTR(-ENOMEM);
>> +
>> +       xe->drm.dev = &__mock_device;
>> +
>> +       xe->gt[0].info.id = 0;
>> +       xe->gt[0].info.type = XE_GT_TYPE_MAIN;
>> +       xe->gt[0].xe = xe;
>> +
>> +       return xe;
>> +}
>> +
>> +void put_xe_mock(struct xe_device *xe)
>> +{
>> +       kfree(xe);
>> +}
>> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_params.c
>> b/drivers/gpu/drm/xe/selftests/xe_selftests_params.c
>> new file mode 100644
>> index 000000000000..e6e28cc91901
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests_params.c
>> @@ -0,0 +1,23 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <linux/module.h>
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
>> +
>> +char *dut_filter;
>> +module_param_named(dut_filter, dut_filter, charp, 0644);
>> +MODULE_PARM_DESC(dut_filter,
>> +                "The pattern of the names of devices on which we
>> want to run tests automatically. "
>> +                "If <none> is specified (default) then no devices
>> will be tested automatically. "
>> +                "If '*' is specified then all new bound devices will
>> be tested.\n");
>> +
>> +bool anonymous_dut;
>> +module_param_named(anonymous_dut, anonymous_dut, bool, 0600);
>> +MODULE_PARM_DESC(anonymous_dut,
>> +                "Enables selftests to be run without providing
>> explicit DUT name (like during "
>> +                "selftests execution triggered by the Kunit module
>> notifier). Default is off.\n");
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_module.c
>> b/drivers/gpu/drm/xe/xe_module.c
>> index 6860586ce7f8..f76d69f7f5ad 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -13,6 +13,7 @@
>>  #include "xe_module.h"
>>  #include "xe_pci.h"
>>  #include "xe_sched_job.h"
>> +#include "selftests/xe_selftests.h"
>>  
>>  bool enable_guc = true;
>>  module_param_named_unsafe(enable_guc, enable_guc, bool, 0444);
>> @@ -45,6 +46,7 @@ struct init_funcs {
>>  static const struct init_funcs init_funcs[] = {
>>         MAKE_INIT_EXIT_FUNCS(hw_fence),
>>         MAKE_INIT_EXIT_FUNCS(sched_job),
>> +       MAKE_INIT_EXIT_FUNCS(selftests),
>>  };
>>  
>>  static int __init xe_init(void)
> 
--------------Vjtt78MUgVMM7iK85IzBy2j7
Content-Type: text/plain; charset=UTF-8;
 name="0001-drm-xe-Convert-dma_buf_test-to-new-live-selftest-fra.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-xe-Convert-dma_buf_test-to-new-live-selftest-fra.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA3OWU1NThmOWI5NDljOTY4M2ZmM2Y1NDE0MTRiYWU4ZWI4NTExN2RhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwud2FqZGVj
emtvQGludGVsLmNvbT4KRGF0ZTogVHVlLCAxNCBNYXIgMjAyMyAwMDoyMzozNSArMDEwMApT
dWJqZWN0OiBbUEFUQ0hdIGRybS94ZTogQ29udmVydCBkbWFfYnVmX3Rlc3QgdG8gbmV3IGxp
dmUgc2VsZnRlc3QgZnJhbWV3b3JrCgpbMTI6MTA6MjNdID09PT09PT09PT09PT09PSB4ZV9k
bWFfYnVmX2xpdmUgKDEgc3VidGVzdCkgPT09PT09PT09PT09PT09PQpbMTI6MTA6MjNdID09
PT09PT09PT09PT09PT09PT09PSB0ZXN0X3hlX2RtYV9idWYgPT09PT09PT09PT09PT09PT09
PT09PQpbMTI6MTA6MjNdIFtQQVNTRURdIG1hc2s9MHgwNCBmb3JjZT1ubyAgcDJwPXllcyBu
b3RpZnk9eGVfZG1hX2J1Zl9tb3ZlX25vdGlmeSBbeGVdClsxMjoxMDoyM10gW1BBU1NFRF0g
bWFzaz0weDA0IGZvcmNlPXllcyBwMnA9eWVzIG5vdGlmeT14ZV9kbWFfYnVmX21vdmVfbm90
aWZ5IFt4ZV0KWzEyOjEwOjIzXSBbUEFTU0VEXSBtYXNrPTB4MDQgZm9yY2U9bm8gIHAycD1u
byAgbm90aWZ5PXhlX2RtYV9idWZfbW92ZV9ub3RpZnkgW3hlXQpbMTI6MTA6MjNdIFtQQVNT
RURdIG1hc2s9MHgwNCBmb3JjZT15ZXMgcDJwPW5vICBub3RpZnk9eGVfZG1hX2J1Zl9tb3Zl
X25vdGlmeSBbeGVdClsxMjoxMDoyM10gW1BBU1NFRF0gbWFzaz0weDA0IGZvcmNlPW5vICBw
MnA9bi9hIG5vdGlmeT0weDAKWzEyOjEwOjIzXSBbUEFTU0VEXSBtYXNrPTB4MDQgZm9yY2U9
eWVzIHAycD1uL2Egbm90aWZ5PTB4MApbMTI6MTA6MjNdIFtQQVNTRURdIG1hc2s9MHgwMiBm
b3JjZT1ubyAgcDJwPXllcyBub3RpZnk9eGVfZG1hX2J1Zl9tb3ZlX25vdGlmeSBbeGVdClsx
MjoxMDoyM10gW1BBU1NFRF0gbWFzaz0weDAyIGZvcmNlPXllcyBwMnA9eWVzIG5vdGlmeT14
ZV9kbWFfYnVmX21vdmVfbm90aWZ5IFt4ZV0KWzEyOjEwOjIzXSBbUEFTU0VEXSBtYXNrPTB4
MDIgZm9yY2U9bm8gIHAycD1ubyAgbm90aWZ5PXhlX2RtYV9idWZfbW92ZV9ub3RpZnkgW3hl
XQpbMTI6MTA6MjNdIFtQQVNTRURdIG1hc2s9MHgwMiBmb3JjZT15ZXMgcDJwPW5vICBub3Rp
Znk9eGVfZG1hX2J1Zl9tb3ZlX25vdGlmeSBbeGVdClsxMjoxMDoyM10gW1BBU1NFRF0gbWFz
az0weDAyIGZvcmNlPW5vICBwMnA9bi9hIG5vdGlmeT0weDAKWzEyOjEwOjIzXSBbUEFTU0VE
XSBtYXNrPTB4MDIgZm9yY2U9eWVzIHAycD1uL2Egbm90aWZ5PTB4MApbMTI6MTA6MjNdIFtQ
QVNTRURdIG1hc2s9MHgwNiBmb3JjZT1ubyAgcDJwPXllcyBub3RpZnk9eGVfZG1hX2J1Zl9t
b3ZlX25vdGlmeSBbeGVdClsxMjoxMDoyM10gW1BBU1NFRF0gbWFzaz0weDA2IGZvcmNlPXll
cyBwMnA9eWVzIG5vdGlmeT14ZV9kbWFfYnVmX21vdmVfbm90aWZ5IFt4ZV0KWzEyOjEwOjIz
XSBbUEFTU0VEXSBtYXNrPTB4MDYgZm9yY2U9bm8gIHAycD1ubyAgbm90aWZ5PXhlX2RtYV9i
dWZfbW92ZV9ub3RpZnkgW3hlXQpbMTI6MTA6MjNdIFtQQVNTRURdIG1hc2s9MHgwNiBmb3Jj
ZT15ZXMgcDJwPW5vICBub3RpZnk9eGVfZG1hX2J1Zl9tb3ZlX25vdGlmeSBbeGVdClsxMjox
MDoyM10gW1BBU1NFRF0gbWFzaz0weDA2IGZvcmNlPW5vICBwMnA9bi9hIG5vdGlmeT0weDAK
WzEyOjEwOjIzXSBbUEFTU0VEXSBtYXNrPTB4MDYgZm9yY2U9eWVzIHAycD1uL2Egbm90aWZ5
PTB4MApbMTI6MTA6MjNdID09PT09PT09PT09PT09PT09IFtQQVNTRURdIHRlc3RfeGVfZG1h
X2J1ZiA9PT09PT09PT09PT09PT09PQoKWyAgMTU4LjkyODU2M10gICAgICMgeGVfZG1hX2J1
Zl9saXZlOiBEVVQgMDAwMDowMDowMi4wClsgIDE1OC45Mjg1NjRdICAgICAjIFN1YnRlc3Q6
IHhlX2RtYV9idWZfbGl2ZQpbICAxNTguOTMzNTA3XSAgICAgMS4uMQpbICAxNTguOTM3Nzc0
XSAgICAgICAgICMgU3VidGVzdDogdGVzdF94ZV9kbWFfYnVmClsgIDE1OC45NDAyMDJdICAg
ICAgICAgb2sgMSAtIG1hc2s9MHgwNCBmb3JjZT1ubyAgcDJwPXllcyBub3RpZnk9eGVfZG1h
X2J1Zl9tb3ZlX25vdGlmeSBbeGVdClsgIDE1OC45NDQ5MzddICAgICAgICAgb2sgMiAtIG1h
c2s9MHgwNCBmb3JjZT15ZXMgcDJwPXllcyBub3RpZnk9eGVfZG1hX2J1Zl9tb3ZlX25vdGlm
eSBbeGVdClsgIDE1OC45NTMzMjNdICAgICAgICAgb2sgMyAtIG1hc2s9MHgwNCBmb3JjZT1u
byAgcDJwPW5vICBub3RpZnk9eGVfZG1hX2J1Zl9tb3ZlX25vdGlmeSBbeGVdClsgIDE1OC45
NjE3MDddICAgICAgICAgb2sgNCAtIG1hc2s9MHgwNCBmb3JjZT15ZXMgcDJwPW5vICBub3Rp
Znk9eGVfZG1hX2J1Zl9tb3ZlX25vdGlmeSBbeGVdClsgIDE1OC45NzAyMzNdICAgICAgICAg
b2sgNSAtIG1hc2s9MHgwNCBmb3JjZT1ubyAgcDJwPW4vYSBub3RpZnk9MHgwClsgIDE1OC45
Nzg3ODVdICAgICAgICAgb2sgNiAtIG1hc2s9MHgwNCBmb3JjZT15ZXMgcDJwPW4vYSBub3Rp
Znk9MHgwClsgIDE1OC45ODUyNTNdICAgICAjIHRlc3RfeGVfZG1hX2J1ZjogcnVubmluZyB4
ZV90ZXN0X2RtYWJ1Zl9pbXBvcnRfc2FtZV9kcml2ZXIKWyAgMTU4Ljk5ODg4MV0gICAgICAg
ICBvayA3IC0gbWFzaz0weDAyIGZvcmNlPW5vICBwMnA9eWVzIG5vdGlmeT14ZV9kbWFfYnVm
X21vdmVfbm90aWZ5IFt4ZV0KWyAgMTU4Ljk5OTA0MV0gICAgICMgdGVzdF94ZV9kbWFfYnVm
OiBydW5uaW5nIHhlX3Rlc3RfZG1hYnVmX2ltcG9ydF9zYW1lX2RyaXZlcgpbICAxNTkuMDE0
NjM2XSAgICAgICAgIG9rIDggLSBtYXNrPTB4MDIgZm9yY2U9eWVzIHAycD15ZXMgbm90aWZ5
PXhlX2RtYV9idWZfbW92ZV9ub3RpZnkgW3hlXQpbICAxNTkuMDE0ODg5XSAgICAgIyB0ZXN0
X3hlX2RtYV9idWY6IHJ1bm5pbmcgeGVfdGVzdF9kbWFidWZfaW1wb3J0X3NhbWVfZHJpdmVy
ClsgIDE1OS4wMzAzODhdICAgICAgICAgb2sgOSAtIG1hc2s9MHgwMiBmb3JjZT1ubyAgcDJw
PW5vICBub3RpZnk9eGVfZG1hX2J1Zl9tb3ZlX25vdGlmeSBbeGVdClsgIDE1OS4wMzA2NTJd
ICAgICAjIHRlc3RfeGVfZG1hX2J1ZjogcnVubmluZyB4ZV90ZXN0X2RtYWJ1Zl9pbXBvcnRf
c2FtZV9kcml2ZXIKWyAgMTU5LjA0NjM4OF0gICAgICAgICBvayAxMCAtIG1hc2s9MHgwMiBm
b3JjZT15ZXMgcDJwPW5vICBub3RpZnk9eGVfZG1hX2J1Zl9tb3ZlX25vdGlmeSBbeGVdClsg
IDE1OS4wNDY1OThdICAgICAjIHRlc3RfeGVfZG1hX2J1ZjogcnVubmluZyB4ZV90ZXN0X2Rt
YWJ1Zl9pbXBvcnRfc2FtZV9kcml2ZXIKWyAgMTU5LjA2MjA2OV0gICAgICAgICBvayAxMSAt
IG1hc2s9MHgwMiBmb3JjZT1ubyAgcDJwPW4vYSBub3RpZnk9MHgwClsgIDE1OS4wNjIyMzNd
ICAgICAjIHRlc3RfeGVfZG1hX2J1ZjogcnVubmluZyB4ZV90ZXN0X2RtYWJ1Zl9pbXBvcnRf
c2FtZV9kcml2ZXIKWyAgMTU5LjA3NTcwOV0gICAgICAgICBvayAxMiAtIG1hc2s9MHgwMiBm
b3JjZT15ZXMgcDJwPW4vYSBub3RpZnk9MHgwClsgIDE1OS4wNzU5NjJdICAgICAgICAgb2sg
MTMgLSBtYXNrPTB4MDYgZm9yY2U9bm8gIHAycD15ZXMgbm90aWZ5PXhlX2RtYV9idWZfbW92
ZV9ub3RpZnkgW3hlXQpbICAxNTkuMDgyMzYzXSAgICAgICAgIG9rIDE0IC0gbWFzaz0weDA2
IGZvcmNlPXllcyBwMnA9eWVzIG5vdGlmeT14ZV9kbWFfYnVmX21vdmVfbm90aWZ5IFt4ZV0K
WyAgMTU5LjA5MDg4Nl0gICAgICAgICBvayAxNSAtIG1hc2s9MHgwNiBmb3JjZT1ubyAgcDJw
PW5vICBub3RpZnk9eGVfZG1hX2J1Zl9tb3ZlX25vdGlmeSBbeGVdClsgIDE1OS4wOTkzMDFd
ICAgICAgICAgb2sgMTYgLSBtYXNrPTB4MDYgZm9yY2U9eWVzIHAycD1ubyAgbm90aWZ5PXhl
X2RtYV9idWZfbW92ZV9ub3RpZnkgW3hlXQpbICAxNTkuMTA3ODE3XSAgICAgICAgIG9rIDE3
IC0gbWFzaz0weDA2IGZvcmNlPW5vICBwMnA9bi9hIG5vdGlmeT0weDAKWyAgMTU5LjExNjI5
OF0gICAgICAgICBvayAxOCAtIG1hc2s9MHgwNiBmb3JjZT15ZXMgcDJwPW4vYSBub3RpZnk9
MHgwClsgIDE1OS4xMjI1NjRdICAgICAjIHRlc3RfeGVfZG1hX2J1ZjogcGFzczoxOCBmYWls
OjAgc2tpcDowIHRvdGFsOjE4ClsgIDE1OS4xMjg3ODJdICAgICBvayAxIC0gdGVzdF94ZV9k
bWFfYnVmCgpTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwud2FqZGVj
emtvQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0veGUvdGVzdHMvTWFrZWZpbGUg
ICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX2RtYV9idWYu
YyAgICAgIHwgNTQgKysrKysrKysrKysrKy0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3hl
L3Rlc3RzL3hlX2RtYV9idWZfdGVzdC5jIHwgMjMgLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0veGUvdGVzdHMveGVfZG1hX2J1Zl90ZXN0LmggfCAxMyAtLS0tLS0KIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kbWFfYnVmLmMgICAgICAgICAgICB8ICA3ICsrLQogNSBmaWxlcyBjaGFu
Z2VkLCAzNSBpbnNlcnRpb25zKCspLCA2NCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0veGUvdGVzdHMveGVfZG1hX2J1Zl90ZXN0LmMKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUvdGVzdHMveGVfZG1hX2J1Zl90ZXN0
LmgKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvdGVzdHMvTWFrZWZpbGUgYi9k
cml2ZXJzL2dwdS9kcm0veGUvdGVzdHMvTWFrZWZpbGUKaW5kZXggNDcwNTZiNjQ1OWUzLi5l
ZTI0MWRjNmExMjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS90ZXN0cy9NYWtl
ZmlsZQorKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvdGVzdHMvTWFrZWZpbGUKQEAgLTEsNCAr
MSw0IEBACiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCiAKLW9iai0kKENP
TkZJR19EUk1fWEVfS1VOSVRfVEVTVCkgKz0geGVfYm9fdGVzdC5vIHhlX2RtYV9idWZfdGVz
dC5vIFwKK29iai0kKENPTkZJR19EUk1fWEVfS1VOSVRfVEVTVCkgKz0geGVfYm9fdGVzdC5v
IFwKIAl4ZV9taWdyYXRlX3Rlc3QubwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3Rlc3RzL3hlX2RtYV9idWYuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS90ZXN0cy94ZV9kbWFf
YnVmLmMKaW5kZXggZTY2YTgzNjFhZTFmLi4zY2E5Yjk0N2MxNWYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS90ZXN0cy94ZV9kbWFfYnVmLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3Rlc3RzL3hlX2RtYV9idWYuYwpAQCAtNSwxNyArNSwxNyBAQAogCiAjaW5jbHVk
ZSA8a3VuaXQvdGVzdC5oPgogCi0jaW5jbHVkZSAidGVzdHMveGVfZG1hX2J1Zl90ZXN0Lmgi
CisjaW5jbHVkZSAic2VsZnRlc3RzL3hlX3NlbGZ0ZXN0cy5oIgogCiAjaW5jbHVkZSAieGVf
cGNpLmgiCiAKLXN0YXRpYyBib29sIHAycF9lbmFibGVkKHN0cnVjdCBkbWFfYnVmX3Rlc3Rf
cGFyYW1zICpwYXJhbXMpCitzdGF0aWMgYm9vbCBwMnBfZW5hYmxlZChjb25zdCBzdHJ1Y3Qg
ZG1hX2J1Zl90ZXN0X3BhcmFtcyAqcGFyYW1zKQogewogCXJldHVybiBJU19FTkFCTEVEKENP
TkZJR19QQ0lfUDJQRE1BKSAmJiBwYXJhbXMtPmF0dGFjaF9vcHMgJiYKIAkJcGFyYW1zLT5h
dHRhY2hfb3BzLT5hbGxvd19wZWVyMnBlZXI7CiB9CiAKLXN0YXRpYyBib29sIGlzX2R5bmFt
aWMoc3RydWN0IGRtYV9idWZfdGVzdF9wYXJhbXMgKnBhcmFtcykKK3N0YXRpYyBib29sIGlz
X2R5bmFtaWMoY29uc3Qgc3RydWN0IGRtYV9idWZfdGVzdF9wYXJhbXMgKnBhcmFtcykKIHsK
IAlyZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfRE1BQlVGX01PVkVfTk9USUZZKSAmJiBwYXJh
bXMtPmF0dGFjaF9vcHMgJiYKIAkJcGFyYW1zLT5hdHRhY2hfb3BzLT5tb3ZlX25vdGlmeTsK
QEAgLTI0LDcgKzI0LDcgQEAgc3RhdGljIGJvb2wgaXNfZHluYW1pYyhzdHJ1Y3QgZG1hX2J1
Zl90ZXN0X3BhcmFtcyAqcGFyYW1zKQogc3RhdGljIHZvaWQgY2hlY2tfcmVzaWRlbmN5KHN0
cnVjdCBrdW5pdCAqdGVzdCwgc3RydWN0IHhlX2JvICpleHBvcnRlZCwKIAkJCSAgICBzdHJ1
Y3QgeGVfYm8gKmltcG9ydGVkLCBzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmKQogewotCXN0cnVj
dCBkbWFfYnVmX3Rlc3RfcGFyYW1zICpwYXJhbXMgPSB0b19kbWFfYnVmX3Rlc3RfcGFyYW1z
KHRlc3QtPnByaXYpOworCWNvbnN0IHN0cnVjdCBkbWFfYnVmX3Rlc3RfcGFyYW1zICpwYXJh
bXMgPSB0ZXN0LT5wYXJhbV92YWx1ZTsKIAl1MzIgbWVtX3R5cGU7CiAJaW50IHJldDsKIApA
QCAtMTA0LDcgKzEwNCw3IEBAIHN0YXRpYyB2b2lkIGNoZWNrX3Jlc2lkZW5jeShzdHJ1Y3Qg
a3VuaXQgKnRlc3QsIHN0cnVjdCB4ZV9ibyAqZXhwb3J0ZWQsCiBzdGF0aWMgdm9pZCB4ZV90
ZXN0X2RtYWJ1Zl9pbXBvcnRfc2FtZV9kcml2ZXIoc3RydWN0IHhlX2RldmljZSAqeGUpCiB7
CiAJc3RydWN0IGt1bml0ICp0ZXN0ID0geGVfY3VyX2t1bml0KCk7Ci0Jc3RydWN0IGRtYV9i
dWZfdGVzdF9wYXJhbXMgKnBhcmFtcyA9IHRvX2RtYV9idWZfdGVzdF9wYXJhbXModGVzdC0+
cHJpdik7CisJY29uc3Qgc3RydWN0IGRtYV9idWZfdGVzdF9wYXJhbXMgKnBhcmFtcyA9IHRl
c3QtPnBhcmFtX3ZhbHVlOwogCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqaW1wb3J0OwogCXN0
cnVjdCBkbWFfYnVmICpkbWFidWY7CiAJc3RydWN0IHhlX2JvICpibzsKQEAgLTIzMywyOSAr
MjMzLDM3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1hX2J1Zl90ZXN0X3BhcmFtcyB0ZXN0
X3BhcmFtc1tdID0gewogCXsubWVtX21hc2sgPSBYRV9CT19DUkVBVEVfU1lTVEVNX0JJVCB8
IFhFX0JPX0NSRUFURV9WUkFNMF9CSVR9LAogCXsubWVtX21hc2sgPSBYRV9CT19DUkVBVEVf
U1lTVEVNX0JJVCB8IFhFX0JPX0NSRUFURV9WUkFNMF9CSVQsCiAJIC5mb3JjZV9kaWZmZXJl
bnRfZGV2aWNlcyA9IHRydWV9LAotCi0Je30KIH07CiAKLXN0YXRpYyBpbnQgZG1hX2J1Zl9y
dW5fZGV2aWNlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQorc3RhdGljIHZvaWQgdGVzdF94ZV9k
bWFfYnVmKHN0cnVjdCBrdW5pdCAqdGVzdCkKIHsKLQljb25zdCBzdHJ1Y3QgZG1hX2J1Zl90
ZXN0X3BhcmFtcyAqcGFyYW1zOwotCXN0cnVjdCBrdW5pdCAqdGVzdCA9IHhlX2N1cl9rdW5p
dCgpOwotCi0JZm9yIChwYXJhbXMgPSB0ZXN0X3BhcmFtczsgcGFyYW1zLT5tZW1fbWFzazsg
KytwYXJhbXMpIHsKLQkJc3RydWN0IGRtYV9idWZfdGVzdF9wYXJhbXMgcCA9ICpwYXJhbXM7
CisJc3RydWN0IHhlX2RldmljZSAqeGUgPSB0ZXN0LT5wcml2OwogCi0JCXAuYmFzZS5pZCA9
IFhFX1RFU1RfTElWRV9ETUFfQlVGOwotCQl0ZXN0LT5wcml2ID0gJnA7Ci0JCXhlX3Rlc3Rf
ZG1hYnVmX2ltcG9ydF9zYW1lX2RyaXZlcih4ZSk7Ci0JfQotCi0JLyogQSBub24temVybyBy
ZXR1cm4gd291bGQgaGFsdCBpdGVyYXRpb24gb3ZlciBkcml2ZXIgZGV2aWNlcyAqLwotCXJl
dHVybiAwOworCXhlX3Rlc3RfZG1hYnVmX2ltcG9ydF9zYW1lX2RyaXZlcih4ZSk7CiB9CiAK
LXZvaWQgeGVfZG1hX2J1Zl9rdW5pdChzdHJ1Y3Qga3VuaXQgKnRlc3QpCitzdGF0aWMgdm9p
ZCBkbWFfYnVmX3Rlc3RfcGFyYW1fZGVzYyhjb25zdCBzdHJ1Y3QgZG1hX2J1Zl90ZXN0X3Bh
cmFtcyAqcCwgY2hhciAqZGVzYykKIHsKLQl4ZV9jYWxsX2Zvcl9lYWNoX2RldmljZShkbWFf
YnVmX3J1bl9kZXZpY2UpOworCXNucHJpbnRmKGRlc2MsIEtVTklUX1BBUkFNX0RFU0NfU0la
RSwgIm1hc2s9JSMwNHggZm9yY2U9JS0zcyBwMnA9JS0zcyBub3RpZnk9JXBzIiwKKwkJIHAt
Pm1lbV9tYXNrLCBzdHJfeWVzX25vKHAtPmZvcmNlX2RpZmZlcmVudF9kZXZpY2VzKSwKKwkJ
IHAtPmF0dGFjaF9vcHMgPyBzdHJfeWVzX25vKHAtPmF0dGFjaF9vcHMtPmFsbG93X3BlZXIy
cGVlcikgOiAibi9hIiwKKwkJIHAtPmF0dGFjaF9vcHMgPyBwLT5hdHRhY2hfb3BzLT5tb3Zl
X25vdGlmeSA6IE5VTEwpOwogfQotRVhQT1JUX1NZTUJPTCh4ZV9kbWFfYnVmX2t1bml0KTsK
KworS1VOSVRfQVJSQVlfUEFSQU0oZG1hX2J1Zl90ZXN0X3BhcmFtcywgdGVzdF9wYXJhbXMs
IGRtYV9idWZfdGVzdF9wYXJhbV9kZXNjKTsKKworc3RhdGljIHN0cnVjdCBrdW5pdF9jYXNl
IHhlX2RtYV9idWZfbGl2ZV90ZXN0X2Nhc2VzW10gPSB7CisJS1VOSVRfQ0FTRV9QQVJBTSh0
ZXN0X3hlX2RtYV9idWYsIGRtYV9idWZfdGVzdF9wYXJhbXNfZ2VuX3BhcmFtcyksCisJe30K
K307CisKK3N0YXRpYyBzdHJ1Y3Qga3VuaXRfc3VpdGUgeGVfZG1hX2J1Zl9saXZlX3N1aXRl
ID0geworCS5uYW1lID0gInhlX2RtYV9idWZfbGl2ZSIsCisJLnRlc3RfY2FzZXMgPSB4ZV9k
bWFfYnVmX2xpdmVfdGVzdF9jYXNlcywKKworCS5zdWl0ZV9pbml0ID0gaW5pdF94ZV9saXZl
X3NlbGZ0ZXN0X3N1aXRlLAorCS5pbml0ID0gaW5pdF94ZV9kZXZpY2Vfc2VsZnRlc3QsCisJ
LmV4aXQgPSBleGl0X3hlX2RldmljZV9zZWxmdGVzdCwKK307CisKK2t1bml0X3Rlc3Rfc3Vp
dGUoeGVfZG1hX2J1Zl9saXZlX3N1aXRlKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS90ZXN0cy94ZV9kbWFfYnVmX3Rlc3QuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS90ZXN0
cy94ZV9kbWFfYnVmX3Rlc3QuYwpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYTFh
ZGZkMWUxNjA1Li4wMDAwMDAwMDAwMDAKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3Rz
L3hlX2RtYV9idWZfdGVzdC5jCisrKyAvZGV2L251bGwKQEAgLTEsMjMgKzAsMCBAQAotLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKLS8qCi0gKiBDb3B5cmlnaHQgwqkg
MjAyMiBJbnRlbCBDb3Jwb3JhdGlvbgotICovCi0KLSNpbmNsdWRlICJ4ZV9kbWFfYnVmX3Rl
c3QuaCIKLQotI2luY2x1ZGUgPGt1bml0L3Rlc3QuaD4KLQotc3RhdGljIHN0cnVjdCBrdW5p
dF9jYXNlIHhlX2RtYV9idWZfdGVzdHNbXSA9IHsKLQlLVU5JVF9DQVNFKHhlX2RtYV9idWZf
a3VuaXQpLAotCXt9Ci19OwotCi1zdGF0aWMgc3RydWN0IGt1bml0X3N1aXRlIHhlX2RtYV9i
dWZfdGVzdF9zdWl0ZSA9IHsKLQkubmFtZSA9ICJ4ZV9kbWFfYnVmIiwKLQkudGVzdF9jYXNl
cyA9IHhlX2RtYV9idWZfdGVzdHMsCi19OwotCi1rdW5pdF90ZXN0X3N1aXRlKHhlX2RtYV9i
dWZfdGVzdF9zdWl0ZSk7Ci0KLU1PRFVMRV9BVVRIT1IoIkludGVsIENvcnBvcmF0aW9uIik7
Ci1NT0RVTEVfTElDRU5TRSgiR1BMIik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUvdGVzdHMveGVfZG1hX2J1Zl90ZXN0LmggYi9kcml2ZXJzL2dwdS9kcm0veGUvdGVzdHMv
eGVfZG1hX2J1Zl90ZXN0LmgKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGU2YjQ2
NGRkZDUyNi4uMDAwMDAwMDAwMDAwCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS90ZXN0cy94
ZV9kbWFfYnVmX3Rlc3QuaAorKysgL2Rldi9udWxsCkBAIC0xLDEzICswLDAgQEAKLS8qIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wIEFORCBNSVQgKi8KLS8qCi0gKiBDb3B5
cmlnaHQgwqkgMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbgotICovCi0KLSNpZm5kZWYgX1hFX0RN
QV9CVUZfVEVTVF9IXwotI2RlZmluZSBfWEVfRE1BX0JVRl9URVNUX0hfCi0KLXN0cnVjdCBr
dW5pdDsKLQotdm9pZCB4ZV9kbWFfYnVmX2t1bml0KHN0cnVjdCBrdW5pdCAqdGVzdCk7Ci0K
LSNlbmRpZgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RtYV9idWYuYyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kbWFfYnVmLmMKaW5kZXggOWIyNTJjYzc4MmI3Li40
ZDFlZDE3Y2U5ZDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kbWFfYnVm
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RtYV9idWYuYwpAQCAtMjQzLDkgKzI0
Myw4IEBAIHN0cnVjdCBkbWFfYnVmX3Rlc3RfcGFyYW1zIHsKIHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqeGVfZ2VtX3ByaW1lX2ltcG9ydChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJ
CQkgICBzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZikKIHsKLQlYRV9URVNUX0RFQ0xBUkUoc3Ry
dWN0IGRtYV9idWZfdGVzdF9wYXJhbXMgKnRlc3QgPQotCQkJdG9fZG1hX2J1Zl90ZXN0X3Bh
cmFtcwotCQkJKHhlX2N1cl9rdW5pdF9wcml2KFhFX1RFU1RfTElWRV9ETUFfQlVGKSk7KQor
CVhFX1RFU1RfREVDTEFSRShjb25zdCBzdHJ1Y3QgZG1hX2J1Zl90ZXN0X3BhcmFtcyAqdGVz
dCA9CisJCQl4ZV9jdXJfa3VuaXQoKS0+cGFyYW1fdmFsdWU7KQogCWNvbnN0IHN0cnVjdCBk
bWFfYnVmX2F0dGFjaF9vcHMgKmF0dGFjaF9vcHM7CiAJc3RydWN0IGRtYV9idWZfYXR0YWNo
bWVudCAqYXR0YWNoOwogCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqOwpAQCAtMzAxLDYg
KzMwMCw2IEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqeGVfZ2VtX3ByaW1lX2ltcG9ydChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCXJldHVybiBvYmo7CiB9CiAKLSNpZiBJU19FTkFC
TEVEKENPTkZJR19EUk1fWEVfS1VOSVRfVEVTVCkKKyNpZiBJU19FTkFCTEVEKENPTkZJR19E
Uk1fWEVfU0VMRlRFU1RTX0xJVkUpCiAjaW5jbHVkZSAidGVzdHMveGVfZG1hX2J1Zi5jIgog
I2VuZGlmCi0tIAoyLjI1LjEKCg==

--------------Vjtt78MUgVMM7iK85IzBy2j7--
