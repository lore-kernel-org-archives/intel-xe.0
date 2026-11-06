Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E20A606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 07:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P/akb/WR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D707310E9CE;
	Fri,  6 Nov 2026 07:20:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AF810E3CD
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 07:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793949612; x=1825485612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0snSSNb+eeLsRnYxViOuUpQQK3kReMGWOts/ByyhOzg=;
 b=P/akb/WRRa+XYSQI8WE2Wc3IZhHmUM0xih5Cq/uKYOAHMs4e1WCEvh35
 Z8ympdAF8baRKJy9BKHq491RfCZTLqvMnyshdcDIalnV3cDjko5pAiwv6
 FLK4hxnJcgY+xoJ524kJGLsGhN9LAb0zu28v3+J1og3Dm49og8rrmf2t0
 jDqvb88Oa9eFUhRZBD5LVFxegQSa6LdQncej9my+5iSIRIJG8qb+jBf+U
 GoAhAlOwOUqx0DNXeba1Am3W2EujDv9wwOKvATXG2fpchG1gHxJir7dRc
 pb+enx5IwVJU60cBykH4fkXhDbLahFicClH1pSXzKx9zAmx3h8cCu3U+h g==;
X-CSE-ConnectionGUID: P090tDX7SbG9pVs6eXGDsA==
X-CSE-MsgGUID: TZc9sNAVQH2LUyhcM/zaNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2659343"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2659343"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 23:20:11 -0800
X-CSE-ConnectionGUID: fa1/1FlORLGsNmy6s6XihA==
X-CSE-MsgGUID: tpzm7vE+TfKo5d5uDxhcog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7548997"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 23:20:09 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 mallesh.koujalagi@intel.com, badal.nilawar@intel.com
Subject: [PATCH v4 2/8] drm/xe/hw_error: Initialize hw_error_work per tile
Date: Fri,  6 Nov 2026 12:49:47 +0530
Message-ID: <20261106071944.2693854-12-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261106071944.2693854-10-riana.tauro@intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: add dgfx and sriov check (Sashiko)

v3: retain original patch and fix unload issue in later patches
---
 drivers/gpu/drm/xe/xe_hw_error.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index a934b649575c..f7031b341ce0 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -537,6 +537,19 @@ static void process_hw_errors(struct xe_device *xe)
 	}
 }
 
+static void hw_error_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	u8 id;
+
+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
+		return;
+
+	for_each_tile(tile, xe, id)
+		disable_work_sync(&tile->hw_error_work);
+}
+
 /**
  * xe_hw_error_init - Initialize hw errors
  * @xe: xe device instance
@@ -546,12 +559,15 @@ static void process_hw_errors(struct xe_device *xe)
  */
 void xe_hw_error_init(struct xe_device *xe)
 {
-	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_tile *tile;
+	u8 id;
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
-	INIT_WORK(&tile->hw_error_work, hw_error_work);
+	for_each_tile(tile, xe, id)
+		INIT_WORK(&tile->hw_error_work, hw_error_work);
 
 	process_hw_errors(xe);
+	devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
 }
-- 
2.47.1

