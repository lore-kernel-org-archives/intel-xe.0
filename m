Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DFCC6FD19
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 12:45:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6DF10E0E0;
	Mon, 13 Mar 2023 12:45:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65B010E0E0
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 12:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678711542; x=1710247542;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g8Q2VME4dIf2+0WDKVUJLXKaBIO7d4N17pO+AncnKWw=;
 b=i4LLafb3rN8ddXVgE2ci4r+BqRHaLlkWr8+fcuiw5ZILTEqfSYE1MQN3
 wzaM0tLt1L0gW0X9PR5gJmZzBmMiUX9h6qgZfDwdxFRCW05ptbG//lcxQ
 pllCpnLvWHhZnmbnSXbnsUAJT9Kq6lgHhZlpSWi6GVvfYuwZzkSaUrk75
 6Qr6mNLqbwZS/bnzJLjAf3k7nmtkiJaIn7aFC41dh/4mhnVFtwAfOvoed
 nEvVoMHZRBMz6BaIVUmjc/Bnq3+ROSB6hdVpuHJQ9bue0myqlw2wW+fjj
 D1yHb4Q6U9JPeS6snpsnI5n1rGXDS7DTqI5bCfFMHs8UCLkMbhPSDDpYQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="423401003"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="423401003"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="747598116"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="747598116"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2023 05:45:42 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.24.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4A4AF5807A3;
 Mon, 13 Mar 2023 05:45:41 -0700 (PDT)
Date: Mon, 13 Mar 2023 13:45:38 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20230313134538.47da434b@maurocar-mobl2>
In-Reply-To: <20230313081316.2408-2-michal.wajdeczko@intel.com>
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
 <20230313081316.2408-2-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 13 Mar 2023 09:13:12 +0100
Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:

