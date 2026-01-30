Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8858D49C9B
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 11:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A23410E99D;
	Fri, 30 Jan 2026 11:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqxv4Man";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4FD10E99D
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 11:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770873; x=1801306873;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WssLIGVWHxo4UvgDHWGbpMwJ7cJkMm+oI/rjEOqXGQg=;
 b=kqxv4ManTKbAtu6skTO3Vj4OwJ/bx9Pt6u+aom6C/+znxyCYcRidHqQC
 adAXySeiX5uTIFivW2EGAWkZqEFsEhdG1r4F006CqrPxxfvJ3ShMZFDdI
 dztViDNbBT/yzufLQlN62a3c8yd/B4+cpqq0Uh/QABPabUu9UfYeDTQJt
 BXG8UkOVQdgKUrQzcgEtSiC76FTlePZ3j7kbbyE8yxNO1R6GGVaO7v98j
 /0kkLvRcDWy73CkoZT84C37OGypG9NwMDobHiyKIEKO/3pF4UxvZUeJmo
 mTUlrOZsXQ36dBEX+Iy0Ru+gi/jHIm3o58G3omxUhMMkCD5SxVD4FX6m/ A==;
X-CSE-ConnectionGUID: 17CEGwD8T6i24YmOmsU51g==
X-CSE-MsgGUID: /0Syk0pHRKGfS/snT+L+Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70931524"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="70931524"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 03:01:13 -0800
X-CSE-ConnectionGUID: KWukUJunTKWIO+njxNUDzg==
X-CSE-MsgGUID: jDWVRxAuRLO4IbZOnM1yuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="240092222"
Received: from abityuts-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.35])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 03:01:11 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ulisses Furquim <ulisses.furquim@intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Subject: [PATCH] drm/xe/uapi: update used tracking kernel-doc
Date: Fri, 30 Jan 2026 11:01:01 +0000
Message-ID: <20260130110100.439832-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.52.0
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

In commit 4d0b035fd6da ("drm/xe/uapi: loosen used tracking restriction")
we dropped the CAP_PERMON restriction but missed updating the
corresponding kernel-doc. Fix that.

Reported-by: Ulisses Furquim <ulisses.furquim@intel.com>
Fixes: 4d0b035fd6da ("drm/xe/uapi: loosen used tracking restriction")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 include/uapi/drm/xe_drm.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 077e66a682e2..e2b62a1b6118 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -335,10 +335,6 @@ struct drm_xe_mem_region {
 	__u64 total_size;
 	/**
 	 * @used: Estimate of the memory used in bytes for this region.
-	 *
-	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
-	 * accounting.  Without this the value here will always equal
-	 * zero.
 	 */
 	__u64 used;
 	/**
@@ -362,12 +358,6 @@ struct drm_xe_mem_region {
 	/**
 	 * @cpu_visible_used: Estimate of CPU visible memory used, in
 	 * bytes.
-	 *
-	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
-	 * accounting. Without this the value here will always equal
-	 * zero.  Note this is only currently tracked for
-	 * DRM_XE_MEM_REGION_CLASS_VRAM regions (for other types the value
-	 * here will always be zero).
 	 */
 	__u64 cpu_visible_used;
 	/** @reserved: Reserved */
-- 
2.52.0

