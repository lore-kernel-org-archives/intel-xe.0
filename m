Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D23C0218A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 17:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B594A10E213;
	Mon, 27 Jan 2025 17:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnlqrP9N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E75610E213
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jan 2025 17:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737997679; x=1769533679;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=5RUOBtLQjoKwQFe2uWZjYQYuDMvZwHVEM8NIXqFroGE=;
 b=ZnlqrP9NFULHIyB2kL8rjerdeV1fBzEp+Z8Q0NF3RX7i0WwrjxprOSN6
 vyNMfSEra0GKIGTcH5IQPHyxn33CpNM0nYjSO3jprp2iqpaIAllbXl3JR
 0f8wDEyo8nWfQm3XFCyB2DKZT5tqLzjT5bs8rsgK6a2HZf2pAJ/YLwN0M
 AsugyaIGJQDrWxSVytDx4B3PJHcjevn/5eswAfAVKehAuFKBneUwMfEUr
 fqP2/hXbQ0XzGzwv1+e6b2sbUBwk1jLsvSaOgPS19KAz+BZzvY+0FwM8x
 /ovY7GhLKEPuta5kl0mgaY3iPEiDzTbHrjwY7t3BlzBfT9KsBWG0/D3Yy w==;
X-CSE-ConnectionGUID: Aphx/7hpQPKrx+NdOQbbuA==
X-CSE-MsgGUID: n4tzIKKfSZ+0d7DyphItCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49063304"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="49063304"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 09:07:59 -0800
X-CSE-ConnectionGUID: fpPfAxa2RkenXEXEAaKkLg==
X-CSE-MsgGUID: xGFQCsczT6OaYRym5GnHbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108347763"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 27 Jan 2025 09:07:58 -0800
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 00B7D28795
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jan 2025 17:07:56 +0000 (GMT)
Message-ID: <3ea1cc40-cfbd-42cb-aec1-51ccee3f2656@intel.com>
Date: Mon, 27 Jan 2025 18:07:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Move_VFs_reprovisioning_to_worker?=
To: intel-xe@lists.freedesktop.org
References: <20250125215505.720-1-michal.wajdeczko@intel.com>
 <173785211300.531267.16645975627263814012@b555e5b46a47>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173785211300.531267.16645975627263814012@b555e5b46a47>
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



On 26.01.2025 01:41, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Move VFs reprovisioning to worker
> URL   : https://patchwork.freedesktop.org/series/143963/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2553-b21557cf9ac310ed4c206f6661ac57fa090c42b2_full -> xe-pw-143963v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-143963v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-143963v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-143963v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

all unrelated to this PF-only series

> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2553-b21557cf9ac310ed4c206f6661ac57fa090c42b2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143963v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2553-b21557cf9ac310ed4c206f6661ac57fa090c42b2/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143963v1/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

<3> [432.067770] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did
not complete or timeout within 10ms (status 0xad40023f)
<3> [432.077968] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did
not complete or timeout within 10ms (status 0xad40023f)

> 
>   * igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2553-b21557cf9ac310ed4c206f6661ac57fa090c42b2/shard-adlp-4/igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143963v1/shard-adlp-8/igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm:
>     - shard-lnl:          NOTRUN -> [INCOMPLETE][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143963v1/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm.html
> 

