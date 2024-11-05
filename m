Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE343D2C114
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 14:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAAE10E042;
	Tue,  5 Nov 2024 14:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDr0H20M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2D810E042
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 14:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730818100; x=1762354100;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=SBR0JFBv/glQ02Ev3yuRC+aBzvSTTR3+/NvJvFUwMac=;
 b=MDr0H20MfKr4sQ1AIyii7i1xSA3NpvQSUN36oHTI1rsABI6AJaTVxyhT
 S1N7GUNRVCMqLKzSHhVuKpuPnBCgtlBNTz/SM5mukvoAXYZWurK+iKZIS
 NAvClNCefGlt29OFMYNmSZh2ZafIqUT5sQcENdaOb+S7xMSv8MeV25EPZ
 BaepYH/r5ezooxHLhIcZlTg/ZwHK+AmxeLwW6H8lp4MBSh3us2q0HeTKd
 j2Pkdr8YiS8Nz9Q5QiJUR/q8rOnuajROsToCf0fD8dpsSbKW19IG2Gdjh
 vjn7D9ozClBKS07m77jfWbva/RaqixT5pwgLHSv9jFdYLW9EfBjJTVQhQ g==;
X-CSE-ConnectionGUID: ce2BeBkqSUOLaEhM310pLQ==
X-CSE-MsgGUID: ZqUP1sHkRT69OvNujQ5sMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30742283"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30742283"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 06:48:19 -0800
X-CSE-ConnectionGUID: 5foZAYcwQsm3frwozaD7zg==
X-CSE-MsgGUID: Ep7Y+VMORMGB/0AVeXrtUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="84143925"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2024 06:48:18 -0800
Received: from [10.245.120.199] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.120.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1F0022FC43
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 14:48:17 +0000 (GMT)
Message-ID: <de154074-6062-4735-8b70-5952bfd9bd28@intel.com>
Date: Tue, 5 Nov 2024 15:48:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/pf=3A_Fix?=
 =?UTF-8?Q?_potential_GGTT_allocation_leak?=
To: intel-xe@lists.freedesktop.org
References: <20241104144901.1903-1-michal.wajdeczko@intel.com>
 <173076692070.1409781.8767785881855972471@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173076692070.1409781.8767785881855972471@2413ebb6fbb6>
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



On 05.11.2024 01:35, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Fix potential GGTT allocation leak
> URL   : https://patchwork.freedesktop.org/series/140881/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f_full -> xe-pw-140881v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-140881v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-140881v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-140881v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

all unrelated, from non-SRIOV platforms

> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
>     - shard-lnl:          [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140881v1/shard-lnl-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
> 
>   * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1:
>     - shard-lnl:          [PASS][3] -> [FAIL][4] +2 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-7/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140881v1/shard-lnl-3/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][5] +1 other test fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140881v1/shard-dg2-434/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [FAIL][6] ([Intel XE#1242]) -> [DMESG-FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140881v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   
