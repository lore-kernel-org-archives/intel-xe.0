Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8B6C76195
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 17:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2175D10E10E;
	Mon, 27 Mar 2023 17:56:05 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FCF10E10E
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 17:56:04 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id e21so9931732ljn.7
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 10:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hardline-pl.20210112.gappssmtp.com; s=20210112; t=1679939762;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=J4ItxXg4eoLJkAT0NGiSMhO/DOI6AdwZ1QqqTpYnSe0=;
 b=JqoBO4m2+F+UM0HHnJdYVyKt+i6+p//wSYAYNR9J0uvUCFxPSRHylcHOfHS8rDRrPg
 31hZmh5d4d/kcafO8i20JfPVDFuhPxpy5bOutjsYRg8Ix1B9P890OPtUKQYO3ll2yZwW
 DaS7Oh7us/olEKzmlKQBdty2PJ20p6ieY7uk0LSE/+agueF7U7N+Srp9SryvteSFe9e7
 BrPq+N5aa7d1Xeqojpq/UJH+GCdi0ci9TPvYN1borakAevMu9yowJawo5yctelTvAiDb
 nJGtApaWxHR8/POAf0agawCWbvRMaCohossQavc3nhtjWo2KqoCw9C0QjLTzekztnQrH
 5DEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679939762;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J4ItxXg4eoLJkAT0NGiSMhO/DOI6AdwZ1QqqTpYnSe0=;
 b=LSWjCeM5Q1t0/OTb8HuS6QlyNSj1dFvPdGsa1XeZXiXybdX5ED6AFpOKYzf2gC8DZn
 eCXKeCczscp+ObtaIy2wfDK4chUVCvQkvy1YFoU4OrBvbtk5YkhwZbrGWVrjhWSKDfXA
 hRFDxSg5dWIvxghSHOSF0KSIFsXEKseG4gngpy3zRTvW4h0upOSx2kJmBgbinGnfLeu3
 2mmPLdtJar6hWBnMq7dpBQFf0JsI2CW0bRiPmk8A9WEQLpfoOmunCb32E4joOpV6K/sn
 oSiMraJAP/qb7lY8Htg5S6igrK9joXDZvR3mfjk77UBmV8INBJxCJxgWaADpENS9PyQ/
 nJTw==
X-Gm-Message-State: AAQBX9d8qurUHrGg3L1wkKQcQK68gPjI2GDvz6qWsSxB2Wsr9pooF5fm
 ZOLH6L84WOoWpjQ6R6ebMnkUnQ==
X-Google-Smtp-Source: AKy350YC0fh0qxtYSvRd98MLCTKlvbWre0VOeNIwSwB9DSpGc5N+E7MQ/DWxWfGf51JBbVtNxS4d2w==
X-Received: by 2002:a2e:985a:0:b0:298:9fb5:9f20 with SMTP id
 e26-20020a2e985a000000b002989fb59f20mr4355972ljj.26.1679939762373; 
 Mon, 27 Mar 2023 10:56:02 -0700 (PDT)
Received: from localhost (83.8.67.91.ipv4.supernova.orange.pl. [83.8.67.91])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a2e8449000000b00293534d9760sm4776624ljh.127.2023.03.27.10.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 10:56:01 -0700 (PDT)
Date: Mon, 27 Mar 2023 19:56:01 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <adnojpupaqnivif7aqblxkuiwyiexskk4h3b36bsktbpifoip3@b7xazecr7exv>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <20230321220527.595462-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230321220527.595462-2-lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/7] drm/xe: Add basic unit tests for rtp
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
Cc: intel-xe@lists.freedesktop.org, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 03:05:21PM -0700, Lucas De Marchi wrote:
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
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.debug       |   1 +
>  drivers/gpu/drm/xe/tests/Makefile      |   7 +-
>  drivers/gpu/drm/xe/tests/xe_rtp.c      | 201 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  64 ++++++++
>  drivers/gpu/drm/xe/tests/xe_rtp_test.h |  15 ++
>  drivers/gpu/drm/xe/xe_rtp.c            |   4 +
>  6 files changed, 290 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index 93b284cdd0a2..11bb13c73e7b 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -66,6 +66,7 @@ config DRM_XE_KUNIT_TEST
>  	depends on DRM_XE && KUNIT && DEBUG_FS
>  	default KUNIT_ALL_TESTS
>  	select DRM_EXPORT_FOR_TESTS if m
> +	select DRM_KUNIT_TEST_HELPERS
>  	help
>  	  Choose this option to allow the driver to perform selftests under
>  	  the kunit framework

But now we're mixing proper isolated tests with HW-interacting ones.
Can we move the HW-interacting ones to a separate Kconfig which is not
included in .kunitconfig and doesn't set its default value using
KUNIT_ALL_TESTS?

> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
> index 47056b6459e3..c5c2f108d017 100644
> --- a/drivers/gpu/drm/xe/tests/Makefile
> +++ b/drivers/gpu/drm/xe/tests/Makefile
> @@ -1,4 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
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
> index 000000000000..92e2c2b8b44d
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

This test is not using xarray.

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

To keep the test simple, we should hardcode the expected value rather
than compute it inside the test.

> +
> +	/* implementation detail of RTP - SET() also clears */
> +	clr_bits |= set_bits;
> +
> +	KUNIT_EXPECT_EQ(test, clr_bits, sr_entry->clr_bits);
> +	KUNIT_EXPECT_EQ(test, set_bits, sr_entry->set_bits);

All 3 tests follow very similar logic.
I would suggest adding a name and expected values to entries, something
like:

struct xe_rtp_test {
	name;
	expected_set_bits;
	expected_clr_bits;
	expected_count;
	*entries;
};

static const struct xe_rtp_test xe_rtp_tests[] {
	{ .name = "process basic",
          .expected_count = 1,
	  (...)
	  .entries = (const struct xe_rtp_entry[]) {
		{ XE_RTP_NAME("incompat-types-yes-1"),
		(...)
		}
	},
	{ .name = "process dup",
	  (...)
	},
	(...)
};

And then we could handle all 3 test cases as a single parameterized test
with KUNIT_CASE_PARAM

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
> +	xe_rtp_process(incompat_types_entries, reg_sr, &xe->gt[0], NULL);
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
> index 000000000000..4a12aad3f759
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c

There's no need to have this as a separate file.
We can move the contents of tests/xe_rtp.c into tests/xe_rtp_test.c and
include tests/xe_rtp_test.c directly in xe_rtp.c

-Michał

> @@ -0,0 +1,64 @@
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
> +static void xe_fake_device_init(struct xe_device *xe)
> +{
> +	xe->gt[0].xe = xe;
> +}
> +
> +static int xe_rtp_test_init(struct kunit *test)
> +{
> +	struct xe_device *xe;
> +	struct device *dev;
> +
> +	dev = drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +
> +	xe = drm_kunit_helper_alloc_drm_device(test, dev,
> +					       struct xe_device,
> +					       drm, DRIVER_GEM);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
> +
> +	xe_fake_device_init(xe);
> +	xe->drm.dev = dev;
> +	test->priv = xe;
> +
> +	return 0;
> +}
> +
> +static void xe_rtp_test_exit(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +
> +	drm_kunit_helper_free_device(test, xe->drm.dev);
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
>  	return dss >= dss_per_gslice;
>  }
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_rtp.c"
> +#endif
> -- 
> 2.39.0
> 
