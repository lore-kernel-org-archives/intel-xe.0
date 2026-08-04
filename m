Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF83C55838
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 11:51:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A1D10E9DC;
	Tue,  4 Aug 2026 11:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VL/PPlcU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EB310E13F;
 Tue,  4 Aug 2026 11:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785844297; x=1817380297;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=s0YVYxfLjsBxpVpoNbITgDQiJ89VY1jR1dP2/YoMicM=;
 b=VL/PPlcUQX1JVRDzeTLA5MjG4BFeG5OtLTTBytBiUdq7Mq44IeniJkTQ
 KRu9QQFN+qefN7IHvmq/tSJ9OOJpf/8ooMCEzpmc2tjiOC+9Vpgbh65u2
 N4K6hNiTq3Q6zz5abTs6mxU1iKnGLmnbMZpL/4VbYQ65sHBl/qnRFl/un
 ROoMRo6/JHjx0mcbIRym3vfgog7hjZkgOpFO1MIaI0u/HwLoURfzWTTwR
 vlZkyfb3dEL1l7HDZlCG0JT9kce1NNOL1euPFtD+sOwU9i6DbtnXzMUAU
 zpwprWtF7ZCfywMcYrf28iqAykx2I38HjXLPVMoy6VoCtNKkxO1c4N6E9 w==;
X-CSE-ConnectionGUID: DqHKyfkwRFGJQk0qjitRJg==
X-CSE-MsgGUID: safYfskmR2ygQoxo+/xbuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86245284"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86245284"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 04:51:37 -0700
X-CSE-ConnectionGUID: 9D11+uvpSGitFmXfKpJbVA==
X-CSE-MsgGUID: OG37gpxdRsWVWhJ645HSxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="265325107"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.151])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 04:51:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 31/34] drm/i915/kunit: Export link training and caps
 funcs for testing
In-Reply-To: <20260701153204.4124150-32-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260701153204.4124150-1-imre.deak@intel.com>
 <20260701153204.4124150-32-imre.deak@intel.com>
Date: Tue, 04 Aug 2026 14:51:31 +0300
Message-ID: <25145e48002c43786ff0ec85499e3539caa37fc4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 01 Jul 2026, Imre Deak <imre.deak@intel.com> wrote:
> Export the link caps and link training helpers needed by the DP link
> KUnit tests.
>
> Use test ops tables instead of exporting the helpers directly, avoiding
> symbol name collisions between the i915 and xe builds of the shared
> display code.

Okay, so this one slipped through and was merged.

I understand it took time and effort to figure out how to make this work
for both i915 and xe... but frankly, this is now an awful hack that
*must* be undone and refactored and fixed to work with the future
display module.

We can't have a single #ifdef I915.

I don't even see the real benefit for testing this for both i915 and xe,
separately. One should've been enough.


BR,
Jani.

