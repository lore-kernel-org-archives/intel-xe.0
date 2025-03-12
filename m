Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56FCC28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 12:25:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D5E10E740;
	Wed, 12 Mar 2025 12:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBgo/U3u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1B210E108;
 Wed, 12 Mar 2025 12:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741782295; x=1773318295;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=HjtigYvgYERkGEbKsKfbMrIYz0N28dmBi8q0Zt4E1Xo=;
 b=YBgo/U3uk/DO3WQLVtGtoteq6F0py0ZKJ+eHlbCwNGn/chUQ0YVczu3d
 I7+tsQROmVS1eHxWMjqx1u7jq/PAQxZ51gvwaeuIkt0AvSFFJWeJ1QPnK
 BQCqYhc0va+4ro/tAogqnSAIM0tzlSaNQ1cqK4/9wSAxYCzZcJVNO+/lA
 llm0evPUsho6oCFcmbuckzFbiXAhsJqNex7vq9el1u3RDSCZSpgSFGztc
 MiLoe0aPkXE/qqUl3wdUIgepYtUVxQBwSuEvHlVZH7uA2cLx2TaaaEU0H
 X7OKUPscQVrFzhFdcwDVZwzWQV1GlBqypTA+YkJtq0FEI/O2sVwxZ9WkW A==;
X-CSE-ConnectionGUID: 1RhTFX4TQpOre88CPrQCTg==
X-CSE-MsgGUID: lOtggqQXS7Gh3Uc/vHhJbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46504639"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="46504639"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 05:24:54 -0700
X-CSE-ConnectionGUID: M/o28jyJSpOzfJY9pudY2w==
X-CSE-MsgGUID: pmYikaOzRnWzSFzsDUunPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120644775"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 12 Mar 2025 05:24:53 -0700
Received: from [10.245.99.10] (unknown [10.245.99.10])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8DE1133BFE;
 Wed, 12 Mar 2025 12:24:52 +0000 (GMT)
Message-ID: <65fb3c0e-f753-4b28-b3f8-5fc42a01a1de@intel.com>
Date: Wed, 12 Mar 2025 13:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBTUklPVjogRWxp?=
 =?UTF-8?Q?minate_usage_of_CTC=5FMODE?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250311114042.1954-1-michal.wajdeczko@intel.com>
 <174176065049.22922.6929099613750562071@18a75f3d1eae>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <174176065049.22922.6929099613750562071@18a75f3d1eae>
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



On 12.03.2025 07:24, Patchwork wrote:
> == Series Details ==
> 
> Series: SRIOV: Eliminate usage of CTC_MODE
> URL   : https://patchwork.freedesktop.org/series/146132/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2794-777e1850811f9864aa8b55940634d3da19712bf7_full -> xe-pw-146132v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-146132v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-146132v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-146132v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_color@ctm-max@pipe-b-dp-2:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2794-777e1850811f9864aa8b55940634d3da19712bf7/shard-bmg-8/igt@kms_color@ctm-max@pipe-b-dp-2.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146132v1/shard-bmg-2/igt@kms_color@ctm-max@pipe-b-dp-2.html

hmm, another CI glitch? in the log there is:

<7>[  306.488502] [IGT] kms_color: finished subtest pipe-B-DP-2, SUCCESS

> 
>   * igt@kms_cursor_legacy@single-move:
>     - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2794-777e1850811f9864aa8b55940634d3da19712bf7/shard-dg2-435/igt@kms_cursor_legacy@single-move.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146132v1/shard-dg2-435/igt@kms_cursor_legacy@single-move.html

looks like a bug XE#2932

<7> [333.055575] xe 0000:00:02.0: [drm:__xe_guc_upload [xe]] GT0: load
still in progress, timeouts = 0, freq = 1300MHz (req 1500MHz), status =
0x00000072 [0x39/00]
<7> [333.055907] xe 0000:00:02.0: [drm:__xe_guc_upload [xe]] GT0: load
still in progress, timeouts = 0, freq = 1300MHz (req 1500MHz), status =
0x00000074 [0x3A/00]
<7> [333.056029] xe 0000:00:02.0: [drm:__xe_guc_upload [xe]] GT0: load
still in progress, timeouts = 0, freq = 1300MHz (req 1500MHz), status =
0x800030EC [0x76/30]
<4> [333.976800] xe 0000:00:02.0: [drm] GT0: excessive init time: 921ms!
[status = 0x8002F0EC, timeouts = 0]
<4> [333.976809] xe 0000:00:02.0: [drm] GT0: excessive init time: [freq
= 1300MHz (req = 1500MHz), before = 1300MHz, perf_limit_reasons =
0x01000100]


