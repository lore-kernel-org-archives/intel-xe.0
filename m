Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9CFC43458
	for <intel-xe@archiver.kernel.org>; Sat,  4 Jul 2026 10:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2532D10E6B2;
	Sat,  4 Jul 2026 10:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0oow5J6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D86610E6B2;
 Sat,  4 Jul 2026 10:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783162357; x=1814698357;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=Qm/9TDx799BYWd5TRec5D91s7mxSOZdz6BoTi6QGXkk=;
 b=N0oow5J6dqE1SU3THZkYk1epqMooTsiDSE+zUoO5rPVwEExrb/n7o7gY
 Hlebv2qkTaFpRs0ZwzWROYEURgxkFmGN+QZsx0h3k4heS16Ept3L6MWvW
 Ryivv2BWClYWcv5CWlu4sAk02qkDu3f2qRl0GeVXEdkSzdOSnsMGWgH8F
 qzRTjzFkNr4GCEdCQFYANLQx/Rw0YY/j0aw3LVjr0B9jyDtg53mx/NSKX
 vlO6eBN424BkAniPllvPyl7oWb31QWiysQmykS7M0QVLD9pmMOJQ6MGD7
 jqKzn37ZRmcnBUnNZs8PXIOkpe8ATkDRuQAYHG4H8cK5aW3BNqJFfAasg A==;
X-CSE-ConnectionGUID: BmYJsVACSEGuTgVQfoHkNw==
X-CSE-MsgGUID: XGIZz4KTRy+egoEAV5VXYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="94526563"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; d="scan'208";a="94526563"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2026 03:52:36 -0700
X-CSE-ConnectionGUID: kAfQT1BESNu+qVgFYrX8tA==
X-CSE-MsgGUID: O7jLk10/QMC8T8SoqQzDag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; d="scan'208";a="257618985"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2026 03:52:36 -0700
Date: Sat, 4 Jul 2026 12:52:33 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Imre Deak <imre.deak@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 31/34] drm/i915/kunit: Export link training and caps
 funcs for testing
In-Reply-To: <20260701153204.4124150-32-imre.deak@intel.com>
Message-ID: <482ca492-e120-07f6-5732-9f5d6e3be12e@intel.com>
References: <20260701153204.4124150-1-imre.deak@intel.com>
 <20260701153204.4124150-32-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-705612368-1783162356=:605841"
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

--8323329-705612368-1783162356=:605841
Content-Type: text/plain; format=flowed; charset=ISO-8859-2
Content-Transfer-Encoding: 8BIT

On Wed, 1 Jul 2026, Imre Deak wrote:
> Export the link caps and link training helpers needed by the DP link
> KUnit tests.
>
> Use test ops tables instead of exporting the helpers directly, avoiding
> symbol name collisions between the i915 and xe builds of the shared
> display code.
>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> ---
> .../gpu/drm/i915/display/intel_dp_link_caps.c | 29 +++++++++++++++
> .../gpu/drm/i915/display/intel_dp_link_caps.h | 37 +++++++++++++++++++
> .../drm/i915/display/intel_dp_link_training.c | 36 +++++++++++++++++-
> .../drm/i915/display/intel_dp_link_training.h | 31 ++++++++++++++++
> .../i915/display/tests/intel_dp_link_test.c   | 17 +++++++++
> 5 files changed, 148 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> index 76b7c0fc90115..7b6cc6055da82 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> @@ -1281,3 +1281,32 @@ void intel_dp_link_caps_cleanup(struct intel_dp_link_caps *link_caps)
> {
> 	kfree(link_caps);
> }
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
> struct intel_dp_link_caps *intel_dp_link_caps_init(struct intel_dp *intel_dp);
> void intel_dp_link_caps_cleanup(struct intel_dp_link_caps *link_caps);
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
> #endif /* __INTEL_DP_LINK_CAPS_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index a592bfab5ff0e..fa55664c9d98e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -21,6 +21,8 @@
>  * IN THE SOFTWARE.
>  */
>
> +#include <kunit/visibility.h>
> +
> #include <linux/debugfs.h>
> #include <linux/iopoll.h>
>
> @@ -1888,8 +1890,9 @@ static bool reduce_link_params(struct intel_dp *intel_dp, const struct intel_crt
> 	return new_found;
> }
>
> -static int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
> -						   const struct intel_crtc_state *crtc_state)
> +VISIBLE_IF_KUNIT
> +int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
> +					    const struct intel_crtc_state *crtc_state)
> {
> 	struct intel_display *display = to_intel_display(intel_dp);
> 	struct intel_dp_link_caps *link_caps = intel_dp->link.caps;
> @@ -2813,3 +2816,32 @@ void intel_dp_link_training_cleanup(struct intel_dp_link_training *link_training
> {
> 	kfree(link_training);
> }
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
> #include <drm/display/drm_dp_helper.h>
>
> +#include "intel_dp_link_caps.h"
> +
> struct intel_atomic_state;
> struct intel_connector;
> struct intel_crtc_state;
> @@ -71,4 +73,33 @@ void intel_dp_link_training_reset(struct intel_dp_link_training *link_training);
> struct intel_dp_link_training *intel_dp_link_training_init(struct intel_dp *intel_dp);
> void intel_dp_link_training_cleanup(struct intel_dp_link_training *link_training);
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
> #endif /* __INTEL_DP_LINK_TRAINING_H__ */
> diff --git a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> index aa5358c94839f..b77472e9bbe12 100644
> --- a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> +++ b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> @@ -17,6 +17,8 @@
> #include "intel_connector.h"
> #include "intel_display_core.h"
> #include "intel_display_types.h"
> +#include "intel_dp_link_caps.h"
> +#include "intel_dp_link_training.h"
>
> struct test_ctx {
> 	struct {
> @@ -30,6 +32,9 @@ struct test_ctx {
> 		struct intel_crtc_state crtc_state;
> 	} dev;
>
> +	const struct intel_dp_link_caps_test_ops *link_caps_ops;
> +	const struct intel_dp_link_training_test_ops *link_training_ops;
> +
> 	struct rnd_state rnd;
> };
>
> @@ -64,6 +69,8 @@ static int intel_dp_link_test_init(struct kunit *test)
> 	intel_dp = &dig_port->dp;
> 	intel_dp->attached_connector = &test_ctx.dev.connector;
>
> +	intel_dp->link.caps = test_ctx.link_caps_ops->init(intel_dp);
> +
> 	test->priv = &test_ctx;
>
> 	return 0;
> @@ -71,10 +78,20 @@ static int intel_dp_link_test_init(struct kunit *test)
>
> static void intel_dp_link_test_exit(struct kunit *test)
> {
> +	struct test_ctx *ctx = test->priv;
> +
> +	ctx->link_caps_ops->cleanup(ctx->dev.dig_port.dp.link.caps);
> }
>
> static int intel_dp_link_test_suite_init(struct kunit_suite *test_suite)
> {
> +#ifdef I915
> +	test_ctx.link_caps_ops = &i915_display_dp_link_caps_test_ops;
> +	test_ctx.link_training_ops = &i915_display_dp_link_training_test_ops;
> +#else
> +	test_ctx.link_caps_ops = &intel_display_dp_link_caps_test_ops;
> +	test_ctx.link_training_ops = &intel_display_dp_link_training_test_ops;
> +#endif
> 	prandom_seed_state(&test_ctx.rnd, 0);
>
> 	return 0;
> -- 
> 2.49.1
>
>
--8323329-705612368-1783162356=:605841--
