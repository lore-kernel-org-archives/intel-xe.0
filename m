Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40410C76195
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 13:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DE010E0E8;
	Tue, 21 Mar 2023 13:11:23 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AA810E0E8
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 13:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679404280; x=1710940280;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=BW+5gBfharGTsLwLmQ+40fAOyCCoEQs5H9UdAvYNxxM=;
 b=g/nX1RxR3uc0AE59g9n2tHMS5TmUPa8c5Wdgn5EocctvwPmdntTA4vpb
 W5d3Iw+e8ni13OhX/hqRI1YZ4TRvDrmMlqINIySKeDJPqDM9OFPMuZ8k+
 BWyYlgavj9mCdb5jgrx+ykBOnCcigfFhPXf2a5D3PrfjFuQhClBeHtU0Z
 SGF89a7/vpgPNzRqKGk8UsIsxQPsNDzVAXbzZTpMQ+IvEyuARtIZB6XWT
 rBquo4tMnEVqK0bHTEuQe9V1SvbEODxXEds1JEpIHdvMNbPNe19/GjIoW
 uFPoAHBMt5RtpH9o7UbmubUbdJAU+/AeVaXoevgLRuoiQBk8g6UlhTg4p A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="425210254"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
 d="scan'208,217";a="425210254"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 06:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="750553011"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
 d="scan'208,217";a="750553011"
Received: from mtiebout-mobl1.ger.corp.intel.com (HELO [10.252.35.151])
 ([10.252.35.151])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 06:11:18 -0700
Content-Type: multipart/alternative;
 boundary="------------9ZgDvtV309Qi2JgvLIn16Hb6"
Message-ID: <7f6b73f8-24ee-bb58-96ad-7cbdc60f7092@linux.intel.com>
Date: Tue, 21 Mar 2023 14:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
References: <20230316210341.3547058-1-lucas.demarchi@intel.com>
 <20230316210341.3547058-4-lucas.demarchi@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230316210341.3547058-4-lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe: Add basic unit tests for rtp
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
Cc: Matt Roper <matthew.d.roper@intel.com>, thomas.hellstrom@intel.com,
 mauro.chehab@intel.com, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------9ZgDvtV309Qi2JgvLIn16Hb6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey,

