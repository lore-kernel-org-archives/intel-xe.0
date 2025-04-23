Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7016C369D8
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 21:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2098110E2D2;
	Wed, 23 Apr 2025 21:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYpY288x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D272A10E0B9
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 21:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745445504; x=1776981504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ub1Yvxiz2MFVzMkp+cwbLjbNyTcMVeSl4zWB6wdvhEM=;
 b=iYpY288x0okbWfiAL6pwE3yj1spO6dc0lWEs+By81A8GUsURd3zMNM8w
 MgSKfJsVa1KRtgqYxCIr02i+Xr7Ax8Tl4cDFLGgcn70LNVcQJm2Jks7nv
 XXq0lm4S7xvn0QxuBdUzwfmttVERCstUYOkTrXjTCS0Nkk+3VWxmidS4a
 OBvT69hnX+4bQR6uT2JVHwjjGOz23oMNy7UMgdDP7Hej5XRnr1IMrTH5m
 Faj/5+ANS4CLOISb55CSok0GJkaXLhWce2mDA0zl0n7OaRjCSqN6c5F1B
 HKn5HFcldiLGFg0LCeGhktEn+mPHc2fryoaNHItvrc+YjVmP8UQRyA7jl Q==;
X-CSE-ConnectionGUID: V3o+ox5BTByD3jCPm47pcg==
X-CSE-MsgGUID: 7ZUFVWgOSJ+ILPTgDAXnzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47073112"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47073112"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 14:58:23 -0700
X-CSE-ConnectionGUID: 4GxRVdK0TkeAk/kqoQbi3w==
X-CSE-MsgGUID: gRXkLQ6JRTyb0rF8cvBrwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="136507641"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa003.fm.intel.com with ESMTP; 23 Apr 2025 14:58:23 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 0/6] drm/xe/guc: Add LFD format output for guc log
Date: Wed, 23 Apr 2025 14:58:15 -0700
Message-Id: <20250423215821.3078428-1-zhanjun.dong@intel.com>
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

Changes in v4:
Rebase with debugfs changes (Michal)
Drop "_t" suffix in structures name (Matthew, Michal)
Split log abi header as seperate patch (Michal)
Fix static vaiable multiple instance access issue (Michal)
Switched to fixed chunk size lfd buffer, removed buffer size check for KLVs
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

 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h | 279 ++++++++++++++++
 drivers/gpu/drm/xe/abi/guc_log_lic_abi.h | 117 +++++++
 drivers/gpu/drm/xe/xe_guc_debugfs.c      |   7 +
 drivers/gpu/drm/xe/xe_guc_log.c          | 391 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h          |   1 +
 5 files changed, 795 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lic_abi.h

-- 
2.34.1

