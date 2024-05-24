Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC1EC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 14:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0271C10E8EA;
	Fri, 24 May 2024 14:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYf4fiKk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C0E10ED0D;
 Fri, 24 May 2024 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716560577; x=1748096577;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=neKw/0sQYsDbmqfDOQrit0mF1CbDc1LBWPNmvLgLrAM=;
 b=PYf4fiKkDS7N4oc4rY27qK7kasqr94qNh3kdTDDWDYhwOFu/iOl4Jxit
 EL1nVKaGtEHq33TG8Z1AjAOOKMJquaCHfu6WdUdRIsNJBNcJCV6W4xxQ+
 Klk3oP8Ku/WDfzPNblAnMTwM2Zcqb3bcRHi4DyU5BPQ8hz1zcsuti3wOQ
 vSulhiJL8ilL2O7fs/ynTyNZvaq+Vn5e1djzqOiG2WJD/kR846zcJIqen
 HI2QNrYIX5k96tHOK8sTtoHKXB02aFKVGigIKTkQjp7XQIIC3PNcqrfk3
 Cf3AVZ+oBYbEH9e5H89LVtQU8Q4TPAdlJ/Iof00q91L3++aBEW+njoNQZ Q==;
X-CSE-ConnectionGUID: Da9dVaOtT8GYgJEvtcXv4A==
X-CSE-MsgGUID: FZ7u4gfARVCdzBTXABD9jg==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="24351169"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="24351169"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 07:22:56 -0700
X-CSE-ConnectionGUID: qhN3pUPJTW2vmR5Kn1HXlA==
X-CSE-MsgGUID: T+Ng6F/dTsOz4nSiQ0MXGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="34018956"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.4.197])
 ([10.246.4.197])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 07:22:55 -0700
Message-ID: <02161ef7-84ea-4411-84e7-9f309ed6d32c@intel.com>
Date: Fri, 24 May 2024 16:22:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=C3=A2_CI=2EBAT=3A_failure_for_drm/xe=3A_flush_gtt_?=
 =?UTF-8?Q?before_signalling_user_fence_on_all_engines?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 I915-ci-infra@lists.freedesktop.org
References: <20240522-xu_flush_vcs_before_ufence-v2-1-9ac3e9af0323@intel.com>
 <171636721390.2166515.6639451569991799640@8e613ede5ea5>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <171636721390.2166515.6639451569991799640@8e613ede5ea5>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 22.05.2024 10:40, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe: flush gtt before signalling user fence on all engines
> *URL:*	https://patchwork.freedesktop.org/series/133906/ 
> <https://patchwork.freedesktop.org/series/133906/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd_BAT -> xe-pw-133906v1_BAT
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-133906v1_BAT absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-133906v1_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (5 -> 4)
> 
> Missing (1): bat-pvc-2
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> xe-pw-133906v1_BAT:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
>       o bat-atsm-2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html>

Not related, already observed on[1]

[1]: 
https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/bat-lnl-1/igt@xe_exec_threads@threads-mixed-fd-basic.html



> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@xe_dma_buf_sync@export-dma-buf-once:
>       o {bat-lnl-1}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/bat-lnl-1/igt@xe_dma_buf_sync@export-dma-buf-once.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/bat-lnl-1/igt@xe_dma_buf_sync@export-dma-buf-once.html>

ditto

Apparently there is bug filled for it [2], probably created after this 
run. Re-test submitted.

[2]: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1908

Regards
Andrzej

> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-133906v1_BAT that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@xe_evict@evict-small-cm:
> 
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/bat-adlp-7/igt@xe_evict@evict-small-cm.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +15 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
> 
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +32 other tests skip
>   *
> 
>     igt@xe_huc_copy@huc_copy:
> 
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html> (Intel XE#255 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>   *
> 
>     igt@xe_pat@pat-index-xe2:
> 
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html> (Intel XE#977 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>   *
> 
>     igt@xe_pat@pat-index-xehpc:
> 
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) +1 other test skip
> 
> 
>         Possible fixes
> 
>   * igt@xe_exec_threads@threads-mixed-fd-basic:
>       o bat-adlp-7: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/bat-adlp-7/igt@xe_exec_threads@threads-mixed-fd-basic.html> (Intel XE#1908 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/bat-adlp-7/igt@xe_exec_threads@threads-mixed-fd-basic.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd ->
>     xe-pw-133906v1
> 
> IGT_7867: f3006a13799e3bc45d754aa8ad318394277d69ac @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd: 
> b134db8544f8d5b8a960b368afe12820c3cbe8cd
> xe-pw-133906v1: 133906v1
> 

