Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BEFC6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 07:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9A210E096;
	Fri, 17 Mar 2023 07:20:59 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F9E10E096
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 07:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679037657; x=1710573657;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=Rk0gVRBOYPl98jQ6YI6zQQPEViMvCTd9dtZB1ssGoqY=;
 b=GrE4jdB4BqnfTRP0wWaIW6E1ghZbDmXkxRqUhPa6Zs7Awz2uf5vpOSEh
 FS2KHZNKVdAIGrEZLGhMH3MyoUhybmj5kWs+BRGJwjwXnox9NRinTdK+s
 AxOHYQG9w0jEGvxFCvCh2gifgny86meaMwlJLn9PZ+LJ2iL1npL+/GzsZ
 eTRle7qiRmXAKyNvzdfD40RBmeAXoawbJrrica9mKf1tKN1Y/81nJkOM9
 /FdHnMO/AKbvHzDRA5oRf2AQUDhpA/vTPDm6nlwAe/vKSo2jk7ZYeD9xn
 AzIqjO2f502G0tJM6U1SBpdHEqb5q3wkycvvMGnwjoYwkutPpQY1w36S9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="339740653"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
 d="scan'208,217";a="339740653"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 00:20:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="854352247"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
 d="scan'208,217";a="854352247"
Received: from lsilistr-mobl.ger.corp.intel.com (HELO [10.249.254.137])
 ([10.249.254.137])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 00:20:49 -0700
Content-Type: multipart/alternative;
 boundary="------------jDJ7xc3GtaobmKAC7vSaVAW8"
