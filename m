Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7EBC5B572
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 14:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BC910E564;
	Wed, 19 Aug 2026 14:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcW9EarK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A6110E559;
 Wed, 19 Aug 2026 14:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787148503; x=1818684503;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=Q0FhilOd3XmEr38yshmXJnU9ZUXGg51f4SY/WRET1UY=;
 b=GcW9EarKBu4i9iKL1hW2/shbD2Rm0FYWzuMp7j1x90qw9vR/0JpUT/WB
 +92phQ6tWyq7XXae1izoXepKwL7C7JWA6Nh7siPH1B9aVnAluCG/BLaS7
 DQcmcnrVIrYTLiKYVRcgk6VkkP/XYldGsxMgvi5WcBU/P8qZonMoaIVHZ
 bN/nii8ySmWP1euFhyKIk/l2ambe+iCpfokcEPrC/2cftaTaFfFb7MELr
 Rupd3OhFVwZF0KNjNs/GsFLH3m+Hs7OTFcCiSqodGdU/OFL3NZUcWBkNA
 lOvw3FS0T5XXRhqVeFD8YQyL0r/AH1bIKGK4ymvZEkKds+M70bOlQr0WC w==;
X-CSE-ConnectionGUID: NKJRKwTDTGGTKtSGwnyk2w==
X-CSE-MsgGUID: ExpCjYRiT8yH3fmxju3ZCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87686969"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87686969"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:08:22 -0700
X-CSE-ConnectionGUID: XyOdFZSaRh2IhzU37JaGUA==
X-CSE-MsgGUID: Sh+TUQGkTDSca3GwXD4UWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="263817167"
Received: from dev-417.igk.intel.com (HELO devbox) ([10.91.214.181])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:08:20 -0700
Date: Wed, 19 Aug 2026 16:08:18 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
cc: intel-gfx@lists.freedesktop.org, alex.zuo@intel.com, imre.deak@intel.com, 
 michal.grzelak@intel.com, jani.nikula@linux.intel.com, 
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/i915/kunit: DP Link: Use if statements instead
 of for loops
In-Reply-To: <20260812141300.184053-1-jonathan.cavitt@intel.com>
Message-ID: <1e26e6db-58ce-4f2a-37ee-f51394b4e041@intel.com>
References: <20260812141300.184053-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="8323329-1769235966-1787148501=:1253732"
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

--8323329-1769235966-1787148501=:1253732
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 12 Aug 2026, Jonathan Cavitt wrote:
> The static functions get_target_config and get_fallback_config in
> intel_dp_link_test.c use for loops to determine if the requested index of
> the config set is in the bounds of the config set entry list.
>
> Reconfigure these functions to use if statements instead, as these for
> loops are only run for a single iteration.
>
> Issue caught by static analysis.
>
> v2: (Michal)
> - Change i <= 0 check to i == 0, as i cannot be negative by assertion
> - Remove unnecessary newlines
>
> v3:
> - Misc. checkpatch fixes
> - Resubmit to exercise target kunit test
>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Michal Grzelak <michal.grzelak@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>

CI on intel-xe@ doesn't run i915's KUnit tests so it is absent from CI's
report. Nevertheless, here's the report from running it manually on the
series:

[16:06:01] =============== intel_dp_link (17 subtests) ================
[16:06:01] [PASSED] intel_dp_link_caps_test_baseline
[16:06:01] [PASSED] intel_dp_link_caps_test_update_reset
[16:06:01] [PASSED] intel_dp_link_caps_test_update_rates_shrink
[16:06:01] [PASSED] intel_dp_link_caps_test_update_rates_shrink_disable
[16:06:01] [PASSED] intel_dp_link_caps_test_update_rates_expand
[16:06:01] [PASSED] intel_dp_link_caps_test_update_rates_expand_disable
[16:06:01] [PASSED] intel_dp_link_caps_test_update_lanes_shrink
[16:06:01] [PASSED] intel_dp_link_caps_test_update_lanes_shrink_disable
[16:06:01] [PASSED] intel_dp_link_caps_test_update_lanes_expand
[16:06:01] [PASSED] intel_dp_link_caps_test_update_lanes_expand_disable
[16:06:02] [PASSED] intel_dp_link_caps_test_update_params_shrink_random
[16:06:02] [PASSED] intel_dp_link_caps_test_update_params_shrink_disable_random
[16:06:02] [PASSED] intel_dp_link_caps_test_update_params_expand_random
[16:06:02] [PASSED] intel_dp_link_caps_test_update_params_expand_disable_random
[16:06:02] [PASSED] intel_dp_link_test_fallback_for_edp
[16:06:02] [PASSED] intel_dp_link_test_fallback_for_sst
[16:06:02] [PASSED] intel_dp_link_test_fallback_for_mst
[16:06:02] ================== [PASSED] intel_dp_link ==================
[16:06:02] ============================================================
[16:06:02] Testing complete. Ran 17 tests: passed: 17
[16:06:02] Elapsed time: 3.599s total, 0.001s configuring, 2.128s building, 1.440s running

Looks reasonable.

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>
Tested-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> ---
> .../i915/display/tests/intel_dp_link_test.c   | 34 ++++++++-----------
> 1 file changed, 15 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> index 67c6fe9f1812..608b7a9d60bf 100644
> --- a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> +++ b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> @@ -1215,22 +1215,20 @@ static bool get_fallback_config(const struct test_config_table *expected_table,
> 	struct kunit *test = expected_table->test;
> 	const struct link_config_set *config_set =
> 		get_fallback_configs_for_output_type(test, output_type);
> +	const struct intel_dp_link_config *config;
> 	int i;
>
> 	i = lookup_config(config_set, target_config);
> 	KUNIT_ASSERT_GE(test, i, 0);
>
> -	for (i--; i >= 0; i--) {
> -		const struct intel_dp_link_config *config =
> -			&config_set->entries[i];
> +	if (!i)
> +		return false;
>
> -		assert_config_is_supported(expected_table, config);
> -		*fallback_config = *config;
> +	config = &config_set->entries[i - 1];
> +	assert_config_is_supported(expected_table, config);
> +	*fallback_config = *config;
>
> -		return true;
> -	}
> -
> -	return false;
> +	return true;
> }
>
> static bool get_target_config(const struct test_config_table *expected_table,
> @@ -1240,19 +1238,17 @@ static bool get_target_config(const struct test_config_table *expected_table,
> 	struct kunit *test = expected_table->test;
> 	const struct link_config_set *config_set =
> 		get_target_configs_for_output_type(test, output_type);
> -	int i;
> +	const struct intel_dp_link_config *config;
> +	int i = config_set->size - 1;
>
> -	for (i = config_set->size - 1; i >= 0; i--) {
> -		const struct intel_dp_link_config *config =
> -			&config_set->entries[i];
> +	if (i < 0)
> +		return false;
>
> -		assert_config_is_supported(expected_table, config);
> -		*target = *config;
> +	config = &config_set->entries[i];
> +	assert_config_is_supported(expected_table, config);
> +	*target = *config;
>
> -		return true;
> -	}
> -
> -	return false;
> +	return true;
> }
>
> static void test_fallback_seq(struct kunit *test,
> -- 
> 2.53.0
>
>
--8323329-1769235966-1787148501=:1253732--
