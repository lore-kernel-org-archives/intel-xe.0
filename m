Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE93C3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 11:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F65110E8AE;
	Thu, 27 Mar 2025 11:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GD5SXEKU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD35010E8AE
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 11:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743075257; x=1774611257;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Bsq3qeZx7PMLZuVxnTxRAZwsyZACLy0eQZv2mSKDqYo=;
 b=GD5SXEKU+19gTVMeDiRrDUBKoA+ZH7I75ZPuqDe07aHm2sCbTT49pLHp
 d+K3x2D3HH6/wxWYCwlREf/6h0WPYX+Lg2quzZ2wHQqprZoo765w40CqH
 DCzl4hEI0Z1i2yRHKGDHad06l14J26ovE6JqHysfDi1FHO9qZuINM1mAT
 B0J60u71XnKGmQZWHj8oDuM5x4TWko2RBzYNtSdewbV+CmLGnOotHhdjk
 eDMHHvtCKAofiFuHImjg+AeIdKjbBCqd3CftHViYYGIXDcJM/tKDs9Jpf
 Ntde16BKTpkfo0I3fg0h/36FtUfG5oqVjDaCqxIgHB19l/MR7P+u2+7XL w==;
X-CSE-ConnectionGUID: oib/S0Y2QGmeBnDI2zukZg==
X-CSE-MsgGUID: HtvcsqvORFG+sb0LW80RmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55059670"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="55059670"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 04:34:16 -0700
X-CSE-ConnectionGUID: B3spq4MYQCeao5iJ6LLCIQ==
X-CSE-MsgGUID: PPFAXHxjQxq5x2j55dyEHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="124913402"
Received: from svamja-mobl1.gar.corp.intel.com (HELO [10.247.157.187])
 ([10.247.157.187])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 04:34:15 -0700
Message-ID: <9e25e0e7-7c35-41d8-baad-cb9110d38608@intel.com>
Date: Thu, 27 Mar 2025 17:04:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/migr?=
 =?UTF-8?Q?ate=3A_Switch_from_drm_to_dev_managed_actions?=
To: intel-xe@lists.freedesktop.org, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
References: <20250326151929.1495972-1-aradhya.bhatia@intel.com>
 <174307418548.10488.18028096142076320099@e6b6f09ec485>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
In-Reply-To: <174307418548.10488.18028096142076320099@e6b6f09ec485>
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

Hi,

On 27-03-2025 16:46, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/migrate: Switch from drm to dev managed actions
> URL   : https://patchwork.freedesktop.org/series/146811/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8_FULL -> xe-pw-146811v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-146811v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-146811v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-146811v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146811v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-lnl:          NOTRUN -> [SKIP][2] +5 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146811v1/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-adlp:         NOTRUN -> [SKIP][3] +4 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146811v1/shard-adlp-8/igt@kms_plane_multiple@2x-tiling-yf.html
>     - shard-bmg:          NOTRUN -> [SKIP][4] +2 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146811v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs (NEW):
>     - shard-dg2-set2:     NOTRUN -> [FAIL][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146811v1/shard-dg2-436/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
>     - shard-lnl:          NOTRUN -> [FAIL][6]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146811v1/shard-lnl-5/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
>     - shard-adlp:         NOTRUN -> [FAIL][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146811v1/shard-adlp-1/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
>     - shard-bmg:          NOTRUN -> [FAIL][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146811v1/shard-bmg-3/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [INCOMPLETE][9] ([Intel XE#2705]) -> [INCOMPLETE][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146811v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   

These possible regressions do not seem related to my patch.

Please go ahead with the merge. Thanks!

--
Regards
Aradhya


[snip]



