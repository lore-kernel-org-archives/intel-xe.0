Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851CEC6FD19
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 17:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475E210E5D2;
	Mon, 13 Mar 2023 17:22:26 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BE810E5D6
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678728144; x=1710264144;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=m2Dn41oeT1XYl5XT+AOdcHH/eFnPOWuFro6PfYkQJPg=;
 b=ZsW8nTnBRLG4O4ZJxYCJ/azZkj1La9r+nupJBrRFqhOwepkD/c/WApNy
 Ng8D5rC5rnQ46fZuYf8VbfpR8qz9bXB+9aznmSdmJ2DGFFKlDDcm3foDj
 F0uelFhX1LAS45MLlwzhqVSDT3DXNAhUR2nOOVRfW4fDbxvjzA1RP9LXC
 eopPuXiIVs9uywp16FMD4psLfRhZ+FDxcVWuDiS0QDxYyNQWFVWAitICm
 oSz2RD0Gner1nbnnMNiPAeGu09vGio2MYP0bBFh72Cbv0BiXYg8OZh+j4
 OFeD8TAvaCuPKm2m9ICnuUcPrIB64s6ur+B8aj0erRWHGgni/zIzrFHny w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="325572669"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="325572669"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 10:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789001852"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="789001852"
Received: from binsumax-mobl.gar.corp.intel.com (HELO [10.249.254.198])
 ([10.249.254.198])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 10:22:21 -0700
Message-ID: <994675861f22406bacb92a9f85ac39518d66c51d.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 18:22:18 +0100
In-Reply-To: <20230313081316.2408-2-michal.wajdeczko@intel.com>
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
 <20230313081316.2408-2-michal.wajdeczko@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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

Hi, Michal,

Some comments below. I don't have time for an in-depth review today,
but As a general comment, I don't think we should have multiple
infrastructures for live Kunit selftests, so if we're adopting this, we
should port the existing ones over.

On Mon, 2023-03-13 at 09:13 +0100, Michal Wajdeczko wrote:
> Our initial attempt to run Kunit based tests on live devices is hard
> to use and will not work well with multiple devices attached.
>=20
> Instead of relying on separate test module and duplicating support
> for multiple live devices in every test entry point, create new set
> of helpers and use test->priv to pass reference of the device under
> test (DUT) directly to every test function.

Could this be passed directly as a parameter instead? I think the
test->priv parameter is intended for and very useful to pass
parameters used by code to provoke test-specific behaviour (see for
example our dma-buf kunit test). That would BTW be a good live test to
port over to see if it could be made to work with this new framework.


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

What would it take with this infrastructure to be able to run both
mock- and live without recompiling on an already loaded module? I think
that's very convenient.



>=20
> Support for either mock or live selftests, only one at time, is
> controlled by new Kconfig options.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Thanks,
thomas


