Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884B6C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 19:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3193E10E236;
	Thu, 10 Jul 2025 19:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpYYZ53Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407BF10E236
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 19:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752175952; x=1783711952;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=8cVG4aXr3jeBlAhHl4ZBFUwQRerHHR6uNwTiNY843H8=;
 b=HpYYZ53ZfYAjxZHeRxjad2TzA8qMBjoz3yBq6cbF5njUtJWB4twZdtW4
 OG8pMsHFUrhOlXX0H3fZ+JnyuQS2jcbzZ1xn38wPG/gK6i6nJ3cUHFH9t
 CZzH1fOpOUa83V0IaslBZllJsCnyvNPco1UqHDg0A2cF5KQmKqvKYuPnK
 xDNTpFS2Kae6JucEwapVjJDdADOoAyu+QScKQAyPqfZmzexyAMoLW2cSy
 gDiV8kyLYnZJa8xWUh+OV5LMq2NYSbSY5ib/IjjqD3d/R+VFrl5n6SP5h
 s2T1xQTwShOOgRngHUW1Q3/NYNulf0eL7adHm0JaBpPvH24qT/VeBW70e g==;
X-CSE-ConnectionGUID: tgg2DV+mRmqGzaUF+Nr+1w==
X-CSE-MsgGUID: 6rjDqu1tS22jm+UqSAX1jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="58131072"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="58131072"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:31:44 -0700
X-CSE-ConnectionGUID: h9ALmL7ASZu/6MfGFLTk+g==
X-CSE-MsgGUID: 6t1xvNzkTN6yavoFWiRRbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="160507815"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 10 Jul 2025 12:31:43 -0700
Received: from [10.245.84.121] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7996632EDE
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 20:31:41 +0100 (IST)
Message-ID: <da84d4ff-6324-407e-9042-2d9153f08c0c@intel.com>
Date: Thu, 10 Jul 2025 21:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Cancel_ongo?=
 =?UTF-8?Q?ing_H2G_requests_when_stopping_CT?=
To: intel-xe@lists.freedesktop.org
References: <20250709174038.1876-1-michal.wajdeczko@intel.com>
 <175209769642.149137.6797463672407574006@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175209769642.149137.6797463672407574006@1538d3639d33>
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



On 09.07.2025 23:48, Patchwork wrote:
> == Series Details ==
> 
> Series: Cancel ongoing H2G requests when stopping CT
> URL   : https://patchwork.freedesktop.org/series/151406/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3384-8cbc0224847589e88bb3ea0c00952c51e00f5bd6_FULL -> xe-pw-151406v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-151406v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-151406v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-151406v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated

> 
>   * igt@kms_async_flips@test-time-stamp@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151406v1/shard-dg2-434/igt@kms_async_flips@test-time-stamp@pipe-b-dp-4.html

kms_async_flips:7150) CRITICAL: Test assertion failure function
test_timestamp, file ../tests/kms_async_flips.c:537:
(kms_async_flips:7150) CRITICAL: Failed assertion: seq1 == seq + 1
(kms_async_flips:7150) CRITICAL: Vblank sequence is expected to be
incremented by one(6047 != (6041 + 1)

> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151406v1/shard-dg2-433/igt@xe_pm@s4-vm-bind-userptr.html

no logs, but it looks that device was lost after it already resumed,
while patch touches reset/suspend paths

