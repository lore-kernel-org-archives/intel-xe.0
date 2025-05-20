Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27E5C3DA6D
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 19:58:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFBF10E0A2;
	Tue, 20 May 2025 19:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YaRXfFZS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B312D10E0A2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 19:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747771085; x=1779307085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iNfFhbnZ6rssMOAIwOHAW5zK9iVUxrQXhtkisqkUOJk=;
 b=YaRXfFZSxvPwuYJPiPJKZyaEQCaLvJPjHEb5cxMmEt47fBE35b9v1MR1
 LLRTn8ENSa2l73sXkMgzlnrlP1PHz5Cc97mpTHKDIaYjEyOWBOOIQvdu1
 TPDSz2pnG2kSlPR6uv8VlXZkg7MYRYa4AncupsboO52tNXyl8/uIU7tNh
 K26uGNIkeuC2dQ4HKiUupdq6t5cl1RLOtJsNdnpg8xrX++V/jvKCs/c8u
 dt5ghXkf32fBm/y3csKbJEGsATg5gNOYthajJRsegcjd7VDgpyVEH74CU
 lDbnucHq1AXQ6k2e5cfqi2QtO2/884PM88EauI6YzV6xqnjdOXotjr1M9 w==;
X-CSE-ConnectionGUID: kEGQf4RzRvKSdDCU678mEA==
X-CSE-MsgGUID: 9PkxbLI3S3ixLVFhHh5FTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="61065896"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="61065896"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:57:54 -0700
X-CSE-ConnectionGUID: IY3X4W75TmmT5qt2Vn9ZAw==
X-CSE-MsgGUID: Eh4NnLJPRFevJnAI6dckfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140288995"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:57:54 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH] drm/xe/ptl: Update the PTL pci id table
Date: Tue, 20 May 2025 12:57:49 -0700
Message-ID: <20250520195749.371748-1-matthew.s.atwood@intel.com>
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

Update to current bspec table.

Bspec: 72574

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 include/drm/intel/pciids.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index d212848d07f3..a7ce9523c50d 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -861,6 +861,10 @@
 	MACRO__(0xB081, ## __VA_ARGS__), \
 	MACRO__(0xB082, ## __VA_ARGS__), \
 	MACRO__(0xB083, ## __VA_ARGS__), \
+	MACRO__(0xB084, ## __VA_ARGS__), \
+	MACRO__(0xB085, ## __VA_ARGS__), \
+	MACRO__(0xB086, ## __VA_ARGS__), \
+	MACRO__(0xB087, ## __VA_ARGS__), \
 	MACRO__(0xB08F, ## __VA_ARGS__), \
 	MACRO__(0xB090, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
-- 
2.49.0

