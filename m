Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BA3C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 14:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3A810E8B5;
	Thu,  7 Dec 2023 14:45:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A3910E8B5
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 14:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701960350; x=1733496350;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=J5o4WFGZhz6EfbsoZeLbe8K/tIuG6bDS/AhNxf6ZSwI=;
 b=C57bPsUj/42H2Pxx6CHOvq1gO+o8vdV6ai1a9sEmHcqCQlaf7QlADdPB
 sjAikDNNNp3L0UDu4u1+cU6eVuM3w3K3jMtAUEDiJi2dXofhQwOQLMchd
 qzfiJhPP9qXBjJYaa0awcCL2hSg0Qz6yjTLoHgHikFEx0fewql3dKRt5y
 5RWWE13hA0570nTlc5olMNCaLxuCkES7zDSVtFPRGXPngYiZpiPZgmQBa
 r6z5ruEW9wr37wSPPUV4D7DZF85wyCxrbvGVZH3o4LKXFc/lhaEQJRuO+
 OPpxSj6QqSwpcrO9ajKC26ZlXU2ItBeyfM0R6OTpBAJqzkUhoOZrmTzmV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="379255392"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="379255392"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:45:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="945056310"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="945056310"
Received: from jbuller-mobl.ger.corp.intel.com (HELO [10.213.214.207])
 ([10.213.214.207])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:45:49 -0800
Message-ID: <4c5c2902-9503-465e-8a59-d17d75d8781f@linux.intel.com>
Date: Thu, 7 Dec 2023 14:45:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Engine Busyness
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
References: <20231207125802.3730165-1-riana.tauro@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20231207125802.3730165-1-riana.tauro@intel.com>
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


Hi,

On 07/12/2023 12:57, Riana Tauro wrote:
> GuC provides engine busyness ticks as a 64 bit counter which count
> as clock ticks. These counters are maintained in a
> shared memory buffer and internally updated on a continuous basis.
> 
> GuC also provides a periodically total active ticks that GT has been
> active for. This counter is exposed to the user such that busyness can
> be calculated as a percentage using
> 
> busyness % = (engine active ticks/total active ticks) * 100.

I think I've asked this before but don't remember it was clarified - 
what are the semantics of "active" with total active ticks? In other 
words considering activity timelines like:

1)
      0          1s
rcs0 |xxxxx-----|
bcs0 |-----xxxxx|

2)
      0          1s
rcs0 |xxxxx-----|
bcs0 |xxxxx-----|

Assuming 1s sampling, would the above formula correctly say 50% for both 
engines in both cases?

I am also curious if there are plans to add support to intel_gpu_top in 
which case please copy me on the required refactorings.

Regards,

Tvrtko

> This can be listed as
> 
> sudo ./perf list
>       xe_0000_03_00.0/total-active-ticks-gt0/            [Kernel PMU event]
>       xe_0000_03_00.0/bcs0-busy-ticks-gt0/               [Kernel PMU event]
>       xe_0000_03_00.0/ccs0-busy-ticks-gt0/               [Kernel PMU event]
>       xe_0000_03_00.0/rcs0-busy-ticks-gt0/               [Kernel PMU event]
>       xe_0000_03_00.0/vcs0-busy-ticks-gt0/               [Kernel PMU event]
>       xe_0000_03_00.0/vecs0-busy-ticks-gt0/              [Kernel PMU event]
> 
> and can be read as
> 
> 	sudo ./perf stat -e xe_0000_03_00.0/bcs0-busy-ticks-gt0/,xe_0000_03_00.0/total-active-ticks-gt0/  -I 1000
> 
> v2: rebase
>      fix review comments
> 
> Riana Tauro (8):
>    RFC drm/xe: Move user engine class mappings to functions
>    RFC drm/xe/guc: Add interface for engine busyness ticks
>    RFC drm/xe/guc: Expose engine busyness only for supported GuC version
>    RFC drm/xe/guc: Add PMU counter for total active ticks
>    RFC drm/xe/uapi: Add configs for Engine busyness
>    RFC drm/xe/pmu: Add PMU counters for engine busy ticks
>    RFC drm/xe/guc: Dynamically enable/disable engine busyness stats
>    RFC drm/xe/guc: Handle runtime suspend issues for engine busyness
> 
>   drivers/gpu/drm/xe/Makefile                 |   1 +
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   1 +
>   drivers/gpu/drm/xe/xe_exec_queue.c          |  19 +-
>   drivers/gpu/drm/xe/xe_gt.c                  |  26 ++
>   drivers/gpu/drm/xe/xe_gt.h                  |   3 +
>   drivers/gpu/drm/xe/xe_guc.c                 |   7 +
>   drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 367 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  21 ++
>   drivers/gpu/drm/xe/xe_guc_fwif.h            |  15 +
>   drivers/gpu/drm/xe/xe_guc_types.h           |  25 ++
>   drivers/gpu/drm/xe/xe_hw_engine.c           |  50 +++
>   drivers/gpu/drm/xe/xe_hw_engine.h           |   3 +
>   drivers/gpu/drm/xe/xe_pmu.c                 | 189 +++++++++-
>   drivers/gpu/drm/xe/xe_pmu.h                 |   2 +
>   drivers/gpu/drm/xe/xe_query.c               |  23 +-
>   include/uapi/drm/xe_drm.h                   |  24 ++
>   16 files changed, 726 insertions(+), 50 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.h
> 
