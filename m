Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3A5CA9ED6
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:19:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6362E10ECA4;
	Mon, 12 Oct 2026 05:19:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3AE10E118
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791782372; x=1823318372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cgDnsptsIVZzWPeTPjZMvcjIB7xAZQEd4gnTrIKL+ZA=;
 b=XNrriz9Qh+JaIbszoqICjMoNYHAObnh+aYegLhcCclieenU+QmSrT4Ql
 aKdUGuT65erA94hLZeXJU4wZCxwhtDjpoHQI+d+T7o7iZJl7z1igZ228x
 58P7JUI+8tPoN26/3wabB4YYOw7pN6kgfaaZiNf+BPEo+Jp4dhQx+MBjV
 STE+zod+kkpOLV+3o8YujrhG79Z8UIpA8Vqed+tRoT6QUhPa/H1oKKqH9
 RlPusJoozY+xK+9EGoRKyYz9SLKCaYorfCl2clcOgQ5glvTG8ldQn6mFg
 tVdcNw/3uMxTO695kP2c0zFix1Mhz6bq6MUWWhwjATlh5DgxxkSSQKJVf w==;
X-CSE-ConnectionGUID: nQv2hV20T1ODiS7eS/ke5w==
X-CSE-MsgGUID: VQWfArLaTeqQVq1axAAAZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="390508"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="390508"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:18:39 -0700
X-CSE-ConnectionGUID: 5mYzyz78QcOEq0R5uRK0Og==
X-CSE-MsgGUID: YA3wU/3GTuWBRcKbsOCzVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="735914"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa009.jf.intel.com with ESMTP; 11 Oct 2026 22:18:37 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v6 07/12] drm/xe/pat: Return error from xe_pat_init_early() on
 unknown platform
Date: Mon, 12 Oct 2026 10:48:18 +0530
Message-ID: <20261012051823.2201360-8-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
References: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
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

