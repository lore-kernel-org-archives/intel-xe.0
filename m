Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE89C2BA15
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 11:42:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E9F10E021;
	Tue, 18 Jun 2024 11:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UienJZnL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765BF10E021
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 11:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718710956; x=1750246956;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=zEwreekxLBMhO1fJeBJjEHbqFStjx+AZL7QgWMgLWrQ=;
 b=UienJZnLmJOhfTUEa8sjhR9g4IrWIAogpXQSDI8560GAhdbSFOEVSew7
 nrCIMGOTkWlsJmAjeA6CmCIXeLsd8gcvVdvDDDw8+dPj32GgPpNKItP9E
 gghEpjCPv2xXQUvZIpqGo7IacRNg8GznvFI30crDUHCkIUUwKmbt1T6CW
 AhtwDO2eEBaZec7HnufNh1AY2+ihyVBe+4bvwTEEWKOwfX11oQJ3M9nQT
 JO5hT2foNR2IzwrXAIVcB9lxodihKRAExPEu5igOEoPpg2+YIXGbshfu+
 saweqV7nie/Lca/HLWzsRaCd/oWSLvwCUQq4wFLkU8oUCL5Ozbh3y8TAn w==;
X-CSE-ConnectionGUID: ooN99eV/Q/em/E7qpPnfhw==
X-CSE-MsgGUID: E6MiL8DlQuWSLb0TqUgOZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15726378"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15726378"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 04:42:36 -0700
X-CSE-ConnectionGUID: BW9vR1lHS12nPpISoImufA==
X-CSE-MsgGUID: Y1MChBG7RRalXJZUdZjJeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46478558"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 18 Jun 2024 04:42:35 -0700
Received: from [10.246.48.1] (mwajdecz-MOBL.ger.corp.intel.com [10.246.48.1])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3117F33EBD
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 12:42:33 +0100 (IST)
Message-ID: <5a7412e7-636b-425a-bbd7-4f48a86d8955@intel.com>
Date: Tue, 18 Jun 2024 13:42:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Use_ttm?=
 =?UTF-8?Q?=5Funcached_for_BO_with_NEEDS=5FUC_flag_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20240618104947.729-1-michal.wajdeczko@intel.com>
 <171871054579.103379.9406133499403683961@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171871054579.103379.9406133499403683961@a6498e030952>
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



On 18.06.2024 13:35, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Use ttm_uncached for BO with NEEDS_UC flag (rev2)
> URL   : https://patchwork.freedesktop.org/series/134580/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165_BAT -> xe-pw-134580v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-134580v2_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134580v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (5 -> 5)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-134580v2_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated

> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:
>     - bat-dg2-oem2:       [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html

Dynamic subtest B-DP3: SUCCESS (1.025s)

This test caused an abort condition: Lockdep not active

<7>[  309.551991] [IGT] kms_flip: starting dynamic subtest C-DP3
<7>[  309.553397] xe 0000:03:00.0: [drm:drm_mode_addfb2 [drm]] [FB:292]
<7>[  309.554465] xe 0000:03:00.0: [drm:drm_mode_addfb2 [drm]] [FB:293]
<4>[  309.561185] ------------[ cut here ]------------
<4>[  309.561189] DEBUG_LOCKS_WARN_ON(debug_atomic_read(nr_unused_locks)
!= nr_unused)
<4>[  309.561192] WARNING: CPU: 4 PID: 1149 at
kernel/locking/lockdep_proc.c:283 lockdep_stats_show+0xb99/0xe30


> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134580v2_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - bat-dg2-oem2:       [PASS][3] -> [ABORT][4] ([Intel XE#1553])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
>     - bat-dg2-oem2:       [PASS][5] -> [DMESG-WARN][6] ([Intel XE#1553])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
> 
>   
>   [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165 -> xe-pw-134580v2
> 
>   IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165: b3cee15446d95e97d9d663cdcbc611e698354165
>   xe-pw-134580v2: 134580v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/index.html
> 