> ---
> =C2=A0drivers/gpu/drm/xe/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 22 ++++
> =C2=A0drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 11 ++
> =C2=A0drivers/gpu/drm/xe/selftests/xe_selftests.h=C2=A0=C2=A0 |=C2=A0 35 =
++++++
> =C2=A0.../gpu/drm/xe/selftests/xe_selftests_auto.c=C2=A0 |=C2=A0 46 +++++=
++
> =C2=A0.../drm/xe/selftests/xe_selftests_executor.c=C2=A0 | 118
> ++++++++++++++++++
> =C2=A0.../drm/xe/selftests/xe_selftests_helpers.c=C2=A0=C2=A0 | 101 +++++=
++++++++++
> =C2=A0.../drm/xe/selftests/xe_selftests_internal.h=C2=A0 |=C2=A0 22 ++++
> =C2=A0.../gpu/drm/xe/selftests/xe_selftests_mock.c=C2=A0 |=C2=A0 32 +++++
> =C2=A0.../drm/xe/selftests/xe_selftests_params.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 23 ++++
> =C2=A0drivers/gpu/drm/xe/xe_module.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A010 files changed, 412 insertions(+)
> =C2=A0create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests.h
> =C2=A0create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
> =C2=A0create mode 100644
> drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
> =C2=A0create mode 100644
> drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
> =C2=A0create mode 100644
> drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
> =C2=A0create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
> =C2=A0create mode 100644
> drivers/gpu/drm/xe/selftests/xe_selftests_params.c
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug
> b/drivers/gpu/drm/xe/Kconfig.debug
> index 93b284cdd0a2..aeba43977dca 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -61,6 +61,28 @@ config DRM_XE_SIMPLE_ERROR_CAPTURE
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If in doubt, say "=
N".
> =C2=A0
> +config DRM_XE_SELFTESTS_MOCK
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool "Mock selftests for Xe" i=
f !KUNIT_ALL_TESTS
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on DRM_XE && KUNIT
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default KUNIT_ALL_TESTS
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0Choose this option to allow the driver to perform
> mock
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0selftests based on the Kunit framework.
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0Recommended for driver developers only.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0If in doubt, say "N".
> +
> +config DRM_XE_SELFTESTS_LIVE
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool "Live selftests for Xe" i=
f !DRM_XE_SELFTESTS_MOCK
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on DRM_XE && KUNIT && =
EXPERT
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default n
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0Choose this option to allow the driver to perform
> live
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0selftests based on the Kunit framework.
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0Recommended for driver developers only.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0If in doubt, say "N".
> +
> =C2=A0config DRM_XE_KUNIT_TEST
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "KUnit tests fo=
r the drm xe driver" if
> !KUNIT_ALL_TESTS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on DRM_XE && KUNI=
T && DEBUG_FS
> diff --git a/drivers/gpu/drm/xe/Makefile
> b/drivers/gpu/drm/xe/Makefile
> index b94e65c91101..b193af2d9930 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -211,6 +211,17 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe-$(CONFIG_DRM_XE_DISPLA=
Y) +=3D display/intel_fbdev.o
> =C2=A0endif
> =C2=A0
> +xe-$(CONFIG_DRM_XE_SELFTESTS_MOCK) +=3D \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0selftests/xe_selftests_mock.o =
\
> +
> +xe-$(CONFIG_DRM_XE_SELFTESTS_LIVE) +=3D \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0selftests/xe_selftests_auto.o =
\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0selftests/xe_selftests_executo=
r.o \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0selftests/xe_selftests_params.=
o \
> +
> +xe-$(CONFIG_KUNIT) +=3D \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0selftests/xe_selftests_helpers=
.o \
> +
> =C2=A0obj-$(CONFIG_DRM_XE) +=3D xe.o
> =C2=A0obj-$(CONFIG_DRM_XE_KUNIT_TEST) +=3D tests/
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests.h
> b/drivers/gpu/drm/xe/selftests/xe_selftests.h
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
> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
> b/drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
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
> +static int bus_cb(struct notifier_block *nb, unsigned long action,
> void *data)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device *dev =3D data;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_driver *drv =3D =
dev->driver;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (action !=3D BUS_NOTIFY_BOU=
ND_DRIVER)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return 0;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (strcmp(DRIVER_NAME, drv->n=
ame))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return 0;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* only matching DUT names wil=
l be tested */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!dut_filter || !glob_match=
(dut_filter, dev_name(dev)))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return 0;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe_selftests_run(dev_name(dev)=
);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> +}
> +
> +static struct notifier_block nb =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.notifier_call =3D bus_cb,
> +};
> +
> +int xe_selftests_module_init(void)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return bus_register_notifier(&=
pci_bus_type, &nb);
> +}
> +
> +void xe_selftests_module_exit(void)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bus_unregister_notifier(&pci_b=
us_type, &nb);
> +}
> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
> b/drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
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
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 1;
> +}
> +
> +static int match_dev_by_name(struct device *dev, const void *data)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *name =3D data;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return !strcmp(dev_name(dev), =
name);
> +}
> +
> +struct xe_device *get_xe_dut(void)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_driver *drv;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device *dev;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!anonymous_dut && !mutex_i=
s_locked(&dut_mutex))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return ERR_PTR(-ENOTTY);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drv =3D driver_find(DRIVER_NAM=
E, &pci_bus_type);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev =3D driver_find_device(drv=
, NULL, dut_name,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_is_locked(&dut_mutex) ?
> match_dev_by_name : match_dev_any);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!dev)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return ERR_PTR(-ENODEV);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return to_xe_device(dev_get_dr=
vdata(dev));
> +}
> +
> +void put_xe_dut(struct xe_device *xe)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0put_device(xe->drm.dev);
> +}
> +
> +static int run_test_suites(struct xe_device *xe)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device *dev =3D xe->drm=
.dev;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_driver *drv =3D =
dev->driver;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct module *mod =3D drv->ow=
ner;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct kunit_suite **suites =
=3D mod->kunit_suites;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int num_suites =3D mod->num_ku=
nit_suites;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_info("TAP version 14\n");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_info("1..%u\n", num_suites)=
;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* reset kunit_suite_counter a=
t the start */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__kunit_test_suites_exit(NULL,=
 0);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < num_suites; =
