Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE81C47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 19:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983E510FC73;
	Wed, 31 Jan 2024 19:22:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76B710FBFB;
 Wed, 31 Jan 2024 19:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706728959; x=1738264959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/IKw8VvmkZ7sPEzdGJ5kdhJnVI5t9cbfZUqHHCr1T+g=;
 b=ZxP4833uwfr+Khi0cET/AgWmF/VovsaPVAGw+7q4PNKm4gy3kujhLGNL
 6nAt/4+pSZP/QzNQTlqQaxeH2bYG7frmkl2lXiJ1GMvcOnEaZsqJU+XkT
 LzPs4HSt9euhZIVSo+dgH7WVL7U7vleRfazDIIaPoTiBu5HjEI4wtjMGp
 EZnzTj86PKl3YFz5WDmMG0uZSDWjfuA7dWDcahzTNUmjdomzoPV3MF9Me
 PyXxaZJ7mO6h+BmLJUYw3nHWATZhr6ksswKj5qLkplKt4O2IfMjhjOIpD
 RAc1lH3+SrgfHO8nbKiQaCysYZyN1/py+QhlTNdtcYY8wFgN7EETYB0Lz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="394143683"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="394143683"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 11:22:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="4140284"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.2.5])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 11:22:38 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: =?UTF-8?B?4pyX?= CI.xeBAT: failure for lib/kunit: Support writable
 filter* parameters of kunit module (rev2)
Date: Wed, 31 Jan 2024 20:22:35 +0100
Message-ID: <13441462.dW097sEU6C@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <170672621780.878359.16320506199099182638@5338d5abeb45>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
 <170672621780.878359.16320506199099182638@5338d5abeb45>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wednesday, 31 January 2024 19:36:57 CET Patchwork wrote:
> == Series Details ==
> 
> Series: lib/kunit: Support writable filter* parameters of kunit module 
(rev2)
> URL   : https://patchwork.freedesktop.org/series/129174/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7699_BAT -> XEIGTPW_10613_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_10613_BAT absolutely need to 
be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_10613_BAT, please notify your bug team (I915-ci-
infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in 
CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in 
XEIGTPW_10613_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_live_ktest@bo:
>     - bat-adlp-7:         [PASS][1] -> [SKIP][2] +2 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/
igt@xe_live_ktest@bo.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10613/bat-adlp-7/
igt@xe_live_ktest@bo.html

Hi Lucas,

We've got an empty list of test cases because the current algorithm of IGT 
KUnit implementation expects subtest name provided via struct kunit_tests 
to be the same as name of a test suite provided by the KUnit test module.  As 
a special case, if the module provides only one test suite (most do) and the 
name of it is the same as the module name with the _test or _kunit suffix 
truncated (also the most common case) then subtest name may be omitted (i.e., 
.name field may be NULL).

I have to document the above, but we also have to use the same names on both 
sides (KUnit test module and its corresponding IGT test).  Now we don't, e.g. 
test suite named "xe_bo" is provided by xe_bo_test module while subtest name 
"bo" is specified for that module in IGT xe_live_ktest.

Thanks,
Janusz

> 
>   * igt@xe_live_ktest@migrate:
>     - bat-pvc-2:          [PASS][3] -> [SKIP][4] +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-pvc-2/
igt@xe_live_ktest@migrate.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10613/bat-pvc-2/
igt@xe_live_ktest@migrate.html
>     - bat-dg2-oem2:       [PASS][5] -> [SKIP][6] +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/
igt@xe_live_ktest@migrate.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10613/bat-dg2-oem2/
igt@xe_live_ktest@migrate.html
>     - bat-atsm-2:         [PASS][7] -> [SKIP][8] +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-atsm-2/
igt@xe_live_ktest@migrate.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10613/bat-atsm-2/
igt@xe_live_ktest@migrate.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_10613_BAT that come from known 
issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@invalid-set-prop:
>     - bat-adlp-7:         [PASS][9] -> [SKIP][10] ([i915#6077]) +30 other 
tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/
igt@kms_addfb_basic@invalid-set-prop.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10613/bat-adlp-7/
igt@kms_addfb_basic@invalid-set-prop.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - bat-adlp-7:         [PASS][11] -> [SKIP][12] ([Intel XE#1219]) +9 
other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/
igt@kms_flip@basic-flip-vs-dpms.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10613/bat-adlp-7/
igt@kms_flip@basic-flip-vs-dpms.html
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - bat-adlp-7:         [PASS][13] -> [SKIP][14] ([Intel XE#540]) +3 other 
tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/
igt@kms_force_connector_basic@force-connector-state.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10613/bat-adlp-7/
igt@kms_force_connector_basic@force-connector-state.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-adlp-7:         [PASS][15] -> [SKIP][16] ([Intel XE#829]) +6 other 
tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/
igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10613/bat-adlp-7/
igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_prop_blob@basic:
>     - bat-adlp-7:         [PASS][17] -> [SKIP][18] ([Intel XE#780])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/
igt@kms_prop_blob@basic.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10613/bat-adlp-7/
igt@kms_prop_blob@basic.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_module_load@load:
>     - bat-pvc-2:          [SKIP][19] ([Intel XE#378]) -> [PASS][20]
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-pvc-2/
igt@xe_module_load@load.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10613/bat-pvc-2/
igt@xe_module_load@load.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-adlp-7:         [SKIP][21] ([Intel XE#455]) -> [SKIP][22] ([Intel 
XE#1219])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/
igt@kms_dsc@dsc-basic.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10613/bat-adlp-7/
igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         [DMESG-FAIL][23] ([Intel XE#1033]) -> [SKIP][24] 
([Intel XE#783])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/
igt@kms_frontbuffer_tracking@basic.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10613/bat-adlp-7/
igt@kms_frontbuffer_tracking@basic.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when 
computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1219]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1219
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
>   [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
>   [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
>   [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>   [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7699 -> IGTPW_10613
>   * Linux: xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457 -> 
xe-711-8327dc2a5a26f82a8700035c6259f57e9299d6a2
> 
>   IGTPW_10613: 10613
>   IGT_7699: 7699
>   xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457: 
c655e0fd28045dbaa581d04bf7cc266eec1c3457
>   xe-711-8327dc2a5a26f82a8700035c6259f57e9299d6a2: 
8327dc2a5a26f82a8700035c6259f57e9299d6a2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10613/
index.html
> 




