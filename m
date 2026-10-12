Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9201BCA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 06:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5576810EE7A;
	Mon, 12 Oct 2026 06:15:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430A810EE74
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 06:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791785705; x=1823321705;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5lFWZUg+Q5xyoD+9DA3bO0vBe1E97pWX4ZqUaWDIJ3A=;
 b=IGucjZDsFgQi9h8f0SP0cYztpjyHoygu923//8CJX7mNq7tqQ4DsPvF6
 lJsmEdmAzr5JNqRBbQZ2zCN9vIpfg+7YGWdxHFgsNXpLBDCW/gxj3CAmN
 UNQx4o/69b8HliRh2zNvrwHM+F/ksl3w+TbXhEvIZeGmmzV0Ya9gGTlzq
 yfYrl9fIZoUtLyQR7yrG9ZxHFc2Og94O0HviqR6ZB6k/tRs/1K40e3exu
 TRW9a3S41eKjTtOuoI0H4s5Tmle/kzqMkcF8Ocd/NySYQKs4/iS97TA8j
 aHRTJb9bxG/HTbML/QCtXZQezX+k0riM4+hS0WD+VQpUU0vU+r5Q5rSWP g==;
X-CSE-ConnectionGUID: +pCgT0jCTx68i0Qi2vOyyg==
X-CSE-MsgGUID: IWy1CtUNTeSkbvqomflftA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="388325"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="388325"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 23:15:05 -0700
X-CSE-ConnectionGUID: zsPKymZESPWP2y3KdcMjMg==
X-CSE-MsgGUID: SA6ymatZSdy6vhnFY1qHng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="748984"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 23:15:02 -0700
Date: Mon, 12 Oct 2026 08:14:59 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH v4 00/12] Add CPER logging support for CRI
Message-ID: <asx642wl72PkTZY4@black.igk.intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009104602.1075405-14-badal.nilawar@intel.com>
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

On Fri, Oct 09, 2026 at 04:16:03PM +0530, Badal Nilawar wrote:
> This patch series adds CPER (Common Platform Error Record) logging support
> for Correctable errors reported by Intel Xe GPUs. CPER logging is done

Is it still correctable errors?

Raag

> through trace event.
> 
> v2:
>    - Extended CPER logging to Uncorrectable errors and xe_ras_get_counter
>      request
>    - Log CPER records via xe_log SIGID infra 
> 
> v3:
>   - Added the patches in incremental order (Raag)
>   - Fixed Sashiko warnings which are applicable 
> 
> v4:
>   - Split the patches further for incremental review (Raag)
>   - Refactor info queue handling (Raag)
>   - Fix applicable Sashiko warnings
> 
> Badal Nilawar (12):
>   drm/xe/cper: Add CPER reporting entry point for xe_log
>   drm/xe/cper: Retrieve the error counter record for CPER reporting
>   drm/xe/cper: Initialize Intel-specific error section header
>   drm/xe/cper: Construct CPER record for hardware errors
>   drm/xe/xe_ras: Add support to retrieve info queue data for CRI
>   drm/xe/cper: Prepare Intel CPER error info records
>   drm/xe/cper: Log CPER records for aggregate counter retrieval
>   drm/xe/cper: Emit cper record to trace buf
>   drm/xe/xe_ras: Report device memory errors using SIGID
>   drm/xe/xe_ras: Report core compute errors using SIGID
>   drm/xe/xe_ras: Report soc internal errors using SIGID
>   drm/xe/xe_ras: Report correctable errors using SIGID
> 
>  .../ABI/testing/sysfs-driver-intel-xe-cper    |  18 +
>  drivers/gpu/drm/xe/Makefile                   |   3 +
>  drivers/gpu/drm/xe/xe_cper.c                  | 530 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_cper.h                  |  37 ++
>  drivers/gpu/drm/xe/xe_cper_types.h            | 185 ++++++
>  drivers/gpu/drm/xe/xe_device_types.h          |   4 +
>  drivers/gpu/drm/xe/xe_log.c                   |   5 +-
>  drivers/gpu/drm/xe/xe_ras.c                   | 254 ++++++++-
>  drivers/gpu/drm/xe/xe_ras.h                   |   5 +
>  drivers/gpu/drm/xe/xe_ras_types.h             | 118 +++-
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>  drivers/gpu/drm/xe/xe_trace_cper.c            |   9 +
>  drivers/gpu/drm/xe/xe_trace_cper.h            |  66 +++
>  13 files changed, 1202 insertions(+), 34 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-cper
>  create mode 100644 drivers/gpu/drm/xe/xe_cper.c
>  create mode 100644 drivers/gpu/drm/xe/xe_cper.h
>  create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
>  create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h
> 
> -- 
> 2.54.0
> 
