Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A22FCD6E74
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 09:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B40411A664;
	Fri,  5 Jun 2026 09:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/05fRCH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDD711A669
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 09:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780652115; x=1812188115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eZJG9y551mOP1y6gt4x/ZICA6tHJhAwEq54bn3lLQzA=;
 b=R/05fRCHyQ1QwRW0vfVZUEDFUHuiarKDeN0LkOVebF/qx5gbGoFvh+SG
 a+fnSaf+ugQnubF9OBI26IsX1kWDf23c5ulF/jnxkimIWi3r1OznokeM9
 YqkI3yhjUyrspS7QcXhiCFFspu6njPhY0R1brVhBfYDdYSDa2butcIRP/
 hwlpj/66ggD0gvlugRC+gmF6PDWd991xsKZEUJ5EdXDpDE7T2jlWX+mwC
 /O8a7jNJxUjPKoGmXM864IZz3d8fDDtrxfO2JrfDRBMMzExGChcnuOByc
 ZWAzBRjDosIUMKS/wrB8DhhRgwiXyed1tWy+2uKvdrXHg0Y5tZZ3id1zT g==;
X-CSE-ConnectionGUID: riM4TagtRs+eVUf9BFfg4Q==
X-CSE-MsgGUID: ofZ0nekWQ1Ce5AgN6wIG9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="98903918"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="98903918"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:35:15 -0700
X-CSE-ConnectionGUID: qTngU6ZVRku8rtXfbASEyg==
X-CSE-MsgGUID: UynX1pWDQYGekwz5E125kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249133579"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:35:12 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v7 03/15] drm/xe: Improve wedged state management
Date: Fri,  5 Jun 2026 15:04:49 +0530
Message-ID: <20260605093446.4189929-20-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260605093446.4189929-17-riana.tauro@intel.com>
References: <20260605093446.4189929-17-riana.tauro@intel.com>
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

From: Raag Jadav <raag.jadav@intel.com>

Currently, wedged state is serving a single usecase where the device is
declared wedged, but this doesn't allow any wedged state management for
runtime usecases. In preparation of usecases which requires to facilitate
temporary device wedging, convert wedged.flag to wedged.ref which serves
as a driver internal refcount and blocks critical path execution during
device lifetime and while at it, introduce wedged.fini and use it as a
cleanup indicator during driver unwind which operates independent of the
refcount.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  5 +++--
 drivers/gpu/drm/xe/xe_device.h       | 12 +++++++++++-
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++--
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 51e3a2dd7b22..7154f356d631 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -915,7 +915,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
 
-	if (atomic_read(&xe->wedged.flag))
+	if (atomic_read(&xe->wedged.fini))
 		xe_pm_runtime_put(xe);
 }
 
@@ -1411,7 +1411,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		return;
 	}
 
-	if (!atomic_xchg(&xe->wedged.flag, 1)) {
+	if (!atomic_xchg(&xe->wedged.fini, 1)) {
+		xe_device_wedged_get(xe);
 		xe->needs_flr_on_fini = true;
 		xe_pm_runtime_get_noresume(xe);
 		drm_err(&xe->drm,
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 975768a6a9c8..3e536a49388a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -192,9 +192,19 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
 void xe_device_td_flush(struct xe_device *xe);
 void xe_device_l2_flush(struct xe_device *xe);
 
+static inline void xe_device_wedged_get(struct xe_device *xe)
+{
+	atomic_inc(&xe->wedged.ref);
+}
+
+static inline void xe_device_wedged_put(struct xe_device *xe)
+{
+	atomic_dec(&xe->wedged.ref);
+}
+
 static inline bool xe_device_wedged(struct xe_device *xe)
 {
-	return atomic_read(&xe->wedged.flag);
+	return atomic_read(&xe->wedged.ref);
 }
 
 void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32dd2ffbc796..66e673e4e3e7 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -485,8 +485,10 @@ struct xe_device {
 
 	/** @wedged: Struct to control Wedged States and mode */
 	struct {
-		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
-		atomic_t flag;
+		/** @wedged.fini: Needs cleanup on fini */
+		atomic_t fini;
+		/** @wedged.ref: Refcount for wedged device, blocks critical path execution */
+		atomic_t ref;
 		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
 		enum xe_wedged_mode mode;
 		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
-- 
2.47.1

