Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65689D5C0C0
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 12:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289C110E252;
	Fri,  8 Nov 2024 12:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVQDoWf1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C04F10E252
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731068229; x=1762604229;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=MOTaderPfdg5Nc7FoNjdSuxpdAVov8l0YthHu/MCISY=;
 b=DVQDoWf171yI67wxfaO2frZG3a02aYlss0HgzXApo6QK08GIKV7fCKyB
 8Y/HlbD7EgLo/oyhipPjVZO6DoszSYdaiyznluiqRmQ2rDunK+Z6TK6t4
 ZM3oLM6zNT6cz02sgHWm50WJPlWbjNrtNfdcRGXgEXQkm+nJFa+y5O3Sm
 nxOmDR7B6A0ecKjlSqUrFa9YaMxVInyNUWb0y9q9CiReyXqNHORCfwTqr
 9IFBaiQfFq5mqXFn2FD1MUyJJLEK7iHO/m1ayzCStn7D02kGd6ZjdOWEU
 c5bKYxWKNiSjQvqz03e4lBeMc12TXWRM3UJEHaLpAxEJ8kZiBhBXeWrF+ Q==;
X-CSE-ConnectionGUID: bIddC6HUQ5++3VcmFoC1hg==
X-CSE-MsgGUID: bPUM5okPRAKgRL9r6O8REw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30346957"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="30346957"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 04:17:09 -0800
X-CSE-ConnectionGUID: KsXeT8PYSYieKP/VGYz5pQ==
X-CSE-MsgGUID: JeNwZH6rRAaCdVtgJyLjLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="90349689"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 08 Nov 2024 04:17:08 -0800
Received: from [10.246.2.138] (mwajdecz-MOBL.ger.corp.intel.com [10.246.2.138])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id F334328167
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 12:17:06 +0000 (GMT)
Message-ID: <db205fab-bc54-41c2-8645-ff8aa85ec387@intel.com>
Date: Fri, 8 Nov 2024 13:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_PF=3A_Add_suppor?=
 =?UTF-8?Q?t_for_VF_scheduling_priority_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20241106151301.2079-1-michal.wajdeczko@intel.com>
 <173100716634.1423778.15413621307728445633@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173100716634.1423778.15413621307728445633@2413ebb6fbb6>
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



On 07.11.2024 20:19, Patchwork wrote:
> == Series Details ==
> 
> Series: PF: Add support for VF scheduling priority (rev2)
> URL   : https://patchwork.freedesktop.org/series/140401/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2176-49ab426a234910391d809d835166fdaddb8d1a70_full -> xe-pw-140401v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-140401v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-140401v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-140401v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

all unrelated, all from KMS, not touched by this series

> 
>   * igt@kms_big_fb@linear-32bpp-rotate-180:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] +2 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2176-49ab426a234910391d809d835166fdaddb8d1a70/shard-lnl-6/igt@kms_big_fb@linear-32bpp-rotate-180.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140401v2/shard-lnl-7/igt@kms_big_fb@linear-32bpp-rotate-180.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140401v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140401v2/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html
> 
