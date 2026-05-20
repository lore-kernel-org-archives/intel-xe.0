Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06912CD5BAC
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 23:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565A010E44B;
	Wed, 20 May 2026 23:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oQWANTrX";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CD710E43B;
 Wed, 20 May 2026 23:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZL2o7UtBOukLYUFJLY9bVRgecr3as72B0+W7GjSZDN0=; b=oQWANTrXLhkFgtsvdwvEC6m9a6
 WN7okLQbKK8N35BDPmmY9kzO5SzT52c9yVvitRfUQg86oUhSt7xZO2G6zJd1jUUlijSxFdALUYB8i
 ueOwemQDMnyCLPEWMl5OqDGmkjL27Xlnqm6JJwERp6pXjdb1walGFpsLTNfZmDhB5p6SKExrbBbjn
 Af9CZKGyG1J06aZCcyx+rpW9iVcnSaLd2muLqaP0kFSYAgHIN7AuGAvnkVdmQ8m6fWUhVLLAS+FcF
 o7dgOaE1Jq6MjBlJ067YWn1kM0uM6hNLpjbsHos7uKNYYwdXZ4EgqSSUWCBIUUWluEZ39gVWwChY3
 K2pNXZQQ==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wPqp8-00456i-Jb; Thu, 21 May 2026 01:59:39 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 2/9] drm/i915/display: Use an unbound workqueue for atomic
 clean up
Date: Wed, 20 May 2026 16:58:13 -0700
Message-ID: <20260520235820.2313192-3-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325110744.1096786-1-suraj.kandpal@intel.com>
References: <20260325110744.1096786-1-suraj.kandpal@intel.com>
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

Prevents this kind of message being seen:
<4> [71024.774936] workqueue: intel_atomic_cleanup_work [xe] hogged CPU for >10000us 35 times, consider switching to WQ_UNBOUND

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 9c2f7ad6c7b7..147661729bb2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -242,7 +242,7 @@ int intel_display_driver_probe_noirq(struct intel_display *display)
 		goto cleanup_wq_modeset;
 	}
 
-	display->wq.cleanup = alloc_workqueue("i915_cleanup", WQ_HIGHPRI | WQ_PERCPU, 0);
+	display->wq.cleanup = alloc_workqueue("i915_cleanup", WQ_HIGHPRI | WQ_PERCPU | WQ_UNBOUND, 0);
 	if (!display->wq.cleanup) {
 		ret = -ENOMEM;
 		goto cleanup_wq_flip;
-- 
2.43.0

