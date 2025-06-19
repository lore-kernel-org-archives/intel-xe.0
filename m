Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7145C7115A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 10:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD2110E9F7;
	Thu, 19 Jun 2025 10:49:51 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4835410E9FB
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Jun 2025 10:49:36 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 06/11] drm/xe: Rename gt_init sub-functions
Date: Thu, 19 Jun 2025 12:49:05 +0200
Message-ID: <20250619104858.418440-19-dev@lankhorst.se>
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

s/gt_fw_domain_init/gt_init_with_gt_forcewake()/
s/all_fw_domain_init/gt_init_with_all_forcewake()/

Clarify that the functions are the part of gt_init() that are called
with the respective power domains held. all_domain() of course only
works after discovering and initialisation of force_wake on all engines,
that's why the split is needed in the first place.

Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_gt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 98360986df7db..435d888a1dfc8 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -440,7 +440,7 @@ static void dump_pat_on_error(struct xe_gt *gt)
 	xe_pat_dump(gt, &p);
 }
 
-static int gt_fw_domain_init(struct xe_gt *gt)
+static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
 	int err;
@@ -493,7 +493,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	return err;
 }
 
-static int all_fw_domain_init(struct xe_gt *gt)
+static int gt_init_with_all_forcewake(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
 	int err;
@@ -648,7 +648,7 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	err = gt_fw_domain_init(gt);
+	err = gt_init_with_gt_forcewake(gt);
 	if (err)
 		return err;
 
@@ -662,7 +662,7 @@ int xe_gt_init(struct xe_gt *gt)
 
 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
 
-	err = all_fw_domain_init(gt);
+	err = gt_init_with_all_forcewake(gt);
 	if (err)
 		return err;
 
-- 
2.45.2

