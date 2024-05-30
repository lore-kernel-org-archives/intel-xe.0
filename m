Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D29C27C43
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 11:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04A010E14C;
	Thu, 30 May 2024 11:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HshLAiJy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731BC10E14C;
 Thu, 30 May 2024 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717067945; x=1748603945;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=VLVydp5L7H7d9uI3AMj5FIEnIjJUaSNHohOQcfMkZ8g=;
 b=HshLAiJyueMQKSt2+gx6RBH7jXG53KQB2DTzwmhQqomeoUuqWfQkQHHO
 HpWZncNJaS5LMZyJlb8fhakP1aaj7OfpNFD8WS6Zmkqd20EGj73tNcITy
 qNbUzFxG06s7GGc95c7CtaKHug6yPf47adFFaJsUtSqKpGXzWczxi93Di
 QLtnu+gzDFO6h+qPtDMvxryRoYTeppJRNAbTSRKCZeXRQR5qQX7ilkG+k
 zHwsCjKnKzyqul8TPzEj1AjCANfS12T22oQrJU9rMsMDwkARcpJVNlmlK
 ggCmAMiPi3oIrBrWAxkTL8xOwO11zjrfi52Ej5aw+qEMtqyGv752QMcAI Q==;
X-CSE-ConnectionGUID: nFBiIXDeRUmhdHYny7eC4w==
X-CSE-MsgGUID: MQfJ/5YOQQSlhu73mtzOvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="16488747"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="16488747"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 04:19:04 -0700
X-CSE-ConnectionGUID: rcrsg0l0Rj6kem/F79u5HA==
X-CSE-MsgGUID: IIYkgBYqT92RFDCg+F9Vqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="35853504"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa009.fm.intel.com with ESMTP; 30 May 2024 04:19:03 -0700
Received: from [10.246.25.139] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.25.139])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id EB7EE1242C;
 Thu, 30 May 2024 12:19:01 +0100 (IST)
Message-ID: <6d9d3977-fcf7-40ae-85f2-bd730217d98d@intel.com>
Date: Thu, 30 May 2024 13:19:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Split_?=
 =?UTF-8?Q?MCR_initialization?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240529162945.1240-1-michal.wajdeczko@intel.com>
 <171701078174.2234143.1195067952768312508@8e613ede5ea5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171701078174.2234143.1195067952768312508@8e613ede5ea5>
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



On 29.05.2024 21:26, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Split MCR initialization
> URL   : https://patchwork.freedesktop.org/series/134196/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1372-fc8c84173ee4de00aaea8235be8442b50af5454a_full -> xe-pw-134196v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-134196v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134196v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-134196v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>     - shard-adlp:         NOTRUN -> [FAIL][1] +2 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v1/shard-adlp-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

this seems to be a recent regression from the build known as
xe-1371-da00654c89411daac601fd16ac6c45e48639d334, which points to [1]

[1]
https://cgit.freedesktop.org/drm/drm-tip/commit/?id=da00654c89411daac601fd16ac6c45e48639d334


> Build changes
> -------------
> 
>   * Linux: xe-1372-fc8c84173ee4de00aaea8235be8442b50af5454a -> xe-pw-134196v1
> 
>   IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1372-fc8c84173ee4de00aaea8235be8442b50af5454a: fc8c84173ee4de00aaea8235be8442b50af5454a
>   xe-pw-134196v1: 134196v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134196v1/index.html
> 
