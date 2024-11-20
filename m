Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC9ED6395B
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 14:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A5810E28C;
	Wed, 20 Nov 2024 14:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0hUu0bo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0679E10E013;
 Wed, 20 Nov 2024 14:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732111365; x=1763647365;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=UocC8UkiyMlGT5OAEt1y978NBn8Okj0z2cJce80v2dk=;
 b=M0hUu0boo3oubgc6SKUKKcuZvObpnpVZj4Gmw9qhm9XR1B9frCUvmRvH
 gLezJqRlNKSMJ9X92tfnPOrBMl1ybVjfZGuLAWggdVGTPfSk6Q/KeyvMy
 YMteYdSElqY5yHPchF+TNsa/ABENplanwJsagwUAG4RVvaBCCkDRNwrJb
 B1kZgfxD3n2bP2hZs1QgMvPnGS+8Tm2384YZOU5Gzb3R5Zr5++NaZzb4J
 TMc1Jl5GkOljYgDgs435eQlAF3msnXyC6seKpfI9MZK0ny6SzerPp/cWo
 hkzNrPRCTEIBgkUyU+NiIXk7RSOP141WFbFbj3S7lXWI3neloKzTC2o2U g==;
X-CSE-ConnectionGUID: Qb1LToSSSLOoyjsEgIyQHw==
X-CSE-MsgGUID: 9lz8zKeBR5qgQ0M1S15oyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="43235876"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="43235876"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 06:02:34 -0800
X-CSE-ConnectionGUID: 3fAGkwQATx+mosqwT+LvSg==
X-CSE-MsgGUID: C/3+nB0dQL+RlhJEI4h+5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="127463698"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 06:02:34 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= CI.BAT: failure for drm/i915: MST and DDI
 cleanups and refactoring (rev3)
In-Reply-To: <173211120756.722476.1061959015010963380@b555e5b46a47>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1732106557.git.jani.nikula@intel.com>
 <173211120756.722476.1061959015010963380@b555e5b46a47>
Date: Wed, 20 Nov 2024 16:02:30 +0200
Message-ID: <87o72a0zrd.fsf@intel.com>
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

On Wed, 20 Nov 2024, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> == Series Details ==
>
> Series: drm/i915: MST and DDI cleanups and refactoring (rev3)
> URL   : https://patchwork.freedesktop.org/series/141501/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed_BAT -> xe-pw-141501v3_BAT
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-141501v3_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-141501v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   
>
> Participating hosts (9 -> 9)
> ------------------------------
>
>   No changes in participating hosts
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in xe-pw-141501v3_BAT:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@kms_psr@psr-primary-page-flip@edp-1:
>     - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html

Unrelated, please re-report.

Please also add the Reply-To: I915-ci-infra@lists.freedesktop.org header
to the mails.


>
>   
> Known issues
> ------------
>
>   Here are the changes found in xe-pw-141501v3_BAT that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3517])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
>
>   * igt@kms_psr@psr-cursor-plane-move:
>     - bat-adlp-7:         [PASS][5] -> [SKIP][6] ([Intel XE#3443] / [Intel XE#455]) +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
>
>   
> #### Warnings ####
>
>   * igt@xe_exec_fault_mode@many-basic:
>     - bat-lnl-1:          [DMESG-FAIL][7] ([Intel XE#3466]) -> [INCOMPLETE][8] ([Intel XE#3466])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed/bat-lnl-1/igt@xe_exec_fault_mode@many-basic.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/bat-lnl-1/igt@xe_exec_fault_mode@many-basic.html
>
>   
>   [Intel XE#3443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443
>   [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
>   [Intel XE#3517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>
>
> Build changes
> -------------
>
>   * Linux: xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed -> xe-pw-141501v3
>
>   IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2255-6992ee4b9cd5a553e6e429e58b97abedf546e3ed: 6992ee4b9cd5a553e6e429e58b97abedf546e3ed
>   xe-pw-141501v3: 141501v3
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141501v3/index.html

-- 
Jani Nikula, Intel
