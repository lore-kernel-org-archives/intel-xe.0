Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C9BC44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 14:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9315810EA50;
	Tue, 21 Jul 2026 14:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="fU0WeuQx";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD87110EA38;
 Tue, 21 Jul 2026 14:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784643918;
 bh=xWZN3IgOPH56vSX1PoDgz7dWf9GkM2dtltu+UT1BEPk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fU0WeuQxjqLTChSg83N5kTPSKy5BkbfqercIBT5qTmUqcwo/I8eXB2569+0vNs9FB
 I5FDh1dZfBM/uBR5atsVFDvQLAsNjpYna63FXfe3JA+oxhCgr/cDcvdksvEEvs6NZW
 Iu6BjbEh0Pjz9KbIcCCtOGNqS8eK/H6LGQASrrU7locGZc9XxNQ/VOpAZamF2IyTfo
 a3rg5vvSu1vI6/IPK9N4Dxggb35Rw4vXODzRtaS7vWZX5rlgdstSd7A2eZkfr7k5BK
 ILb5kq56bZSJySeoo+/+J27kghJ0J/t4ThiBSr/QN6SXakJ71E9BTLt0sWm5k8ZMXs
 U1jInp8DByU8Q==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 3/5] drm/xe: Raise gt frequency slightly earlier.
Date: Tue, 21 Jul 2026 16:26:14 +0200
Message-ID: <20260721142610.93804-10-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721142610.93804-7-dev@lankhorst.se>
References: <20260721142610.93804-7-dev@lankhorst.se>
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

Move raising the gt frequency to before display_register, so the
blit that's potentially performed to copy stolen memory to system
memory will run at full speed.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4eed9a251e65b..e6c4e1358a614 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1077,6 +1077,9 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	for_each_gt(gt, xe, id)
+		xe_gt_sanitize_freq(gt);
+
 	xe_display_register(xe);
 
 	err = xe_oa_register(xe);
@@ -1101,9 +1104,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
-	for_each_gt(gt, xe, id)
-		xe_gt_sanitize_freq(gt);
-
 	xe_vsec_init(xe);
 
 	err = xe_sriov_init_late(xe);
-- 
2.53.0

