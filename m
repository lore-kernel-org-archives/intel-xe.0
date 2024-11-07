Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7382CD5AE75
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 09:21:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FD010E7DC;
	Thu,  7 Nov 2024 09:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLW+FLqI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A1710E7DC
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 09:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730971303; x=1762507303;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=UxxtWXASinU2ecW5+wxCYMTfCNWrAkfM75CCyFNi9BQ=;
 b=YLW+FLqIP1DTLXkemLaM3QzDKfH5608jf9hWVhkhnRipuC/YErfbyk1K
 H8krF1urUF8n2okZAY7TY/ZU8khDhoYhGHoB1lweVMKLnmHTAp7Lmhaax
 0AecFzELdPy7iaQV6VT7fwivpriNvs+O5szjOdjtxZJdjmnIJFMEUHvMx
 uPaZ3PDw38hWOf5EMRrl71Gv8mVA3ri0Hwxo8mcwbSO5drsjo+jXIQ2aG
 lqWbQh4LH8EwhycBwtA2Dg2lgFvuoJbukWXMdoZHEm7SaANDJ0Gv0Ny40
 OJ2+j17nM7w2y+xiNS9dJn38LovtYZ0JXXkARMYGPXU5DCTQmnJQXnJax A==;
X-CSE-ConnectionGUID: 1deGA7PGQ3+E6HY7KTDrww==
X-CSE-MsgGUID: pxPwOZibTrWS86mTh8AiRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30964150"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30964150"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 01:21:42 -0800
X-CSE-ConnectionGUID: TAxhavqcQy25Q/wH8Px/yw==
X-CSE-MsgGUID: yH+WlmKpT8O2vUeUBIw6Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="122502893"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 07 Nov 2024 01:21:42 -0800
Received: from [10.246.2.138] (mwajdecz-MOBL.ger.corp.intel.com [10.246.2.138])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3792D28195
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 09:21:40 +0000 (GMT)
Message-ID: <8019ad54-3371-4d71-be21-e502c0d64703@intel.com>
Date: Thu, 7 Nov 2024 10:21:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_GuC=3A_Improve_h?=
 =?UTF-8?Q?andling_of_the_malformed_G2H_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20241105173032.1947-1-michal.wajdeczko@intel.com>
 <173094159553.1419576.10592915235781384917@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173094159553.1419576.10592915235781384917@2413ebb6fbb6>
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



On 07.11.2024 02:06, Patchwork wrote:
> == Series Details ==
> 
> Series: GuC: Improve handling of the malformed G2H (rev2)
> URL   : https://patchwork.freedesktop.org/series/140958/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2169-1051f5a468c5531923b01ba67999e502ce47a6b0_full -> xe-pw-140958v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-140958v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-140958v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-140958v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 

all unrelated, all from noisy KMS

>   * igt@kms_color@ctm-0-75@pipe-b-edp-1:
>     - shard-lnl:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2169-1051f5a468c5531923b01ba67999e502ce47a6b0/shard-lnl-7/igt@kms_color@ctm-0-75@pipe-b-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140958v2/shard-lnl-3/igt@kms_color@ctm-0-75@pipe-b-edp-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-c-edp-1:
>     - shard-lnl:          [PASS][3] -> [FAIL][4] +3 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2169-1051f5a468c5531923b01ba67999e502ce47a6b0/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-c-edp-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140958v2/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-c-edp-1.html
> 
>   
