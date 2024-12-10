Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98AEE7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 08:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D5E10E82B;
	Tue, 10 Dec 2024 08:30:51 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A52B10E822
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 08:30:49 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 11/11] drm/xe: Do not attempt to bootstrap VF in execlists mode
Date: Tue, 10 Dec 2024 09:31:11 +0100
Message-ID: <20241210083111.230484-12-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210083111.230484-1-dev@lankhorst.se>
References: <20241210083111.230484-1-dev@lankhorst.se>
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

It was mentioned in a review that there is a possibility of choosing
to load the module with VF in execlists mode.

Of course this doesn't work, just bomb out as hard as possible.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 997438047a037..4b16a6bf27b12 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -213,6 +213,9 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt)
 {
 	int err;
 
+	if (!xe_device_uc_enabled(gt_to_xe(gt)))
+		return -ENODEV;
+
 	err = vf_reset_guc_state(gt);
 	if (unlikely(err))
 		return err;
-- 
2.45.2

