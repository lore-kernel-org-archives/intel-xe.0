Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC65C531CC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 20:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC62C10F1FE;
	Thu, 23 Jul 2026 20:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DxwLTmLj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797F110F1FE
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 20:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784839096; x=1816375096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NymUYldqjejvG31ckf3mpiugH9eF3Ms4jzTYV2MGxbw=;
 b=DxwLTmLjOsImxs4xunZl3rMoQJ421Z9faVQRD29dnrb3Juh3XB71zX0G
 dtpCBU/IyZ0K+Cutl6slEA2op/Ig4QAC8ZVH/JlkIwX+18SnyUYIQMVOc
 FtVFX42Z0LpviXGb9Oizl5YqKwxmvuIRWcQz8uPYf63rkUbVU66Wq0V5g
 LED8MWTBebLIbLNTlwYE/2Ge5VybF/h0P81sYVj4VLkZtevBb+Q0TPd22
 rm7XoudgwPHPHAMfxKVBIqiD72mwf0sk3INRDqw30Rl0qeoTdvsd2EUVR
 n2p3RQBl4Xoo7od9OHTXSG4wbqDyU9ACy5lSnAlsM8oL2O+zR2x3JaBqN g==;
X-CSE-ConnectionGUID: /Q9GPaZZSduU46vTefLdXw==
X-CSE-MsgGUID: 6zFmu3/OTKefX/Xy51tsMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84484296"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="84484296"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:16 -0700
X-CSE-ConnectionGUID: p6ruUS9aSu22bv1I5SENCw==
X-CSE-MsgGUID: A3r+VQ3STCWQFHVeMy4Zew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="254578588"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:15 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 04/19] drm/xe/log: Allow to emit SIGID dmesg/cper separately
Date: Thu, 23 Jul 2026 22:37:37 +0200
Message-ID: <20260723203754.3782-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723203754.3782-1-michal.wajdeczko@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
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

For the device-level errors, like a probe failure, the messages that
we want to put into dmesg and to store in the CPER record are the same.
But in case of the tile-level or GT-level errors, like a TDR, we will
want to decorate dmesg message with additional info about Tile/GT info,
like we do in our existing xe_gt|tile_err() macros, but we also don't
want this decoration be copied into a CPER record as location details
will likely be provided as separate parameters to xe_log() anyway.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_log.c | 78 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_log.h |  8 ++++
 2 files changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
index 7ea8d8cde0c1..c8ca0097c0b3 100644
--- a/drivers/gpu/drm/xe/xe_log.c
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -13,6 +13,36 @@ static void log_prep_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigi
 	/* TODO */
 }
 
+/**
+ * xe_log_emit_cper() - Emit a structured SIGID CPER record
+ * @pdev: the &pci_dev device
+ * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
+ * @sigid: signature identifier, see &enum xe_sigid
+ * @component: component identifer
+ * @location: location details of the @component
+ * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
+ * @len: length of the @data in bytes, or 0 if not applicable
+ * @fmt: printf-style format string
+ * @...: format arguments
+ *
+ * Note: generation of the CPER record is a planned follow-up.
+ */
+void xe_log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+		      u32 component, u32 location, const void *data, size_t len,
+		      const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	log_prep_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
+
+	va_end(args);
+}
+
 static bool is_hw_sigid(enum xe_sigid sigid)
 {
 	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
@@ -84,6 +114,54 @@ static void log_prep_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sig
 				sigid, sev_prefix, hwe_prefix, vaf);
 }
 
+/**
+ * xe_log_emit_dmesg() - Emit a structured SIGID dmesg line only
+ * @pdev: the &pci_dev device
+ * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
+ * @sigid: signature identifier, see &enum xe_sigid
+ * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
+ * @len: length of the @data in bytes, or 0 if not applicable
+ * @fmt: printf-style format string
+ * @...: format arguments
+ *
+ * Emits a dmesg line that includes a single stable, machine-matchable token
+ * ``SIGID=<n>`` followed by the optional severity token (like ``FATAL``) and,
+ * when @data pointer is set, either the error printed with %pe or a packed hex
+ * dump of the @data binary blob. The dmesg line will also include printf-style
+ * text message.
+ *
+ * The dmesg line is emitted using the pci_err() (or pci_info() for informational)
+ * wrapper, so the driver's name and device's BDF (like ``xe 0000:03:00.0:``) are
+ * included.
+ *
+ * Note that we can't use regular xe_err()/xe_info() macros, as we might want to
+ * emit some logs during the early driver initialization, where do not have an
+ * xe_device, and thus the underlying drm_device, allocation yet.
+ *
+ * To mimics the drm_err() or drm_info() outputs, we will provide ``[drm]``
+ * decoration manually and for drm_err() it will include ``[drm] *ERROR*``
+ *
+ * Examples::
+ *
+ *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
+ *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
+ *   <6> xe 0000:03:00.0: [drm] SIGID=103 In survivability mode
+ */
+void xe_log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+		       const void *data, size_t len, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	log_prep_dmesg(pdev, cper_sev, sigid, data, len, &vaf);
+
+	va_end(args);
+}
+
 /**
  * xe_log_emit() - Emit a structured SIGID log entry
  * @pdev: the &pci_dev device
diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index 1d30d05eb311..ebca8874a44d 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -18,6 +18,14 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 		 u32 component, u32 location, const void *data, size_t len,
 		 const char *fmt, ...);
 
+__printf(8, 9)
+void xe_log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+		      u32 component, u32 location, const void *data, size_t len,
+		      const char *fmt, ...);
+__printf(6, 7)
+void xe_log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+		       const void *data, size_t len, const char *fmt, ...);
+
 #define xe_log_emit_from(any, sev, sig, comp, loc, data, len, fmt, args...) \
 	xe_log_emit(xe_any_to_pdev(any), (sev), (sig), (comp), (loc), \
 		    (data), (len), fmt, ##args)
-- 
2.47.1

