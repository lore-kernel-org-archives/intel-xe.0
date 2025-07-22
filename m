Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7256C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 01:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F22610E3CE;
	Tue, 22 Jul 2025 01:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9fOSKPz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8113910E3CE
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 01:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753148197; x=1784684197;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fmZAk+NCdIfChYjdfzNmvdiyIFIBvQNHEc2UDH/dPw0=;
 b=m9fOSKPze19yOgFW34Oh3Dc4P0Lu+FTGDk9OfZDy4T+MqGb1d/7/FxO6
 P7TPn+Xosccqfoz2TlUNCDG2qX2Xeha5ErXfowhgMZo3ave+RsD3xEpfm
 hGgGjHgYwc0SiXYg6/R6IKsMKzfXNz63Myl0sULPwHqC2GvL9mHnl66/W
 U1qBqVYOgMXWXiw7jstydEVI+hR+d/B8fzuVs2z4sbGmXIphFWhTsU4gl
 sF2DWt97p3jkeuxic8tI/yaA0ppXrUwMSFG54xUYYCIMpSmc+JpbqkgQ5
 u/eZmqTRBc6CLpJRLVtXBHNPGqwcpd9szbmSSD5UTngpFoxonhWy9lUWh Q==;
X-CSE-ConnectionGUID: 7R8udulgSE2WK7vSRBtbQQ==
X-CSE-MsgGUID: ZHPjMftGQza61wISg6Xa2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="54596786"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="54596786"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 18:35:55 -0700
X-CSE-ConnectionGUID: Fn2SIUCISCOf+Yciuzlv0g==
X-CSE-MsgGUID: nD0MuWYXQ+6IAXgMAFb+IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="163225875"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa003.jf.intel.com with ESMTP; 21 Jul 2025 18:35:55 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 0/6] drm/xe/guc: Add LFD format output for guc log
Date: Mon, 21 Jul 2025 21:35:47 -0400
Message-Id: <20250722013553.1266218-1-zhanjun.dong@intel.com>
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

