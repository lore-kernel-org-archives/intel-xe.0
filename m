Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC22C02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 20:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6907110E212;
	Tue, 21 Jan 2025 20:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k954lYKV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD7A10E212;
 Tue, 21 Jan 2025 20:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737492104; x=1769028104;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=fxexKaZKoPjpx12qrd+tc1lQOJTjnnhnnN2o6mEua6I=;
 b=k954lYKVHj3QpF6Eq8syT3c5r2yTOzWh4ZkVK9BSWHk3x9iILyXQj6iE
 UvaCY8Dh2d7t34BDpldCQeTLVjzOBQ5OvWKWbaFq9q7rl3QGeWpeGI5JG
 428Y8D8sHnpMW902Jq/KzZmDanLBFDm/eTS8eijHAwXT72NRLsvWHfNUJ
 8R1F/btPzzXlMH6mlBLYireKgBeY5s+uldbv2FWYJlV0DGsntwLuvmTdj
 dHi0EeitYl8s8jiQbbhZJv6cQGI8cQdpJgHvAmySHcWe50mrry4a2+7WY
 NGR0oU/ia6rcSJJ9ZVA94VRun4UiFqQP9rTE4Fn1wVIL+gnH9I5C5rD1G Q==;
X-CSE-ConnectionGUID: bN6oNylDTC6agVZdeok8Uw==
X-CSE-MsgGUID: RVXCwAqlQo+Q2z4rZ24yOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37810971"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="37810971"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 12:41:44 -0800
X-CSE-ConnectionGUID: CBfDh5oqTTW78DfxJk906A==
X-CSE-MsgGUID: trtnJtDwQXeIpdZTZJvrVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="137747744"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 21 Jan 2025 12:41:42 -0800
Received: from [10.245.80.89] (mwajdecz-MOBL.ger.corp.intel.com [10.245.80.89])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6F79F32CA9;
 Tue, 21 Jan 2025 20:41:41 +0000 (GMT)
Message-ID: <eb3eecb7-343b-4200-b468-c7d8bd9bfcc3@intel.com>
Date: Tue, 21 Jan 2025 21:41:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Fix_migration_initialization?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250120232443.544-1-michal.wajdeczko@intel.com>
 <173742274949.2389727.16860213807102826496@b555e5b46a47>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173742274949.2389727.16860213807102826496@b555e5b46a47>
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



On 21.01.2025 02:25, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Fix migration initialization
> URL   : https://patchwork.freedesktop.org/series/143765/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2516-fb87b4e061d1844beaca66c8446cfcf60db99a23_full -> xe-pw-143765v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-143765v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-143765v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-143765v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

all unrelated

> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [FAIL][1] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143765v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][2] +1 other test incomplete
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143765v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@plain-flip-ts-check@a-hdmi-a6:
>     - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2516-fb87b4e061d1844beaca66c8446cfcf60db99a23/shard-dg2-436/igt@kms_flip@plain-flip-ts-check@a-hdmi-a6.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143765v1/shard-dg2-434/igt@kms_flip@plain-flip-ts-check@a-hdmi-a6.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
>     - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] +5 other tests dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2516-fb87b4e061d1844beaca66c8446cfcf60db99a23/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143765v1/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

<3> [362.879531] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did
not complete or timeout within 10ms (status 0xad40023f)
<3> [362.889860] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did
not complete or timeout within 10ms (status 0xad40023f)


