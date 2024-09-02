Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342DFCD13CF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 18:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C930710E28E;
	Mon,  2 Sep 2024 18:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSUTNa2u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7D410E28E
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 18:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725302671; x=1756838671;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=7frkiXL9WyLxASO8PDFPwMroPfPFDn1J7hGfS0k6vaI=;
 b=iSUTNa2ujmI1+U8pQN6MPrXvXwakSvpl9ie6J3iFC6qJ06dxDovN6olG
 JLA9tmfZT0SKuvyQgkQQ/eumZtJvyQH1lfFcT1gh+f+/gvFcd/Z8mUV7+
 m8eHFzwakmDreRfeZYlntQ/ccUPqqCOsz4v2IWHIEKLSA8O8Lar+dqM8/
 SL6NtRX4Cb6e+UI1c7yG3A8tqKijfM3FiAytUTQgx0EPs0BD/NSTefFNv
 Nf8GgoTvqGL+ua1VGiLK5KMh7iznMleZpViisbur7MqEpE1T0i6WHQ4st
 uM9b9+XVFUl5m0sNnVXTee4gPAflc7i9Z3reucGg2pZKejGDeXr1wjqR1 w==;
X-CSE-ConnectionGUID: RIAw3gWiQW+HkZRnbK6gLQ==
X-CSE-MsgGUID: t4H6kcgzTpOZPicXhxlY8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="46409390"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; d="scan'208";a="46409390"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 11:44:31 -0700
X-CSE-ConnectionGUID: rR5E/uKdTk2+vwnt+BwUIg==
X-CSE-MsgGUID: ft/jev2cTUqjal+UCup7xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; d="scan'208";a="69470667"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 02 Sep 2024 11:44:30 -0700
Received: from [10.245.120.199] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.120.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 496D42FC4C
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 19:44:29 +0100 (IST)
Message-ID: <91b77dd0-1132-4abc-b913-54f24054c4bd@intel.com>
Date: Mon, 2 Sep 2024 20:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_PF=3A_threshold_?=
 =?UTF-8?Q?config_fixes?=
To: intel-xe@lists.freedesktop.org
References: <20240830132100.1704-1-michal.wajdeczko@intel.com>
 <172507210447.870668.13648793813923277783@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172507210447.870668.13648793813923277783@2413ebb6fbb6>
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



On 31.08.2024 04:41, Patchwork wrote:
> == Series Details ==
> 
> Series: PF: threshold config fixes
> URL   : https://patchwork.freedesktop.org/series/138023/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1867-876db6b8ef45d285316cc53b5cf44cbc39aa8758_full -> xe-pw-138023v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-138023v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-138023v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-138023v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_vm@munmap-style-unbind-userptr-one-partial:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1867-876db6b8ef45d285316cc53b5cf44cbc39aa8758/shard-dg2-434/igt@xe_vm@munmap-style-unbind-userptr-one-partial.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138023v1/shard-dg2-433/igt@xe_vm@munmap-style-unbind-userptr-one-partial.html

<3> [196.507166] xe 0000:03:00.0: [drm] *ERROR* GT0: GuC PC Start failed
<4> [196.507215] ------------[ cut here ]------------
<4> [196.507217] xe 0000:03:00.0: [drm] GT0: Failed to start GuC PC: -EIO
<4> [196.507231] WARNING: CPU: 11 PID: 1715 at
drivers/gpu/drm/xe/xe_guc.c:1138 xe_guc_start+0xa3/0x1b0 [xe]
<4> [196.507377] Workqueue: gt-ordered-wq gt_reset_worker [xe]
<4> [196.507427] RIP: 0010:xe_guc_start+0xa3/0x1b0 [xe]
<4> [196.507480] Call Trace:
<4> [196.507481]  <TASK>
<4> [196.507483]  ? show_regs+0x67/0x70
<4> [196.507487]  ? __warn+0x94/0x1b0
<4> [196.507490]  ? xe_guc_start+0xa3/0x1b0 [xe]
<4> [196.507527]  ? report_bug+0x1b7/0x1d0
<4> [196.507531]  ? handle_bug+0x46/0x80
<4> [196.507533]  ? exc_invalid_op+0x19/0x70
<4> [196.507535]  ? asm_exc_invalid_op+0x1b/0x20
<4> [196.507539]  ? xe_guc_start+0xa3/0x1b0 [xe]
<4> [196.507576]  ? cancel_work_sync+0x10/0x20
<4> [196.507579]  xe_uc_start+0x28/0x30 [xe]
<4> [196.507635]  do_gt_restart+0x110/0x670 [xe]

and this looks exactly as #2559

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>     - {shard-bmg}:        [FAIL][3] ([Intel XE#2333]) -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1867-876db6b8ef45d285316cc53b5cf44cbc39aa8758/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138023v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@xe_vm:
>     - {shard-bmg}:        NOTRUN -> [INCOMPLETE][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138023v1/shard-bmg-4/igt@xe_vm.html
> 
>   
