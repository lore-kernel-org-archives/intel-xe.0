Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05981049524
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 09:58:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B85510E20D;
	Wed, 11 Mar 2026 09:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+qgQbqg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C027810E20D;
 Wed, 11 Mar 2026 09:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773223113; x=1804759113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HzPj4fT4BTPw6WA53cGERH2WgByckd4BKoG2vrd/YnE=;
 b=G+qgQbqgrP6iF/D+WC/dEoi+EsS/ioRIbR5/VT3PjLQOGZUalSOgNeqM
 pd12rqyhT4xAC4vzYrq2XZwQJ8rut14vb4D0+qJtlpCqlZzhFQ9MDaLQU
 vv55OPskeJhTVVn1pi2F0GOJW7na0Ju+6zZTkkU/WRzAcjMpOrpg32Bqg
 5kvekRc+vy9ZCODWsALXBzCdyf2wuEbfQTn9oXqM3Fo+mt3tutrS72ugd
 QnjShSiVb4ymeGP4NbqlvF77AOKUWLQEYK1bGX5gksEpFPFZyS0EQoMvK
 atGHlUhaz2abin3+jdOCKw5mOPDbZbaRWDBebG3kIB34u25q/yCB0TtEh g==;
X-CSE-ConnectionGUID: wEgq02PzTjmk/j8M4Xkujg==
X-CSE-MsgGUID: gxB8WqRfQM+o53tiexSpJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74326042"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74326042"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 02:58:29 -0700
X-CSE-ConnectionGUID: dw6oik6XQXeAF+bYkMIWNg==
X-CSE-MsgGUID: GfffPN51QkCdZ1iOiBQVrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="217095830"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 02:58:24 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, anvesh.bakwad@intel.com,
 maarten.lankhorst@linux.intel.com, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH 2/4] drm/xe/xe_drm_ras: Add support for clear-error-counter in
 XE DRM RAS
Date: Wed, 11 Mar 2026 15:59:16 +0530
Message-ID: <20260311102913.3387468-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260311102913.3387468-6-riana.tauro@intel.com>
References: <20260311102913.3387468-6-riana.tauro@intel.com>
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

Add support for clear-error-counter command in XE DRM RAS.
This resets the counter value.

Usage:

$ sudo ynl --family drm_ras  --do clear-error-counter --json \
'{"node-id":1, "error-id":1}'
None

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_ras.c | 35 +++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
index e07dc23a155e..c21c8b428de6 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras.c
+++ b/drivers/gpu/drm/xe/xe_drm_ras.c
@@ -27,6 +27,16 @@ static int hw_query_error_counter(struct xe_drm_ras_counter *info,
 	return 0;
 }
 
+static int hw_clear_error_counter(struct xe_drm_ras_counter *info, u32 error_id)
+{
+	if (!info || !info[error_id].name)
+		return -ENOENT;
+
+	atomic_set(&info[error_id].counter, 0);
+
+	return 0;
+}
+
 static int query_uncorrectable_error_counter(struct drm_ras_node *ep, u32 error_id,
 					     const char **name, u32 *val)
 {
@@ -37,6 +47,15 @@ static int query_uncorrectable_error_counter(struct drm_ras_node *ep, u32 error_
 	return hw_query_error_counter(info, error_id, name, val);
 }
 
+static int clear_uncorrectable_error_counter(struct drm_ras_node *node, u32 error_id)
+{
+	struct xe_device *xe = node->priv;
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE];
+
+	return hw_clear_error_counter(info, error_id);
+}
+
 static int query_correctable_error_counter(struct drm_ras_node *ep, u32 error_id,
 					   const char **name, u32 *val)
 {
@@ -47,6 +66,15 @@ static int query_correctable_error_counter(struct drm_ras_node *ep, u32 error_id
 	return hw_query_error_counter(info, error_id, name, val);
 }
 
+static int clear_correctable_error_counter(struct drm_ras_node *node, u32 error_id)
+{
+	struct xe_device *xe = node->priv;
+	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
+
+	return hw_clear_error_counter(info, error_id);
+}
+
 static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe)
 {
 	struct xe_drm_ras_counter *counter;
@@ -92,10 +120,13 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
 	if (IS_ERR(ras->info[severity]))
 		return PTR_ERR(ras->info[severity]);
 
-	if (severity == DRM_XE_RAS_ERR_SEV_CORRECTABLE)
+	if (severity == DRM_XE_RAS_ERR_SEV_CORRECTABLE) {
 		node->query_error_counter = query_correctable_error_counter;
-	else
+		node->clear_error_counter = clear_correctable_error_counter;
+	} else {
 		node->query_error_counter = query_uncorrectable_error_counter;
+		node->clear_error_counter = clear_uncorrectable_error_counter;
+	}
 
 	return 0;
 }
-- 
2.47.1

