Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE29606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=b+DHKtkq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D87610ED82;
	Thu,  5 Nov 2026 16:13:58 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE81310EC60
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1793895229;
 bh=IzycR5Q4yMn6EoEJRPQfihBwUXrCJrKmC52X9uryfvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b+DHKtkqpXYFyOxMJtqfkBp2dYZBdV+taEUL56v+ubxFvBEN/brff6i1Yxro2K8dL
 9wZApsSa8oYFZZsWPkc2LNm7hEqoO02ZOGFLXrd9GgMovwGbGBsSFkobsxfoCgbcqT
 dg0MzViQitYuqeCmgo86vHClr3hqxag18q89tDyV/YjF16GOZ9o59eqKVaQ6xQ5PVJ
 CLC5Y6a5BbOEmCX3aQEAQL0yoXRZkLvi581BcTxdVGaus/p463iSl2xJHL9jkgdqOi
 XrFBU0ZT249Lfufibz+hMUa0Dr1VgmVcIaUa3LvakABCJnjZoym7SaA74yOUOH7+PU
 oeAe1Ij3V5VfA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 3/5] drm/xe: Raise gt frequency slightly earlier.
Date: Thu,  5 Nov 2026 17:14:48 +0100
Message-ID: <20261105161444.593259-10-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105161444.593259-7-dev@lankhorst.se>
References: <20261105161444.593259-7-dev@lankhorst.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move raising the gt frequency to before display_register, so the
blit that's potentially performed to copy stolen memory to system
memory will run at full speed.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 273e2c45fea9b..1350f851ee783 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1068,6 +1068,9 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	for_each_gt(gt, xe, id)
+		xe_gt_sanitize_freq(gt);
+
 	xe_display_register(xe);
 
 	err = xe_oa_register(xe);
@@ -1092,9 +1095,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
-	for_each_gt(gt, xe, id)
-		xe_gt_sanitize_freq(gt);
-
 	xe_vsec_init(xe);
 
 	err = xe_sriov_init_late(xe);
-- 
2.55.0

