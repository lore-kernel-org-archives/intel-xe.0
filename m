Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A80E75426
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 12:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDE810E2CB;
	Tue,  3 Oct 2023 12:08:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466C710E1DB;
 Tue,  3 Oct 2023 12:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696334881; x=1727870881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XZxscxmuTTzfz2zC1EXs/MM9242ykF5j1JXprb8mgN8=;
 b=UAOO9ZxsJd8WT+pfG21WFOiTKA4NP0ieyUTDepT1LOBIITPS7JaSetjw
 8RJwkixYbYuZjqA1u0LpSfSBFtIgomkD697O4+vIqjNx8+nXUWNXUI+Dh
 vwTdkrLb3Yr56vwFHDol+fi+XQLNqNALrwr+jzMeRzqFo2MIX2CbRQO6v
 DrHcxg4bwAsx/hDEnt3QK5ERDQEiHRzSn+oOkREYmfhm2vzfcfHmLIPda
 F+0ziL/aZ0g14MNwIIHNWC3bm2FA6Z2LU81DZ76ZXsldhHzerNwY7PO/v
 /LgkEB2Lasyp5laWbNxomtdg/HOzIfq1oqfHkDNjapG5svoK3kEhAlatE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="380136066"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="380136066"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 05:07:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="924632945"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="924632945"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.28.215])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 05:07:40 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 03 Oct 2023 14:07:39 +0200
Message-ID: <2298859.ElGaqSPkdT@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <169632954821.4383.8893621095534790285@emeril.freedesktop.org>
References: <20231003091044.407965-11-janusz.krzysztofik@linux.intel.com>
 <169632954821.4383.8893621095534790285@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Kunit_f?=
 =?utf-8?q?ixes_and_improvements?=
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
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tuesday, 3 October 2023 12:39:08 CEST Patchwork wrote:
> == Series Details ==
> 
> Series: Kunit fixes and improvements
> URL   : https://patchwork.freedesktop.org/series/124554/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7508_BAT -> XEIGTPW_9910_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_9910_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_9910_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_9910_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_live_ktest@bo:
>     - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +2 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7508/bat-dg2-oem2/igt@xe_live_ktest@bo.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/bat-dg2-oem2/igt@xe_live_ktest@bo.html

These IGT side changes require kunit on the kernel side to be built as a 
module, while CI Xe specific kconfig makes it built into the kernel.  I've 
asked CI support what we should do to fix that.

Thanks,
Janusz

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_9910_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - bat-dg2-oem2:       [FAIL][3] ([Intel XE#480]) -> [PASS][4] +1 other test pass
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7508/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * {igt@xe_create@create-execqueues-noleak}:
>     - bat-adlp-7:         [FAIL][5] ([Intel XE#524]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7508/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7508 -> IGTPW_9910
>   * Linux: xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313 -> xe-410-02ab43e36623665d8644d46162bd4ec5eeb68489
> 
>   IGTPW_9910: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9910/index.html
>   IGT_7508: f366406b05ca6b3d16eaa734a91e0833bd159f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313: 22fcf2404f56a8e7aea6734298e0b2b265136313
>   xe-410-02ab43e36623665d8644d46162bd4ec5eeb68489: 02ab43e36623665d8644d46162bd4ec5eeb68489
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9910/index.html
> 




