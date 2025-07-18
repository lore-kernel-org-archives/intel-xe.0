Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD330C83F34
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 23:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5847610EA4F;
	Fri, 18 Jul 2025 23:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agY/tXsB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9D810E19F
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 23:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752880345; x=1784416345;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dUPkyaw8hRb3TGCcjJ5rTxO3pdUSmCTw1dvwV5dCENU=;
 b=agY/tXsBvQ1nMZKSE0SmBUzeAXutRmfajPFW69GBf88WgJcBgxl7qXsi
 2icStJAJRW8c0wHzeG9hO6/OmyCJnIGL6/5upeLhoDCcKN5wEsgy3xn5s
 45908xc/2wD+wM3B5beWPDKstgXzTnfyAoINiU8D/cNb9+LV9jSUAnvdd
 H6ZF7s9AUQ8fuYFeVrzfbwP2vL7AuFyEBtPEI76GjQdAA5GZThwBvE5mw
 7uIQxaC0pqA2A/Net/9K7yovT9hYAQFLyqSRdFoA6R7wMwXzVYZzM+XDm
 pj1K1ZyKiMLHjBApkNbz30P08L+o3lDxpf4FvLsqZwdhTQ3Sx5FJCgGzV A==;
X-CSE-ConnectionGUID: 6zBQtpPpRXGBuy++nOpj9Q==
X-CSE-MsgGUID: GSqH75sHTK+N2/V5NryCXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="58995566"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="58995566"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 16:12:25 -0700
X-CSE-ConnectionGUID: GMEJO3cJQWKoxrpPl1BsFw==
X-CSE-MsgGUID: yn/j+yS2TB+X2ebUCkFjPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="163949088"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa005.jf.intel.com with ESMTP; 18 Jul 2025 16:12:24 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v5 0/6] drm/xe/guc: Add LFD format output for guc log
Date: Fri, 18 Jul 2025 19:12:17 -0400
Message-Id: <20250718231223.670188-1-zhanjun.dong@intel.com>
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
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

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
  drm/xe/guc: Add new debugfs entry for lfd format output
  drm/xe/guc: Add GuC log init config in LFD format
  drm/xe/guc: Add GuC log event buffer output in LFD format
  drm/xe/guc: Only add GuC crash dump if available

 drivers/gpu/drm/xe/abi/guc_lfd_abi.h | 282 ++++++++++++++++++++
 drivers/gpu/drm/xe/abi/guc_lic_abi.h | 107 ++++++++
 drivers/gpu/drm/xe/xe_guc_debugfs.c  |   7 +
 drivers/gpu/drm/xe/xe_guc_log.c      | 382 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h      |   1 +
 5 files changed, 779 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_lfd_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_lic_abi.h

-- 
2.34.1

