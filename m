Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923BEC5B555
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 17:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6F210E572;
	Mon,  2 Jun 2025 17:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="de1JQgAl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC98710E572
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 17:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748885695; x=1780421695;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ktmAw7DQyYDRpIt3yMcDWsIYgRAZ21j12WkCe1puiT0=;
 b=de1JQgAl6q5EDHAhgYUl8/mYGTtG/wa1ZpuKLztHrPyzak057ojLUgMz
 ZXMhQN/vg5vkQACGXcNQYsiBshmgu/aMTkFJSEjkX9zNH3ws+i4afbIlM
 lgktnBg0ngBlWbThZ1ZmQ3MMW9PQlZB3iCYasR5pVS+m3yH9DHQ1jiFTt
 zpcSxWYl8nNskIFa34dUdaf58n4bUMIVBG4F4XRMY/ZYf8lFTHo8G13gG
 nOTR3Fg4hsFH7tiukaLQcSAIANHUUFLWrtvEk60IJUfr4D74bAe+c9xcu
 9lN6scCUyDQQTZTY6MXSMZIH8kD1JXXayWsXFWX6Vryf/wbiUA99+BQpA A==;
X-CSE-ConnectionGUID: GFOdvW6rQCyQG5p6s9zEAQ==
X-CSE-MsgGUID: XYVVv8EsRlezBMbzL5zwIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61565136"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="61565136"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 10:34:54 -0700
X-CSE-ConnectionGUID: ykX4XF6RQlC/E4NgjgZr4Q==
X-CSE-MsgGUID: SG1MrHc9Q52utnAALSzu1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="167766968"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 02 Jun 2025 10:32:40 -0700
Received: from [10.245.84.121] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6FB843432D
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 18:32:39 +0100 (IST)
Message-ID: <2373a5f9-daa1-4f97-aa81-17e4aa398dd8@intel.com>
Date: Mon, 2 Jun 2025 19:32:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBWRjogU21hbGwg?=
 =?UTF-8?Q?updates_around_GGTT_handling?=
To: intel-xe@lists.freedesktop.org
References: <20250602103325.549-1-michal.wajdeczko@intel.com>
 <174888043373.41082.16662024409831568512@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <174888043373.41082.16662024409831568512@1538d3639d33>
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



On 02.06.2025 18:07, Patchwork wrote:
> == Series Details ==
> 
> Series: VF: Small updates around GGTT handling
> URL   : https://patchwork.freedesktop.org/series/149730/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3171-908b29f2f229f4625b8c3735e6d5ff99234277b2_FULL -> xe-pw-149730v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-149730v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-149730v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-149730v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate:
>     - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3171-908b29f2f229f4625b8c3735e6d5ff99234277b2/shard-dg2-432/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149730v1/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html

unrelated assert hit on non-VF run:

<7>[   51.174821] xe 0000:03:00.0: [drm:xe_pci_probe [xe]] SR-IOV
support: no (mode: none)

...

<4> [376.258534] xe 0000:03:00.0: [drm] Assertion
`!exec_queue_pending_disable(q)` failed!
platform: DG2 subplatform: 6
graphics: Xe_HPG 12.55 step A1
media: Xe_HPM 12.55 step A1
tile: 0 VRAM 6.00 GiB
GT: 0 type 1
<4> [376.258555] WARNING: CPU: 0 PID: 9171 at
drivers/gpu/drm/xe/xe_guc_submit.c:1003 enable_scheduling+0x443/0x920 [xe]


