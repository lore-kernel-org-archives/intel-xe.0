Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C6EC27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 14:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD3310E12A;
	Thu, 20 Jun 2024 14:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jp/PTqRM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050F510E12A
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 14:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718893801; x=1750429801;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=aIYQVyLJcpz8q4zibj/X29H4jHHHJ0pvjVckypltCFs=;
 b=jp/PTqRMw3/08uIv6ivtNK7a5ZcVrnUTaImtaxRe9JZwUDYhIgxOJNYu
 p0tGXiIcaUNwgvgWM0B8XAOI8tA1t+yd3vjvK9nkAivwvMnYoFRc41+2b
 wp1wayrLGXzscpFAPdW23yM+5QK1YDdaaIiWVFmUFSTHdrvA3+ZX2ej6U
 /y/Z6csv9f2PRMQq9F/EH7zI/udsC1TOxvVMi8mvFPXxZmbFE/lTi7AVI
 FYY5uGkJvoRu20xAceSXwP3Fmg16k3cOTpk3B32W2yDXMZ+nFj9lIOIpE
 SMotleOFx9KoNjmBNtbBTfJk+lxNBdThm02GhPhUfJxFkm6ngWCFVfFrI A==;
X-CSE-ConnectionGUID: B97Y+ao+R3mhLUGLcRFAuw==
X-CSE-MsgGUID: J3MgdqxHQIGB4j+ceB8csQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15582917"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="15582917"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 07:30:00 -0700
X-CSE-ConnectionGUID: DmgBlk9uQ364kSJHrFcJgw==
X-CSE-MsgGUID: FUoqNlcZTnaSj8cQSTxYTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="47198117"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 20 Jun 2024 07:29:59 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 67A51312D8
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 15:29:57 +0100 (IST)
Message-ID: <c8a56828-e969-4936-b715-440ff382da89@intel.com>
Date: Thu, 20 Jun 2024 16:29:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_Adapt_the_driver_?=
 =?UTF-8?Q?to_boot_on_the_VF_device_=28rev3=29?=
To: intel-xe@lists.freedesktop.org
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <171888077158.127478.9366256395087035922@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171888077158.127478.9366256395087035922@a6498e030952>
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



On 20.06.2024 12:52, Patchwork wrote:
> == Series Details ==
> 
> Series: Adapt the driver to boot on the VF device (rev3)
> URL   : https://patchwork.freedesktop.org/series/135080/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357_BAT -> xe-pw-135080v3_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-135080v3_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135080v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (5 -> 5)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-135080v3_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated, series is VF-only, not seen in almost identical rev2

> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +6 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

driver didn't load - see below

> 
>   * igt@xe_module_load@load:
>     - bat-dg2-oem2:       [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_module_load@load.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_module_load@load.html

<7> [334.075076] xe 0000:03:00.0: [drm:xe_pci_probe [xe]] SR-IOV
support: no (mode: none)
<5> [334.125269] xe 0000:03:00.0: [drm] GT0: Force wake domain 0 failed
to ack wake (-ETIMEDOUT) reg[0x130044] = 0x0
<3> [334.125285] xe 0000:03:00.0: probe with driver xe failed with error
-110
> 
>   
> #### Warnings ####
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-dg2-oem2:       [SKIP][5] ([Intel XE#455]) -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_psr@psr-cursor-plane-move:
>     - bat-dg2-oem2:       [SKIP][7] ([Intel XE#929]) -> [SKIP][8] +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-135080v3_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-dg2-oem2:       [PASS][9] -> [SKIP][10] ([Intel XE#1885])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@kms_addfb_basic@bad-pitch-128:
>     - bat-dg2-oem2:       [PASS][11] -> [SKIP][12] ([i915#2575]) +50 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
> 
>   * igt@xe_intel_bb@create-in-region:
>     - bat-dg2-oem2:       [PASS][13] -> [SKIP][14] ([Intel XE#1130]) +155 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - bat-dg2-oem2:       [PASS][15] -> [SKIP][16] ([Intel XE#455]) +5 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
>     - {bat-lnl-1}:        [FAIL][17] ([Intel XE#1069]) -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-dg2-oem2:       [SKIP][19] ([Intel XE#623]) -> [SKIP][20] ([i915#2575])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-dg2-oem2:       [SKIP][21] ([i915#5274]) -> [SKIP][22] ([i915#2575])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
>     - bat-dg2-oem2:       [SKIP][23] ([Intel XE#288]) -> [SKIP][24] ([Intel XE#1130]) +32 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - bat-dg2-oem2:       [SKIP][25] ([Intel XE#255]) -> [SKIP][26] ([Intel XE#1130])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - bat-dg2-oem2:       [SKIP][27] ([Intel XE#977]) -> [SKIP][28] ([Intel XE#1130])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - bat-dg2-oem2:       [SKIP][29] ([Intel XE#979]) -> [SKIP][30] ([Intel XE#1130]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357 -> xe-pw-135080v3
> 
>   IGT_7893: a1840ca4270b765883d3b71a710b6af85ded8235 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357: 65ef303b3a8a20609f394e0a823ade01cb4f1357
>   xe-pw-135080v3: 135080v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/index.html
> 
