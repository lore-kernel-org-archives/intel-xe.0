Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877B7C25B74
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 19:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9F410F0A8;
	Thu,  9 May 2024 19:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ir+Y9N08";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2559210F0A4
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 19:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715282253; x=1746818253;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kD4WWMpDeeJmhMvfl31vIBvtwYniZ176UJPVQmSb+yw=;
 b=Ir+Y9N08ynZynfDmxQmGCY26bIx6fmq/UCJAY3842+ms0XO2IqbilMXK
 ZPrEFC83FGFX5MWJVUBtKa5j+DVet6k6cUKbBBvd6VF/OkBDIKUsP/vuu
 aJQGLRHeKLUQJQ1AWcaaMgavRfga6Vcx1v7fElNMVpJ2StPypEFHYc49w
 RpGmZoZWsuHfjGKKYwrjJ6vvcwnv9HaLOwON9pao8tasBgaG/CI6PE2Dc
 bsSs3d3tAoyy6PmDu+tWHeeYbovNtO7470qYHGI2XMik6d3E8Nk6u4SG3
 cpeBvxOxMh7bDQWALYM44AyTYCCSw0mnVqna1m/6em0Lbt7BP+kKPiy2N A==;
X-CSE-ConnectionGUID: 6exS+zinSZmBI+DYQd3hpQ==
X-CSE-MsgGUID: E/O9Hp2bQRq4iVDwsY7LDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15038488"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="15038488"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:17:33 -0700
X-CSE-ConnectionGUID: /XQCBbXWSu+VaVq6hhZ1uA==
X-CSE-MsgGUID: Tbl6fAfhQlemNXSd7LJIPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="34203595"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 09 May 2024 12:17:32 -0700
Received: from [10.246.17.255] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.17.255])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0DB0F2FC47
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 20:17:29 +0100 (IST)
Message-ID: <2acbfaf0-1473-4211-9826-e864d82cb314@intel.com>
Date: Thu, 9 May 2024 21:17:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Move_x?=
 =?UTF-8?Q?e=5Fgpu=5Fcommands=2Eh_file_to_instructions/?=
To: intel-xe@lists.freedesktop.org
References: <20240508174856.1908-1-michal.wajdeczko@intel.com>
 <171523379898.2037202.17555157416032215968@8e613ede5ea5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171523379898.2037202.17555157416032215968@8e613ede5ea5>
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



On 09.05.2024 07:49, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Move xe_gpu_commands.h file to instructions/
> URL   : https://patchwork.freedesktop.org/series/133336/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1257-34d52122a69076639d526b035c8edd5b43201f84_full -> xe-pw-133336v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with xe-pw-133336v1_full need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-133336v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-133336v1_full:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-adlp:         [SKIP][1] ([Intel XE#1201] / [Intel XE#656]) -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1257-34d52122a69076639d526b035c8edd5b43201f84/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133336v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

unrelated:

This test caused an abort condition: Lockdep not active

<1> [296.087937] BUG: kernel NULL pointer dereference, address:
0000000000000480
...
<4> [296.088081] RIP: 0010:__mutex_lock+0x63/0xe60
<4> [296.088334] Call Trace:
...
<4> [296.089031]  snd_hdac_acomp_init+0xdf/0x160 [snd_hda_core]
<4> [296.089061]  snd_hdac_i915_init+0xd8/0x150 [snd_hda_core]
<4> [296.089090]  azx_probe+0x5c8/0x1250 [snd_hda_intel]
...
<4> [296.098215]  azx_driver_init+0x23/0xff0 [snd_hda_intel]
<4> [296.099101]  do_one_initcall+0x5f/0x3d0
<4> [296.099562]  ? kmalloc_trace+0x307/0x3b0
<4> [296.100023]  ? do_init_module+0x28/0x270
<4> [296.100520]  do_init_module+0x6a/0x270
<4> [296.100974]  load_module+0x20a9/0x2400

