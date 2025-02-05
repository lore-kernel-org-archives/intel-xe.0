Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AD3C02192
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 17:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D9910E37D;
	Wed,  5 Feb 2025 17:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3bRKCzY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AC910E3A0
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 17:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738776081; x=1770312081;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=O6dBycaAH6dcSJZi+bXRr9YkR6ZYfldniQxj/Awfo5E=;
 b=X3bRKCzYY64huS2UYMku8XVB7ujxLEtEDKs48dCOfUS0HNN8W9h0Y2JB
 VTxxZcv3dvaTDwsoZn1Zo5afnGGSxLs4KFtmRBDow2rwAt3Zls9i8PVEY
 PocwPX+2o6okY01I0UMhf1M5MZT3sU4iX3dl6OwE7FjRXnMUQ0m1+Igkq
 JxzN13G8cXbNEs6LG3DyxFSy8vAEhwd//bpy8zNTwK+LXrvdKbGYz+mPX
 6dGJMDmjk4fp6XrcgbueOg+/JCirgnRR3972H8j0lMfYMsRwF1/Q0hIWq
 lVtHZSKpX8EFVrGCmrC+M4qUnt8zoxPVk+a8cO4dtCJI4sIqbvSg90Qy6 g==;
X-CSE-ConnectionGUID: 1j4xXY/qSS2HVWpCWxn1hg==
X-CSE-MsgGUID: sQrQ3zjWT8i9DsK9T9RNgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43274883"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="43274883"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 09:21:20 -0800
X-CSE-ConnectionGUID: hIcdGbTGR2KdBbAMnSloww==
X-CSE-MsgGUID: +MHIlVeWS6+k0ukab/5cOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="111497601"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 05 Feb 2025 09:21:20 -0800
Received: from [10.246.16.98] (mwajdecz-MOBL.ger.corp.intel.com [10.246.16.98])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6DCB932ECB
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 17:21:19 +0000 (GMT)
Message-ID: <06b41a9f-db03-4348-8bf2-e62a2a4652ea@intel.com>
Date: Wed, 5 Feb 2025 18:21:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGU6IERv?=
 =?UTF-8?Q?n=27t_treat_SR-IOV_platforms_as_reclaim_unsafe?=
To: intel-xe@lists.freedesktop.org
References: <20250205120150.896-1-michal.wajdeczko@intel.com>
 <173877505287.1534803.3974260777427551466@b555e5b46a47>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173877505287.1534803.3974260777427551466@b555e5b46a47>
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



On 05.02.2025 18:04, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Don't treat SR-IOV platforms as reclaim unsafe
> URL   : https://patchwork.freedesktop.org/series/144369/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721_full -> xe-pw-144369v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-144369v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-144369v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-144369v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated

> 
>   * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-adlp-8/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-1.html

<3> [297.013815] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did
not complete or timeout within 10ms (status 0xad40023f)

> 
>   * igt@xe_module_load@many-reload:
>     - shard-dg2-set2:     [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2600-5f025a38e4ddb453bfbf89d4ab37facf07427721/shard-dg2-466/igt@xe_module_load@many-reload.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144369v1/shard-dg2-464/igt@xe_module_load@many-reload.html

FACT: there was no DG2 on boot, only ADLP

[60.032030] [FACT before any test] new:
hardware.pci.gpu_at_addr.0000:00:02.0: 8086:4680 Intel Alderlake_s
(Gen12) AlderLake-S GT1
[60.036187] [FACT before any test] new:
hardware.pci.drm_card_at_addr.0000:00:02.0: card0
[60.038099] [FACT before any test] new: kernel.kmod_is_loaded.xe: true


