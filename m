Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F39FC3DA5D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 09:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EC410E47D;
	Mon, 22 Jul 2024 09:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVsMQi4P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC6410E47D
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 09:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721642335; x=1753178335;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=/vApR7044264J/F29U8LsCVTy2iWB22VGcHxI8hlkdA=;
 b=AVsMQi4PBgXji48zImFbF0WNXSwvK301FPWqBBbC0pro7i28z3mWEW4i
 2WnWbTbtPzyDt8GokXIwHZkNTgtVaxzBCm0vhFd2Gr8TwxBsZHDtqe5v6
 6YnrwjgmPektFBl9XLmQ/ZEGeu+lZbBqHpvxPIIY0ycD/MpOuHebSmvty
 HL8MmHDd358l4K8/uhnd+W/GrnkgSQ74Xe5sGWqMY1d8AGSrxE2ZBKUzc
 QSq6H8CgYoQi2lG5pi5Os4q0OFiTvsK1uABqrKJWk1hU5KYduDN0tXxQe
 2suMATGoTE5WtSgN4+GdjIOpkt2Oer1uVhg8jSsjjdDT0mczbddmfuUxQ g==;
X-CSE-ConnectionGUID: 9FyRNuuPQJKAqV/EouMwGw==
X-CSE-MsgGUID: uadPGzdqTX+7nka8Z1WbMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="30357800"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="30357800"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 02:58:55 -0700
X-CSE-ConnectionGUID: FkLvHXMbR86ULIDt4FQY8A==
X-CSE-MsgGUID: GChQjeCmQYiz+Zf66IwDow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="51559890"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 22 Jul 2024 02:58:53 -0700
Received: from [10.246.48.141] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.48.141])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CCF0528184
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 10:58:52 +0100 (IST)
Message-ID: <86629cc8-bef4-4704-8cf5-bfed724c92e8@intel.com>
Date: Mon, 22 Jul 2024 11:58:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_Convert_live_test?=
 =?UTF-8?Q?s_to_parameterized_style_=28rev3=29?=
To: intel-xe@lists.freedesktop.org
References: <20240720142528.530-1-michal.wajdeczko@intel.com>
 <172148816752.308938.17470269550639554812@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172148816752.308938.17470269550639554812@2413ebb6fbb6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 20.07.2024 17:09, Patchwork wrote:
> == Series Details ==
> 
> Series: Convert live tests to parameterized style (rev3)
> URL   : https://patchwork.freedesktop.org/series/136163/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f_BAT -> xe-pw-136163v3_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-136163v3_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-136163v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (7 -> 7)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-136163v3_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - bat-lnl-1:          [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

expected, as result of proper reporting of the SKIP:

[]     # xe_bo_evict_kunit: Skipping non-discrete device 0000:00:02.0.
[]     ok 1 xe_bo_evict_kunit

vs

[]         ok 1 0000:00:02.0 # SKIP non-discrete device
[]     ok 1 xe_bo_evict_kunit # SKIP


> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - bat-pvc-2:          [PASS][3] -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

[]     # xe_ccs_migrate_kunit: Skipping non-flat-ccs device.
[]     ok 1 xe_ccs_migrate_kunit

vs

[]         ok 1 0000:aa:00.0 # SKIP non-flat-ccs device
[]     ok 1 xe_ccs_migrate_kunit # SKIP


>     - bat-adlp-7:         [PASS][5] -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

[]     # xe_ccs_migrate_kunit: Skipping non-flat-ccs device.
[]     ok 1 xe_ccs_migrate_kunit

vs

[]         ok 1 0000:00:02.0 # SKIP non-flat-ccs device
[]     ok 1 xe_ccs_migrate_kunit # SKIP

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - {bat-lnl-2}:        [PASS][7] -> [SKIP][8] +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - {bat-bmg-1}:        [PASS][9] -> [SKIP][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * {igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit}:
>     - bat-pvc-2:          [PASS][11] -> [SKIP][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>     - bat-dg2-oem2:       [PASS][13] -> [SKIP][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>     - bat-atsm-2:         [PASS][15] -> [SKIP][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>     - bat-lnl-1:          [PASS][17] -> [SKIP][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>     - bat-adlp-7:         [PASS][19] -> [SKIP][20]
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-136163v3_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@xe_live_ktest@xe_bo:
>     - bat-adlp-7:         [PASS][21] -> [SKIP][22] ([Intel XE#455]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - bat-lnl-1:          [FAIL][23] ([Intel XE#886]) -> [PASS][24] +1 other test pass
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f -> xe-pw-136163v3
> 
>   IGT_7933: 7933
>   xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f: 51eaf1afceb400cf4fe9ed1147dffccc4cc8204f
>   xe-pw-136163v3: 136163v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/index.html
> 
