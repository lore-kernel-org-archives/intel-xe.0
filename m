Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C78C9832A
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 08:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2F410E07C;
	Tue, 29 Sep 2026 08:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKfB/Ruc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131D810E07C
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 08:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790669564; x=1822205564;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=sbHBYmKGZVjQwE7IgfqzpVoreAp0GgsmoXS2+ptYq8Y=;
 b=IKfB/Ruc8DA11Ma9iRg0d8qTB141mWaDAFBZwMqlBxHDMP8NMX1N/C1L
 pdD4SMN4LXV43Wa21xM34RaZIGubvrYo8c+KgjPF1tJQ1w5A5a96OxZAR
 8LOx4dJVr99IeY8WpHzMYjmRCbNdQGRGwKaNmgcF8yiN9/CexuVaO3VNT
 v5YpRQp20EhH3qHGSoOF5qEBO2SiVGSS3UCHc9nYACTHYW8rn1WG9OZVT
 7YkUmpsUJDiVb6wXrLn2atg1+wcrU9pCHVFWFxlYwyd3cxyRd3R9sjAeA
 c2MOBcUII7lla+FZTZZ5lUHLVoG3VQW6CqlMV3T9M7ekaqvjx7T6xoq/a w==;
X-CSE-ConnectionGUID: EW89IdL2TwG8mFwGo/iWLg==
X-CSE-MsgGUID: jEIvE/8xQJuKqwhSrMqqcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91400375"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91400375"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 01:12:44 -0700
X-CSE-ConnectionGUID: GmSnSYqEQruuO7AF7lYcyg==
X-CSE-MsgGUID: RT7Z8l0xTLCsOzaujsJsjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="273092726"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.234])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 01:12:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 29 Sep 2026 11:12:34 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
 anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v11 00/20] Crescent Island PMT support
In-Reply-To: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
Message-ID: <6805e8bd-9b48-df74-986c-d5aa43a6724c@linux.intel.com>
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 23 Sep 2026, Michael J. Ruhl wrote:

> The Crescent Island (CRI) GPU supports PMT via Xe driver
> registration.
> 
> The CRI PMT MMIO mapping is shared for each PMT feature and it is
> necessary to set an index register value to access the correct memory
> space.
> 
> The PMT driver has a callback infrastructure to access data areas with
> driver specific access. It is does not support the PMT control access.
> 
> CRI discovery/control spaces are part of the access window so a driver
> callback is necessary to allow for the correct window to be exposed.
> 
> Add control path callback support to the PMT driver.
> 
> Add CRI PMT discovery information.
> 
> Update the Xe driver to support the CRI PMT access.
> 
> The crashlog access needs to be done with power enabled (telem is only
> available when the device is powered).
> 
> Determine which access is requested, and do the appropriate power
> request.
> 
> CRI FW is loaded at device power.  Support the late-binding API to
> wait for FW readiness. (pending sysctl patch set implements the API).
> 
> v2:
>   Address AI feedback:
>   - add missing entry->cb check
>   - address SRIOV VF concerns
>   - use xe_pm_runtime_put instead of _get in error path
> 
>   Address review comments:
>   - redo power/lock sequencing
>   - support device hotplug events
> 
> v3:
>   - cleanup power manangement flow
>   - fixed an out of order power management locking issue
>   - add a GUID caching mechanism, for GUID read
>   - removed unused parameter (mmio)
> 
> v4:
>  - address various review comments
>  - refactor crashlog to allow for return values
>  - for callback usage, decouple PMT remap of data areas
>  - use IS_SRIOV_VF() rather than expose soc-remapper internals
>  - separate locking fixes intos distinct steps
>  - refactor define update patches to seperate BMG and CRI updates
>  - separate internal GUID into separate steps
> 
> v5:
>  - removed callback helpers
>  - do not return error message with sysfs
>  - fix missed return code check in trigger_store
>  - return error value not false
>  - use DEFINE_RES_MEM
>  - document when base is unused
>  - return error on invalid GUID request
> 
> v6:
>  - fix enabled/disabled inversion
>  - fix missing DOC reference
>  - change memcpy_to/fromio to readl/writel for register read
>  - guid cache comment and update on valid guid
> 
> v7:
>  - reordered to have BMG updates followed by CRI support
>  - separate base_offset usage for clarity
>  - added EAGAIN usage to block uninitialized use of the API
> 
> v8:
>  - fix punit crashlog offset (should be 0xE60 not 0xE78)
>  - remove EAGAIN support and re-order probe steps to initialize
>    VSEC before other features use it
> 
> v9:
>  - added appropriate reviewed-bys
>  - use dev_err instead of pr_err
>  - enforce defined base usage when callbacks are in plcace
>  - move SRIOV check to get_platform_info
>  - assert SRIOV for API check
>  - use scoped_guard() where possible
>  - update to use correct sysctrl helper
> 
> v10:
>  - fix incorrect return type (broken in refactor, int -> bool)
>  - fix incorrectly documented error return values
>  - doc text cleanup
> 
> v11:
>  - add reviewed-by
>  - fix minor checkpatch issue
>  - use xe_assert() for a consistent API check
> 
> Michael J. Ruhl (18):
>   platform/x86/intel/pmt: complete pcidev to device update
>   platform/x86/intel/pmt: refactor rmw with a return value
>   platform/x86/intel/pmt: refactor rc with a return value
>   platform/x86/intel/pmt: Add register access callbacks
>   platform/x86/intel/pmt: Do not remap when using callbacks