Message-ID: <b411541a-b357-14f7-e193-f8cbb2e31b4a@linux.intel.com>
Date: Fri, 17 Mar 2023 08:20:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: intel-xe@lists.freedesktop.org
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
 <20230313081316.2408-2-michal.wajdeczko@intel.com>
 <20230313162348.s3cle2rpnvtgh6yk@ldmartin-desk2.lan>
 <f7483e45-d145-4e32-64b8-ea921b3ae393@intel.com>
 <20230316064643.fu5thzu4pf7htisq@ldmartin-desk2.lan>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230316064643.fu5thzu4pf7htisq@ldmartin-desk2.lan>
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
--------------jDJ7xc3GtaobmKAC7vSaVAW8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 3/16/23 07:46, Lucas De Marchi wrote:
> On Mon, Mar 13, 2023 at 07:18:34PM +0100, Michal Wajdeczko wrote:
>>
>>
>> On 13.03.2023 17:23, Lucas De Marchi wrote:
>>> On Mon, Mar 13, 2023 at 09:13:12AM +0100, Michal Wajdeczko wrote:
>>>> Our initial attempt to run Kunit based tests on live devices is hard
>>>> to use and will not work well with multiple devices attached.
>>>>
>>>> Instead of relying on separate test module and duplicating support
>>>> for multiple live devices in every test entry point, create new set
>>>> of helpers and use test->priv to pass reference of the device under
>>>> test (DUT) directly to every test function.
>>>>
>>>> The same use pattern is supported for both mock and live selftests.
>>>>
>>>> By using bus_notifier we can start testing each new bound device
>>>> separatelly, subject to filtering using dut_filter modparam.
>>>>
>>>> All test cases can be included directly from .c file, allowing test
>>>> code to access and use any private functions.
>>>>
>>>> As Kunit will attempt to run all suites on module load, including
>>>> our new live test suites, we may want to allow to execute them on
>>>> any available device. This is controlled by anonymous_dut modparam.
>>>>
>>>> Support for either mock or live selftests, only one at time, is
>>>> controlled by new Kconfig options.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/Kconfig.debug              |  22 ++++
>>>> drivers/gpu/drm/xe/Makefile                   |  11 ++
>>>> drivers/gpu/drm/xe/selftests/xe_selftests.h   |  35 ++++++
>>>> .../gpu/drm/xe/selftests/xe_selftests_auto.c  |  46 +++++++
>>>> .../drm/xe/selftests/xe_selftests_executor.c  | 118 ++++++++++++++++++
>>>> .../drm/xe/selftests/xe_selftests_helpers.c   | 101 +++++++++++++++
>>>> .../drm/xe/selftests/xe_selftests_internal.h  |  22 ++++
>>>> .../gpu/drm/xe/selftests/xe_selftests_mock.c  |  32 +++++
>>>> .../drm/xe/selftests/xe_selftests_params.c    |  23 ++++
>>>> drivers/gpu/drm/xe/xe_module.c                |   2 +
>>>> 10 files changed, 412 insertions(+)
>>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests.h
>>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>>>> create mode 100644 
>>>> drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
>>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
>>>> create mode 100644 
>>>> drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
>>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
>>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_params.c
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Kconfig.debug
>>>> b/drivers/gpu/drm/xe/Kconfig.debug
>>>> index 93b284cdd0a2..aeba43977dca 100644
>>>> --- a/drivers/gpu/drm/xe/Kconfig.debug
>>>> +++ b/drivers/gpu/drm/xe/Kconfig.debug
>>>> @@ -61,6 +61,28 @@ config DRM_XE_SIMPLE_ERROR_CAPTURE
>>>>
>>>>       If in doubt, say "N".
>>>>
>>>> +config DRM_XE_SELFTESTS_MOCK
>>>> +    bool "Mock selftests for Xe" if !KUNIT_ALL_TESTS
>>>> +    depends on DRM_XE && KUNIT
>>>> +    default KUNIT_ALL_TESTS
>>>> +    help
>>>> +        Choose this option to allow the driver to perform mock
>>>> +        selftests based on the Kunit framework.
>>>> +
>>>> +        Recommended for driver developers only.
>>>> +        If in doubt, say "N".
>>>> +
>>>> +config DRM_XE_SELFTESTS_LIVE
>>>> +    bool "Live selftests for Xe" if !DRM_XE_SELFTESTS_MOCK
>>>
>>> why?  I think we should aim to run live tests in *addition* to
>>> mock ones.  The mock tests are more testing our SW infra and can be 
>>> used
>>> in a true "unit test" sense. While the live ones are testing the
>>> integration with the HW and making sure they work together.
>>
>> I've added that just to simplify the code logic as I assumed we will be
>> running mock tests only in "true kunit" fashion as part of the build.
>>
>> So then we could avoid mixing mock/live "kunit suites" in single driver
>> module, especially that as of today there is no nice support to filter
>> out undesired suites from the execution. Thus adding compile time flag
>> to only have one category of selftests at time was looking promising.
>
> I'm using this in the patches I'm sending to unit test rtp and wa parts:
>
>     ./tools/testing/kunit/kunit.py run --raw_output  \
>                 --kunitconfig drivers/gpu/drm/xe/.kunitconfig xe_rtp
>
>>
>> So I was using .kunitconfig with
>>     CONFIG_DRM_XE_SELFTESTS_MOCK=y
>> and normal .config with
>>     CONFIG_DRM_XE_SELFTESTS_LIVE=y
>>
>>>
>>> I have changes pending to test some WA and RTP infra we added,
>>> regardless of the HW. But I don't want to have to choose either one or
>>> the other.
>>
>> And I guess you still can do that, just it wont be automatically
>> compiled out, nor you be able to benefit from the helpers, but they will
>> be executed
>>
>>>
>>> Also Cc Thomas as original author of the kunit integration.
>>>
>>> We also have some overloaded terms that need better explanation:
>>> mock, selftest, live.
>>
>> I reused terms from i915, assumed everyone is familiar with that.
>>
>> "mock selftest" - a kunit test suite to be run on abstract xe device
>> "live selftest" - a kunit test suite to be executed on real xe device
>
> Things I like on the current kunit integration we have in xe:
>
>     1) The ability to move unit test code out to a separate module
>     2) Not having a big infra that is xe-only
>     3) Share terminology with the rest of drm subsystem
>
> This patch series is basically killing (1) and (3). And for (2) it seems
> to be heading another direction.  Looking at the current available
> drivers,  I think we should be more like the drm tests and the vc4 tests
> rather than the i915 ones.  If we need more helpers we may probably
> extend the ones in DRM_KUNIT_TEST_HELPERS
>
> I'd love to hear others' opinions though.

