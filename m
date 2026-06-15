Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75801CD98DE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 09:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F2610E30B;
	Mon, 15 Jun 2026 09:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YlrzJbY4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A64F10E30B
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 09:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781515156; x=1813051156;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wbkOWEy6EVz1zxAoj6J+chIwC1ykVM3737+feRa8HPo=;
 b=YlrzJbY4fuNhvh+cFWK+CCko0EGxyyCTXneIymmezzg/BgJHBDhokh+9
 FuVnHkJ5jgoikIczprHmFMgcdRp1Vx8++BcBabek+WdFNx/Q2P3VBmQZV
 udzplyANAdMkAPEhUaGUyf898u93YHyyDKzDSsWRbMjm0xhUJD/ENMTZJ
 ddH/q7FVgjcAm5ilY/i9pwNhmr2n/IOAbe5uJF7Ikb99+bUu2c218+JHX
 CxUdCL+P6/SJafj3G7MdMcSnmfLGPcr3TmVu2GPUCpMqxzG5Hhlnp/TyG
 F6ykSTo442w8qH5r3SlSIUARGyoPBSq5z7fd/Pei1cLuC35laHndNS4E1 w==;
X-CSE-ConnectionGUID: 43aTEwTpQSSCjpL0s9GtIw==
X-CSE-MsgGUID: ZV90+fvdS7SNWgqe3S0JOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="107680470"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="107680470"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:19:16 -0700
X-CSE-ConnectionGUID: vU+aycCJSq6PZ4tACEJMFA==
X-CSE-MsgGUID: 1565ydFrQVSjHWoM1TDUwg==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.16])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:19:14 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe/pt: Fix NULL pointer dereference in
 xe_pt_zap_ptes_entry()
Date: Mon, 15 Jun 2026 11:19:04 +0200
Message-ID: <20260615091904.165762-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

The page-table walk framework may pass a NULL *child pointer for
unpopulated entries. xe_pt_zap_ptes_entry() called container_of(*child)
before checking for NULL, then dereferenced the result, causing a crash.

Move the container_of() call after a NULL guard, so the function
returns early instead of proceeding with an invalid pointer. Return 0
rather than an error code so that the walk continues to process
remaining entries.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 15ce77ce7793..123f97b9ee42 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -885,11 +885,14 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
 {
 	struct xe_pt_zap_ptes_walk *xe_walk =
 		container_of(walk, typeof(*xe_walk), base);
-	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
+	struct xe_pt *xe_child;
 	pgoff_t end_offset;
 
-	XE_WARN_ON(!*child);
 	XE_WARN_ON(!level);
+	if (XE_WARN_ON(!*child))
+		return 0;
+
+	xe_child = container_of(*child, typeof(*xe_child), base);
 
 	/*
 	 * Note that we're called from an entry callback, and we're dealing
-- 
2.43.0

