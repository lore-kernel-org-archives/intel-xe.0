Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED30C7618A
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 12:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBF010EAEC;
	Wed, 15 Mar 2023 12:35:51 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B1D10EAEC
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 12:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678883750; x=1710419750;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PEaZ0rOlAZgZPAhIi9VOhKEOiCucHUUrlql4SL3iDuk=;
 b=Me0/I6yn+xNZTXOuYbUgozYxPCwtzFUhPKCMXVkwucXTnzi+X6B7XoNB
 eN2NnWa4hPGNwbc64Yf+2rv4oJUJfKDJME1+HQQu0sL5N2yDPOAynZEBF
 y/xYtfCmxdD3hCyh0TL0irTuck63jrv1dMdrykVe1c09H60MciFuPGMT5
 ldQ+pA/WS63Z4BTHFPleLZB/CbMVN5PpKEA8/yHU9QJHlbRskjSZggRow
 CNJAx6QlPqM4bc5aVuW1bjD1e7xdYt8OqTZ4ATs3N2m2sAtzo0OFYtSFf
 BOL4aMm6kszOUB9bmu1uKK5uAaLblISTT9pneBhYQMaabRkY+AwWx7QJ4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="326046437"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="326046437"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 05:35:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="672726146"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="672726146"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga007.jf.intel.com with ESMTP; 15 Mar 2023 05:35:47 -0700
Received: from [10.249.159.27] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.159.27])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A2DEBB56C4;
 Mon, 13 Mar 2023 13:20:10 +0000 (GMT)
Message-ID: <477d72db-37f8-3d67-7209-80af87e27c38@intel.com>
Date: Mon, 13 Mar 2023 14:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-US
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
 <20230313081316.2408-2-michal.wajdeczko@intel.com>
 <20230313134538.47da434b@maurocar-mobl2>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230313134538.47da434b@maurocar-mobl2>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 13.03.2023 13:45, Mauro Carvalho Chehab wrote:
