Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64607606A32D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=TozyHL8C
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB531123D9;
	Fri, 13 Nov 2026 12:43:54 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8253A112371;
 Fri, 13 Nov 2026 12:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1794573827;
 bh=veIzabU++axDdL/czso3gMtAmDO8RPomzf2ZET+Af6c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TozyHL8COAXQmEPy3Y2ZszU/CWm9utHzm9OaMjBR384L7WKpDfdvH6qZPZtUwO6GK
 hRxgiQCx7+vNeUYAIAy8ta+tnKTa9wxTImqyWLulsVMfaC0CMivgD2OzaSMa3hHI+K
 RnRmdVs0n9GNUAUUS3LIum6DcZwp9halCkH5r+3qY0a9/Y9rvG5JD9hPIATbaOJiO+
 1rrtiv/Ryj+a8066/zv1nj8Hui97cqjuazJ1I80HhgDEP5vkpfC/+t2zGP/rXaUQEv
 J04TaK8zADa3CE1FrY/BSr89YSKb024ImyGbfSPWqyt9Z0zMi+XXGvxWDDX4mGDIA/
 7YCLP3/wSHdZw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v5 3/5] drm/xe: Raise gt frequency slightly earlier.
Date: Fri, 13 Nov 2026 13:44:57 +0100
Message-ID: <20261113124453.144408-10-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113124453.144408-7-dev@lankhorst.se>
References: <20261113124453.144408-7-dev@lankhorst.se>
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
index 6911c2ac39f82..616e02066ae6d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1069,6 +1069,9 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	for_each_gt(gt, xe, id)
+		xe_gt_sanitize_freq(gt);
+
 	xe_display_register(xe);
 
 	err = xe_oa_register(xe);
@@ -1093,9 +1096,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
-	for_each_gt(gt, xe, id)
-		xe_gt_sanitize_freq(gt);
-
 	xe_vsec_init(xe);
 
 	err = xe_sriov_init_late(xe);
-- 
2.55.0

