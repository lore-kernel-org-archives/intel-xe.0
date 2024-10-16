Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A104FD1AD43
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 11:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C12010E2DA;
	Wed, 16 Oct 2024 11:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AmN6ZjZe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8003710E2DA
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729078346; x=1760614346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=viB42UoqVLCCSC7jIqI/uX3PX5ZjgHhFQ1kmTnK5+gs=;
 b=AmN6ZjZeuwHjkPTBUQHWTr7s71Kg7/FmaVnd35wgxQf2iSi0nUg8TJ9n
 b02IBgnf7DRzW2tpW6CFtlzLCk1lwDz0YliyEqRIX95mlv9lK7d5FRF7W
 SaufW4uyiJ/7kh3Dv0WauZ78S2hBOJLDi4GJEaq6L4wUM2aUQC/H2a85m
 JdShEGtA7i2GeBDKec6NqmSFt6gAx4CjJUCB2hmHzXdLy+JmUwEClc/2L
 qnAvT0972sMY+z+R2Hk0PzcEZ7RQyLJiriXSZvN9FcSpeS4z6aJrcAVCu
 UZqYHvrMzfxGylYXQecR6BkJx7KB4pBYNf49/reAec7rccEr43jZ+RSaR Q==;
X-CSE-ConnectionGUID: sV/4BrkyQDy0DsGIMZrl3Q==
X-CSE-MsgGUID: bP+qBvVpT3m7kfygVFB7Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28472513"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28472513"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 04:32:26 -0700
X-CSE-ConnectionGUID: n1WlAX8jTNKJd8gIpM5PJg==
X-CSE-MsgGUID: DK9JDrwDSMSSuukkghMt4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="108941599"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 04:32:24 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, john.c.harrison@intel.com,
 rodrigo.vivi@intel.com, matthew.brost@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 1/2] drm/xe/guc/ct: Increase wait timeout for g2h response
Date: Wed, 16 Oct 2024 17:22:55 +0530
Message-Id: <20241016115256.349791-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016115256.349791-1-badal.nilawar@intel.com>
References: <20241016115256.349791-1-badal.nilawar@intel.com>
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

Occasionally, the G2H worker starts running after a delay of more than
a second even after being queued and activated by the Linux workqueue
subsystem.
To prevent G2H timeout errors, the wait timeout is being increased.

v2: Add comment to describe this change with TODO (Matt B/John H)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c7673f56d413..3096baa4c9f4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1016,7 +1016,17 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		return ret;
 	}
 
-	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
+	/*
+	 * Occasionally it is seen that the G2H worker starts running after a delay of more than
+	 * a second even after being queued and activated by the Linux workqueue subsystem. This
+	 * leads to G2H timeout error. This is seen especially while running xe_pm and gt reset
+	 * flow which uses xe_guc_ct_send_recv(). To prevent G2H timeout errors, the wait timeout
+	 * is being increased.
+	 *
+	 * TODO: Reduce the timeout Once workqueue scheduling delay issue root caused and fixed.
+	 */
+
+	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ * 3);
 
 	/*
 	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
-- 
2.34.1