> Our initial attempt to run Kunit based tests on live devices is hard
> to use and will not work well with multiple devices attached.
>=20
> Instead of relying on separate test module and duplicating support
> for multiple live devices in every test entry point, create new set
> of helpers and use test->priv to pass reference of the device under
> test (DUT) directly to every test function.
>=20
> The same use pattern is supported for both mock and live selftests.
>=20
> By using bus_notifier we can start testing each new bound device
> separatelly, subject to filtering using dut_filter modparam.
>=20
> All test cases can be included directly from .c file, allowing test
> code to access and use any private functions.
>=20
> As Kunit will attempt to run all suites on module load, including
> our new live test suites, we may want to allow to execute them on
> any available device. This is controlled by anonymous_dut modparam.
>=20
> Support for either mock or live selftests, only one at time, is
> controlled by new Kconfig options.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.debug              |  22 ++++
>  drivers/gpu/drm/xe/Makefile                   |  11 ++
>  drivers/gpu/drm/xe/selftests/xe_selftests.h   |  35 ++++++
>  .../gpu/drm/xe/selftests/xe_selftests_auto.c  |  46 +++++++
>  .../drm/xe/selftests/xe_selftests_executor.c  | 118 ++++++++++++++++++
>  .../drm/xe/selftests/xe_selftests_helpers.c   | 101 +++++++++++++++
>  .../drm/xe/selftests/xe_selftests_internal.h  |  22 ++++
>  .../gpu/drm/xe/selftests/xe_selftests_mock.c  |  32 +++++
>  .../drm/xe/selftests/xe_selftests_params.c    |  23 ++++
>  drivers/gpu/drm/xe/xe_module.c                |   2 +
>  10 files changed, 412 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests.h
>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
>  create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_params.c
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfi=
g.debug
> index 93b284cdd0a2..aeba43977dca 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -61,6 +61,28 @@ config DRM_XE_SIMPLE_ERROR_CAPTURE
> =20
>  	  If in doubt, say "N".
> =20
> +config DRM_XE_SELFTESTS_MOCK
> +	bool "Mock selftests for Xe" if !KUNIT_ALL_TESTS
> +	depends on DRM_XE && KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +		Choose this option to allow the driver to perform mock
> +		selftests based on the Kunit framework.
> +
> +		Recommended for driver developers only.
> +		If in doubt, say "N".
> +
> +config DRM_XE_SELFTESTS_LIVE
> +	bool "Live selftests for Xe" if !DRM_XE_SELFTESTS_MOCK
> +	depends on DRM_XE && KUNIT && EXPERT
> +	default n
> +	help
> +		Choose this option to allow the driver to perform live
> +		selftests based on the Kunit framework.
> +
> +		Recommended for driver developers only.
> +		If in doubt, say "N".
> +
>  config DRM_XE_KUNIT_TEST
>          tristate "KUnit tests for the drm xe driver" if !KUNIT_ALL_TESTS
>  	depends on DRM_XE && KUNIT && DEBUG_FS
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b94e65c91101..b193af2d9930 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -211,6 +211,17 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
>  	xe-$(CONFIG_DRM_XE_DISPLAY) +=3D display/intel_fbdev.o
>  endif
> =20
> +xe-$(CONFIG_DRM_XE_SELFTESTS_MOCK) +=3D \
> +	selftests/xe_selftests_mock.o \
> +
> +xe-$(CONFIG_DRM_XE_SELFTESTS_LIVE) +=3D \
> +	selftests/xe_selftests_auto.o \
> +	selftests/xe_selftests_executor.o \
> +	selftests/xe_selftests_params.o \
> +
> +xe-$(CONFIG_KUNIT) +=3D \
> +	selftests/xe_selftests_helpers.o \
> +
>  obj-$(CONFIG_DRM_XE) +=3D xe.o
>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) +=3D tests/
> =20
> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests.h b/drivers/gpu/dr=
m/xe/selftests/xe_selftests.h
> new file mode 100644
> index 000000000000..6b13b998e789
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_SELFTESTS_H_
> +#define _XE_SELFTESTS_H_
> +
> +struct kunit_suite;
> +struct kunit;
> +
> +int xe_selftests_run(const char *dev_name);
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
> +int init_xe_live_selftest_suite(struct kunit_suite *suite);
> +#endif
> +
> +int init_xe_device_selftest(struct kunit *test);
> +void exit_xe_device_selftest(struct kunit *test);
> +
> +int init_xe_gt_selftest(struct kunit *test);
> +void exit_xe_gt_selftest(struct kunit *test);
> +
> +int init_xe_guc_selftest(struct kunit *test);
> +void exit_xe_guc_selftest(struct kunit *test);
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
> +int xe_selftests_module_init(void);
> +void xe_selftests_module_exit(void);
> +#else
> +static inline int xe_selftests_module_init(void) { return 0; }
> +static inline void xe_selftests_module_exit(void) { }
> +#endif
> +
> +#endif /* _XE_SELFTESTS_H_ */
> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c b/drivers/g=
pu/drm/xe/selftests/xe_selftests_auto.c
> new file mode 100644
> index 000000000000..ef98f3599eac
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#include <linux/device.h>
> +#include <linux/glob.h>
> +#include <linux/pci.h>
> +
> +#include "xe_drv.h"
> +#include "selftests/xe_selftests.h"
> +#include "selftests/xe_selftests_internal.h"
> +
> +static int bus_cb(struct notifier_block *nb, unsigned long action, void =
*data)
> +{
> +	struct device *dev =3D data;
> +	struct device_driver *drv =3D dev->driver;
> +
> +	if (action !=3D BUS_NOTIFY_BOUND_DRIVER)
> +		return 0;
> +
> +	if (strcmp(DRIVER_NAME, drv->name))
> +		return 0;
> +
> +	/* only matching DUT names will be tested */
> +	if (!dut_filter || !glob_match(dut_filter, dev_name(dev)))
> +		return 0;
> +
> +	xe_selftests_run(dev_name(dev));
> +
> +	return 0;
> +}
> +
> +static struct notifier_block nb =3D {
> +	.notifier_call =3D bus_cb,
> +};
> +
> +int xe_selftests_module_init(void)
> +{
> +	return bus_register_notifier(&pci_bus_type, &nb);
> +}
> +
> +void xe_selftests_module_exit(void)
> +{
> +	bus_unregister_notifier(&pci_bus_type, &nb);
> +}
> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_executor.c b/drive=
rs/gpu/drm/xe/selftests/xe_selftests_executor.c
> new file mode 100644
> index 000000000000..93c3360c9631
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#include <linux/glob.h>
> +#include <kunit/test.h>
> +
> +#include "xe_device.h"
> +#include "xe_drv.h"
> +
> +#include "selftests/xe_selftests.h"
> +#include "selftests/xe_selftests_internal.h"
> +
> +#define DUT_NAME_LEN 32
> +static char dut_name[DUT_NAME_LEN];
> +
> +/* protects @dut_name during live test execution */
> +static DEFINE_MUTEX(dut_mutex);
> +
> +static int match_dev_any(struct device *dev, const void *data)
> +{
> +	return 1;
> +}
> +
> +static int match_dev_by_name(struct device *dev, const void *data)
> +{
> +	const char *name =3D data;
> +	return !strcmp(dev_name(dev), name);
> +}
> +
> +struct xe_device *get_xe_dut(void)
> +{
> +	struct device_driver *drv;
> +	struct device *dev;
> +
> +	if (!anonymous_dut && !mutex_is_locked(&dut_mutex))
> +		return ERR_PTR(-ENOTTY);

Hmm... I guess EBUSY would fit better here.

> +
> +	drv =3D driver_find(DRIVER_NAME, &pci_bus_type);
> +	dev =3D driver_find_device(drv, NULL, dut_name,
> +				 mutex_is_locked(&dut_mutex) ? match_dev_by_name : match_dev_any);
> +	if (!dev)
> +		return ERR_PTR(-ENODEV);
> +
> +	return to_xe_device(dev_get_drvdata(dev));
> +}
> +
> +void put_xe_dut(struct xe_device *xe)
> +{
> +	put_device(xe->drm.dev);
> +}
> +
> +static int run_test_suites(struct xe_device *xe)
> +{
> +	struct device *dev =3D xe->drm.dev;
> +	struct device_driver *drv =3D dev->driver;
> +	struct module *mod =3D drv->owner;
> +	struct kunit_suite **suites =3D mod->kunit_suites;
> +	int num_suites =3D mod->num_kunit_suites;
> +	int i;
> +
> +	pr_info("TAP version 14\n");

It doesn't seem nice to hardcode it here. IMO, this should be in sync
with lib/kunit/executor.c.

Maybe the way to go would be to add, at kunit/test.h:

#define TAP_VERSION	"TAP version 14\n"

And use such macro on both lib/kunit/executor.c and here.

We need to c/c kunit maintainers on such patch.

IMO, a better approach would be to modify lib/kunit/executor.c, adding
there a variant of kunit_run_all_tests() to be used with a custom
filter list, e. g.:

	kunit_run_filtered_tests(struct suite_set *suite_set, (int *)filter_test(s=
truct suite_set *suite_set))=20

And then calling it at xe_selftests_executor.c.

> +	pr_info("1..%u\n", num_suites);
> +
> +	/* reset kunit_suite_counter at the start */
> +	__kunit_test_suites_exit(NULL, 0);
> +
> +	for (i =3D 0; i < num_suites; i++) {
> +		kunit_run_tests(suites[i]);
> +	}
> +
> +	/* reset kunit_suite_counter at the end */
> +	__kunit_test_suites_exit(NULL, 0);
> +
> +	return num_suites;
> +}

Regards,
Mauro
