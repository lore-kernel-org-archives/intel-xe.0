Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7414C7115B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 10:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A731C10EA02;
	Thu, 19 Jun 2025 10:49:51 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4859010E9FC
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Jun 2025 10:49:36 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 11/11] drm/xe: Rename xe_uc_init_hw to xe_uc_load_hw
Date: Thu, 19 Jun 2025 12:49:10 +0200
Message-ID: <20250619104858.418440-24-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619104858.418440-13-dev@lankhorst.se>
References: <20250619104858.418440-13-dev@lankhorst.se>
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

It feels to me like load is closer to the intention than init_hw.

It makes the init calls slightly less confusing to me. :)

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_gt.c | 6 +++---
 drivers/gpu/drm/xe/xe_uc.c | 6 +++---
 drivers/gpu/drm/xe/xe_uc.h | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 14761849390d8..d397df056e4cd 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -573,7 +573,7 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 		}
 	}
 
-	err = xe_uc_init_hw(&gt->uc);
+	err = xe_uc_load_hw(&gt->uc);
 	if (err)
 		goto err_force_wake;
 
@@ -738,7 +738,7 @@ static int vf_gt_restart(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	err = xe_uc_init_hw(&gt->uc);
+	err = xe_uc_load_hw(&gt->uc);
 	if (err)
 		return err;
 
@@ -776,7 +776,7 @@ static int do_gt_restart(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	err = xe_uc_init_hw(&gt->uc);
+	err = xe_uc_load_hw(&gt->uc);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 1b1441b234c92..d8ac194107c32 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -144,7 +144,7 @@ int xe_uc_sanitize_reset(struct xe_uc *uc)
 	return uc_reset(uc);
 }
 
-static int vf_uc_init_hw(struct xe_uc *uc)
+static int vf_uc_load_hw(struct xe_uc *uc)
 {
 	int err;
 
@@ -173,7 +173,7 @@ static int vf_uc_init_hw(struct xe_uc *uc)
  * Should be called during driver load, after every GT reset, and after every
  * suspend to reload / auth the firmwares.
  */
-int xe_uc_init_hw(struct xe_uc *uc)
+int xe_uc_load_hw(struct xe_uc *uc)
 {
 	int ret;
 
@@ -182,7 +182,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
 		return 0;
 
 	if (IS_SRIOV_VF(uc_to_xe(uc)))
-		return vf_uc_init_hw(uc);
+		return vf_uc_load_hw(uc);
 
 	ret = xe_huc_upload(&uc->huc);
 	if (ret)
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 58ff3946a80ec..21c9306098cfd 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -11,7 +11,7 @@ struct xe_uc;
 int xe_uc_init_noalloc(struct xe_uc *uc);
 int xe_uc_init(struct xe_uc *uc);
 int xe_uc_init_post_hwconfig(struct xe_uc *uc);
-int xe_uc_init_hw(struct xe_uc *uc);
+int xe_uc_load_hw(struct xe_uc *uc);
 void xe_uc_gucrc_disable(struct xe_uc *uc);
 int xe_uc_reset_prepare(struct xe_uc *uc);
 void xe_uc_stop_prepare(struct xe_uc *uc);
-- 
2.45.2

