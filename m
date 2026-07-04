Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A626C43458
	for <intel-xe@archiver.kernel.org>; Sat,  4 Jul 2026 10:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8A710E6A3;
	Sat,  4 Jul 2026 10:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HX/syZG4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBE810E6B1;
 Sat,  4 Jul 2026 10:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783162270; x=1814698270;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=YNaZnRUU6gpC4EUIHyW2hbMGCqwnzxkavChfWoEIBcM=;
 b=HX/syZG4xxB6xxiYmI8LiJ1AgVhb9vWoUxCRreS93lNkl5dm7yoRQWWD
 QXm9H0izXIwSoAIA14fGfI5A6QFT6vmm5Rj+BoEH7sG8ihl9Kyi2mgRRu
 j1H3Bq0GqmJymubMlAv7tSfXsQ3QfWMXE70o4ROikT5leR539EP1r+Qci
 7vJb3Q2e7oWNeTQQ/qOrHzXN7fGeu1cbtIXDw433OlRsHy+I4iJd0rF7T
 dC5WahZNJbIMkrtoQqRxFysxQgoss9+Z46X2MiRNPN84Sdpv3X69nTSDQ
 qzdpjdGtJZADVOFYSnJQLUQVbqC1UIYHoTZ7e5lOeECqEqWQ8VuCjaATW A==;
X-CSE-ConnectionGUID: 5+1stl79SDiLIgW+WNg4/Q==
X-CSE-MsgGUID: sEJ/D5vTS5uoN/7GFO5eQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="95382551"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; d="scan'208";a="95382551"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2026 03:51:10 -0700
X-CSE-ConnectionGUID: pdZL1olEQ3WBXSBQR/JjRA==
X-CSE-MsgGUID: CmSOtB4pS7KxLhVxQoQa1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; d="scan'208";a="257172259"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2026 03:51:08 -0700
Date: Sat, 4 Jul 2026 12:51:07 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Imre Deak <imre.deak@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 32/34] drm/i915/kunit: DP link: add baseline fixed
 table reference test
In-Reply-To: <20260701153204.4124150-33-imre.deak@intel.com>
Message-ID: <b23a877a-0442-92ee-916f-d1f3873b5892@intel.com>
References: <20260701153204.4124150-1-imre.deak@intel.com>
 <20260701153204.4124150-33-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-879589332-1783158384=:605841"
Content-ID: <0f954422-3522-fa02-ef7d-9bad33ec1722@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-879589332-1783158384=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <86d816dc-89c7-62d0-fa8f-a8cbbc8144cb@intel.com>