On 2023-03-16 22:03, Lucas De Marchi wrote:
> Add some basic unit tests for rtp. This is intended to prove the
> functionality of the rtp itself, like coalescing entries, rejecting
> non-disjoint values, etc.
>
> Contrary to the other tests in xe, this is a unit test to test the
> sw-side only, so it can be executed on any machine - it doesn't interact
> with the real hardware. For that a mock was provided with the minimum
> initialization needed. Running it produces the following output:
>
> 	$ ./tools/testing/kunit/kunit.py run --raw_output  \
> 		--kunitconfig drivers/gpu/drm/xe/.kunitconfig xe_rtp
> 	...
> 	[13:46:14] Starting KUnit Kernel (1/1)...
> 	KTAP version 1
> 	1..1
> 	    KTAP version 1
> 	    # Subtest: xe_rtp
> 	    1..3
> 	    ok 1 xe_rtp_process_basic
> 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
> 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
> 	    ok 2 xe_rtp_process_dup
> 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
> 	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
> 	    ok 3 xe_rtp_process_incompat_types
> 	# xe_rtp: pass:3 fail:0 skip:0 total:3
> 	# Totals: pass:3 fail:0 skip:0 total:3
> 	ok 1 xe_rtp
> 	[13:46:14] Elapsed time: 6.800s total, 0.002s configuring, 6.682s building, 0.073s running
>
> Note that the ERRORs in the kernel log are expected since it's testing
> non-disjoint or incompatible entries.
>
> Signed-off-by: Lucas De Marchi<lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/Kconfig.debug       |   1 +
>   drivers/gpu/drm/xe/tests/Makefile      |   7 +-
>   drivers/gpu/drm/xe/tests/xe_rtp.c      | 201 +++++++++++++++++++++++++
>   drivers/gpu/drm/xe/tests/xe_rtp_test.c |  71 +++++++++
>   drivers/gpu/drm/xe/tests/xe_rtp_test.h |  15 ++
>   drivers/gpu/drm/xe/xe_rtp.c            |   4 +
>   6 files changed, 297 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp.c
>   create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c
>   create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.h
>
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index 93b284cdd0a2..11bb13c73e7b 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -66,6 +66,7 @@ config DRM_XE_KUNIT_TEST
>   	depends on DRM_XE && KUNIT && DEBUG_FS
>   	default KUNIT_ALL_TESTS
>   	select DRM_EXPORT_FOR_TESTS if m
> +	select DRM_KUNIT_TEST_HELPERS
>   	help
>   	  Choose this option to allow the driver to perform selftests under
>   	  the kunit framework
> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
> index 47056b6459e3..c5c2f108d017 100644
> --- a/drivers/gpu/drm/xe/tests/Makefile
> +++ b/drivers/gpu/drm/xe/tests/Makefile
> @@ -1,4 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
> -obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_bo_test.o xe_dma_buf_test.o \
> -	xe_migrate_test.o
> +obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
> +	xe_bo_test.o \
> +	xe_dma_buf_test.o \
> +	xe_migrate_test.o \
> +	xe_rtp_test.o
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp.c b/drivers/gpu/drm/xe/tests/xe_rtp.c
> new file mode 100644
> index 000000000000..196a7223c807
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp.c
> @@ -0,0 +1,201 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "tests/xe_rtp_test.h"
> +
> +#include <linux/string.h>
> +#include <linux/xarray.h>
> +
> +#include <kunit/test.h>
> +
> +#include "regs/xe_gt_regs.h"
> +#include "regs/xe_reg_defs.h"
> +#include "xe_rtp.h"
> +
> +#undef _MMIO
> +#undef MCR_REG
> +#define _MMIO(x)	_XE_RTP_REG(x)
> +#define MCR_REG(x)	_XE_RTP_MCR_REG(x)
> +
> +#define REGULAR_REG1	_MMIO(1)
> +#define REGULAR_REG2	_MMIO(2)
> +#define REGULAR_REG3	_MMIO(3)
> +#define MCR_REG1	MCR_REG(1)
> +#define MCR_REG2	MCR_REG(2)
> +#define MCR_REG3	MCR_REG(3)
> +
> +static bool match_yes(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
> +{
> +	return true;
> +}
> +
> +static bool match_no(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
> +{
> +	return false;
> +}
> +
> +/* Basic entries: same register, only one action, disjoint values */
> +static const struct xe_rtp_entry basic_entries[] = {
> +	{ XE_RTP_NAME("basic-yes-1"),
> +	  XE_RTP_RULES(FUNC(match_yes)),
> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> +	},
> +	{ XE_RTP_NAME("basic-yes-2"),
> +	  XE_RTP_RULES(FUNC(match_yes)),
> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
> +	},
> +	{ XE_RTP_NAME("basic-no-3"),
> +	  XE_RTP_RULES(FUNC(match_no)),
> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(2)))
> +	},
> +	{ XE_RTP_NAME("basic-no-4"),
> +	  XE_RTP_RULES(FUNC(match_yes), FUNC(match_no)),
> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(3)))
> +	},
> +	{ XE_RTP_NAME("basic-yes-clr-1"),
> +	  XE_RTP_RULES(FUNC(match_yes)),
> +	  XE_RTP_ACTIONS(CLR(REGULAR_REG1, REG_BIT(4)))
> +	},
> +	{ XE_RTP_NAME("basic-yes-clr-2"),
> +	  XE_RTP_RULES(FUNC(match_yes)),
> +	  XE_RTP_ACTIONS(CLR(REGULAR_REG1, REG_BIT(5)))
> +	},
> +	{}
> +};
> +
> +void xe_rtp_process_basic(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
> +	const struct xe_rtp_entry *rtp_entry;
> +	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
> +	unsigned long idx, count = 0, set_bits = 0, clr_bits = 0;
> +
> +	xe_reg_sr_init(reg_sr, "basic", xe);
> +	xe_rtp_process(basic_entries, reg_sr, &xe->gt[0], NULL);
> +
> +	xa_for_each(&reg_sr->xa, idx, sre) {
> +		count++;
> +		sr_entry = sre;
> +	}
> +
> +	/*
> +	 * Same REGULAR_REG1 register being used: all the entries should
> +	 * coalesce into a single entry
> +	 */
> +	KUNIT_ASSERT_EQ(test, count, 1);
> +
> +	/* Only bits in the entries named *-yes* are set */
> +	for (rtp_entry = basic_entries; rtp_entry && rtp_entry->name; rtp_entry++) {
> +		if (!strstr(rtp_entry->name, "-yes"))
> +			continue;
> +
> +		clr_bits |= rtp_entry->actions[0].clr_bits;
> +		set_bits |= rtp_entry->actions[0].set_bits;
> +	}
> +
> +	/* implementation detail of RTP - SET() also clears */
> +	clr_bits |= set_bits;
> +
> +	KUNIT_EXPECT_EQ(test, clr_bits, sr_entry->clr_bits);
> +	KUNIT_EXPECT_EQ(test, set_bits, sr_entry->set_bits);
> +}
> +EXPORT_SYMBOL(xe_rtp_process_basic);
> +
> +/*
> + * Duplicate entries - same register register, only one action,
> + * with actions trying to set/clear bits already changed in previous entries
> + */
> +static const struct xe_rtp_entry dup_entries[] = {
> +	{ XE_RTP_NAME("dup-entries-yes-1"),
> +	  XE_RTP_RULES(FUNC(match_yes)),
> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> +	},
> +	{ XE_RTP_NAME("dup-entries-no-2"),
> +	  XE_RTP_RULES(FUNC(match_yes)),
> +	  /* should be dropped as it's the same as a previous */
> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> +	},
> +	{ XE_RTP_NAME("dup-entries-no-3"),
> +	  XE_RTP_RULES(FUNC(match_yes)),
> +	  /* should be dropped as not disjoint */
> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_GENMASK(1, 0)))
> +	},
> +	{}
> +};
> +
> +void xe_rtp_process_dup(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
> +	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
> +	unsigned long idx, count = 0;
> +
> +	xe_reg_sr_init(reg_sr, "duplicate values", xe);
> +	xe_rtp_process(dup_entries, reg_sr, &xe->gt[0], NULL);
> +
> +	xa_for_each(&reg_sr->xa, idx, sre) {
> +		count++;
> +		sr_entry = sre;
> +	}
> +
> +	/*
> +	 * Same REGULAR_REG1 register being used: all the entries should
> +	 * coalesce into a single entry
> +	 */
> +	KUNIT_EXPECT_EQ(test, count, 1);
> +	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, REG_BIT(0));
> +}
> +EXPORT_SYMBOL(xe_rtp_process_dup);
> +
> +/*
> + * Incompatible types: same register register, but entries trying to set the
> + * same register passing incompatible types (masked / mcr)
> + */
> +static const struct xe_rtp_entry incompat_types_entries[] = {
> +	{ XE_RTP_NAME("incompat-types-yes-1"),
> +	  XE_RTP_RULES(FUNC(match_yes)),
> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> +	},
> +	{ XE_RTP_NAME("incompat-types-no-2"),
> +	  XE_RTP_RULES(FUNC(match_yes)),
> +	  /* dropped since has incompatible type with previous entry */
> +	  XE_RTP_ACTIONS(SET(MCR_REG1, REG_BIT(1)))
> +	},
> +	{ XE_RTP_NAME("incompat-types-no-3"),
> +	  XE_RTP_RULES(FUNC(match_yes)),
> +	  /* dropped since has incompatible type with previous entry */
> +	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(2),
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("incompat-types-no-3"),
> +	  XE_RTP_RULES(FUNC(match_yes)),
> +	  /* dropped since has incompatible type with previous entry */
> +	  XE_RTP_ACTIONS(SET(MCR_REG1, REG_BIT(3),
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{}
> +};
> +
> +void xe_rtp_process_incompat_types(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
> +	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
> +	unsigned long idx, count = 0;
> +
> +	xe_reg_sr_init(reg_sr, "incompatible types", xe);
> +	xe_rtp_process(dup_entries, reg_sr, &xe->gt[0], NULL);
> +
> +	xa_for_each(&reg_sr->xa, idx, sre) {
> +		count++;
> +		sr_entry = sre;
> +	}
> +
> +	/* Just the first entry is added, the rest are incompatible */
> +	KUNIT_EXPECT_EQ(test, count, 1);
> +	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, REG_BIT(0));
> +}
> +EXPORT_SYMBOL(xe_rtp_process_incompat_types);
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> new file mode 100644
> index 000000000000..9340ce44c7be
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "xe_rtp_test.h"
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_kunit_helpers.h>
> +
> +#include <kunit/test.h>
> +
> +#include "xe_device_types.h"
> +
> +static void mock_xe_device_init(struct xe_device *xe)
> +{
> +	xe->gt[0].xe = xe;
> +}
> +
> +struct xe_rtp_test_priv {
> +	struct xe_device xe;
> +	struct device *dev;
> +};
> +
> +static int xe_rtp_test_init(struct kunit *test)
> +{
> +	struct xe_rtp_test_priv *priv;
> +	struct device *dev;
> +
> +	dev = drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +
> +	priv = drm_kunit_helper_alloc_drm_device(test, dev,
> +						 struct xe_rtp_test_priv,
> +						 xe.drm,
> +						 DRIVER_GEM | DRIVER_RENDER |
> +						 DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
> +
> +	mock_xe_device_init(&priv->xe);
> +	priv->dev = dev;
> +	test->priv = priv;
> +
> +	return 0;
> +}

Would it be a good idea to put dev inside xe->drm.dev instead? I'm not sure if it
has side effects though.

Alternatively, assign test->priv to &priv->xe and put a container_of macro inside
test_exit, so this works regardless of xe_rtp_test_priv memory layout (struct randomization).

With this fixed in either way:
Reviewed-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>

> +static void xe_rtp_test_exit(struct kunit *test)
> +{
> +	struct xe_rtp_test_priv *priv = test->priv;
> +
> +	drm_kunit_helper_free_device(test, priv->dev);
> +}
> +
> +static struct kunit_case xe_rtp_tests[] = {
> +	KUNIT_CASE(xe_rtp_process_basic),
> +	KUNIT_CASE(xe_rtp_process_dup),
> +	KUNIT_CASE(xe_rtp_process_incompat_types),
> +	{}
> +};
> +
> +static struct kunit_suite xe_rtp_test_suite = {
> +	.name = "xe_rtp",
> +	.init = xe_rtp_test_init,
> +	.exit = xe_rtp_test_exit,
> +	.test_cases = xe_rtp_tests,
> +};
> +
> +kunit_test_suite(xe_rtp_test_suite);
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.h b/drivers/gpu/drm/xe/tests/xe_rtp_test.h
> new file mode 100644
> index 000000000000..a2f1437d6299
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_RTP_TEST_H_
> +#define _XE_RTP_TEST_H_
> +
> +struct kunit;
> +
> +void xe_rtp_process_basic(struct kunit *test);
> +void xe_rtp_process_dup(struct kunit *test);
> +void xe_rtp_process_incompat_types(struct kunit *test);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index cb9dd894547d..f634558b6e50 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -186,3 +186,7 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>   
>   	return dss >= dss_per_gslice;
>   }
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_rtp.c"
> +#endif
--------------9ZgDvtV309Qi2JgvLIn16Hb6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hey,<br>
    </p>
    <div class="moz-cite-prefix">On 2023-03-16 22:03, Lucas De Marchi
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230316210341.3547058-4-lucas.demarchi@intel.com">
      <pre class="moz-quote-pre" wrap="">Add some basic unit tests for rtp. This is intended to prove the
functionality of the rtp itself, like coalescing entries, rejecting
non-disjoint values, etc.

Contrary to the other tests in xe, this is a unit test to test the
sw-side only, so it can be executed on any machine - it doesn't interact
with the real hardware. For that a mock was provided with the minimum
initialization needed. Running it produces the following output:

	$ ./tools/testing/kunit/kunit.py run --raw_output  \
		--kunitconfig drivers/gpu/drm/xe/.kunitconfig xe_rtp
	...
	[13:46:14] Starting KUnit Kernel (1/1)...
	KTAP version 1
	1..1
	    KTAP version 1
	    # Subtest: xe_rtp
	    1..3
	    ok 1 xe_rtp_process_basic
	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
	    ok 2 xe_rtp_process_dup
	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000001, set: 00000001, masked: no): ret=-22
	[drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 0001 (clear: 00000003, set: 00000003, masked: no): ret=-22
	    ok 3 xe_rtp_process_incompat_types
	# xe_rtp: pass:3 fail:0 skip:0 total:3
	# Totals: pass:3 fail:0 skip:0 total:3
	ok 1 xe_rtp
	[13:46:14] Elapsed time: 6.800s total, 0.002s configuring, 6.682s building, 0.073s running

Note that the ERRORs in the kernel log are expected since it's testing
non-disjoint or incompatible entries.

Signed-off-by: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/Kconfig.debug       |   1 +
 drivers/gpu/drm/xe/tests/Makefile      |   7 +-
 drivers/gpu/drm/xe/tests/xe_rtp.c      | 201 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  71 +++++++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.h |  15 ++
 drivers/gpu/drm/xe/xe_rtp.c            |   4 +
 6 files changed, 297 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.h

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 93b284cdd0a2..11bb13c73e7b 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -66,6 +66,7 @@ config DRM_XE_KUNIT_TEST
 	depends on DRM_XE &amp;&amp; KUNIT &amp;&amp; DEBUG_FS
 	default KUNIT_ALL_TESTS
 	select DRM_EXPORT_FOR_TESTS if m
+	select DRM_KUNIT_TEST_HELPERS
 	help
 	  Choose this option to allow the driver to perform selftests under
 	  the kunit framework
diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index 47056b6459e3..c5c2f108d017 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_bo_test.o xe_dma_buf_test.o \
-	xe_migrate_test.o
+obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
+	xe_bo_test.o \
+	xe_dma_buf_test.o \
+	xe_migrate_test.o \
+	xe_rtp_test.o
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp.c b/drivers/gpu/drm/xe/tests/xe_rtp.c
new file mode 100644
index 000000000000..196a7223c807
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_rtp.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "tests/xe_rtp_test.h"
+
+#include &lt;linux/string.h&gt;
+#include &lt;linux/xarray.h&gt;
+
+#include &lt;kunit/test.h&gt;
+
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_reg_defs.h"
+#include "xe_rtp.h"
+
+#undef _MMIO
+#undef MCR_REG
+#define _MMIO(x)	_XE_RTP_REG(x)
+#define MCR_REG(x)	_XE_RTP_MCR_REG(x)
+
+#define REGULAR_REG1	_MMIO(1)
+#define REGULAR_REG2	_MMIO(2)
+#define REGULAR_REG3	_MMIO(3)
+#define MCR_REG1	MCR_REG(1)
+#define MCR_REG2	MCR_REG(2)
+#define MCR_REG3	MCR_REG(3)
+
+static bool match_yes(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
+{
+	return true;
+}
+
+static bool match_no(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
+{
+	return false;
+}
+
+/* Basic entries: same register, only one action, disjoint values */
+static const struct xe_rtp_entry basic_entries[] = {
+	{ XE_RTP_NAME("basic-yes-1"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+	},
+	{ XE_RTP_NAME("basic-yes-2"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
+	},
+	{ XE_RTP_NAME("basic-no-3"),
+	  XE_RTP_RULES(FUNC(match_no)),
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(2)))
+	},
+	{ XE_RTP_NAME("basic-no-4"),
+	  XE_RTP_RULES(FUNC(match_yes), FUNC(match_no)),
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(3)))
+	},
+	{ XE_RTP_NAME("basic-yes-clr-1"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  XE_RTP_ACTIONS(CLR(REGULAR_REG1, REG_BIT(4)))
+	},
+	{ XE_RTP_NAME("basic-yes-clr-2"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  XE_RTP_ACTIONS(CLR(REGULAR_REG1, REG_BIT(5)))
+	},
+	{}
+};
+
+void xe_rtp_process_basic(struct kunit *test)
+{
+	struct xe_device *xe = test-&gt;priv;
+	struct xe_reg_sr *reg_sr = &amp;xe-&gt;gt[0].reg_sr;
+	const struct xe_rtp_entry *rtp_entry;
+	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
+	unsigned long idx, count = 0, set_bits = 0, clr_bits = 0;
+
+	xe_reg_sr_init(reg_sr, "basic", xe);
+	xe_rtp_process(basic_entries, reg_sr, &amp;xe-&gt;gt[0], NULL);
+
+	xa_for_each(&amp;reg_sr-&gt;xa, idx, sre) {
+		count++;
+		sr_entry = sre;
+	}
+
+	/*
+	 * Same REGULAR_REG1 register being used: all the entries should
+	 * coalesce into a single entry
+	 */
+	KUNIT_ASSERT_EQ(test, count, 1);
+
+	/* Only bits in the entries named *-yes* are set */
+	for (rtp_entry = basic_entries; rtp_entry &amp;&amp; rtp_entry-&gt;name; rtp_entry++) {
+		if (!strstr(rtp_entry-&gt;name, "-yes"))
+			continue;
+
+		clr_bits |= rtp_entry-&gt;actions[0].clr_bits;
+		set_bits |= rtp_entry-&gt;actions[0].set_bits;
+	}
+
+	/* implementation detail of RTP - SET() also clears */
+	clr_bits |= set_bits;
+
+	KUNIT_EXPECT_EQ(test, clr_bits, sr_entry-&gt;clr_bits);
+	KUNIT_EXPECT_EQ(test, set_bits, sr_entry-&gt;set_bits);
+}
+EXPORT_SYMBOL(xe_rtp_process_basic);
+
+/*
+ * Duplicate entries - same register register, only one action,
+ * with actions trying to set/clear bits already changed in previous entries
+ */
+static const struct xe_rtp_entry dup_entries[] = {
+	{ XE_RTP_NAME("dup-entries-yes-1"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+	},
+	{ XE_RTP_NAME("dup-entries-no-2"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  /* should be dropped as it's the same as a previous */
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+	},
+	{ XE_RTP_NAME("dup-entries-no-3"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  /* should be dropped as not disjoint */
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_GENMASK(1, 0)))
+	},
+	{}
+};
+
+void xe_rtp_process_dup(struct kunit *test)
+{
+	struct xe_device *xe = test-&gt;priv;
+	struct xe_reg_sr *reg_sr = &amp;xe-&gt;gt[0].reg_sr;
+	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
+	unsigned long idx, count = 0;
+
+	xe_reg_sr_init(reg_sr, "duplicate values", xe);
+	xe_rtp_process(dup_entries, reg_sr, &amp;xe-&gt;gt[0], NULL);
+
+	xa_for_each(&amp;reg_sr-&gt;xa, idx, sre) {
+		count++;
+		sr_entry = sre;
+	}
+
+	/*
+	 * Same REGULAR_REG1 register being used: all the entries should
+	 * coalesce into a single entry
+	 */
+	KUNIT_EXPECT_EQ(test, count, 1);
+	KUNIT_EXPECT_EQ(test, sr_entry-&gt;set_bits, REG_BIT(0));
+}
+EXPORT_SYMBOL(xe_rtp_process_dup);
+
+/*
+ * Incompatible types: same register register, but entries trying to set the
+ * same register passing incompatible types (masked / mcr)
+ */
+static const struct xe_rtp_entry incompat_types_entries[] = {
+	{ XE_RTP_NAME("incompat-types-yes-1"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
+	},
+	{ XE_RTP_NAME("incompat-types-no-2"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  /* dropped since has incompatible type with previous entry */
+	  XE_RTP_ACTIONS(SET(MCR_REG1, REG_BIT(1)))
+	},
+	{ XE_RTP_NAME("incompat-types-no-3"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  /* dropped since has incompatible type with previous entry */
+	  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(2),
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("incompat-types-no-3"),
+	  XE_RTP_RULES(FUNC(match_yes)),
+	  /* dropped since has incompatible type with previous entry */
+	  XE_RTP_ACTIONS(SET(MCR_REG1, REG_BIT(3),
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{}
+};
+
+void xe_rtp_process_incompat_types(struct kunit *test)
+{
+	struct xe_device *xe = test-&gt;priv;
+	struct xe_reg_sr *reg_sr = &amp;xe-&gt;gt[0].reg_sr;
+	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
+	unsigned long idx, count = 0;
+
+	xe_reg_sr_init(reg_sr, "incompatible types", xe);
+	xe_rtp_process(dup_entries, reg_sr, &amp;xe-&gt;gt[0], NULL);
+
+	xa_for_each(&amp;reg_sr-&gt;xa, idx, sre) {
+		count++;
+		sr_entry = sre;
+	}
+
+	/* Just the first entry is added, the rest are incompatible */
+	KUNIT_EXPECT_EQ(test, count, 1);
+	KUNIT_EXPECT_EQ(test, sr_entry-&gt;set_bits, REG_BIT(0));
+}
+EXPORT_SYMBOL(xe_rtp_process_incompat_types);
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
new file mode 100644
index 000000000000..9340ce44c7be
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_rtp_test.h"
+
+#include &lt;drm/drm_drv.h&gt;
+#include &lt;drm/drm_kunit_helpers.h&gt;
+
+#include &lt;kunit/test.h&gt;
+
+#include "xe_device_types.h"
+
+static void mock_xe_device_init(struct xe_device *xe)
+{
+	xe-&gt;gt[0].xe = xe;
+}
+
+struct xe_rtp_test_priv {
+	struct xe_device xe;
+	struct device *dev;
+};
+
+static int xe_rtp_test_init(struct kunit *test)
+{
+	struct xe_rtp_test_priv *priv;
+	struct device *dev;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	priv = drm_kunit_helper_alloc_drm_device(test, dev,
+						 struct xe_rtp_test_priv,
+						 xe.drm,
+						 DRIVER_GEM | DRIVER_RENDER |
+						 DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	mock_xe_device_init(&amp;priv-&gt;xe);
+	priv-&gt;dev = dev;
+	test-&gt;priv = priv;
+
+	return 0;
+}</pre>
    </blockquote>
    <pre>Would it be a good idea to put dev inside xe-&gt;drm.dev instead? I'm not sure if it
has side effects though.</pre>
    <pre>Alternatively, assign test-&gt;priv to &amp;priv-&gt;xe and put a container_of macro inside
test_exit, so this works regardless of xe_rtp_test_priv memory layout (struct randomization).

With this fixed in either way:
Reviewed-by: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a>
</pre>
    <blockquote type="cite"
      cite="mid:20230316210341.3547058-4-lucas.demarchi@intel.com">
      <pre class="moz-quote-pre" wrap="">+static void xe_rtp_test_exit(struct kunit *test)
+{
+	struct xe_rtp_test_priv *priv = test-&gt;priv;
+
+	drm_kunit_helper_free_device(test, priv-&gt;dev);
+}
+
+static struct kunit_case xe_rtp_tests[] = {
+	KUNIT_CASE(xe_rtp_process_basic),
+	KUNIT_CASE(xe_rtp_process_dup),
+	KUNIT_CASE(xe_rtp_process_incompat_types),
+	{}
+};
+
+static struct kunit_suite xe_rtp_test_suite = {
+	.name = "xe_rtp",
+	.init = xe_rtp_test_init,
+	.exit = xe_rtp_test_exit,
+	.test_cases = xe_rtp_tests,
+};
+
+kunit_test_suite(xe_rtp_test_suite);
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.h b/drivers/gpu/drm/xe/tests/xe_rtp_test.h
new file mode 100644
index 000000000000..a2f1437d6299
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_RTP_TEST_H_
+#define _XE_RTP_TEST_H_
+
+struct kunit;
+
+void xe_rtp_process_basic(struct kunit *test);
+void xe_rtp_process_dup(struct kunit *test);
+void xe_rtp_process_incompat_types(struct kunit *test);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index cb9dd894547d..f634558b6e50 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -186,3 +186,7 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 
 	return dss &gt;= dss_per_gslice;
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_rtp.c"
+#endif
</pre>
    </blockquote>
  </body>
</html>

--------------9ZgDvtV309Qi2JgvLIn16Hb6--