I basically agree with Lucas here. Some points:

  * For mock selftests IMO we don't need anything on top of what we
    already have, except perhaps consolidate initialization of a mock
    device as a helper each test can optionally use.  I think, though,
    that Mauro's suggestion of coalescing multiple mock tests together
    in a single separate kernel module with multiple test suites to
    avoid too many separate kernel module might be worth considering if
    needed.
  * For live selftests it seems like where the big disconnect is. I
    still believe that we should have separate modules, and depending on
    how the IGT runner end up working have enough information in that
    module for IGT to execute the tests with the --run-subtest and
    --dynamic-subtest options.
  * Admiddedly the xe_for_each_device() helper is very limited, but
    couldn't we just make a more elaborate helper that can add
    functionality like filter out devices if needed? I'm thinking if we
    enforce a middle layer that tells each test what device it should be
    testing, things like testing PCI p2p dma between devices will become
    awkward (but still possible I guess).
  * Do we really need to support compiled-in live selftests that run a
    device on device binding? I guess the use-case isn't fully clear to me.
  * And yes the test parameters shouldn't be needing the test->priv, but
    neither should we need to pass the device here, right?

/Thomas





>
> Lucas De Marchi
>
>>
>> If you have better suggestions, then you're welcomed
>>
>>>
>>>> +    depends on DRM_XE && KUNIT && EXPERT
>>>> +    default n
>>>> +    help
>>>> +        Choose this option to allow the driver to perform live
>>>> +        selftests based on the Kunit framework.
>>>> +
>>>> +        Recommended for driver developers only.
>>>> +        If in doubt, say "N".
>>>> +
>>>> config DRM_XE_KUNIT_TEST
>>>>         tristate "KUnit tests for the drm xe driver" if 
>>>> !KUNIT_ALL_TESTS
>>>>     depends on DRM_XE && KUNIT && DEBUG_FS
>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>> index b94e65c91101..b193af2d9930 100644
>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>> @@ -211,6 +211,17 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
>>>>     xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
>>>> endif
>>>>
>>>> +xe-$(CONFIG_DRM_XE_SELFTESTS_MOCK) += \
>>>> +    selftests/xe_selftests_mock.o \
>>>> +
>>>> +xe-$(CONFIG_DRM_XE_SELFTESTS_LIVE) += \
>>>> +    selftests/xe_selftests_auto.o \
>>>> +    selftests/xe_selftests_executor.o \
>>>> +    selftests/xe_selftests_params.o \
>>>> +
>>>> +xe-$(CONFIG_KUNIT) += \
>>>> +    selftests/xe_selftests_helpers.o \
>>>> +
>>>> obj-$(CONFIG_DRM_XE) += xe.o
>>>> obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests.h
>>>> b/drivers/gpu/drm/xe/selftests/xe_selftests.h
>>>> new file mode 100644
>>>> index 000000000000..6b13b998e789
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests.h
>>>> @@ -0,0 +1,35 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _XE_SELFTESTS_H_
>>>> +#define _XE_SELFTESTS_H_
>>>> +
>>>> +struct kunit_suite;
>>>> +struct kunit;
>>>> +
>>>> +int xe_selftests_run(const char *dev_name);
>>>> +
>>>> +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
>>>> +int init_xe_live_selftest_suite(struct kunit_suite *suite);
>>>> +#endif
>>>> +
>>>> +int init_xe_device_selftest(struct kunit *test);
>>>> +void exit_xe_device_selftest(struct kunit *test);
>>>> +
>>>> +int init_xe_gt_selftest(struct kunit *test);
>>>> +void exit_xe_gt_selftest(struct kunit *test);
>>>> +
>>>> +int init_xe_guc_selftest(struct kunit *test);
>>>> +void exit_xe_guc_selftest(struct kunit *test);
>>>> +
>>>> +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
>>>> +int xe_selftests_module_init(void);
>>>> +void xe_selftests_module_exit(void);
>>>> +#else
>>>> +static inline int xe_selftests_module_init(void) { return 0; }
>>>> +static inline void xe_selftests_module_exit(void) { }
>>>> +#endif
>>>> +
>>>> +#endif /* _XE_SELFTESTS_H_ */
>>>> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>>>> b/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>>>> new file mode 100644
>>>> index 000000000000..ef98f3599eac
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>>>> @@ -0,0 +1,46 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <linux/device.h>
>>>> +#include <linux/glob.h>
>>>> +#include <linux/pci.h>
>>>> +
>>>> +#include "xe_drv.h"
>>>> +#include "selftests/xe_selftests.h"
>>>> +#include "selftests/xe_selftests_internal.h"
>>>> +
>>>> +static int bus_cb(struct notifier_block *nb, unsigned long action,
>>>> void *data)
>>>> +{
>>>> +    struct device *dev = data;
>>>> +    struct device_driver *drv = dev->driver;
>>>> +
>>>> +    if (action != BUS_NOTIFY_BOUND_DRIVER)
>>>> +        return 0;
>>>> +
>>>> +    if (strcmp(DRIVER_NAME, drv->name))
>>>> +        return 0;
>>>> +
>>>> +    /* only matching DUT names will be tested */
>>>> +    if (!dut_filter || !glob_match(dut_filter, dev_name(dev)))
>>>
>>> "DUT" name could be avoided and just use what exactly it means.
>>> When I see "DUT" I'm wondering... is this the platform name, the pci 
>>> ID,
>>> the pci slot, the device node?
>>
>> will rename to "dut_name_filter" do the trick ?
>>
>> or do you want to drop "dut" completely and have "device_name_filter" ?
>> but then we would need to add "selftest" or similar word somewhere to
>> give context and then full modparam name will no longer be that friendly
>>
>> Thanks,
>> Michal
--------------jDJ7xc3GtaobmKAC7vSaVAW8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 3/16/23 07:46, Lucas De Marchi
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230316064643.fu5thzu4pf7htisq@ldmartin-desk2.lan">On
      Mon, Mar 13, 2023 at 07:18:34PM +0100, Michal Wajdeczko wrote:
      <br>
      <blockquote type="cite">
        <br>
        <br>
        On 13.03.2023 17:23, Lucas De Marchi wrote:
        <br>
        <blockquote type="cite">On Mon, Mar 13, 2023 at 09:13:12AM
          +0100, Michal Wajdeczko wrote:
          <br>
          <blockquote type="cite">Our initial attempt to run Kunit based
            tests on live devices is hard
            <br>
            to use and will not work well with multiple devices
            attached.
            <br>
            <br>
            Instead of relying on separate test module and duplicating
            support
            <br>
            for multiple live devices in every test entry point, create
            new set
            <br>
            of helpers and use test-&gt;priv to pass reference of the
            device under
            <br>
            test (DUT) directly to every test function.
            <br>
            <br>
            The same use pattern is supported for both mock and live
            selftests.
            <br>
            <br>
            By using bus_notifier we can start testing each new bound
            device
            <br>
            separatelly, subject to filtering using dut_filter modparam.
            <br>
            <br>
            All test cases can be included directly from .c file,
            allowing test
            <br>
            code to access and use any private functions.
            <br>
            <br>
            As Kunit will attempt to run all suites on module load,
            including
            <br>
            our new live test suites, we may want to allow to execute
            them on
            <br>
            any available device. This is controlled by anonymous_dut
            modparam.
            <br>
            <br>
            Support for either mock or live selftests, only one at time,
            is
            <br>
            controlled by new Kconfig options.
            <br>
            <br>
            Signed-off-by: Michal Wajdeczko
            <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
            <br>
            ---
            <br>
            drivers/gpu/drm/xe/Kconfig.debug              |  22 ++++
            <br>
            drivers/gpu/drm/xe/Makefile                   |  11 ++
            <br>
            drivers/gpu/drm/xe/selftests/xe_selftests.h   |  35 ++++++
            <br>
            .../gpu/drm/xe/selftests/xe_selftests_auto.c  |  46 +++++++
            <br>
            .../drm/xe/selftests/xe_selftests_executor.c  | 118
            ++++++++++++++++++
            <br>
            .../drm/xe/selftests/xe_selftests_helpers.c   | 101
            +++++++++++++++
            <br>
            .../drm/xe/selftests/xe_selftests_internal.h  |  22 ++++
            <br>
            .../gpu/drm/xe/selftests/xe_selftests_mock.c  |  32 +++++
            <br>
            .../drm/xe/selftests/xe_selftests_params.c    |  23 ++++
            <br>
            drivers/gpu/drm/xe/xe_module.c                |   2 +
            <br>
            10 files changed, 412 insertions(+)
            <br>
            create mode 100644
            drivers/gpu/drm/xe/selftests/xe_selftests.h
            <br>
            create mode 100644
            drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
            <br>
            create mode 100644
            drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
            <br>
            create mode 100644
            drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
            <br>
            create mode 100644
            drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
            <br>
            create mode 100644
            drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
            <br>
            create mode 100644
            drivers/gpu/drm/xe/selftests/xe_selftests_params.c
            <br>
            <br>
            diff --git a/drivers/gpu/drm/xe/Kconfig.debug
            <br>
            b/drivers/gpu/drm/xe/Kconfig.debug
            <br>
            index 93b284cdd0a2..aeba43977dca 100644
            <br>
            --- a/drivers/gpu/drm/xe/Kconfig.debug
            <br>
            +++ b/drivers/gpu/drm/xe/Kconfig.debug
            <br>
            @@ -61,6 +61,28 @@ config DRM_XE_SIMPLE_ERROR_CAPTURE
            <br>
            <br>
                  If in doubt, say "N".
            <br>
            <br>
            +config DRM_XE_SELFTESTS_MOCK
            <br>
            +    bool "Mock selftests for Xe" if !KUNIT_ALL_TESTS
            <br>
            +    depends on DRM_XE &amp;&amp; KUNIT
            <br>
            +    default KUNIT_ALL_TESTS
            <br>
            +    help
            <br>
            +        Choose this option to allow the driver to perform
            mock
            <br>
            +        selftests based on the Kunit framework.
            <br>
            +
            <br>
            +        Recommended for driver developers only.
            <br>
            +        If in doubt, say "N".
            <br>
            +
            <br>
            +config DRM_XE_SELFTESTS_LIVE
            <br>
            +    bool "Live selftests for Xe" if !DRM_XE_SELFTESTS_MOCK
            <br>
          </blockquote>
          <br>
          why?  I think we should aim to run live tests in *addition* to
          <br>
          mock ones.  The mock tests are more testing our SW infra and
          can be used
          <br>
          in a true "unit test" sense. While the live ones are testing
          the
          <br>
          integration with the HW and making sure they work together.
          <br>
        </blockquote>
        <br>
        I've added that just to simplify the code logic as I assumed we
        will be
        <br>
        running mock tests only in "true kunit" fashion as part of the
        build.
        <br>
        <br>
        So then we could avoid mixing mock/live "kunit suites" in single
        driver
        <br>
        module, especially that as of today there is no nice support to
        filter
        <br>
        out undesired suites from the execution. Thus adding compile
        time flag
        <br>
        to only have one category of selftests at time was looking
        promising.
        <br>
      </blockquote>
      <br>
      I'm using this in the patches I'm sending to unit test rtp and wa
      parts:
      <br>
      <br>
          ./tools/testing/kunit/kunit.py run --raw_output  \
      <br>
                      --kunitconfig drivers/gpu/drm/xe/.kunitconfig
      xe_rtp
      <br>
      <br>
      <blockquote type="cite">
        <br>
        So I was using .kunitconfig with
        <br>
            CONFIG_DRM_XE_SELFTESTS_MOCK=y
        <br>
        and normal .config with
        <br>
            CONFIG_DRM_XE_SELFTESTS_LIVE=y
        <br>
        <br>
        <blockquote type="cite">
          <br>
          I have changes pending to test some WA and RTP infra we added,
          <br>
          regardless of the HW. But I don't want to have to choose
          either one or
          <br>
          the other.
          <br>
        </blockquote>
        <br>
        And I guess you still can do that, just it wont be automatically
        <br>
        compiled out, nor you be able to benefit from the helpers, but
        they will
        <br>
        be executed
        <br>
        <br>
        <blockquote type="cite">
          <br>
          Also Cc Thomas as original author of the kunit integration.
          <br>
          <br>
          We also have some overloaded terms that need better
          explanation:
          <br>
          mock, selftest, live.
          <br>
        </blockquote>
        <br>
        I reused terms from i915, assumed everyone is familiar with
        that.
        <br>
        <br>
        "mock selftest" - a kunit test suite to be run on abstract xe
        device
        <br>
        "live selftest" - a kunit test suite to be executed on real xe
        device
        <br>
      </blockquote>
      <br>
      Things I like on the current kunit integration we have in xe:
      <br>
      <br>
          1) The ability to move unit test code out to a separate module
      <br>
          2) Not having a big infra that is xe-only
      <br>
          3) Share terminology with the rest of drm subsystem
      <br>
      <br>
      This patch series is basically killing (1) and (3). And for (2) it
      seems
      <br>
      to be heading another direction.  Looking at the current available
      <br>
      drivers,  I think we should be more like the drm tests and the vc4
      tests
      <br>
      rather than the i915 ones.  If we need more helpers we may
      probably
      <br>
      extend the ones in DRM_KUNIT_TEST_HELPERS
      <br>
      <br>
      I'd love to hear others' opinions though.
      <br>
    </blockquote>
    <p>I basically agree with Lucas here. Some points:</p>
    <ul>
      <li>For mock selftests IMO we don't need anything on top of what
        we already have, except perhaps consolidate initialization of a
        mock device as a helper each test can optionally use.  I think,
        though, that Mauro's suggestion of coalescing multiple mock
        tests together in a single separate kernel module with multiple
        test suites to avoid too many separate kernel module might be
        worth considering if needed.</li>
      <li>For live selftests it seems like where the big disconnect is.
        I still believe that we should have separate modules, and
        depending on how the IGT runner end up working have enough
        information in that module for IGT to execute the tests with the
        --run-subtest and --dynamic-subtest options.</li>
      <li>Admiddedly the xe_for_each_device() helper is very limited,
        but couldn't we just make a more elaborate helper that can add
        functionality like filter out devices if needed? I'm thinking if
        we enforce a middle layer that tells each test what device it
        should be testing, things like testing PCI p2p dma between
        devices will become awkward (but still possible I guess).</li>
      <li>Do we really need to support compiled-in live selftests that
        run a device on device binding? I guess the use-case isn't fully
        clear to me.</li>
      <li>And yes the test parameters shouldn't be needing the
        test-&gt;priv, but neither should we need to pass the device
        here, right?</li>
    </ul>
    <p>/Thomas</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20230316064643.fu5thzu4pf7htisq@ldmartin-desk2.lan">
      <br>
      Lucas De Marchi
      <br>
      <br>
      <blockquote type="cite">
        <br>
        If you have better suggestions, then you're welcomed
        <br>
        <br>
        <blockquote type="cite">
          <br>
          <blockquote type="cite">+    depends on DRM_XE &amp;&amp;
            KUNIT &amp;&amp; EXPERT
            <br>
            +    default n
            <br>
            +    help
            <br>
            +        Choose this option to allow the driver to perform
            live
            <br>
            +        selftests based on the Kunit framework.
            <br>
            +
            <br>
            +        Recommended for driver developers only.
            <br>
            +        If in doubt, say "N".
            <br>
            +
            <br>
            config DRM_XE_KUNIT_TEST
            <br>
                    tristate "KUnit tests for the drm xe driver" if
            !KUNIT_ALL_TESTS
            <br>
                depends on DRM_XE &amp;&amp; KUNIT &amp;&amp; DEBUG_FS
            <br>
            diff --git a/drivers/gpu/drm/xe/Makefile
            b/drivers/gpu/drm/xe/Makefile
            <br>
            index b94e65c91101..b193af2d9930 100644
            <br>
            --- a/drivers/gpu/drm/xe/Makefile
            <br>
            +++ b/drivers/gpu/drm/xe/Makefile
            <br>
            @@ -211,6 +211,17 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
            <br>
                xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
            <br>
            endif
            <br>
            <br>
            +xe-$(CONFIG_DRM_XE_SELFTESTS_MOCK) += \
            <br>
            +    selftests/xe_selftests_mock.o \
            <br>
            +
            <br>
            +xe-$(CONFIG_DRM_XE_SELFTESTS_LIVE) += \
            <br>
            +    selftests/xe_selftests_auto.o \
            <br>
            +    selftests/xe_selftests_executor.o \
            <br>
            +    selftests/xe_selftests_params.o \
            <br>
            +
            <br>
            +xe-$(CONFIG_KUNIT) += \
            <br>
            +    selftests/xe_selftests_helpers.o \
            <br>
            +
            <br>
            obj-$(CONFIG_DRM_XE) += xe.o
            <br>
            obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
            <br>
            <br>
            diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests.h
            <br>
            b/drivers/gpu/drm/xe/selftests/xe_selftests.h
            <br>
            new file mode 100644
            <br>
            index 000000000000..6b13b998e789
            <br>
            --- /dev/null
            <br>
            +++ b/drivers/gpu/drm/xe/selftests/xe_selftests.h
            <br>
            @@ -0,0 +1,35 @@
            <br>
            +/* SPDX-License-Identifier: MIT */
            <br>
            +/*
            <br>
            + * Copyright © 2023 Intel Corporation
            <br>
            + */
            <br>
            +
            <br>
            +#ifndef _XE_SELFTESTS_H_
            <br>
            +#define _XE_SELFTESTS_H_
            <br>
            +
            <br>
            +struct kunit_suite;
            <br>
            +struct kunit;
            <br>
            +
            <br>
            +int xe_selftests_run(const char *dev_name);
            <br>
            +
            <br>
            +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
            <br>
            +int init_xe_live_selftest_suite(struct kunit_suite *suite);
            <br>
            +#endif
            <br>
            +
            <br>
            +int init_xe_device_selftest(struct kunit *test);
            <br>
            +void exit_xe_device_selftest(struct kunit *test);
            <br>
            +
            <br>
            +int init_xe_gt_selftest(struct kunit *test);
            <br>
            +void exit_xe_gt_selftest(struct kunit *test);
            <br>
            +
            <br>
            +int init_xe_guc_selftest(struct kunit *test);
            <br>
            +void exit_xe_guc_selftest(struct kunit *test);
            <br>
            +
            <br>
            +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
            <br>
            +int xe_selftests_module_init(void);
            <br>
            +void xe_selftests_module_exit(void);
            <br>
            +#else
            <br>
            +static inline int xe_selftests_module_init(void) { return
            0; }
            <br>
            +static inline void xe_selftests_module_exit(void) { }
            <br>
            +#endif
            <br>
            +
            <br>
            +#endif /* _XE_SELFTESTS_H_ */
            <br>
            diff --git
            a/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
            <br>
            b/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
            <br>
            new file mode 100644
            <br>
            index 000000000000..ef98f3599eac
            <br>
            --- /dev/null
            <br>
            +++ b/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
            <br>
            @@ -0,0 +1,46 @@
            <br>
            +// SPDX-License-Identifier: MIT
            <br>
            +/*
            <br>
            + * Copyright © 2023 Intel Corporation
            <br>
            + */
            <br>
            +
            <br>
            +#include &lt;linux/device.h&gt;
            <br>
            +#include &lt;linux/glob.h&gt;
            <br>
            +#include &lt;linux/pci.h&gt;
            <br>
            +
            <br>
            +#include "xe_drv.h"
            <br>
            +#include "selftests/xe_selftests.h"
            <br>
            +#include "selftests/xe_selftests_internal.h"
            <br>
            +
            <br>
            +static int bus_cb(struct notifier_block *nb, unsigned long
            action,
            <br>
            void *data)
            <br>
            +{
            <br>
            +    struct device *dev = data;
            <br>
            +    struct device_driver *drv = dev-&gt;driver;
            <br>
            +
            <br>
            +    if (action != BUS_NOTIFY_BOUND_DRIVER)
            <br>
            +        return 0;
            <br>
            +
            <br>
            +    if (strcmp(DRIVER_NAME, drv-&gt;name))
            <br>
            +        return 0;
            <br>
            +
            <br>
            +    /* only matching DUT names will be tested */
            <br>
            +    if (!dut_filter || !glob_match(dut_filter,
            dev_name(dev)))
            <br>
          </blockquote>
          <br>
          "DUT" name could be avoided and just use what exactly it
          means.
          <br>
          When I see "DUT" I'm wondering... is this the platform name,
          the pci ID,
          <br>
          the pci slot, the device node?
          <br>
        </blockquote>
        <br>
        will rename to "dut_name_filter" do the trick ?
        <br>
        <br>
        or do you want to drop "dut" completely and have
        "device_name_filter" ?
        <br>
        but then we would need to add "selftest" or similar word
        somewhere to
        <br>
        give context and then full modparam name will no longer be that
        friendly
        <br>
        <br>
        Thanks,
        <br>
        Michal
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------jDJ7xc3GtaobmKAC7vSaVAW8--