>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_dp_link_caps.c | 29 +++++++++++++++
>  .../gpu/drm/i915/display/intel_dp_link_caps.h | 37 +++++++++++++++++++
>  .../drm/i915/display/intel_dp_link_training.c | 36 +++++++++++++++++-
>  .../drm/i915/display/intel_dp_link_training.h | 31 ++++++++++++++++
>  .../i915/display/tests/intel_dp_link_test.c   | 17 +++++++++
>  5 files changed, 148 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> index 76b7c0fc90115..7b6cc6055da82 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> @@ -1281,3 +1281,32 @@ void intel_dp_link_caps_cleanup(struct intel_dp_link_caps *link_caps)
>  {
>  	kfree(link_caps);
>  }
> +
> +#if IS_ENABLED(CONFIG_KUNIT)
> +
> +#define __INIT_MEMBER(__name, __fn) \
> +	.__name = __fn,
> +
> +#define INTEL_DP_LINK_CAPS_TEST_OPS_INIT \
> +	INTEL_DP_LINK_CAPS_TEST_OPS_MEMBERS(__INIT_MEMBER)
> +
> +#ifdef I915
> +
> +const struct intel_dp_link_caps_test_ops i915_display_dp_link_caps_test_ops = {
> +	INTEL_DP_LINK_CAPS_TEST_OPS_INIT
> +};
> +EXPORT_SYMBOL(i915_display_dp_link_caps_test_ops);
> +
> +#else
> +
> +const struct intel_dp_link_caps_test_ops intel_display_dp_link_caps_test_ops = {
> +	INTEL_DP_LINK_CAPS_TEST_OPS_INIT
> +};
> +EXPORT_SYMBOL(intel_display_dp_link_caps_test_ops);
> +
> +#endif	/* I915 */
> +
> +#undef INTEL_DP_LINK_CAPS_TEST_OPS_INIT
> +#undef __INIT_MEMBER
> +
> +#endif	/* CONFIG_KUNIT */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
> index 56c585eb5a135..a0a88efb95463 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.h
> @@ -155,4 +155,41 @@ void intel_dp_link_caps_debugfs_add(struct intel_connector *connector);
>  struct intel_dp_link_caps *intel_dp_link_caps_init(struct intel_dp *intel_dp);
>  void intel_dp_link_caps_cleanup(struct intel_dp_link_caps *link_caps);
>  
> +#if IS_ENABLED(CONFIG_KUNIT)
> +
> +#define INTEL_DP_LINK_CAPS_TEST_OPS_MEMBERS(__X) \
> +	__X(connector_compute_order,	intel_dp_link_caps_connector_compute_order) \
> +	__X(connector_fallback_order,	intel_dp_link_caps_connector_fallback_order) \
> +	__X(iter_start,			intel_dp_link_caps_iter_start) \
> +	__X(iter_end,			intel_dp_link_caps_iter_end) \
> +	__X(set_max_limits,		intel_dp_link_caps_set_max_limits) \
> +	__X(get_max_limits,		intel_dp_link_caps_get_max_limits) \
> +	__X(get_max_bw_config,		intel_dp_link_caps_get_max_bw_config) \
> +	__X(reset_max_limits,		intel_dp_link_caps_reset_max_limits) \
> +	__X(disable_config,		intel_dp_link_caps_disable_config) \
> +	__X(update,			intel_dp_link_caps_update) \
> +	__X(init,			intel_dp_link_caps_init) \
> +	__X(cleanup,			intel_dp_link_caps_cleanup)
> +
> +#define __DECLARE_MEMBER(__name, __fn) \
> +	typeof(__fn) *__name;
> +
> +#define INTEL_DP_LINK_CAPS_TEST_OPS_DECLARE \
> +	INTEL_DP_LINK_CAPS_TEST_OPS_MEMBERS(__DECLARE_MEMBER)
> +
> +struct intel_dp_link_caps_test_ops {
> +	INTEL_DP_LINK_CAPS_TEST_OPS_DECLARE
> +};
> +
> +#undef INTEL_DP_LINK_CAPS_TEST_OPS_DECLARE
> +#undef __DECLARE_MEMBER
> +
> +#ifdef I915
> +extern const struct intel_dp_link_caps_test_ops i915_display_dp_link_caps_test_ops;
> +#else
> +extern const struct intel_dp_link_caps_test_ops intel_display_dp_link_caps_test_ops;
> +#endif	/* I915 */
> +
> +#endif	/* CONFIG_KUNIT */
> +
>  #endif /* __INTEL_DP_LINK_CAPS_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index a592bfab5ff0e..fa55664c9d98e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -21,6 +21,8 @@
>   * IN THE SOFTWARE.
>   */
>  
> +#include <kunit/visibility.h>
> +
>  #include <linux/debugfs.h>
>  #include <linux/iopoll.h>
>  
> @@ -1888,8 +1890,9 @@ static bool reduce_link_params(struct intel_dp *intel_dp, const struct intel_crt
>  	return new_found;
>  }
>  
> -static int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
> -						   const struct intel_crtc_state *crtc_state)
> +VISIBLE_IF_KUNIT
> +int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
> +					    const struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_display *display = to_intel_display(intel_dp);
>  	struct intel_dp_link_caps *link_caps = intel_dp->link.caps;
> @@ -2813,3 +2816,32 @@ void intel_dp_link_training_cleanup(struct intel_dp_link_training *link_training
>  {
>  	kfree(link_training);
>  }
> +
> +#if IS_ENABLED(CONFIG_KUNIT)
> +
> +#define __INIT_MEMBER(__name, __fn) \
> +	.__name = __fn,
> +
> +#define INTEL_DP_LINK_TRAINING_TEST_OPS_INIT \
> +	INTEL_DP_LINK_TRAINING_TEST_OPS_MEMBERS(__INIT_MEMBER)
> +
> +#ifdef I915
> +
> +const struct intel_dp_link_training_test_ops i915_display_dp_link_training_test_ops = {
> +	INTEL_DP_LINK_TRAINING_TEST_OPS_INIT
> +};
> +EXPORT_SYMBOL(i915_display_dp_link_training_test_ops);
> +
> +#else
> +
> +const struct intel_dp_link_training_test_ops intel_display_dp_link_training_test_ops = {
> +	INTEL_DP_LINK_TRAINING_TEST_OPS_INIT
> +};
> +EXPORT_SYMBOL(intel_display_dp_link_training_test_ops);
> +
> +#endif	/* I915 */
> +
> +#undef INTEL_DP_LINK_TRAINING_TEST_OPS_INIT
> +#undef __INIT_MEMBER
> +
> +#endif	/* CONFIG_KUNIT */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> index ef16fcabd6da9..581f2361fdfd5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> @@ -8,6 +8,8 @@
>  
>  #include <drm/display/drm_dp_helper.h>
>  
> +#include "intel_dp_link_caps.h"
> +
>  struct intel_atomic_state;
>  struct intel_connector;
>  struct intel_crtc_state;
> @@ -71,4 +73,33 @@ void intel_dp_link_training_reset(struct intel_dp_link_training *link_training);
>  struct intel_dp_link_training *intel_dp_link_training_init(struct intel_dp *intel_dp);
>  void intel_dp_link_training_cleanup(struct intel_dp_link_training *link_training);
>  
> +#if IS_ENABLED(CONFIG_KUNIT)
> +
> +int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
> +					    const struct intel_crtc_state *crtc_state);
> +
> +#define INTEL_DP_LINK_TRAINING_TEST_OPS_MEMBERS(__X) \
> +	__X(get_fallback_values,	intel_dp_get_link_train_fallback_values)
> +
> +#define __DECLARE_MEMBER(__name, __fn) \
> +	typeof(__fn) *__name;
> +
> +#define INTEL_DP_LINK_TRAINING_TEST_OPS_DECLARE \
> +	INTEL_DP_LINK_TRAINING_TEST_OPS_MEMBERS(__DECLARE_MEMBER)
> +
> +struct intel_dp_link_training_test_ops {
> +	INTEL_DP_LINK_TRAINING_TEST_OPS_DECLARE
> +};
> +
> +#undef INTEL_DP_LINK_TRAINING_TEST_OPS_DECLARE
> +#undef __DECLARE_MEMBER
> +
> +#ifdef I915
> +extern const struct intel_dp_link_training_test_ops i915_display_dp_link_training_test_ops;
> +#else
> +extern const struct intel_dp_link_training_test_ops intel_display_dp_link_training_test_ops;
> +#endif	/* I915 */
> +
> +#endif	/* CONFIG_KUNIT */
> +
>  #endif /* __INTEL_DP_LINK_TRAINING_H__ */
> diff --git a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> index aa5358c94839f..b77472e9bbe12 100644
> --- a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> +++ b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> @@ -17,6 +17,8 @@
>  #include "intel_connector.h"
>  #include "intel_display_core.h"
>  #include "intel_display_types.h"
> +#include "intel_dp_link_caps.h"
> +#include "intel_dp_link_training.h"
>  
>  struct test_ctx {
>  	struct {
> @@ -30,6 +32,9 @@ struct test_ctx {
>  		struct intel_crtc_state crtc_state;
>  	} dev;
>  
> +	const struct intel_dp_link_caps_test_ops *link_caps_ops;
> +	const struct intel_dp_link_training_test_ops *link_training_ops;
> +
>  	struct rnd_state rnd;
>  };
>  
> @@ -64,6 +69,8 @@ static int intel_dp_link_test_init(struct kunit *test)
>  	intel_dp = &dig_port->dp;
>  	intel_dp->attached_connector = &test_ctx.dev.connector;
>  
> +	intel_dp->link.caps = test_ctx.link_caps_ops->init(intel_dp);
> +
>  	test->priv = &test_ctx;
>  
>  	return 0;
> @@ -71,10 +78,20 @@ static int intel_dp_link_test_init(struct kunit *test)
>  
>  static void intel_dp_link_test_exit(struct kunit *test)
>  {
> +	struct test_ctx *ctx = test->priv;
> +
> +	ctx->link_caps_ops->cleanup(ctx->dev.dig_port.dp.link.caps);
>  }
>  
>  static int intel_dp_link_test_suite_init(struct kunit_suite *test_suite)
>  {
> +#ifdef I915
> +	test_ctx.link_caps_ops = &i915_display_dp_link_caps_test_ops;
> +	test_ctx.link_training_ops = &i915_display_dp_link_training_test_ops;
> +#else
> +	test_ctx.link_caps_ops = &intel_display_dp_link_caps_test_ops;
> +	test_ctx.link_training_ops = &intel_display_dp_link_training_test_ops;
> +#endif
>  	prandom_seed_state(&test_ctx.rnd, 0);
>  
>  	return 0;

-- 
Jani Nikula, Intel
