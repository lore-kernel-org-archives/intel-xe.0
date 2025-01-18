Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C201BC02185
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jan 2025 23:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAE510E292;
	Sat, 18 Jan 2025 23:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bMgIb4ae";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0446510E05C;
 Sat, 18 Jan 2025 23:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737244073; x=1768780073;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=/SicEuMSKd4/AxY3SgqnY+SuYUdihu55zgoiRwTZbCU=;
 b=bMgIb4aeOQMhovVvfOaQ1Bt1Wn886olSivnn9LmZFHyH6+439VpuukXA
 qCv6E6pGPHSOyxQo6UjXDfpajikE8SvGbTO+BMUTt38cgp94gQDl4BvfP
 snw8mmJZyr2W0hSrtYpLSiYER5ylsxopo7JuddzTFcA3Mdsy1QDI6/BLp
 Zl5IxALNGwgxqkaWg27lFWApBniq5YSz0VNprHmFKBO4oyKvgV8Ffi0op
 ONl77FnxBnTH8FtUgPfjIjcgc5t0P1UNNRniYwAI+4dRzACYRn/xe9Um1
 jq8CnYkZSLoSq92Qw75VGUbc6efZoGOs06bAht/qFtcLn1ZuWrO3hSX5u w==;
X-CSE-ConnectionGUID: LwoKbIs1So+2ZZW4aYA27A==
X-CSE-MsgGUID: GtILAX9nS7SPJ4JSZ9WOCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="41575363"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; d="scan'208";a="41575363"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2025 15:47:52 -0800
X-CSE-ConnectionGUID: 8mwaiYFDTPOBFzq0N0iSDQ==
X-CSE-MsgGUID: vofb+04fSJqL6XZf5zM0Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111240582"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 18 Jan 2025 15:47:51 -0800
Received: from [10.245.96.215] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.215])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E160232CB1;
 Sat, 18 Jan 2025 23:47:49 +0000 (GMT)
Message-ID: <e8ef0685-6aac-414e-838f-ada300b2b996@intel.com>
Date: Sun, 19 Jan 2025 00:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGU6IFN1?=
 =?UTF-8?Q?ppress_printing_of_mode_when_running_in_non-sriov_mode=2E?=
To: intel-xe@lists.freedesktop.org,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250116055617.20611-1-satyanarayana.k.v.p@intel.com>
 <173702757755.259313.11549143142888319161@b555e5b46a47>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173702757755.259313.11549143142888319161@b555e5b46a47>
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



On 16.01.2025 12:39, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Suppress printing of mode when running in non-sriov mode.
> URL   : https://patchwork.freedesktop.org/series/143584/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2495-4cea1f90028925afcf1a0f8a0ef301f90349688c_full -> xe-pw-143584v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-143584v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-143584v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-143584v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143584v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][2] -> [FAIL][3] +1 other test fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2495-4cea1f90028925afcf1a0f8a0ef301f90349688c/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143584v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-dg2-set2:     [PASS][4] -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2495-4cea1f90028925afcf1a0f8a0ef301f90349688c/shard-dg2-432/igt@kms_hdr@bpc-switch.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143584v1/shard-dg2-434/igt@kms_hdr@bpc-switch.html
> 
>   * igt@xe_exec_compute_mode@many-bindexecqueue-rebind:
>     - shard-adlp:         [PASS][6] -> [FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2495-4cea1f90028925afcf1a0f8a0ef301f90349688c/shard-adlp-8/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143584v1/shard-adlp-2/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html

Can't be related to this simple patch so pushed to drm-xe-next

Thanks for the patch and review,
Michal
