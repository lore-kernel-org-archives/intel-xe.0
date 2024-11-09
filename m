Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E33AD5E373
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 14:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9A510E08D;
	Sat,  9 Nov 2024 14:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkX8Lfvr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE37010E08D
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Nov 2024 14:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731161703; x=1762697703;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=EpGeKSbbhJ1uK23p3G+F13JMR97g+6eEgBu5/XuG0Hc=;
 b=PkX8LfvrJyeait57KKeZTTdxoT09nCz2xVdGmyRcJ6TNkqYXuRH/peXH
 aZj4wv3Zo7W9mgskR8csXa65QT1pl0rOts6BmrbXLu+SgnoqTNQ6JaNBp
 m+QaVlSz9fLoRgZg5oG9BzvdeoYUt3ALziSKSkkW8+S5wyYeCt8KnQBOu
 dfSF7+2CO/6HilMNJ0Os1aiBXElA76HPX9LgQL3+t27nqLDeSdcO5kDYl
 /9eSoEXroHU/ZuOOA3CJbQ1dL/za9+YNQn68NMdoUVXe5F+YbF1wJeTyZ
 TQ1LvzlZcqfVdKKx3FG4C3Ujh/xAMNBU/zr8zMzXDRyV444oJoxZwj0Yp w==;
X-CSE-ConnectionGUID: IFtJHVVvSai6HhUVLwPgzA==
X-CSE-MsgGUID: 9hC1mrBDRL2prRybYR5R2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="41642733"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; d="scan'208";a="41642733"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 06:15:02 -0800
X-CSE-ConnectionGUID: guW8OM1EQq6Fu1pMwvl1Vg==
X-CSE-MsgGUID: O93YUQ7cSDGHgI6ITew/jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; d="scan'208";a="85703809"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 09 Nov 2024 06:15:01 -0800
Received: from [10.246.2.138] (mwajdecz-MOBL.ger.corp.intel.com [10.246.2.138])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8CB8C28197
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Nov 2024 14:15:00 +0000 (GMT)
Message-ID: <05a4c78c-22a0-4a3b-bc4e-66577637859e@intel.com>
Date: Sat, 9 Nov 2024 15:14:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_Prefer_GT_orient?=
 =?UTF-8?Q?ed_logs/asserts_in_submit_code?=
To: intel-xe@lists.freedesktop.org
References: <20241107194741.2167-1-michal.wajdeczko@intel.com>
 <173111858505.1509041.12925856584925267535@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173111858505.1509041.12925856584925267535@2413ebb6fbb6>
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



On 09.11.2024 03:16, Patchwork wrote:
> == Series Details ==
> 
> Series: Prefer GT oriented logs/asserts in submit code
> URL   : https://patchwork.freedesktop.org/series/141063/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97_full -> xe-pw-141063v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-141063v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-141063v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-141063v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

all unrelated

> 
>   * igt@core_getversion@all-cards:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2184-85b1b17ed748e1f68ac83052916a95d624405c97/shard-dg2-466/igt@core_getversion@all-cards.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141063v1/shard-dg2-434/igt@core_getversion@all-cards.html

(core_getversion:2196) drmtest-DEBUG: Looking for devices to open using
filter 0: pci:vendor=intel,device=discrete,card=0
(core_getversion:2196) drmtest-WARNING: No card matches the filter!
[pci:vendor=intel,device=discrete,card=0]

> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141063v1/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141063v1/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
