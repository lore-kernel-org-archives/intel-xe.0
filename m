Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D891AC79F85
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:09:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3245110E088;
	Sun,  6 Sep 2026 17:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2KPIapC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68ABC10E088
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788714555; x=1820250555;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7czT+9VBlWRvt02F0Skb6tKqybzdVKpINTiSDKJX8cY=;
 b=E2KPIapCkWHG49EwX5V722KV5TR2cBfcJkT7bzeuKnVwK1COT39GLQgX
 6eVFfO1IFtrlDOFS2KXMUKMjUwAT+1Mybj044hX66YI/Pd0cv3/6EWSLJ
 wXOVi2XDFpVyCPovW9T5K+5OUmfXTj67lRnT40Pl6LIKqGovutkSGP9jB
 X6si8P8jJhJA0s3UwyWTpIqPv9ryCbGae4T8VR7cZf28GcfnJumtKhf/c
 O13UWydY0oup4QgYnoDmZB80P+m8kiV93t3Pk/liDDqALcPjRU0R2tIU2
 yCExdxuuRHRvTFYdqYTotoLXd3SqPAo8+ZuJCWr7/Qv+W5CPmVxT5ldR2 A==;
X-CSE-ConnectionGUID: rVxWSPSuRWmAh7Moqe9uIA==
X-CSE-MsgGUID: k9KXxQLESquk+HJ2XB39Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88071440"
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="88071440"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:15 -0700
X-CSE-ConnectionGUID: XbNPiwxYRF2UDDnRYc05iA==
X-CSE-MsgGUID: ZGdkucYDQG+Pc5S1FzIyEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="269996109"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:12 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: [PATCH v3 00/12] Add CPER logging support for CRI
Date: Sun,  6 Sep 2026 22:56:05 +0530
Message-ID: <20260906172604.2215987-14-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This patch series adds CPER (Common Platform Error Record) logging support
for Correctable errors reported by Intel Xe GPUs. CPER logging is done
through trace event.

v2:
   - Extended CPER logging to Uncorrectable errors and xe_ras_get_counter
     request
   - Log CPER records via xe_log SIGID infra 

v3:
  - Added the patches in incremental order (Raag)
  - Fixed Sashiko warnings which are applicable 


Badal Nilawar (12):
  drm/xe/cper: Hardware error CPER reporting from xe_log
  drm/xe/cper: Retrieve the error counter record for CPER reporting
  drm/xe/cper: Add Intel specific CPER structures
  drm/xe/cper: Prepare CPER record
  drm/xe/xe_ras: Add support to retrieve info queue data for CRI
  drm/xe/cper: Prepare Intel CPER error info records
  drm/xe/cper: Log CPER records for aggregate counter retrival
  drm/xe/xe_ras: Report device memory errors using SIGID
  drm/xe/xe_ras: Report core compute errors using SIGID
  drm/xe/xe_ras: Report soc internal errors using SIGID
  drm/xe/xe_ras: Report correctable errors using SIGID
  drm/xe/cper: Emit cper record to trace buf

 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/regs/xe_regs.h             |   2 +
 drivers/gpu/drm/xe/xe_cper.c                  | 479 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper.h                  |  25 +
 drivers/gpu/drm/xe/xe_cper_types.h            | 179 +++++++
 drivers/gpu/drm/xe/xe_drm_ras_types.h         |   3 +
 drivers/gpu/drm/xe/xe_log.c                   |  17 +-
 drivers/gpu/drm/xe/xe_ras.c                   | 358 +++++++++++--
 drivers/gpu/drm/xe/xe_ras.h                   |   6 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 118 ++++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 drivers/gpu/drm/xe/xe_trace_cper.c            |   9 +
 drivers/gpu/drm/xe/xe_trace_cper.h            |  66 +++
 13 files changed, 1211 insertions(+), 56 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_cper.h
 create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h

-- 
2.54.0

