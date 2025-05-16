Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1ECC3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 14:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34AF10EAF0;
	Fri, 16 May 2025 14:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DyOMRopv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF8210EAF0
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747406795; x=1778942795;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+Ty8uy4zljBRVZsRl1PtuioILiG+mgp0nGhE0UnpPCI=;
 b=DyOMRopvtOr1pg47IMluqsx+t6blUfJ/FFj4Z/5craykZbmQDuw7RDFD
 AOirm8iWrVIjrZ3H1Jo8BCOCHj1w/D/d2iSiChHeIyjmW1ak6kClp9KT9
 CgY9j+ykYKdgXNS5NtGCNc6KkGEw38o8paB3p28mFic8Wa9IqhljuwkEX
 QXmdwixg9UiApO2OY4u/ZNqbPhBvHcZI8+Zq5+GKgR2y/Z73Q3U8CyrIb
 mdZpSjUPwUxn21q4OeNpbit8HFXeWq3cLVd2NkPjtVp4nkq7+fYVg+tr5
 5+AXVB/nguXvhJe0sKyon7m38jIBme4/O39XjOl+gHP7HUgXV7epu2QT2 g==;
X-CSE-ConnectionGUID: xxmtOauSTEy1QiyD5xRuEg==
X-CSE-MsgGUID: mjNU/Px2QC+iC6wGA4sHQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49307572"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49307572"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 07:46:33 -0700
X-CSE-ConnectionGUID: q5pm1FsfRCOE/1wj9YXLpQ==
X-CSE-MsgGUID: F0n52lGCS8OHz3Vsl5xmvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169755532"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.223.225])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 07:46:32 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: linux-platform-driver-x86@linux-kbuild-tools.org,
 intel-xe@lists.freedesktop.org, david.e.box@intel.com,
 rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 0/4] Crashlog Type1 Version2 support
Date: Fri, 16 May 2025 10:46:15 -0400
Message-ID: <20250516144619.210413-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
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

The Intel BMG GPU device supports the crashlog feature,
which was exposed in an Xe driver patch
(drm/xe/vsec: Support BMG devices), however the version
of crashlog used by the BMG GPU does not have a supporing
PMT driver.

Update the PMT crashlog driver to support the BMG crashlog
feature.

Michael J. Ruhl (4):
  platform/x86/intel/pmt: crashlog binary file endpoint
  platform/x86/intel/pmt: update to bit access
  platform/x86/intel/pmt: decouple sysfs and namespace
  platform/x86/intel/pmt: support BMG crashlog

 drivers/platform/x86/intel/pmt/class.c    |  12 +-
 drivers/platform/x86/intel/pmt/class.h    |   4 +-
 drivers/platform/x86/intel/pmt/crashlog.c | 429 +++++++++++++++++++---
 3 files changed, 382 insertions(+), 63 deletions(-)

-- 
2.49.0