These platform drivers side patches looked ready so I've taken these 
into a separate branch in pdx86 repo (+ one standalone pmt fix that looked 
relevant to this case).

I can do an IB PR out of that branch as needed if xe side wants to take 
the rest sometime in this cycle.

>   drm/xe/vsec: Do not register BMG PMT for VF
>   drm/xe/vsec: Correct locking order
>   drm/xe/vsec: Use correct pm state get
>   drm/xe/vsec: Add DOC text for VSEC
>   drm/xe/vsec: Support possible hotplug exit
>   drm/xe/vsec: Refactor BattleMage PMT defines
>   drm/xe/vsec: Update VSEC probe order
>   drm/xe/vsec: Add base_offset to allow for more flexibilty
>   drm/xe/vsec: Support Crescent Island PMT
>   drm/xe/vsec: Crescent Island PMT decode
>   drm/xe/vsec: Crescent Island PMT callbacks
>   drm/xe/vsec: Support late bind fw information
>   drm/xe/vsec: Add PMT GUID internal access
>   drm/xe/vsec: Update PMT internal access
>   drm/xe/vsec: Refactor platform check
> 
>  Documentation/gpu/xe/index.rst             |   1 +
>  Documentation/gpu/xe/xe_vsec.rst           |  14 +
>  drivers/gpu/drm/xe/regs/xe_pmt.h           |  12 +-
>  drivers/gpu/drm/xe/xe_debugfs.c            |  45 +-
>  drivers/gpu/drm/xe/xe_device.c             |   6 +-
>  drivers/gpu/drm/xe/xe_device_types.h       |   9 +
>  drivers/gpu/drm/xe/xe_hwmon.c              |  10 +-
>  drivers/gpu/drm/xe/xe_pcode.c              |  10 +-
>  drivers/gpu/drm/xe/xe_vsec.c               | 552 +++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_vsec.h               |   3 +-
>  drivers/platform/x86/intel/pmt/class.c     |  26 +-
>  drivers/platform/x86/intel/pmt/class.h     |   5 +-
>  drivers/platform/x86/intel/pmt/crashlog.c  | 235 ++++++---
>  drivers/platform/x86/intel/pmt/discovery.c |   2 +-
>  drivers/platform/x86/intel/pmt/telemetry.c |   3 +
>  include/linux/intel_vsec.h                 |  14 +-
>  16 files changed, 781 insertions(+), 166 deletions(-)
>  create mode 100644 Documentation/gpu/xe/xe_vsec.rst
> 
> 

-- 
 i.

