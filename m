Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC09CAC5B9
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E4F10E9D0;
	Thu, 25 Sep 2025 23:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoZWhcAH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA8310E9C6
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844008; x=1790380008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UAwpKifaxaAi9n1keSgrWPukTkT8zXwvIKo7nRK2PJ8=;
 b=LoZWhcAHMOWM1CyYIIX6y2nO/O8R300mww5BduJvekwpt96NhfF4wZ2T
 LOQJdsVCYJUAFlmLCJpWN1826T/yicRloj4ZkJYG3Jj59m4ijbJlBdcO2
 arrIWVqMhXy+9RfvmS+KuPxwjqJjcIEM35C/l6i9PvYLg+fdfiLbkKVFl
 lbDu4tP38RrwRo7NJGgYR9iY5a/VStmEs52fDV8oX2k4vmhpZEkuRlnp8
 l6KeQxgfVPaOZnLtlg+vY8HIdUiC/XhMBR++rZ7GbHK0mM17VNMmSkQyY
 WmyJOaUut6bZcK7ZGkuZxJ0le45LeskdAihJ1LZTmLjJldx0l4+yOoH2b w==;
X-CSE-ConnectionGUID: J3ayG3DzRm2rv+wOSXZk3w==
X-CSE-MsgGUID: fyDUO7l7Rdy0q5hn1NXnxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817680"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817680"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: ewapZC9BRRyUKnJY/wqimA==
X-CSE-MsgGUID: 27CgDjSaQL+nk6LPCLORiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181853000"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 18/22] drm/xe: Check that GT is not NULL before testing
 Wa_16023588340
Date: Thu, 25 Sep 2025 16:46:46 -0700
Message-ID: <20250925234628.2112163-42-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925234628.2112163-24-matthew.d.roper@intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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

If the primary GT is disabled, skip the check for this workaround (which
only applies to dgpu platforms where the primary GT cannot be NULL).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display_wa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display_wa.c b/drivers/gpu/drm/xe/display/xe_display_wa.c
index 8ada1cbcb16c..2aa1b8c03411 100644
--- a/drivers/gpu/drm/xe/display/xe_display_wa.c
+++ b/drivers/gpu/drm/xe/display/xe_display_wa.c
@@ -13,6 +13,7 @@
 bool intel_display_needs_wa_16023588340(struct intel_display *display)
 {
 	struct xe_device *xe = to_xe_device(display->drm);
+	struct xe_gt *wa_gt = xe_root_mmio_gt(xe);
 
-	return XE_GT_WA(xe_root_mmio_gt(xe), 16023588340);
+	return wa_gt && XE_GT_WA(wa_gt, 16023588340);
 }
-- 
2.51.0