> On Mon, 13 Mar 2023 09:13:12 +0100
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> 
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
>>  drivers/gpu/drm/xe/Kconfig.debug              |  22 ++++
>>  drivers/gpu/drm/xe/Makefile                   |  11 ++
>>  drivers/gpu/drm/xe/selftests/xe_selftests.h   |  35 ++++++
>>  .../gpu/drm/xe/selftests/xe_selftests_auto.c  |  46 +++++++
>>  .../drm/xe/selftests/xe_selftests_executor.c  | 118 ++++++++++++++++++
>>  .../drm/xe/selftests/xe_selftests_helpers.c   | 101 +++++++++++++++
>>  .../drm/xe/selftests/xe_selftests_internal.h  |  22 ++++
>>  .../gpu/drm/xe/selftests/xe_selftests_mock.c  |  32 +++++
>>  .../drm/xe/selftests/xe_selftests_params.c    |  23 ++++
>>  drivers/gpu/drm/xe/xe_module.c                |   2 +
>>  10 files changed, 412 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests.h
>>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
>>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
>>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
>>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
>>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_params.c
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>> index 93b284cdd0a2..aeba43977dca 100644
>> --- a/drivers/gpu/drm/xe/Kconfig.debug
>> +++ b/drivers/gpu/drm/xe/Kconfig.debug
>> @@ -61,6 +61,28 @@ config DRM_XE_SIMPLE_ERROR_CAPTURE
>>  
>>  	  If in doubt, say "N".
>>  
>> +config DRM_XE_SELFTESTS_MOCK
>> +	bool "Mock selftests for Xe" if !KUNIT_ALL_TESTS
>> +	depends on DRM_XE && KUNIT
>> +	default KUNIT_ALL_TESTS
>> +	help
>> +		Choose this option to allow the driver to perform mock
>> +		selftests based on the Kunit framework.
>> +
>> +		Recommended for driver developers only.
>> +		If in doubt, say "N".
>> +
>> +config DRM_XE_SELFTESTS_LIVE
>> +	bool "Live selftests for Xe" if !DRM_XE_SELFTESTS_MOCK
>> +	depends on DRM_XE && KUNIT && EXPERT
>> +	default n
>> +	help
>> +		Choose this option to allow the driver to perform live
>> +		selftests based on the Kunit framework.
>> +
>> +		Recommended for driver developers only.
>> +		If in doubt, say "N".
>> +
>>  config DRM_XE_KUNIT_TEST
>>          tristate "KUnit tests for the drm xe driver" if !KUNIT_ALL_TESTS
>>  	depends on DRM_XE && KUNIT && DEBUG_FS
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index b94e65c91101..b193af2d9930 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -211,6 +211,17 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
>>  	xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
>>  endif
>>  
>> +xe-$(CONFIG_DRM_XE_SELFTESTS_MOCK) += \
>> +	selftests/xe_selftests_mock.o \
>> +
>> +xe-$(CONFIG_DRM_XE_SELFTESTS_LIVE) += \
>> +	selftests/xe_selftests_auto.o \
>> +	selftests/xe_selftests_executor.o \
>> +	selftests/xe_selftests_params.o \
>> +
>> +xe-$(CONFIG_KUNIT) += \
>> +	selftests/xe_selftests_helpers.o \
>> +
>>  obj-$(CONFIG_DRM_XE) += xe.o
>>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>>  
>> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests.h b/drivers/gpu/drm/xe/selftests/xe_selftests.h
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
>> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c b/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
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
>> +static int bus_cb(struct notifier_block *nb, unsigned long action, void *data)
>> +{
>> +	struct device *dev = data;
>> +	struct device_driver *drv = dev->driver;
>> +
>> +	if (action != BUS_NOTIFY_BOUND_DRIVER)
>> +		return 0;
>> +
>> +	if (strcmp(DRIVER_NAME, drv->name))
>> +		return 0;
>> +
>> +	/* only matching DUT names will be tested */
>> +	if (!dut_filter || !glob_match(dut_filter, dev_name(dev)))
>> +		return 0;
>> +
>> +	xe_selftests_run(dev_name(dev));
>> +
>> +	return 0;
>> +}
>> +
>> +static struct notifier_block nb = {
>> +	.notifier_call = bus_cb,
>> +};
>> +
>> +int xe_selftests_module_init(void)
>> +{
>> +	return bus_register_notifier(&pci_bus_type, &nb);
>> +}
>> +
>> +void xe_selftests_module_exit(void)
>> +{
>> +	bus_unregister_notifier(&pci_bus_type, &nb);
>> +}
>> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_executor.c b/drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
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
>> +	return 1;
>> +}
>> +
>> +static int match_dev_by_name(struct device *dev, const void *data)
>> +{
>> +	const char *name = data;
>> +	return !strcmp(dev_name(dev), name);
>> +}
>> +
>> +struct xe_device *get_xe_dut(void)
>> +{
>> +	struct device_driver *drv;
>> +	struct device *dev;
>> +
>> +	if (!anonymous_dut && !mutex_is_locked(&dut_mutex))
>> +		return ERR_PTR(-ENOTTY);
> 
> Hmm... I guess EBUSY would fit better here.

I'm using -EBUSY to indicate that other live test is already running,
while here we want to say we don't want to run live test on not
explicitly specified device.

and I was planning to teach Kunit executor to handle -ENOTTY as
indication that we want to SKIP the whole suite (due to missing
prerequisites or something)

> 
>> +
>> +	drv = driver_find(DRIVER_NAME, &pci_bus_type);
>> +	dev = driver_find_device(drv, NULL, dut_name,
>> +				 mutex_is_locked(&dut_mutex) ? match_dev_by_name : match_dev_any);
>> +	if (!dev)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	return to_xe_device(dev_get_drvdata(dev));
>> +}
>> +
>> +void put_xe_dut(struct xe_device *xe)
>> +{
>> +	put_device(xe->drm.dev);
>> +}
>> +
>> +static int run_test_suites(struct xe_device *xe)
>> +{
>> +	struct device *dev = xe->drm.dev;
>> +	struct device_driver *drv = dev->driver;
>> +	struct module *mod = drv->owner;
>> +	struct kunit_suite **suites = mod->kunit_suites;
>> +	int num_suites = mod->num_kunit_suites;
>> +	int i;
>> +
>> +	pr_info("TAP version 14\n");
> 
> It doesn't seem nice to hardcode it here. IMO, this should be in sync
> with lib/kunit/executor.c.
> 
> Maybe the way to go would be to add, at kunit/test.h:
> 
> #define TAP_VERSION	"TAP version 14\n"
> 
> And use such macro on both lib/kunit/executor.c and here.

problem is that upstream Kunit moved from "TAP 14" to "KTAP 1" so I
guess while xe is behind, we would still need local definition

> 
> We need to c/c kunit maintainers on such patch.
> 
> IMO, a better approach would be to modify lib/kunit/executor.c, adding
> there a variant of kunit_run_all_tests() to be used with a custom
> filter list, e. g.:
> 
> 	kunit_run_filtered_tests(struct suite_set *suite_set, (int *)filter_test(struct suite_set *suite_set)) 
> 
> And then calling it at xe_selftests_executor.c.

true, and I've already something similar locally (*), but in this series
I decided to go without any external changes to speed up the decision
process ;)

Thanks,
Michal


(*) plan was to export (currently available as built-in feature)
function to run suites with optional name-based filter:

int kunit_run_suites(struct kunit_suite **suites, int num_suites,
		     const char *filter, bool dry_run);

static inline int kunit_run_module_suites(struct module *mod, const char
*filter, bool dry_run) { .. }

static inline int kunit_run_this_module_suites(const char *filter, bool
dry_run)
{
	return kunit_run_module_suites(THIS_MODULE, filter, dry_run);
}


> 
>> +	pr_info("1..%u\n", num_suites);
>> +
>> +	/* reset kunit_suite_counter at the start */
>> +	__kunit_test_suites_exit(NULL, 0);
>> +
>> +	for (i = 0; i < num_suites; i++) {
>> +		kunit_run_tests(suites[i]);
>> +	}
>> +
>> +	/* reset kunit_suite_counter at the end */
>> +	__kunit_test_suites_exit(NULL, 0);
>> +
>> +	return num_suites;
>> +}
> 
> Regards,
> Mauro
