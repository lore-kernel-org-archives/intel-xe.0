Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5EFCA6004
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 21:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65ED110F7DA;
	Wed,  7 Oct 2026 21:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPFiQkGc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2618210F7D7
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 21:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791407670; x=1822943670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cgDnsptsIVZzWPeTPjZMvcjIB7xAZQEd4gnTrIKL+ZA=;
 b=GPFiQkGcFPkijjQP0rzOGA4z5TPhEgB9j7RSBITHTarxeY4q5iIB/N4c
 1sVWw6ayjO71BsLMHEBH8E1ecld7//qkyXL01ct6aMaQxJYQvy20FOQzI
 obQq+j4lEL4ihR2jCw5tb719sYyqujdXPh3tW33QLaoKi8iSjk8y5YzEP
 ZCOo8Ygzigs5FBGd9o9Xzsw4F5g2qHzSJCeYGS1siZbphuIFzeUgfHBw0
 2UVg04P26ynwp5tG0u6jIfgGGvU9wNy8Sp90PbJXh76m+CNw+c8N4NHnj
 MJsKuDwFyHNIKwEd28NJMipbEi6GFcU7nTAYtYM+x+XWTnuujQ5UKU/PQ Q==;
X-CSE-ConnectionGUID: chJ/dGzlSwus9+LEVbQAkg==
X-CSE-MsgGUID: ehwzO4vOSMyaE/xFIC1C2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="77167"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="77167"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 14:14:30 -0700
X-CSE-ConnectionGUID: SedWAzszTymhI7TQlahRSA==
X-CSE-MsgGUID: twgXcWfwQ0eOZZVA3ZROkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208";a="305526835"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa001.fm.intel.com with ESMTP; 07 Oct 2026 14:14:28 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v5 07/12] drm/xe/pat: Return error from xe_pat_init_early() on
 unknown platform
Date: Thu,  8 Oct 2026 02:44:12 +0530
Message-ID: <20261007211417.2093611-8-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
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

Fixes: 152d7f2db978 ("drm/xe/pat: Handle unicast vs MCR PAT registers")
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

---
v2:
 - Update kernel-doc for xe_pat_init_early. (Michal)
---
---
 drivers/gpu/drm/xe/xe_device.c |  4 +++-
 drivers/gpu/drm/xe/xe_pat.c    | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_pat.h    |  4 +++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8392c9fad3c4..6c214799b65b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -895,7 +895,9 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_uid_probe(xe);
 
-	xe_pat_init_early(xe);
+	err = xe_pat_init_early(xe);
+	if (err)
+		return err;
 
 	err = xe_sriov_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index a5fe1beec652..0ac64a6a3098 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -590,7 +590,13 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops = {
 	.entry_dump = xe3p_xpc_pat_entry_dump,
 };
 
-void xe_pat_init_early(struct xe_device *xe)
+/**
+ * xe_pat_init_early() - Init early pat table operation.
+ * @xe: the &xe_device
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_pat_init_early(struct xe_device *xe)
 {
 	xe->pat.idx[XE_CACHE_WB_COMPRESSION] = XE_PAT_INVALID_IDX;
 	xe->pat.idx[XE_CACHE_NONE_COMPRESSION] = XE_PAT_INVALID_IDX;
@@ -688,12 +694,15 @@ void xe_pat_init_early(struct xe_device *xe)
 		 */
 		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
+		return -ENODATA;
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
index 7060f66e1d63..6398c3ab4805 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -42,8 +42,10 @@ struct xe_pat_table_entry {
 /**
  * xe_pat_init_early - SW initialization, setting up data based on device
  * @xe: xe device
+ *
+ * Return: 0 on success or a negative error code on failure.
  */
-void xe_pat_init_early(struct xe_device *xe);
+int xe_pat_init_early(struct xe_device *xe);
 
 /**
  * xe_pat_init - Program HW PAT table
-- 
2.54.0

