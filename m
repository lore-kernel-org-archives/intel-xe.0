Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75498C02192
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 12:02:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F1910E1B1;
	Wed,  5 Feb 2025 12:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewUVnLb6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6104610E1B1
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 12:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738756927; x=1770292927;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=skhNdOK3HcBuVUZVyrzg56quOOK9DVQaX8s0xAyX9dk=;
 b=ewUVnLb6mHGNPGOUpVMWqB8ybE6pb7znmgI+fKh90HwshfmyywdnXr/3
 cUnXsvg/IjGu0/dWSJtckFmRI1bPGJBCLBu1pzDWJoMzlaQOWvVNhLJ7T
 PCpCzLNPs09g084QVU5Obpp5EG8JEWnzn+pdyB0coCfR/gEEjrtDDnFSS
 sqbfQ8JxGgLhWf8F2so0ail8wAQjMQuFKWfZlr3+2q7wytAXx1bdOCxxB
 h39x0u7NC88YFOiGnusgXpRtHilYSjRKyL0Dvda00sND94FD1g1RZBwoW
 rpId9BYOOqnurox2BMLgqIXQuGslYuoNBb4D4KmoxJBjVMvc6TiPJWo/v A==;
X-CSE-ConnectionGUID: QH44Z1fETyWuaZ2PbHCmVA==
X-CSE-MsgGUID: i5w7riELQyiA13Gq5tkWYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39583199"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="39583199"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 04:02:07 -0800
X-CSE-ConnectionGUID: lEC8vxc8Tj2UWQjTt9ceYw==
X-CSE-MsgGUID: H9P3r7PcT6ShIaK/9Oj3aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110733946"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.16.98])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 04:02:03 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Don't treat SR-IOV platforms as reclaim unsafe
Date: Wed,  5 Feb 2025 13:01:50 +0100
Message-Id: <20250205120150.896-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Since commit a4d1c5d0b99b ("drm/xe/pf: Move VFs reprovisioning
to worker") and commit 78d5d1e20d1d ("drm/xe/relay: Don't use
GFP_KERNEL for new transactions") we should have no more lockdep
dependencies on the reclaim path when running in the SRIOV mode
so we believe that we can now mark SRIOV driver as reclaim safe.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 35dd1757b40b..12200be7b43d 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -91,7 +91,7 @@ static struct lockdep_map xe_pm_runtime_nod3cold_map = {
  */
 bool xe_rpm_reclaim_safe(const struct xe_device *xe)
 {
-	return !xe->d3cold.capable && !xe->info.has_sriov;
+	return !xe->d3cold.capable;
 }
 
 static void xe_rpm_lockmap_acquire(const struct xe_device *xe)
-- 
2.47.1

