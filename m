Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED68C7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 12:11:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D72110E7FA;
	Fri, 26 May 2023 12:11:17 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4DD10E06F
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 12:11:12 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 14:10:58 +0200
Message-Id: <20230526121101.1619278-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
References: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/5] drm/xe: Add debugfs files to evict
 everything.
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

Easy for testing, when you just want your BO evicted.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 7827a785b020..0a2f1becb5c6 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -94,6 +94,15 @@ static const struct file_operations forcewake_all_fops = {
 	.release = forcewake_release,
 };
 
+static int evict(void *data, u64 val)
+{
+	struct ttm_resource_manager *man = data;
+
+	return ttm_resource_manager_evict_all(man->bdev, man);
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(evict_all_fops, NULL, evict, "%lld\n");
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -119,15 +128,21 @@ void xe_debugfs_register(struct xe_device *xe)
 
 			sprintf(name, "vram%d_mm", mem_type - XE_PL_VRAM0);
 			ttm_resource_manager_create_debugfs(man, root, name);
+
+			sprintf(name, "vram%d_evict", mem_type - XE_PL_VRAM0);
+			debugfs_create_file(name, 0644, root, man, &evict_all_fops);
 		}
 	}
 
 	man = ttm_manager_type(bdev, XE_PL_TT);
 	ttm_resource_manager_create_debugfs(man, root, "gtt_mm");
+	debugfs_create_file("gtt_evict", 0644, root, man, &evict_all_fops);
 
 	man = ttm_manager_type(bdev, XE_PL_STOLEN);
-	if (man)
+	if (man) {
 		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
+		debugfs_create_file("stolen_evict", 0644, root, man, &evict_all_fops);
+	}
 
 	for_each_gt(gt, xe, id)
 		xe_gt_debugfs_register(gt);
-- 
2.34.1

