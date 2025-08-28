Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC684CA0FF9
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 17:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEE110EA65;
	Thu, 28 Aug 2025 17:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RrzdTM0T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA7010EA65
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 17:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756402921; x=1787938921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qgk5lkhbUULrx+Dn1J91+FcSf+TDaSsJr2w8ltj3zss=;
 b=RrzdTM0TtKy56eZeWOKSdyQkeDZzKyAmqZvyDsvQwQVLoG4qcnX1+6lx
 N2A0Jjo6hlS7VOEQcgEAvPUciy8IEItWGnqFuONRgcSuwzcslCcaeX+I8
 q3CUQB2nNKdfZDJC1DyraxqLmAwxA/RCAgNEvRcPJzcDmfrAdE3GRadeT
 RjuiG50cjpixinoMyvGMgxNEoRYFX3bYDiRxSrWjBnCLqqxGVh0iaYYKl
 pQkvLSajjD5a5fIWdqqMgeLaOAOmGSAA5rxzVkQDjCntZ9Ojy0exEenGl
 3+ok6YhiIauUK1YJz+M7gtS5xIWsvsPCv1EdGlmroi92J6NAtT1IyYz9i A==;
X-CSE-ConnectionGUID: ddlJpYi4QmKTlsKvdg8b0w==
X-CSE-MsgGUID: Zji3l0ejTAWxKBuPJ/CEEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84085128"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="84085128"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:42:01 -0700
X-CSE-ConnectionGUID: nFTH/bGgQ5S9rGuz4Z/Crw==
X-CSE-MsgGUID: /v2SUCwqSSmnXAxtJynHDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="207317112"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa001.jf.intel.com with ESMTP; 28 Aug 2025 10:42:00 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v7 0/6] drm/xe/guc: Add LFD format output for guc log
Date: Thu, 28 Aug 2025 13:41:53 -0400
Message-Id: <20250828174159.1232994-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add new debugfs entry "guc_log_lfd", which supports output guc log
in LFD(Log Format Descriptors) format.
Add GuC crash dump data empty check. LFD will only include crash dump
section when data is not empty.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

---
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

Changes in v7:
Process log buffer layout by marker detect, not by index
Move debugfs support to end of series
Drop version structures, replaced as an single u32
Switch to use local structure from local buffer
Output lfd in binary format
Use wrap_offset for log event buffer for wraparound handling
As crash dump is very small, remove cross chunk handling
Changes in v6:
Replace log_init_config to lic
Changes in v5:
Cleanup inconsistent macro, type and symbol names (Michal)
Switch to use 1K local stack for buffer usage (Michal)
Changes in v4:
Rebase with debugfs changes (Michal)
Drop "_t" suffix in structures name (Matthew, Michal)
Split log abi header as seperate patch (Michal)
Fix static vaiable multiple instance access issue (Michal)
Switched to fixed size(2M) of lfd buffer, removed buffer size check for KLVs
Removed log event buffer content copy, read from log buffer chunks directly
Changes in v3:
Split ABI header, debugfs and GuC code out as seperate patch
Remove bit fields in structure define, changed to GENMASK
Remove crash_dumped flag, changed to dump data empty check
Changes in v2:
Split GuC init config abi defines out from LFD abi header file
Split crash dump detect as seperate patch
Add size check for LFD functions
Make abi header comments kernel-doc style

Zhanjun Dong (6):
  drm/xe/guc: Add log init config abi definitions
  drm/xe/guc: Add LFD related abi definitions
  drm/xe/guc: Add GuC log init config in LFD format
  drm/xe/guc: Add GuC log event buffer output in LFD format
  drm/xe/guc: Only add GuC crash dump if available
  drm/xe/guc: Add new debugfs entry for lfd format output

 drivers/gpu/drm/xe/abi/guc_lfd_abi.h | 171 ++++++++++++
 drivers/gpu/drm/xe/abi/guc_lic_abi.h |  74 +++++
 drivers/gpu/drm/xe/xe_guc_debugfs.c  |   7 +
 drivers/gpu/drm/xe/xe_guc_log.c      | 396 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h      |   1 +
 5 files changed, 649 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_lfd_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_lic_abi.h

-- 
2.34.1