i++) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0kunit_run_tests(suites[i]);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* reset kunit_suite_counter a=
t the end */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__kunit_test_suites_exit(NULL,=
 0);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return num_suites;
> +}
> +
> +/**
> + * xe_selftests_run - Run selftests on selected device
> + * @dev_name: The device name on which selftests should be run
> + *
> + * This function starts Kunit suites with live selftests on selected
> + * device (DUT).
> + *
> + * Return: 0 on success,
> + *=C2=A0=C2=A0 -EINVAL if no device name was provided,
> + *=C2=A0=C2=A0 -EBUSY if tests are already running,
> + *=C2=A0=C2=A0 -ENODEV if device was not found
> + *=C2=A0=C2=A0 or any other negative error code on failure.
> + */
> +int xe_selftests_run(const char *dev_name)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_device *xe;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!dev_name)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return -EINVAL;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!mutex_trylock(&dut_mutex)=
)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return -EBUSY;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0strscpy(dut_name, dev_name, si=
zeof(dut_name));
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe =3D get_xe_dut();
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(xe)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0ret =3D PTR_ERR(xe);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0goto cleanup;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D run_test_suites(xe);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0put_xe_dut(xe);
> +
> +cleanup:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0strscpy(dut_name, "", sizeof(d=
ut_name));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&dut_mutex);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
> b/drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
> new file mode 100644
> index 000000000000..837d28871686
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#include <linux/mutex.h>
> +
> +#include <kunit/test.h>
> +
> +#include "xe_device.h"
> +#include "selftests/xe_selftests_internal.h"
> +
> +static struct xe_device *__get_xe(void)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_device *xe =3D ERR_P=
TR(-ENOTTY);
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_MOCK)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe =3D get_xe_mock();
> +#elif IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe =3D get_xe_dut();
> +#endif
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return xe;
> +}
> +
> +static void __put_xe(struct xe_device *xe)
> +{
> +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_MOCK)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0put_xe_mock(xe);
> +#elif IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0put_xe_dut(xe);
> +#endif
> +}
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
> +int init_xe_live_selftest_suite(struct kunit_suite *suite)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_device *xe =3D get_x=
e_dut();
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(xe))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return PTR_ERR(xe);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kunit_info(suite, "DUT %s", de=
v_name(xe->drm.dev));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0put_xe_dut(xe);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> +}
> +#endif
> +
> +int init_xe_device_selftest(struct kunit *test)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_device *xe =3D __get=
_xe();
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(xe))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return PTR_ERR(xe);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0test->priv =3D xe;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> +}
> +
> +void exit_xe_device_selftest(struct kunit *test)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_device *xe =3D test-=
>priv;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__put_xe(xe);
> +}
> +
> +int init_xe_gt_selftest(struct kunit *test)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_device *xe =3D __get=
_xe();
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(xe))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return PTR_ERR(xe);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0test->priv =3D to_gt(xe);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> +}
> +
> +void exit_xe_gt_selftest(struct kunit *test)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_gt *gt =3D test->pri=
v;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__put_xe(gt->xe);
> +}
> +
> +int init_xe_guc_selftest(struct kunit *test)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_device *xe =3D __get=
_xe();
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(xe))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return PTR_ERR(xe);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0test->priv =3D &to_gt(xe)->uc.=
guc;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> +}
> +
> +void exit_xe_guc_selftest(struct kunit *test)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_guc *guc =3D test->p=
riv;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_gt *gt =3D container=
_of(guc, struct xe_gt, uc.guc);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__put_xe(gt->xe);
> +}
> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
> b/drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
> new file mode 100644
> index 000000000000..841c1a497eed
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_SELFTEST_INTERNAL_H_
> +#define _XE_SELFTEST_INTERNAL_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +extern char *dut_filter;
> +extern bool anonymous_dut;
> +
> +struct xe_device *get_xe_dut(void);
> +void put_xe_dut(struct xe_device *xe);
> +
> +struct xe_device *get_xe_mock(void);
> +void put_xe_mock(struct xe_device *xe);
> +
> +#endif /* _XE_SELFTEST_INTERNAL_H_ */
> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
> b/drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
> new file mode 100644
> index 000000000000..c1515e451e99
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#include "xe_device_types.h"
> +
> +#define MOCK_DEV_NAME "MOCK:DEBUG.0"
> +static struct device __mock_device =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.init_name =3D MOCK_DEV_NAME,
> +};
> +
> +struct xe_device *get_xe_mock(void)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_device *xe =3D kzall=
oc(sizeof(*xe), GFP_KERNEL);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!xe)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return ERR_PTR(-ENOMEM);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe->drm.dev =3D &__mock_device=
;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe->gt[0].info.id =3D 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe->gt[0].info.type =3D XE_GT_=
TYPE_MAIN;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xe->gt[0].xe =3D xe;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return xe;
> +}
> +
> +void put_xe_mock(struct xe_device *xe)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(xe);
> +}
> diff --git a/drivers/gpu/drm/xe/selftests/xe_selftests_params.c
> b/drivers/gpu/drm/xe/selftests/xe_selftests_params.c
> new file mode 100644
> index 000000000000..e6e28cc91901
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/selftests/xe_selftests_params.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#include <linux/module.h>
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
> +
> +char *dut_filter;
> +module_param_named(dut_filter, dut_filter, charp, 0644);
> +MODULE_PARM_DESC(dut_filter,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "The pattern of the names of devices on which we
> want to run tests automatically. "
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "If <none> is specified (default) then no devices
> will be tested automatically. "
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "If '*' is specified then all new bound devices will
> be tested.\n");
> +
> +bool anonymous_dut;
> +module_param_named(anonymous_dut, anonymous_dut, bool, 0600);
> +MODULE_PARM_DESC(anonymous_dut,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "Enables selftests to be run without providing
> explicit DUT name (like during "
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "selftests execution triggered by the Kunit module
> notifier). Default is off.\n");
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_module.c
> b/drivers/gpu/drm/xe/xe_module.c
> index 6860586ce7f8..f76d69f7f5ad 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -13,6 +13,7 @@
> =C2=A0#include "xe_module.h"
> =C2=A0#include "xe_pci.h"
> =C2=A0#include "xe_sched_job.h"
> +#include "selftests/xe_selftests.h"
> =C2=A0
> =C2=A0bool enable_guc =3D true;
> =C2=A0module_param_named_unsafe(enable_guc, enable_guc, bool, 0444);
> @@ -45,6 +46,7 @@ struct init_funcs {
> =C2=A0static const struct init_funcs init_funcs[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MAKE_INIT_EXIT_FUNCS(hw_f=
ence),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MAKE_INIT_EXIT_FUNCS(sche=
d_job),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MAKE_INIT_EXIT_FUNCS(selftests=
),
> =C2=A0};
> =C2=A0
> =C2=A0static int __init xe_init(void)

