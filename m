Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD34C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 15:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE04010E8EC;
	Thu, 30 May 2024 15:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAel8gH5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399FC10E8EC
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717083183; x=1748619183;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=isKE+Gz5j1/EJHDPHfMnmCqm57aCBYPlJqQruOUTgz0=;
 b=QAel8gH5sBGXOLbV8zTD0ymK8xJH0r7XBaXlvvmVzNQweP7J8ySKW1mv
 2G80R89FDRdI8sMqw+slVHApzHGo5eTjVn5dqOrExk1PzusKfGwOmtuoM
 wT4yOzXyofP+b7RUd3B3sVWCml7tvdm5sKJcRLyaaNYRf5FQllE7iwLqN
 xVeEbMrWCM07QVk8fHNRTei7NF1Ccs/HlLXBsv0UJY+t/DzNOzFayjdk4
 vS88Wn8+zo9CFfaWUnq6yEOz+xNr2hUOvbg2iwZiw81XI8BL3RAuZGtmV
 YZHHCuf/KpCAnLBMXhTrOCrTMoCXvjiJpzH4P0ptYF6G7ZzcCzSBV2tKG Q==;
X-CSE-ConnectionGUID: vwWeB6PmQl2x3UlJMRQbdw==
X-CSE-MsgGUID: dpkM+IEDTEu2G+XripWuJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13697858"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="13697858"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:32:59 -0700
X-CSE-ConnectionGUID: GPpbvMHlS+qB8ImgXj8iJg==
X-CSE-MsgGUID: SY2OWzBMSxa1I4NTUdLVGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="40321361"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:32:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, Radhakrishna Sripada
 <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v3 0/6] Tracing cleanup and add mmio tracing
In-Reply-To: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
Date: Thu, 30 May 2024 18:32:55 +0300
Message-ID: <87ikyvgvrs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 30 May 2024, Radhakrishna Sripada <radhakrishna.sripada@intel.com> wrote:
> xe_trace.h is getting bloated. Group related events to their own
> files. All bo, vm and vma related events have been moved to 
> xe_trace_bo.h. GuC related trace events have been moved to
> xe_trace_guc.h. Patches 1 and 2 splits the trace events into
> seperate files.
>
> In multi gpu environments, it is important to know the device from
> which the event was triggered. Print the device id information along
> with the trace information being printed. Patches 3, 4 and 5 make
> changes to print the device id's if not already captured.
>
> Mmio reg read writes are important tracing information that needs to be
> captured and will be helpful in display debug. Patch 6 adds the reg
> read/write tracing support.
>
> Earlier versions of patch 6 can be found here:
> v1: https://patchwork.freedesktop.org/series/119312/
> v2: https://patchwork.freedesktop.org/series/132626/
>
> Radhakrishna Sripada (6):
>   drm/xe/trace: Extract bo, vm, vma traces
>   drm/xe/trace: Extract guc related traces
>   drm/xe/trace: Print device_id in xe_trace_bo events
>   drm/xe/trace: Print device_id in xe_trace_guc events
>   drm/xe/trace: Print device_id in xe_trace events
>   drm/xe: Add reg read/write trace
>
>  drivers/gpu/drm/xe/Makefile                 |   2 +
>  drivers/gpu/drm/xe/xe_bo.c                  |   2 +-
>  drivers/gpu/drm/xe/xe_gt_pagefault.c        |   2 +-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  27 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c              |  15 +-
>  drivers/gpu/drm/xe/xe_migrate.c             |   2 +-
>  drivers/gpu/drm/xe/xe_mmio.c                |  22 +-
>  drivers/gpu/drm/xe/xe_pt.c                  |   8 +-
>  drivers/gpu/drm/xe/xe_trace.h               | 368 +++-----------------
>  drivers/gpu/drm/xe/xe_trace_bo.c            |   9 +
>  drivers/gpu/drm/xe/xe_trace_bo.h            | 244 +++++++++++++
>  drivers/gpu/drm/xe/xe_trace_guc.c           |   9 +
>  drivers/gpu/drm/xe/xe_trace_guc.h           | 107 ++++++

Seems nice. Now y'all can bikeshed whether to name them
xe_trace_foo.[ch] or xe_foo_trace.[ch]!

*ducks*

>  drivers/gpu/drm/xe/xe_vm.c                  |   2 +-
>  14 files changed, 480 insertions(+), 339 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.c
>  create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.h
>  create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.h

-- 
Jani Nikula, Intel
