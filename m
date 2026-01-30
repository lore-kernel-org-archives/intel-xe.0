Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC74FE6BF0B
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 12:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6BE10E9D5;
	Fri, 30 Jan 2026 12:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EX9a7iYP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA96710E9D5
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 12:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769777479; x=1801313479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PqnjKjeSKtffByqGEjgnFksIOQt1aCPnCsOGZjKJRfc=;
 b=EX9a7iYPawlPjlsARFIlICukVC0m1diuedJ6f1YreH0PY6oBWhvwckVO
 oVydBy9e63kifuC5vS2dsR2TeCX+/7xZ9dhtqfwZgpWxiYsREqArdoH7N
 mJM+W2sGCbZsMhnUijuLx5UTF02TuYZwHPmJuWB74OJOpfDSkPK0pXjra
 NSMou8aP7GpErPRJSTDaBriqXWV6ipNu0ZLpVczVnvoXpDkv+6hafg7PG
 QPA5JUnV8xd6xlhQnmEmhwv8/gOZpNqqJlcUNpIEZWENrYA69EhS0IjQe
 l3W+DOqDnAxTPjgK1Q9MPlyqHsC8l8masgWZLSpOasjYegmr91t+5UsFb g==;
X-CSE-ConnectionGUID: dOGsQPy1Tjuuv28QDBvitw==
X-CSE-MsgGUID: +6DQFiy6QL+yhpqbMUhMjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71190967"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="71190967"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 04:51:18 -0800
X-CSE-ConnectionGUID: Mq1J8RoDQ8W6Tf4yYwIaCA==
X-CSE-MsgGUID: 9F9GzQihSfypWi3qtjQyMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="209264574"
Received: from abityuts-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.35])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 04:51:17 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ulisses Furquim <ulisses.furquim@intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Subject: [PATCH v2] drm/xe/uapi: update used tracking kernel-doc
Date: Fri, 30 Jan 2026 12:51:06 +0000
Message-ID: <20260130125105.451229-2-matthew.auld@intel.com>
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

v2 (Sanjay):
  - Don't drop the note around the extra cpu_visible_used expectations.

Reported-by: Ulisses Furquim <ulisses.furquim@intel.com>
Fixes: 4d0b035fd6da ("drm/xe/uapi: loosen used tracking restriction")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 include/uapi/drm/xe_drm.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 077e66a682e2..c9e70f78e723 100644
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
@@ -363,9 +359,7 @@ struct drm_xe_mem_region {
 	 * @cpu_visible_used: Estimate of CPU visible memory used, in
 	 * bytes.
 	 *
-	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
-	 * accounting. Without this the value here will always equal
-	 * zero.  Note this is only currently tracked for
+	 * Note this is only currently tracked for
 	 * DRM_XE_MEM_REGION_CLASS_VRAM regions (for other types the value
 	 * here will always be zero).
 	 */
-- 
2.52.0

