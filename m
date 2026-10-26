Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F8D606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 06:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b7LOvFlG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B87F10EA8A;
	Mon, 26 Oct 2026 06:05:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A1410EA8B
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 06:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792994721; x=1824530721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y95ea6iWLAqdK+Yme+ufh0U8YfXo3GPZV2tZsLg/0mg=;
 b=b7LOvFlGk0kH49hsp9LfsJ7qONkllBfd8eKHEeNwqj2SspF4Q733mO8F
 KZsnUyvU5eu+JuS3RU1poEztyoIgOKeLaAabyMaVqvkaAlOIRZ4kRTp9E
 5iGGmHttjhqWGjaGK9qAZMM2oWpoAmXuIhiQ19O1DISc53f0I9cL/fGVF
 fGGWiZNnTEsPgueWFTfqoDub+h7DonWj2SN8efKtu033bk0JOQcN7CG+y
 oXU+JHJIZnu3EomsIYVCqMGsFauDe2EtbRRHKgt9DLi2KYRa/Yhy+wZe8
 t6WJwuTQFhW5Efz51fnW7CnGGSiwKwc82QhQDamAWBxKTS5vNt7SLtw0Z w==;
X-CSE-ConnectionGUID: BAffAYEzTUq0K6ypTWQC/Q==
X-CSE-MsgGUID: K/ueqimAR9m+wRZpXhjtQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1531017"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1531017"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:21 -0700
X-CSE-ConnectionGUID: GdVWpFVdTPe5fZFJN6me5A==
X-CSE-MsgGUID: XuZUVQDUQKCyoECFDaIw3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4557314"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:17 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v2 2/9] drm/xe/hw_error: Initialize hw_error_work per tile
Date: Mon, 26 Oct 2026 11:35:01 +0530
Message-ID: <20261026060459.771448-13-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261026060459.771448-11-riana.tauro@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Raag Jadav <raag.jadav@intel.com>

Since hw_error_work is now being reused generically, initialize it per tile
so that we don't hit uninitialized work for non-root tile. While at it,
disable hw_error_work on fini to prevent UAF during unwind.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 24 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_hw_error.h |  1 +
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 41ddd997478b..f7799c3c08aa 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -537,6 +537,23 @@ static void process_hw_errors(struct xe_device *xe)
 	}
 }
 
+/**
+ * xe_hw_error_work_disable - Disable hw error work
+ * @arg: xe device instance
+ *
+ * This function disables the delayed work for hardware error handling
+ * for all tiles.
+ */
+void xe_hw_error_work_disable(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	u8 id;
+
+	for_each_tile(tile, xe, id)
+		disable_delayed_work_sync(&tile->hw_error_work);
+}
+
 /**
  * xe_hw_error_init - Initialize hw errors
  * @xe: xe device instance
@@ -546,12 +563,15 @@ static void process_hw_errors(struct xe_device *xe)
  */
 void xe_hw_error_init(struct xe_device *xe)
 {
-	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_tile *tile;
+	u8 id;
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
-	INIT_DELAYED_WORK(&tile->hw_error_work, hw_error_work);
+	for_each_tile(tile, xe, id)
+		INIT_DELAYED_WORK(&tile->hw_error_work, hw_error_work);
 
 	process_hw_errors(xe);
+	devm_add_action_or_reset(xe->drm.dev, xe_hw_error_work_disable, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index 5e3a11424108..c2c0bfa6d9f9 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -12,4 +12,5 @@ struct xe_device;
 
 void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
 void xe_hw_error_init(struct xe_device *xe);
+void xe_hw_error_work_disable(void *arg);
 #endif
-- 
2.47.1

