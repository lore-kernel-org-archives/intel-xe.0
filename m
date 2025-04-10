Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E813C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 15:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F7C10E9F9;
	Thu, 10 Apr 2025 15:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJfWt2UC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90D610E9F9
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744300736; x=1775836736;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b8MR6KOOtWlzFHA94aGIr0/ZnTpWkwGsIbKdYg48WSE=;
 b=BJfWt2UCDXcvwlJRGy7KHjhX12Zzklj5GoJwpUMPpn1zgkv6JXgXwS89
 coXamT7BLHn5Hc/cr746wn1rYZoBQHWtj3/k2nL4TEQxMjDZqSitCn9ji
 wyj5q3WNHmcCzKHbwWrE5dRWYc21MXUA8vql4v1C2wlycf73C3bDaZeHQ
 AfQC07afINQ4FQ3aINQzyUCR11TzZKljHAQ+JrLq1oQDTHdHHRRsuLl8P
 /rddR/tUr/f4A9qpoPOZwdge8ikUS1MLBzURkKwIn9E7LCLO2hgvQAfyf
 381PcjFHeXVrerMXqFKbH7vMSBj1fMsy1OUpn9eO6ocoJqODaaV6yHdnL A==;
X-CSE-ConnectionGUID: +1+TiYwiQpiCc/ScAJr27g==
X-CSE-MsgGUID: aOvWgnY2QNmIwLpr82Twqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56810513"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="56810513"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 08:58:55 -0700
X-CSE-ConnectionGUID: QXeOV6C/TU28hePCHdfkww==
X-CSE-MsgGUID: Z09kzWsgSwijYVFVKVxo0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129487173"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa007.jf.intel.com with ESMTP; 10 Apr 2025 08:58:54 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v3 0/4] drm/xe/guc: Add LFD format output for guc log
Date: Thu, 10 Apr 2025 08:58:49 -0700
Message-Id: <20250410155853.574830-1-zhanjun.dong@intel.com>
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

Changes in v3:
Split ABI header, debugfs and GuC code out as seperate patch
Remove bit fields in structure define, changed to GENMASK
Remove crash_dumped flag, changed to dump data empty check
Changes in v2:
Split GuC init config abi defines out from LFD abi header file
Split crash dump detect as seperate patch
Add size check for LFD functions
Make abi header comments kernel-doc style

Zhanjun Dong (4):
  drm/xe/guc: Add LFD related abi definitions
  drm/xe/guc: Add new debugfs entry for lfd format output
  drm/xe/guc: Add GuC log LFD format support
  drm/xe/guc: Only add GuC crash dump if available

 drivers/gpu/drm/xe/abi/guc_log_abi.h     | 116 +++++++
 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h | 265 +++++++++++++++
 drivers/gpu/drm/xe/xe_guc_debugfs.c      |  14 +
 drivers/gpu/drm/xe/xe_guc_log.c          | 409 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h          |   1 +
 5 files changed, 805 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h

-- 
2.34.1

