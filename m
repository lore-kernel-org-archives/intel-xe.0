Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE91C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 19:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF3810E65B;
	Wed, 29 Nov 2023 19:29:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0E010E65B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 19:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701286161; x=1732822161;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ZXNI4uf53q6kWQe7LyhJhvlGsOjn58Q9aGQsFrhVgQg=;
 b=HVetxlnuO9Xhq7odymDZQQCwph+7gAFkxQnM+4+mQ3GcZOBirU5GIRQ/
 hgjORi4qY7xwtXswFq6TjM1YF8AZeEO9YFLfM3OW44yZI0YwDhO/caY3r
 kwtDTvyTO+EVDQsRr6iZoOw8spy69heAs2ufGdSWKQ4g9yacdUGxyONqi
 /cFZrTrNdmlPsLm24CWA9X4lbAlSVHkmp4WOWCwCphGWV/BQg3eJECNFU
 2ruLQVpNGQPBWBVV+4srQPCDCqJyXS1aNA+COvlwwKcnlnnt2dmthZDcH
 U2PHTrXS2PA3Kz4Ti7me6VfJeBJeeXf1AnXXiR99tRI2x06BTC4ID599o Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="392959684"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="392959684"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 11:29:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="17117918"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 29 Nov 2023 11:29:19 -0800
Received: from [10.249.141.99] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.141.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 58F013682F;
 Wed, 29 Nov 2023 19:29:15 +0000 (GMT)
Message-ID: <5f30eefb-c37d-48ee-8dd4-4533dde55790@intel.com>
Date: Wed, 29 Nov 2023 20:29:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
References: <20231122203147.988021-1-lucas.demarchi@intel.com>
 <20231122203147.988021-2-lucas.demarchi@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231122203147.988021-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Group normal kunit tests in a
 single module
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



On 22.11.2023 21:31, Lucas De Marchi wrote:
> Creating one module for each compilation unit to be tested seems
> excessive as the number of tests increase. Group them all in a single
> kunit test module called xe_test.ko.

maybe even we don't need a separate test module ?

mostly we are testing low level internals, pure kunit tests cases can be
included by respective .c files and we can avoid need to export many
functions/structs that could stay static.

IMO separate module is more beneficial for closed-box testing, not sure
which of our tests fits into that category

but anyway, single module is better than many, so

Acked-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

with one nit below

> 
> The tests requiring the physical device, aka "live" tests, are still
> kept in separate modules since they are normally triggered via igt,
> and not via kunit.py. After igt is converted, those can be merged in
> a single module as well.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/Makefile      |  7 ++++++-
>  drivers/gpu/drm/xe/tests/xe_pci_test.c |  5 -----
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  5 -----
>  drivers/gpu/drm/xe/tests/xe_test_mod.c | 10 ++++++++++
>  drivers/gpu/drm/xe/tests/xe_wa_test.c  |  5 -----
>  5 files changed, 16 insertions(+), 16 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_test_mod.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
> index 39d8a0892274..9d1d88af8b2f 100644
> --- a/drivers/gpu/drm/xe/tests/Makefile
> +++ b/drivers/gpu/drm/xe/tests/Makefile
> @@ -1,10 +1,15 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> +# "live" kunit tests
>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
>  	xe_bo_test.o \
>  	xe_dma_buf_test.o \
>  	xe_migrate_test.o \
> -	xe_mocs_test.o \
> +	xe_mocs_test.o
> +
> +# Normal kunit tests
> +obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
> +xe_test-y = xe_test_mod.o \
>  	xe_pci_test.o \
>  	xe_rtp_test.o \
>  	xe_wa_test.o
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
> index daf652517608..59e29a148478 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
> @@ -67,8 +67,3 @@ static struct kunit_suite xe_pci_test_suite = {
>  };
>  
>  kunit_test_suite(xe_pci_test_suite);
> -
> -MODULE_AUTHOR("Intel Corporation");
> -MODULE_LICENSE("GPL");
> -MODULE_DESCRIPTION("xe_pci kunit test");
> -MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index a1d204133cc1..83b0ba097a3e 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -310,8 +310,3 @@ static struct kunit_suite xe_rtp_test_suite = {
>  };
>  
>  kunit_test_suite(xe_rtp_test_suite);
> -
> -MODULE_AUTHOR("Intel Corporation");
> -MODULE_LICENSE("GPL");
> -MODULE_DESCRIPTION("xe_rtp kunit test");
> -MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> diff --git a/drivers/gpu/drm/xe/tests/xe_test_mod.c b/drivers/gpu/drm/xe/tests/xe_test_mod.c
> new file mode 100644
> index 000000000000..875f3e6f965e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_test_mod.c

nit: can't this be just named as xe_test.c ?

> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include <linux/module.h>
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("xe kunit tests");
> +MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> index 01ea974591ea..4eb8e1e8a76c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> @@ -135,8 +135,3 @@ static struct kunit_suite xe_rtp_test_suite = {
>  };
>  
>  kunit_test_suite(xe_rtp_test_suite);
> -
> -MODULE_AUTHOR("Intel Corporation");
> -MODULE_LICENSE("GPL");
> -MODULE_DESCRIPTION("xe_wa kunit test");
> -MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
