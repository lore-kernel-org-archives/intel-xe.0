Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF758E77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 20:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632C610E486;
	Tue, 14 Jan 2025 20:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/VlHlUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE2C10E0A1
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 20:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736887241; x=1768423241;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=uYIBmMObNK+dtT9UqO/mPmKNxBNJYvhgodDBE4ME1mA=;
 b=Z/VlHlUNXorBrXy4GpP2Df30Yc7/BfwMi2LYU7NcXs0/Q8aS4HkdK/Ty
 LWjb1dr1ICKJ/VVKy3ZYXCmh0FC8SQkSlPsscXcpquRJuVcW9flnWL0kQ
 tjyrk0SI6Xq5OjE4oAE3HqoJBhE64pu6Myd6itlB5fdc3Q5QMzDP/IDHi
 QgbBS/ATk8NaVAeImsCm9hfCv1yWrzND3Ky8jcVg/UgP9uaL0neQE/dxn
 Dj2nIrmg2yN45YzKUyNGiLPeKarcETVOhmsuPxokZyUVy3KkXII9+qvdn
 zciVO9DNAwvkgZ5QeSN8TLFWkYHV4JpVOEFuDHpNVHAbIQu10a8ig1iZO g==;
X-CSE-ConnectionGUID: 6Xki8fMGTtedGRxvLjkp9Q==
X-CSE-MsgGUID: /eyTOXf6QzqZb0djPkW2Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="48203626"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="48203626"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 12:40:41 -0800
X-CSE-ConnectionGUID: cxvrcbR+Q+2jCUdIDzkFlg==
X-CSE-MsgGUID: Y6PPvUtRROqR3u/3ag/DoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="109885103"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 14 Jan 2025 12:40:39 -0800
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6B41A2FC43
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 20:40:38 +0000 (GMT)
Message-ID: <516af8c7-47b2-4578-a964-f983cd51ac03@intel.com>
Date: Tue, 14 Jan 2025 21:40:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_VF=3A_Fix_early_?=
 =?UTF-8?Q?read_of_GDMID?=
To: intel-xe@lists.freedesktop.org
References: <20241114175955.2299-1-michal.wajdeczko@intel.com>
 <173168324520.285105.17059700662955163503@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173168324520.285105.17059700662955163503@2413ebb6fbb6>
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



On 15.11.2024 16:07, Patchwork wrote:
> == Series Details ==
> 
> Series: VF: Fix early read of GDMID
> URL   : https://patchwork.freedesktop.org/series/141367/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2232-4018ba30ba2cc7bcbaed85dd5e77a506dd911b6d_full -> xe-pw-141367v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-141367v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-141367v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-141367v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

all KMS, all unrelated

> 
>   * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-edp-1:
>     - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2232-4018ba30ba2cc7bcbaed85dd5e77a506dd911b6d/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v1/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-edp-1.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2232-4018ba30ba2cc7bcbaed85dd5e77a506dd911b6d/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][5] -> [FAIL][6] +5 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2232-4018ba30ba2cc7bcbaed85dd5e77a506dd911b6d/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_pm_rpm@cursor-dpms:
>     - shard-bmg:          [PASS][7] -> [INCOMPLETE][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2232-4018ba30ba2cc7bcbaed85dd5e77a506dd911b6d/shard-bmg-4/igt@kms_pm_rpm@cursor-dpms.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v1/shard-bmg-8/igt@kms_pm_rpm@cursor-dpms.html
> 
>   
