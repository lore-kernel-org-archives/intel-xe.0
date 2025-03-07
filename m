Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBAFC28B24
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 16:34:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11FD10EBEC;
	Fri,  7 Mar 2025 16:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZDXmobV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D142610EBFA
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 16:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741365263; x=1772901263;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kLbALn1GTbF77SPBPPfW3oLWneA4cAGMCs0qP8Fm+rY=;
 b=gZDXmobVcYarJH335FJVF2ehi1h3xp+uR2NPhIEbIfPe0NfXAdpnaAD3
 MG8bJBScyve7hHQ/lLh9/8o38kFCeMnE+d+XLVUajfF/e6ZSyKkmmpV8a
 2itRel+kKomzQQHwa+zw75lB8xx8XfnO7wB4Wq17xT5OET87nMZOndAvQ
 PUvlvIaan6aAFw19QAKODFXKpvdYdGL2bbAVS6V6KbmZIbTqkqfjVCFPR
 nGDy308dTK3ld7nx0ZEB2rG9yGxO8y9GbfhX/FOi94vC3SvppDSTXZPQ1
 Lj1hnT4PZGDfnzqBpanIiXwhFo8IMAy6ZVNNBl/+9+/jGJOchUdj9mGUG g==;
X-CSE-ConnectionGUID: m6Mu5z98REGH0zglQmoQhw==
X-CSE-MsgGUID: ZtAx7wBwTfGorBv3532i3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41672763"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="41672763"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 08:34:22 -0800
X-CSE-ConnectionGUID: 65qh0BQZSjyLQ5cP/Q/01A==
X-CSE-MsgGUID: W8MYY1FYTieftxnJDVlWpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="123952327"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 07 Mar 2025 08:34:21 -0800
Received: from [10.245.83.181] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.83.181])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1971034945
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 16:34:21 +0000 (GMT)
Message-ID: <6dc6b072-3083-4002-93ac-805412f357df@intel.com>
Date: Fri, 7 Mar 2025 17:34:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIFVzZSBNSV9NQVRI?=
 =?UTF-8?Q?_to_apply_RMW_WA_in_LRC_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
 <174115343588.934116.11673085508881987726@b555e5b46a47>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <174115343588.934116.11673085508881987726@b555e5b46a47>
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



On 05.03.2025 06:43, Patchwork wrote:
> == Series Details ==
> 
> Series: Use MI_MATH to apply RMW WA in LRC (rev2)
> URL   : https://patchwork.freedesktop.org/series/145732/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2754-ff2d693d88726e29a1d87291105135c31c21fa26_BAT -> xe-pw-145732v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-145732v2_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-145732v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (9 -> 8)
> ------------------------------
> 
>   Missing    (1): bat-adlp-vm 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-145732v2_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_pat@pat-index-xelp@render:
>     - bat-adlp-vf:        [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2754-ff2d693d88726e29a1d87291105135c31c21fa26/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145732v2/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

<6> [241.040607] [IGT] xe_pat: starting dynamic subtest render
<7> [241.197279] xe 0000:00:02.1:
[drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] GT0: Engine memory
cat error: engine_class=bcs, logical_mask: 0x1, guc_id=1
<6> [241.197973] xe 0000:00:02.1: [drm] GT0: Engine reset:
engine_class=bcs, logical_mask: 0x1, guc_id=1
<5> [241.198000] xe 0000:00:02.1: [drm] GT0: Timedout job:
seqno=4294967169, lrc_seqno=4294967169, guc_id=1, flags=0x4 in no
process [-1]
<6> [241.198624] xe 0000:00:02.1: [drm] Xe device coredump has been created
<6> [241.198647] xe 0000:00:02.1: [drm] Check your
/sys/class/drm/card1/device/devcoredump/data
<4> [241.198649] ------------[ cut here ]------------
<4> [241.198651] xe 0000:00:02.1: [drm] GT0: VM job timed out on
non-killed execqueue
<4> [241.198676] WARNING: CPU: 0 PID: 11 at
drivers/gpu/drm/xe/xe_guc_submit.c:1183
guc_exec_queue_timedout_job+0x454/0xe00 [xe]

this is sporadic and now also seen without this series and reported as
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491

> 
>   
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-2754-ff2d693d88726e29a1d87291105135c31c21fa26 -> xe-pw-145732v2
> 
>   IGT_8258: ee442ca9711ab6ae1a1c0fc784d18bfaa6f9244f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2754-ff2d693d88726e29a1d87291105135c31c21fa26: ff2d693d88726e29a1d87291105135c31c21fa26
>   xe-pw-145732v2: 145732v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145732v2/index.html
> 

