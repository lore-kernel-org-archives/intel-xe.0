Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD761CD98DA
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 08:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A53310E71D;
	Tue, 16 Jun 2026 08:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UY7luJbP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55A410E71D
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 08:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781597885; x=1813133885;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FzaJrtJD0nuC5Yo+KZo1xBt5wU6zjk4bWJmMHbLUTJA=;
 b=UY7luJbP5tUStYgm8EK0d1xY+3KVQSpFkMjzxPturq/OeEqtuzPpiR7/
 lr1fxA9sYdstrvvlD6tkhQBnbJl+5WrGXKbJjf8v4xn8EMMTkwEH/iO/c
 G6PXCG4MNPXFRkyxpIvVIgNEQJ1s8RkBqU5etsz0q/OoWpnekHPtVbCgO
 d2YqTenDEzFrP3mn3mfcePWu5USc1ZKfsgzQxadnpQyLnJMVFI3zd5J11
 NCZJGeiFals2JXnf/Z1OjpMzoInodxLJ4FTG16USTBaR0IaupKO2oa1R3
 3QVCQZko6477M8tIVSmv+tCFX6H4UG77cZPSu/EfWPwycHkeb5Xo5RfPb A==;
X-CSE-ConnectionGUID: uOZuGgIsSYusErRjmNT+wA==
X-CSE-MsgGUID: ARUEsvoISQu8hETfHOL59A==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93738538"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="93738538"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:18:04 -0700
X-CSE-ConnectionGUID: tvEvCLnUSVqCwSwP0yok1w==
X-CSE-MsgGUID: zqvYU4TyS1a0Wamvygw/3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="243328657"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.244.163])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:18:03 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2] drm/xe/pt: Fix NULL pointer dereference in
 xe_pt_zap_ptes_entry()
Date: Tue, 16 Jun 2026 10:17:56 +0200
Message-ID: <20260616081756.286918-1-francois.dugast@intel.com>
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

Move the container_of() call after a NULL guard, so the function returns
early instead of proceeding with an invalid pointer. XE_WARN_ON is kept
to help root cause the issue, but we now bail instead of crashing the
driver.

v2: Comment that triggering XE_WARN_ON is unexpected behavior (Matt Brost)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 15ce77ce7793..17db4bcc3fc0 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -885,12 +885,20 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
 {
 	struct xe_pt_zap_ptes_walk *xe_walk =
 		container_of(walk, typeof(*xe_walk), base);
-	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
+	struct xe_pt *xe_child;
 	pgoff_t end_offset;
 
-	XE_WARN_ON(!*child);
 	XE_WARN_ON(!level);
 
+	/*
+	 * Below would be unexpected behavior that needs to be root caused
+	 * but better warn and bail than crash the driver.
+	 */
+	if (XE_WARN_ON(!*child))
+		return 0;
+
+	xe_child = container_of(*child, typeof(*xe_child), base);
+
 	/*
 	 * Note that we're called from an entry callback, and we're dealing
 	 * with the child of that entry rather than the parent, so need to
-- 
2.43.0

