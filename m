Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E39606A32C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HrwjGpT/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04B310F361;
	Tue,  3 Nov 2026 06:09:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FE310F361
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793686188; x=1825222188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p5EqFL5G3AvVkyval38PoRT4UWU+WGOI0FfnixlZ0E0=;
 b=HrwjGpT//JIw/hugqKPy1TP8AgNv+Tsshog1YMoGgnGNRtstLDp5Jq4g
 mJWAdwQIZ60XtEawMiK3AQHF9pXYJJudopEOmRHimzlEmQnNOoilPbFap
 45cGfpWVvINA9XUfmyMoYKKQ498em1RlzI1LIq6gQParO5hmcfmEJDGB2
 ykKUD5GMqeKgq3INqQ/W+ctKRyS+tfFSOnqWSNSVr5H/MygBmDmySRer9
 Tk1R51vM3weEjIzP3Yv23aUpO6UjKZhDdvGhU7X/m0AxCO/fjDcyAoymi
 NOY77syiKajY0sWUw4HOCjBuIRQPe2b7bczAK4Suc0UtdtsJN8xDB3wRk A==;
X-CSE-ConnectionGUID: rgeV7SFZSKSwCGmbqM52gg==
X-CSE-MsgGUID: pD79rKoiSM+u+ZH/JCy/Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2276699"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2276699"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:09:48 -0800
X-CSE-ConnectionGUID: fq8K1a+0TpGwl7PNmfsAvg==
X-CSE-MsgGUID: zSNea94VR9iVKhGHk/IJPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6446340"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:09:45 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 tejas.upadhyay@intel.com
Subject: [PATCH v3 1/7] drm/xe/hw_error: Reuse CSC worker for generic error
 handling
Date: Tue,  3 Nov 2026 11:39:31 +0530
Message-ID: <20261103060929.1586783-10-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261103060929.1586783-9-riana.tauro@intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
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

We have upcoming usecases which require defering work during error
handling. Since we already have CSC worker in place, prepare it to
be reused generically.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
v2: Remove delayed work
---
 drivers/gpu/drm/xe/xe_hw_error.c   | 10 +++++-----
 drivers/gpu/drm/xe/xe_tile_types.h |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index ac720710c8e8..a934b649575c 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -166,9 +166,9 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
 						 pvc_master_local_fatal_err_reg : \
 						 pvc_master_local_nonfatal_err_reg)
 
-static void csc_hw_error_work(struct work_struct *work)
+static void hw_error_work(struct work_struct *work)
 {
-	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
+	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
 	struct xe_device *xe = tile_to_xe(tile);
 
 	guard(xe_pm_runtime)(xe);
@@ -204,7 +204,7 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 					     hec_uncorrected_fw_errors[err_bit], severity_str,
 					     err_bit);
 
-			schedule_work(&tile->csc_hw_error_work);
+			schedule_work(&tile->hw_error_work);
 		}
 	}
 
@@ -513,7 +513,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 	enum hardware_error hw_err;
 
 	if (xe_fault_csc_hw_error())
-		schedule_work(&tile->csc_hw_error_work);
+		schedule_work(&tile->hw_error_work);
 
 	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
 		if (master_ctl & ERROR_IRQ(hw_err))
@@ -551,7 +551,7 @@ void xe_hw_error_init(struct xe_device *xe)
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
-	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
+	INIT_WORK(&tile->hw_error_work, hw_error_work);
 
 	process_hw_errors(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
index e1368c04846a..3dc011f111a4 100644
--- a/drivers/gpu/drm/xe/xe_tile_types.h
+++ b/drivers/gpu/drm/xe/xe_tile_types.h
@@ -118,8 +118,8 @@ struct xe_tile {
 	/** @memirq: Memory Based Interrupts. */
 	struct xe_memirq memirq;
 
-	/** @csc_hw_error_work: worker to report CSC HW errors */
-	struct work_struct csc_hw_error_work;
+	/** @hw_error_work: worker to handle HW errors */
+	struct work_struct hw_error_work;
 
 	/** @pcode: tile's PCODE */
 	struct {
-- 
2.47.1

