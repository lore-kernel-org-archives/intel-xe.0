Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C73FC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 16:11:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484F210E916;
	Thu,  7 Dec 2023 16:11:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED0C10E916
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701965474; x=1733501474;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K3O2A5bmAl/8M1X+pO6bbi/p0toOSrOX8g6A74rVDdE=;
 b=S4y5aY0UVI5/IXKKkjTIXDXfMewA/lOi+8qyJauERBLnFWItz/R3Kyrl
 CZU6r2j0QNw8Q8p0Nbk4sHfcHl+uMzAW9BKf9XnCuULJHLvbJc49NvZg1
 th87GHsMKfuHuzvpPLlD1A31iWw/i16M3wU0Ef37+S5tQkzk0rwDyuz3f
 o6ayGJkbtiL+Gr+ZrpE8y7AeGYlNb3EM1b6gyeQwMROsZ4/sf5frkDm8G
 2Mbhy/ifgIakNbKml1Pr9fvADvcQAnkwCYXcvWAJIptAvCeoLSE/8iJPC
 uUHNxEe6/MpnUGkFJaFCnSXaGKE/v+wVJkdzg46TMEfAgQiehPqi5cKPB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="393994410"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="393994410"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 08:11:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895197571"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="895197571"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 08:11:13 -0800
Received: from maurocar-mobl2 (unknown [10.246.32.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id EB992580201;
 Thu,  7 Dec 2023 08:11:12 -0800 (PST)
Date: Thu, 7 Dec 2023 17:11:10 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Group normal kunit tests in a
 single module
Message-ID: <20231207171110.67073e33@maurocar-mobl2>
In-Reply-To: <20231122203147.988021-2-lucas.demarchi@intel.com>
References: <20231122203147.988021-1-lucas.demarchi@intel.com>
 <20231122203147.988021-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 22 Nov 2023 12:31:46 -0800
Lucas De Marchi <lucas.demarchi@intel.com> wrote:

> Creating one module for each compilation unit to be tested seems
> excessive as the number of tests increase. Group them all in a single
> kunit test module called xe_test.ko.
>=20
> The tests requiring the physical device, aka "live" tests, are still
> kept in separate modules since they are normally triggered via igt,
> and not via kunit.py. After igt is converted, those can be merged in
> a single module as well.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/Makefile      |  7 ++++++-
>  drivers/gpu/drm/xe/tests/xe_pci_test.c |  5 -----
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  5 -----
>  drivers/gpu/drm/xe/tests/xe_test_mod.c | 10 ++++++++++
>  drivers/gpu/drm/xe/tests/xe_wa_test.c  |  5 -----
>  5 files changed, 16 insertions(+), 16 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_test_mod.c
>=20
> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests=
/Makefile
> index 39d8a0892274..9d1d88af8b2f 100644
> --- a/drivers/gpu/drm/xe/tests/Makefile
> +++ b/drivers/gpu/drm/xe/tests/Makefile
> @@ -1,10 +1,15 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
> +# "live" kunit tests
>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) +=3D \
>  	xe_bo_test.o \
>  	xe_dma_buf_test.o \
>  	xe_migrate_test.o \
> -	xe_mocs_test.o \
> +	xe_mocs_test.o
> +
> +# Normal kunit tests
> +obj-$(CONFIG_DRM_XE_KUNIT_TEST) +=3D xe_test.o
> +xe_test-y =3D xe_test_mod.o \
>  	xe_pci_test.o \
>  	xe_rtp_test.o \
>  	xe_wa_test.o
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/=
tests/xe_pci_test.c
> index daf652517608..59e29a148478 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
> @@ -67,8 +67,3 @@ static struct kunit_suite xe_pci_test_suite =3D {
>  };
> =20
>  kunit_test_suite(xe_pci_test_suite);
> -
> -MODULE_AUTHOR("Intel Corporation");
> -MODULE_LICENSE("GPL");
> -MODULE_DESCRIPTION("xe_pci kunit test");
> -MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/=
tests/xe_rtp_test.c
> index a1d204133cc1..83b0ba097a3e 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -310,8 +310,3 @@ static struct kunit_suite xe_rtp_test_suite =3D {
>  };
> =20
>  kunit_test_suite(xe_rtp_test_suite);
> -
> -MODULE_AUTHOR("Intel Corporation");
> -MODULE_LICENSE("GPL");
> -MODULE_DESCRIPTION("xe_rtp kunit test");
> -MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> diff --git a/drivers/gpu/drm/xe/tests/xe_test_mod.c b/drivers/gpu/drm/xe/=
tests/xe_test_mod.c
> new file mode 100644
> index 000000000000..875f3e6f965e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_test_mod.c
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +#include <linux/module.h>
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("xe kunit tests");
> +MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/t=
ests/xe_wa_test.c
> index 01ea974591ea..4eb8e1e8a76c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> @@ -135,8 +135,3 @@ static struct kunit_suite xe_rtp_test_suite =3D {
>  };
> =20
>  kunit_test_suite(xe_rtp_test_suite);
> -
> -MODULE_AUTHOR("Intel Corporation");
> -MODULE_LICENSE("GPL");
> -MODULE_DESCRIPTION("xe_wa kunit test");
> -MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);

AFAIKT, if you want to have multiple test groups at the same file,
you should use, instead, a different macro, pointing to all
test suites that will belong to the module, e. g.:

kunit_test_suites(
	&xe_pci_test_suite,
	...
	&xe_rtp_test_suite);

Regards,
Mauro

