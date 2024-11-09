Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92DED5E373
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 14:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F57410E08D;
	Sat,  9 Nov 2024 14:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7+xArkO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AFE10E08D
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Nov 2024 14:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731161122; x=1762697122;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=n+s2eoxr8Sh+j62Vo8tishR324pXfbVTy24afdzUazk=;
 b=d7+xArkO0O6U9d/nsUKQ7/510blPNRDaVd9+bDwD8Qz+Zd+Qocfl2aA8
 UN1rt8+tLWj0Ckm/tbt302YIjNM8RB7dtC625QvEMrNEy7rhV7NYgpmCp
 OjB6PyNtethrav7utjacvH6T1LEPUffb1p0Qr7q66rwYD9qXDemtGo1/O
 tHrdAv9efzK+Ozt1sdqsWlv66yZ+SIr/FZDhcjARzj3bXSxs6GMkHKJ/O
 JVQI9eA2Gd9Y0ZeZBsb6N/4x4IVJd/DavAJclo3sueD43Q4Y/Soo1r/ah
 ho7bV9YBpJeTO/jfvWua49R60shk3XeXBwE55qrAWLY29GgH6tsRuOy7a w==;
X-CSE-ConnectionGUID: GC3q3CSpQ5eKSvJP7VSSzA==
X-CSE-MsgGUID: Jqio6iRfRoClq2WDCLQoSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="34969349"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; d="scan'208";a="34969349"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 06:05:21 -0800
X-CSE-ConnectionGUID: NQ5axP5pSAe4juqDXhRC0g==
X-CSE-MsgGUID: x5UaxQ1bS3qNrVDJRj557g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; d="scan'208";a="90738074"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 09 Nov 2024 06:05:20 -0800
Received: from [10.246.2.138] (mwajdecz-MOBL.ger.corp.intel.com [10.246.2.138])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D44A528198;
 Sat,  9 Nov 2024 14:05:18 +0000 (GMT)
Message-ID: <c64c6a2a-99fb-4312-9e92-980a9577bb73@intel.com>
Date: Sat, 9 Nov 2024 15:05:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/vf=3A_Pos?=
 =?UTF-8?Q?t-migration_recovery=2C_remove_MMIO_assert?=
To: intel-xe@lists.freedesktop.org, Tomasz Lis <tomasz.lis@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>
References: <20241107151357.1623733-1-tomasz.lis@intel.com>
 <173110416572.1446338.12338028984883774965@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173110416572.1446338.12338028984883774965@2413ebb6fbb6>
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



On 08.11.2024 23:16, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/vf: Post-migration recovery, remove MMIO assert
> URL   : https://patchwork.freedesktop.org/series/141058/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2181-6f358787ded211657532e2ee4df2e446b03d860f_full -> xe-pw-141058v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-141058v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-141058v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-141058v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 

all unrelated, 2x KMS

>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141058v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_vblank@query-forked-hang@pipe-d-dp-2:
>     - shard-bmg:          [PASS][2] -> [INCOMPLETE][3] +1 other test incomplete
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2181-6f358787ded211657532e2ee4df2e446b03d860f/shard-bmg-2/igt@kms_vblank@query-forked-hang@pipe-d-dp-2.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141058v1/shard-bmg-5/igt@kms_vblank@query-forked-hang@pipe-d-dp-2.html
> 
>   * igt@xe_gt_freq@freq_low_max:
>     - shard-lnl:          [PASS][4] -> [DMESG-WARN][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2181-6f358787ded211657532e2ee4df2e446b03d860f/shard-lnl-6/igt@xe_gt_freq@freq_low_max.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141058v1/shard-lnl-5/igt@xe_gt_freq@freq_low_max.html

<4> [431.075162] xe 0000:00:02.0: [drm] GT0: G2H fence 7262, action
3003, done
<4> [432.455310] xe 0000:00:02.0: [drm] GT0: G2H fence 7263, action
3003, done

due to warn added in commit e51527233804 ("drm/xe/guc/ct: Flush g2h
worker in case of g2h response timeout")

@Badal, maybe this should be just xe_gt_dbg() ?


