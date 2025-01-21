Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF05C02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 20:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FDB10E212;
	Tue, 21 Jan 2025 20:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PptuX2Nx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2A710E212;
 Tue, 21 Jan 2025 20:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737492307; x=1769028307;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=PHOrqPZeKbkoU0RFnDDiGNUWuurrRl/NejNZIwElIdQ=;
 b=PptuX2NxKaEMU2AmSKC5E5++4TWb6BFYKSSc3qNNs0k5pPu7ScnPgtPo
 bMZ98xx1turMuj0aptAJ9h5V0DbgL157M+m7YvPZpkvL8Fa/4LSO2m5Qa
 3xNkPPdOzQZmQUGayTX4m3TZRrhcppFolV5oQv71At7EKzwrDG5QEnxKj
 vmHqjhs17dGvOE/4IRAXUu+p+f9EmZKiuMJGZdzsWIPo6jG/YrZ6RFCGw
 dVo03OGzO65C5DYqsITBSTzNVwfPk888Uc6Gd6BUZdoo61lz2ZDN3oL1C
 3tHRHskof09NarJTTmuULLmtodb9XflwPwcan5eA3MtEdVTcNzvgSjL8J Q==;
X-CSE-ConnectionGUID: CsOowA8STOu2G21HA2fRsg==
X-CSE-MsgGUID: 410IMkBVThCwEVB/4xL73w==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48522388"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="48522388"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 12:45:07 -0800
X-CSE-ConnectionGUID: D697mt4GRq+jB4KzlkRoZA==
X-CSE-MsgGUID: oLNeBncPRWeVljqJF+FqEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="130213508"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 21 Jan 2025 12:45:05 -0800
Received: from [10.245.80.89] (mwajdecz-MOBL.ger.corp.intel.com [10.245.80.89])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0BB6932CA9;
 Tue, 21 Jan 2025 20:45:03 +0000 (GMT)
Message-ID: <d662849e-a3cc-4f68-a581-9b567a9f195a@intel.com>
Date: Tue, 21 Jan 2025 21:45:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Fix_sizeof=2832=29_typo?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250121094832.588-1-michal.wajdeczko@intel.com>
 <173747831846.2649833.5021404524478257751@b555e5b46a47>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173747831846.2649833.5021404524478257751@b555e5b46a47>
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



On 21.01.2025 17:51, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/guc: Fix sizeof(32) typo
> URL   : https://patchwork.freedesktop.org/series/143787/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2518-bb123c6e757601d42f71952d879b35f97472d56b_full -> xe-pw-143787v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-143787v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-143787v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-143787v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@crc:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2518-bb123c6e757601d42f71952d879b35f97472d56b/shard-bmg-8/igt@kms_async_flips@crc.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143787v1/shard-bmg-7/igt@kms_async_flips@crc.html
>     - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2518-bb123c6e757601d42f71952d879b35f97472d56b/shard-dg2-435/igt@kms_async_flips@crc.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143787v1/shard-dg2-463/igt@kms_async_flips@crc.html
> 
>   * igt@kms_atomic@plane-primary-legacy@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][5] +1 other test dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143787v1/shard-bmg-1/igt@kms_atomic@plane-primary-legacy@pipe-a-dp-2.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
>     - shard-lnl:          [PASS][6] -> [FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2518-bb123c6e757601d42f71952d879b35f97472d56b/shard-lnl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143787v1/shard-lnl-7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a1:
>     - shard-adlp:         [PASS][8] -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2518-bb123c6e757601d42f71952d879b35f97472d56b/shard-adlp-2/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a1.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143787v1/shard-adlp-9/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][10]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143787v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
> 
>   * igt@kms_plane_multiple@tiling-none:
>     - shard-bmg:          [PASS][11] -> [DMESG-WARN][12] +22 other tests dmesg-warn
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2518-bb123c6e757601d42f71952d879b35f97472d56b/shard-bmg-2/igt@kms_plane_multiple@tiling-none.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143787v1/shard-bmg-1/igt@kms_plane_multiple@tiling-none.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
>     - shard-adlp:         [PASS][13] -> [DMESG-WARN][14] +4 other tests dmesg-warn
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2518-bb123c6e757601d42f71952d879b35f97472d56b/shard-adlp-9/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143787v1/shard-adlp-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
> 

all KMS
all unrelated