On Wed, 1 Jul 2026, Imre Deak wrote:
> Add a simple baseline test for DP link caps iteration using a fixed
> standard DP configuration table. This provides a minimal validity check,
> independent of more complex test setups, verifying the iterator returns
> expected configurations in ascending and descending order.
>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
> .../i915/display/tests/intel_dp_link_test.c   | 200 ++++++++++++++++++
> 1 file changed, 200 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> index b77472e9bbe12..1dc5bf6888990 100644
> --- a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> +++ b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> @@ -7,6 +7,7 @@
>
> #include <linux/compiler.h>
> #include <linux/device.h>
> +#include <linux/log2.h>
> #include <linux/prandom.h>
> #include <linux/random.h>
>
> @@ -20,6 +21,18 @@
> #include "intel_dp_link_caps.h"
> #include "intel_dp_link_training.h"
>
> +#define LINK_TEST_NUM_LANE_CONFIGS(__max_lane_count) \
> +	(ilog2(__max_lane_count) + 1)
> +
> +#define LINK_TEST_NUM_CONFIGS(__num_rates, __max_lane_count) \
> +	((__num_rates) * LINK_TEST_NUM_LANE_CONFIGS(__max_lane_count))
> +
> +#define LINK_TEST_MAX_LANE_COUNT		((u32)4)
> +#define LINK_TEST_MAX_CONFIGS			LINK_TEST_NUM_CONFIGS(DP_MAX_SUPPORTED_RATES, \
> +								      LINK_TEST_MAX_LANE_COUNT)
> +
> +#define LINK_TEST_NUM_RANDOM_ITERATIONS		50
> +
> struct test_ctx {
> 	struct {
> 		struct intel_display display;
> @@ -38,7 +51,194 @@ struct test_ctx {
> 	struct rnd_state rnd;
> };
>
> +struct link_rate_set {
> +	const int *entries;
> +	int size;
> +};
> +
> +struct link_config_set {
> +	struct intel_dp_link_config entries[LINK_TEST_MAX_CONFIGS];
> +	int size;
> +};
> +
> +static const int standard_dp_link_rates[] = {
> +	162000, 270000, 540000, 810000, 1000000, 1350000, 2000000
> +};
> +
> +#define LINK_TEST_NUM_STANDARD_RATES (ARRAY_SIZE(standard_dp_link_rates))
> +
> +static const struct link_config_set standard_dp_link_configs[] = {
> +	[INTEL_DP_LINK_CAPS_ORDER_KEY_BW] = {                        /* MBps    PBN    */
> +		.entries = {
> +			{ .rate =  162000, .lane_count = 1 }, /*  162.0    3.00 */
> +			{ .rate =  270000, .lane_count = 1 }, /*  270.0    5.00 */
> +			{ .rate =  162000, .lane_count = 2 }, /*  324.0    6.00 */
> +			{ .rate =  270000, .lane_count = 2 }, /*  540.0   10.00 */
> +			{ .rate =  540000, .lane_count = 1 }, /*  540.0   10.00 */
> +			{ .rate =  162000, .lane_count = 4 }, /*  648.0   12.00 */
> +			{ .rate =  810000, .lane_count = 1 }, /*  810.0   15.00 */
> +			{ .rate =  270000, .lane_count = 4 }, /* 1080.0   20.00 */
> +			{ .rate =  540000, .lane_count = 2 }, /* 1080.0   20.00 */
> +			{ .rate = 1000000, .lane_count = 1 }, /* 1208.9   22.39 */
> +			{ .rate =  810000, .lane_count = 2 }, /* 1620.0   30.00 */
> +			{ .rate = 1350000, .lane_count = 1 }, /* 1632.0   30.22 */
> +			{ .rate =  540000, .lane_count = 4 }, /* 2160.0   40.00 */
> +			{ .rate = 1000000, .lane_count = 2 }, /* 2417.8   44.77 */
> +			{ .rate = 2000000, .lane_count = 1 }, /* 2417.8   44.77 */
> +			{ .rate =  810000, .lane_count = 4 }, /* 3240.0   60.00 */
> +			{ .rate = 1350000, .lane_count = 2 }, /* 3264.0   60.44 */
> +			{ .rate = 1000000, .lane_count = 4 }, /* 4835.6   89.55 */
> +			{ .rate = 2000000, .lane_count = 2 }, /* 4835.6   89.55 */
> +			{ .rate = 1350000, .lane_count = 4 }, /* 6527.9  120.89 */
> +			{ .rate = 2000000, .lane_count = 4 }, /* 9671.1  179.09 */
> +		},
> +		.size = LINK_TEST_NUM_CONFIGS(ARRAY_SIZE(standard_dp_link_rates),
> +					      LINK_TEST_MAX_LANE_COUNT),
> +	},
> +	[INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE] = {
> +		.entries = {
> +			{ .rate = 162000,  .lane_count = 1 },
> +			{ .rate = 162000,  .lane_count = 2 },
> +			{ .rate = 162000,  .lane_count = 4 },
> +
> +			{ .rate = 270000,  .lane_count = 1 },
> +			{ .rate = 270000,  .lane_count = 2 },
> +			{ .rate = 270000,  .lane_count = 4 },
> +
> +			{ .rate = 540000,  .lane_count = 1 },
> +			{ .rate = 540000,  .lane_count = 2 },
> +			{ .rate = 540000,  .lane_count = 4 },
> +
> +			{ .rate = 810000,  .lane_count = 1 },
> +			{ .rate = 810000,  .lane_count = 2 },
> +			{ .rate = 810000,  .lane_count = 4 },
> +
> +			{ .rate = 1000000, .lane_count = 1 },
> +			{ .rate = 1000000, .lane_count = 2 },
> +			{ .rate = 1000000, .lane_count = 4 },
> +
> +			{ .rate = 1350000, .lane_count = 1 },
> +			{ .rate = 1350000, .lane_count = 2 },
> +			{ .rate = 1350000, .lane_count = 4 },
> +
> +			{ .rate = 2000000, .lane_count = 1 },
> +			{ .rate = 2000000, .lane_count = 2 },
> +			{ .rate = 2000000, .lane_count = 4 },
> +		},
> +		.size = LINK_TEST_NUM_CONFIGS(ARRAY_SIZE(standard_dp_link_rates),
> +					      LINK_TEST_MAX_LANE_COUNT),
> +	},
> +	[INTEL_DP_LINK_CAPS_ORDER_KEY_LANE_RATE] = {
> +		.entries = {
> +			{ .rate = 162000,  .lane_count = 1 },
> +			{ .rate = 270000,  .lane_count = 1 },
> +			{ .rate = 540000,  .lane_count = 1 },
> +			{ .rate = 810000,  .lane_count = 1 },
> +			{ .rate = 1000000, .lane_count = 1 },
> +			{ .rate = 1350000, .lane_count = 1 },
> +			{ .rate = 2000000, .lane_count = 1 },
> +
> +			{ .rate = 162000,  .lane_count = 2 },
> +			{ .rate = 270000,  .lane_count = 2 },
> +			{ .rate = 540000,  .lane_count = 2 },
> +			{ .rate = 810000,  .lane_count = 2 },
> +			{ .rate = 1000000, .lane_count = 2 },
> +			{ .rate = 1350000, .lane_count = 2 },
> +			{ .rate = 2000000, .lane_count = 2 },
> +
> +			{ .rate = 162000,  .lane_count = 4 },
> +			{ .rate = 270000,  .lane_count = 4 },
> +			{ .rate = 540000,  .lane_count = 4 },
> +			{ .rate = 810000,  .lane_count = 4 },
> +			{ .rate = 1000000, .lane_count = 4 },
> +			{ .rate = 1350000, .lane_count = 4 },
> +			{ .rate = 2000000, .lane_count = 4 },
> +		},
> +		.size = LINK_TEST_NUM_CONFIGS(ARRAY_SIZE(standard_dp_link_rates),
> +					      LINK_TEST_MAX_LANE_COUNT),
> +	},
> +};
> +
> +static bool link_configs_match(const struct intel_dp_link_config *a,
> +			       const struct intel_dp_link_config *b)
> +{
> +	return a->rate == b->rate && a->lane_count == b->lane_count;

maybe: s/\<a\>/lc_a/ and s/\<b\>/lc_b/

> +}
> +
> +static const struct intel_dp_link_caps_order config_orders[] = {
> +	{
> +		.key = INTEL_DP_LINK_CAPS_ORDER_KEY_BW,
> +		.dir = INTEL_DP_LINK_CAPS_ORDER_DIR_ASC,
> +	}, {
> +		.key = INTEL_DP_LINK_CAPS_ORDER_KEY_BW,
> +		.dir = INTEL_DP_LINK_CAPS_ORDER_DIR_DESC,
> +	}, {
> +		.key = INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
> +		.dir = INTEL_DP_LINK_CAPS_ORDER_DIR_ASC,
> +	}, {
> +		.key = INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
> +		.dir = INTEL_DP_LINK_CAPS_ORDER_DIR_DESC,
> +	}
> +};
> +
> +static const struct link_config_set *
> +link_caps_config_order_key_to_set(struct kunit *test, enum intel_dp_link_caps_order_key key)
> +{
> +	return &standard_dp_link_configs[key];
> +}
> +
> +/*
> + * TEST: Baseline with fixed reference table
> + * -----------------------------------------

Didn't find in other KUnit tests such header, but I think the info
provided is valuable. Can we add it to the line below, something like:

* Verify baseline link_caps config iterator using fixed standard DP config tables.

> + * Verify the link_caps config iterator using fixed standard DP config tables.
> + */
> +static void baseline_test_for_order(struct kunit *test,
> +				    struct intel_dp_link_caps *link_caps,
> +				    struct intel_dp_link_caps_order config_order)
> +{
> +	struct test_ctx *ctx = test->priv;
> +	const struct link_config_set *config_set =
> +		link_caps_config_order_key_to_set(test, config_order.key);
> +	const struct intel_dp_link_caps_test_ops *ops = ctx->link_caps_ops;
> +	struct intel_dp_link_config iter_config;
> +	struct intel_dp_link_caps_iter iter;
> +	int pos = 0;
> +
> +	ops->iter_start(&iter, link_caps, config_order, INTEL_DP_LINK_CAPS_FILTER_ALL);
> +	for_each_dp_link_config(&iter, &iter_config) {
> +		int idx = pos;
> +
> +		if (config_order.dir == INTEL_DP_LINK_CAPS_ORDER_DIR_DESC)
> +			idx = config_set->size - idx - 1;
> +
> +		KUNIT_EXPECT_TRUE(test, link_configs_match(&iter_config,
> +							   &config_set->entries[idx]));
> +
> +		pos++;
> +	}
> +	ops->iter_end(&iter);
> +}
> +
> +static void intel_dp_link_caps_test_baseline(struct kunit *test)
> +{
> +	struct test_ctx *ctx = test->priv;
> +	struct intel_dp_link_caps *link_caps = ctx->dev.dig_port.dp.link.caps;
> +	const struct intel_dp_link_caps_test_ops *ops =
> +		ctx->link_caps_ops;
> +	int i;
> +
> +	ops->update(link_caps,
> +		    standard_dp_link_rates, LINK_TEST_NUM_STANDARD_RATES,
> +		    LINK_TEST_MAX_LANE_COUNT,
> +		    true);
> +
> +	for (i = 0; i < ARRAY_SIZE(config_orders); i++)
> +		baseline_test_for_order(test, link_caps, config_orders[i]);
> +}
> +
> static struct kunit_case intel_dp_link_test_cases[] = {
> +	KUNIT_CASE(intel_dp_link_caps_test_baseline),
> +

looks like a superfluous newline.

With all that addressed:

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> 	{}
> };
>
> -- 
> 2.49.1
>
>
--8323329-879589332-1783158384=:605841--
