Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEDCC02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 10:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F48510E5E3;
	Tue,  4 Feb 2025 10:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFlhnbX8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5D810E5E3
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 10:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738666697; x=1770202697;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=AEn6mqWsFvkj2Qx7+YPX1DCBhroOTbx/IZK/BeRaI88=;
 b=jFlhnbX8bSxrl0qyq6vLR6WnoY5sqSt34Oo2EJXEHojRvQr4IdzzLD5q
 BZm4H4hKNLIDC2SorxgMDOJwhMhgNKFNLpBz8sktVjxxJbPPxAboDdK6L
 Tmb7134yW4P60iJalHo8aN96mrxOQGBoxwRuye6XRjRjNvtLjGGJnWp+W
 QiRyMlvAwwCLhx+2n5hJXwGTzsexLLs0cRfb4pDlhcKp8Lgk8N626tdJv
 PSJfwqa0D622oGx6eOc+98UCn5BYtZa9VYlvcRb3a2d+f7RwzJznaR9yS
 QcbxYnZyMdaRfYPJRVXdRNoz8s4SPIyUum35XX71PRUUQ4ukxsIYDr59n Q==;
X-CSE-ConnectionGUID: Y1LS2uLDQOqpOTowC9vWTQ==
X-CSE-MsgGUID: ESWL5YBWTIqQqHURGc/NJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42843745"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="42843745"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 02:58:15 -0800
X-CSE-ConnectionGUID: fQoy1AOxTQGI59Q6mph3Mg==
X-CSE-MsgGUID: sKcQrCyGTySFIrlYA8s3XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="115563510"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 04 Feb 2025 02:58:13 -0800
Received: from [10.246.16.98] (mwajdecz-MOBL.ger.corp.intel.com [10.246.16.98])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A958312427
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 10:58:11 +0000 (GMT)
Message-ID: <9008880d-e91e-4f29-a4c8-7b1e90bdc602@intel.com>
Date: Tue, 4 Feb 2025 11:58:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/rela?=
 =?UTF-8?Q?y=3A_Don=27t_use_GFP=5FKERNEL_for_new_transactions?=
To: intel-xe@lists.freedesktop.org
References: <20250131153713.808-1-michal.wajdeczko@intel.com>
 <173835851583.3314806.11712122875644547206@b555e5b46a47>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173835851583.3314806.11712122875644547206@b555e5b46a47>
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



On 31.01.2025 22:21, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/relay: Don't use GFP_KERNEL for new transactions
> URL   : https://patchwork.freedesktop.org/series/144192/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2581-9ad9ba100db6b9b53b314a7c4f20674593614ae0_full -> xe-pw-144192v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-144192v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-144192v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-144192v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

all false positives

> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144192v1/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-d-hdmi-a-6.html

<7>[  335.336488] [IGT] kms_cursor_crc: finished subtest
pipe-D-HDMI-A-6, SUCCESS
<7>[  335.336759] [IGT] kms_cursor_crc: finished subtest
cursor-offscreen-256x256, SUCCESS

> 
>   * igt@kms_plane@plane-position-covered@pipe-b-plane-5:
>     - shard-dg2-set2:     [PASS][2] -> [ABORT][3] +1 other test abort
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2581-9ad9ba100db6b9b53b314a7c4f20674593614ae0/shard-dg2-463/igt@kms_plane@plane-position-covered@pipe-b-plane-5.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144192v1/shard-dg2-432/igt@kms_plane@plane-position-covered@pipe-b-plane-5.html

<6> [140.458994] [IGT] kms_plane: finished subtest pipe-B-plane-5, SUCCESS
<6> [140.459295] [IGT] kms_plane: finished subtest
plane-position-covered, SUCCESS
...
<6> [140.541820] [IGT] kms_plane: exiting, ret=0

> 
>   * igt@kms_plane_lowres@tiling-4@pipe-a-dp-2:
>     - shard-bmg:          [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2581-9ad9ba100db6b9b53b314a7c4f20674593614ae0/shard-bmg-5/igt@kms_plane_lowres@tiling-4@pipe-a-dp-2.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144192v1/shard-bmg-5/igt@kms_plane_lowres@tiling-4@pipe-a-dp-2.html

<7>[  214.567241] [IGT] kms_plane_lowres: starting subtest tiling-4
<7>[  214.568131] [IGT] kms_plane_lowres: starting dynamic subtest
pipe-A-DP-2
...
<7>[  225.128597] [IGT] kms_plane_lowres: finished subtest pipe-A-DP-2,
SUCCESS

> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
>     - shard-adlp:         [PASS][6] -> [DMESG-WARN][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2581-9ad9ba100db6b9b53b314a7c4f20674593614ae0/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144192v1/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

<3> [370.681177] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did
not complete or timeout within 10ms (status 0xad40023f)
<3> [370.691621] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did
not complete or timeout within 10ms (status 0xad40023f)

