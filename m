Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAE9C02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 17:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CB910EB81;
	Fri,  7 Feb 2025 17:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gmUSAb9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D2D10EB81
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 17:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738949159; x=1770485159;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xqS2dmvWNwSTls79jU3VyLYusu52tluk9FiDUAtERsg=;
 b=gmUSAb9BXZtBooEU/yVAzIGwd8wAUMH4Q4HwLWfU5R1QN7A9MbcGB/QE
 BnWzee1Q5OBPZfgDMjcOP5P9UmsalcjvjgJplkQT63rJD+L1oDV3Oww5K
 LPXv4tWeA1WiKX0tHrXuc3lb4h4eljXM8B/LDptm66v2/JO/IX2Ae8/pr
 rwQJodQ5Nlk6tF6a5u/+g9H/yrKYz2UDuTgVSeZ4Zzp3PGAY2DxxsRnRC
 QuxnXUxDKt7XYmMKa//5Fk5McZSxjxw3q0uywQKUd7icVu3iXAQ4tqvSJ
 JlfUDrOTmfFkua/PV1R0tRtJJ+Xh+x3L/GSCccg5WjDaIcW0498JjOpy4 Q==;
X-CSE-ConnectionGUID: rFQZ+OTMQ5mFnPQnzYnPiQ==
X-CSE-MsgGUID: M+Vzgko6TB6XkBvwoiscLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39506452"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="39506452"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 09:25:59 -0800
X-CSE-ConnectionGUID: uMatywGTQnibiMml7jlu1w==
X-CSE-MsgGUID: HInyh8XkQB6YQUGFZWZhyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="112096321"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 07 Feb 2025 09:25:57 -0800
Received: from [10.245.96.215] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.215])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B2FC012427
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 17:25:56 +0000 (GMT)
Message-ID: <eed28c53-5fd7-44f3-add9-4322fe67c9af@intel.com>
Date: Fri, 7 Feb 2025 18:25:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGU6IEVu?=
 =?UTF-8?Q?able_SR-IOV_for_PTL?=
To: intel-xe@lists.freedesktop.org
References: <20250206214545.940-1-michal.wajdeczko@intel.com>
 <173891105273.2491883.6817567250024406338@b555e5b46a47>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173891105273.2491883.6817567250024406338@b555e5b46a47>
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



On 07.02.2025 07:50, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Enable SR-IOV for PTL
> URL   : https://patchwork.freedesktop.org/series/144449/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2613-f2401c718ce075408a723b147cac70aad2a8246f_full -> xe-pw-144449v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-144449v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-144449v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-144449v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

all unrelated, no PTL in this CI

> 
>   * igt@core_setmaster@master-drop-set-root:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-dg2-436/igt@core_setmaster@master-drop-set-root.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144449v1/shard-dg2-464/igt@core_setmaster@master-drop-set-root.html

(core_setmaster:2206) drmtest-WARNING: No card matches the filter!
[pci:vendor=intel,device=discrete,card=0]
(core_setmaster:2206) CRITICAL: Test assertion failure function
check_drop_set, file ../tests/core_setmaster.c:85:

which could be right statement since on DUT there was just ADL

<6>[   50.681563] xe 0000:00:02.0: [drm] Running in SR-IOV PF mode
<6>[   50.681572] xe 0000:00:02.0: [drm] Found alderlake_s (device ID
4680) integrated display version 12.00 stepping C0

> 
>   * igt@core_setmaster@master-drop-set-user:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144449v1/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html

ditto

> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144449v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

wrong report, test passed

<7>[  384.789151] [IGT] kms_frontbuffer_tracking: finished subtest
fbc-2p-primscrn-spr-indfb-fullscreen, SUCCESS

> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:
>     - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] +2 other tests dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2613-f2401c718ce075408a723b147cac70aad2a8246f/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144449v1/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b.html

<3> [344.933080] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did
not complete or timeout within 10ms (status 0xad40023f)


