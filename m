Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DF2C79FAD
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C63A10EB0B;
	Tue,  8 Sep 2026 10:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YU/Y+L6x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7C510EAF7
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788864362; x=1820400362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OOJyFi1JJ5FRTXb4+vOLs7LhpuVz7azU1aLeRQd8gFI=;
 b=YU/Y+L6xjI+GRDT36DQxs83GKRPaGSntaDnDZ1/6IAK+bFQhxwrvkQYK
 Ov07gD3sBynPFElgF+BpoK2sQ+Aeg9O9ZOHot+p6IZVbikKdhM5U6ofTY
 MvVaZKuEJqtkn0VD2hpCmd7znB3LuPgYgEba0RBICRiFUfU75J3KyZnTm
 XQxz3LykRqNK7QW1bFAJQg9iXCVxOEv9CkV2IpV8hQV71PkAqlYu9ApTB
 KHF1rFhEIiz1CG3PGqbMat/bnZrCGviLm+8jDtkPXjbqRi25fX7etxI1S
 bm+AFIOvW2xFeGMsvwTVCSJFhAHzsTZr8ZFZ4tXUY81+ZRwhEiAcq6yB2 A==;
X-CSE-ConnectionGUID: 3zRstmK0SbOjhyMihzlNlQ==
X-CSE-MsgGUID: aQe3w63HS3K1gkfWRhyhRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="91773079"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="91773079"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:46:01 -0700
X-CSE-ConnectionGUID: lKUijIuFQ7CV0BoeDGjOIQ==
X-CSE-MsgGUID: JIaIFB+KTl2w50SXE5008w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264759109"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2026 03:46:00 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v3 08/13] drm/xe/pat: Return error from xe_pat_init_early() on
 unknown platform
Date: Tue,  8 Sep 2026 16:15:45 +0530
Message-ID: <20260908104550.1283933-9-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
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

xe_pat_init_early() currently only logs an error when the platform's
graphics version doesn't match any known PAT table, but continues
probing with an uninitialized pat.ops. This can lead to a NULL
pointer dereference later when pat.ops is used.

Change xe_pat_init_early() to return an int and propagate -ENODATA
to xe_device_probe() so the driver fails to load cleanly instead of
continuing in a broken state.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  4 +++-
 drivers/gpu/drm/xe/xe_pat.c    | 14 +++++---------
 drivers/gpu/drm/xe/xe_pat.h    |  2 +-
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8583b2e9ecf4..b7f78d45dee1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -960,7 +960,9 @@ int xe_device_probe(struct xe_device *xe)
 	int err;
 	u8 id;
 
-	xe_pat_init_early(xe);
+	err = xe_pat_init_early(xe);
+	if (err)
+		return err;
 
 	err = xe_sriov_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index a5fe1beec652..8af92e3c4c17 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -590,7 +590,7 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops = {
 	.entry_dump = xe3p_xpc_pat_entry_dump,
 };
 
-void xe_pat_init_early(struct xe_device *xe)
+int xe_pat_init_early(struct xe_device *xe)
 {
 	xe->pat.idx[XE_CACHE_WB_COMPRESSION] = XE_PAT_INVALID_IDX;
 	xe->pat.idx[XE_CACHE_NONE_COMPRESSION] = XE_PAT_INVALID_IDX;
@@ -678,22 +678,18 @@ void xe_pat_init_early(struct xe_device *xe)
 		xe->pat.idx[XE_CACHE_WT] = 2;
 		xe->pat.idx[XE_CACHE_WB] = 0;
 	} else {
-		/*
-		 * Going forward we expect to need new PAT settings for most
-		 * new platforms; failure to provide a new table can easily
-		 * lead to subtle, hard-to-debug problems.  If none of the
-		 * conditions above match the platform we're running on we'll
-		 * raise an error rather than trying to silently inherit the
-		 * most recent platform's behavior.
-		 */
 		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
+		return -ENODATA;
+
 	}
 
+	xe_assert(xe, xe->pat.ops);
 	xe_assert(xe, xe->pat.ops->dump);
 	xe_assert(xe, xe->pat.ops->program_graphics);
 	xe_assert(xe, MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);
 	xe_assert(xe, GRAPHICS_VER(xe) < 20 || xe->pat.ops->entry_dump);
+	return 0;
 }
 
 void xe_pat_init(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 7060f66e1d63..66e335fb3b0c 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -43,7 +43,7 @@ struct xe_pat_table_entry {
  * xe_pat_init_early - SW initialization, setting up data based on device
  * @xe: xe device
  */
-void xe_pat_init_early(struct xe_device *xe);
+int xe_pat_init_early(struct xe_device *xe);
 
 /**
  * xe_pat_init - Program HW PAT table
-- 
2.54.0

