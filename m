Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC04606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HZEMoiE6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A54410E4A3;
	Thu, 29 Oct 2026 09:18:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2F7112106
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 09:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793265484; x=1824801484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=diFP7E/ukFeYEly7YPVi1clJaJ+BG5+jLllUiQCyrpk=;
 b=HZEMoiE6V/YQGa4nQK4DOlsBYF6fOWcVXYMcFKLDedU0atWvcHBkQEeo
 RzUVqwneX0Ubg9U+bIszrAtTpv5dvkHX5bzLM2S7YPQ2fHvQsJrioHmPF
 hY6PFSMeJyT4VkclBtZz/UE5gMVwg1Xs29+TZyh7rX9dKhMQFbzTscWEq
 bl/3MKZgDKZaO4C15yOJtQQ5fRC4KT4knsEqtUGVexqFYfVQ0obaT4nD4
 8NX4UBA8NbXiA18RwOVB3O98jqYDqJL9hYAlaKy6sVcbwNWXe2RIveNIU
 OVdkOXSAMgg2KEnK0uiwhBWM1I/xYnnMD8CXrdJbr69U65ebA83gshwBc g==;
X-CSE-ConnectionGUID: QxIIEANWQwqx7dZAyWWHVQ==
X-CSE-MsgGUID: hI9gltO/Rt2c5kOxHzKMfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1880763"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1880763"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:18:04 -0700
X-CSE-ConnectionGUID: G737yqHqSc2n1m49r63pXg==
X-CSE-MsgGUID: P1E5UmjpTuGdmWYp/Co1Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5096256"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:18:01 -0700
Date: Thu, 29 Oct 2026 10:17:58 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v7 00/10] Add CPER logging support for CRI
Message-ID: <auMPRpO3ZAoMqFmx@black.igk.intel.com>
References: <20261029082752.1739281-12-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029082752.1739281-12-badal.nilawar@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 01:57:53PM +0530, Badal Nilawar wrote:
> This patch series adds CPER (Common Platform Error Record) logging support
> for RAS errors reported by Intel Xe GPUs. CPER records are emitted through
> a trace event.
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
> v5:
>   - Fixed v4 comments
>   - Covered default paths in error handling flow
>   - Moved info queue related patches at top
>   - Added example logs
> 
> v6:
>   - Fixed v6 comments
>   - Dropped the Info Queue patches; they will be submitted separately
>   - Dropped "drm/xe/xe_ras: Report unknown errors using SIGID" as
>     SIGID logging is not needed for it (Riana/Raag)
> v7:
>   - Rebased
>   - Fixed Sashiko comments
>   - Added GUID of PCIID 6752

I think we missed a few comments[1][2][3] here. Please make sure to address
them.

Raag

[1] https://lore.kernel.org/intel-xe/auIoa-LxjETpt0LR@black.igk.intel.com/
[2] https://lore.kernel.org/intel-xe/auIrXSWHyxE2K_M6@black.igk.intel.com/
[3] https://lore.kernel.org/intel-xe/auIuFsYCyl5m2mrG@black.igk.intel.com/

> Badal Nilawar (10):
>   drm/xe/cper: Add CPER reporting entry point for xe_log
>   drm/xe/cper: Retrieve the error counter record for CPER reporting
>   drm/xe/cper: Initialize Intel-specific CPER header
>   drm/xe/cper: Construct CPER record for hardware errors
>   drm/xe/cper: Log CPER records for aggregate counter retrieval
>   drm/xe/cper: Emit cper record to trace buf
>   drm/xe/xe_ras: Report device memory errors using SIGID
>   drm/xe/xe_ras: Report core compute errors using SIGID
>   drm/xe/xe_ras: Report soc internal errors using SIGID
>   drm/xe/xe_ras: Report correctable errors using SIGID
> 
>  .../ABI/testing/sysfs-driver-intel-xe-cper    |  18 +
>  drivers/gpu/drm/xe/Makefile                   |   3 +
>  drivers/gpu/drm/xe/xe_cper.c                  | 321 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_cper.h                  |  37 ++
>  drivers/gpu/drm/xe/xe_cper_types.h            | 110 ++++++
>  drivers/gpu/drm/xe/xe_device_types.h          |   4 +
>  drivers/gpu/drm/xe/xe_log.c                   |   5 +-
>  drivers/gpu/drm/xe/xe_ras.c                   | 146 ++++++--
>  drivers/gpu/drm/xe/xe_ras.h                   |   2 +
>  drivers/gpu/drm/xe/xe_trace_cper.c            |   9 +
>  drivers/gpu/drm/xe/xe_trace_cper.h            |  65 ++++
>  11 files changed, 692 insertions(+), 28 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-cper
>  create mode 100644 drivers/gpu/drm/xe/xe_cper.c
>  create mode 100644 drivers/gpu/drm/xe/xe_cper.h
>  create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
>  create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h
> 
> -- 
> 2.56.0
> 
