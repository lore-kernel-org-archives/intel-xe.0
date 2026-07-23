Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302C0C531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 20:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF04810F205;
	Thu, 23 Jul 2026 20:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0zGBDIz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623EA10F1FC
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 20:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784839102; x=1816375102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3GozrqFZECHNeHoNbTgyXspHovwKWJxX/tg6LtNFau0=;
 b=B0zGBDIzmS5VqxkODdpkKvceL7g6zGq9dZsPj/+xtl17hW2LkeKbJZR1
 OGL/QSb5mHuCtPZYMYFJeHrax48cIhfaMtx0JTQKpowfAaFXxrmCLoeyv
 nA5f51RgD0J4bx1xldSxG7d9htLzheICG+Irtn68xTeg8ZhLTV9QTjzDJ
 x5ySJcFyjTG4qz2WzIlg8HRxrFOcRPlH1wWGw/3T3R4LBei5aOplE4rfp
 P5abtUxt8pBnYYLOBZRM5tXtB0yyTh4w0SJtm5dFsjMWNFbqnfVN+eku0
 aLW+Vyf4cObivfdELMXdItHPHSV2bw8sGeYZKXwc5A7Zu72KypUojrZwP w==;
X-CSE-ConnectionGUID: Xp52oQdTTA+S9PL4Ryrp1A==
X-CSE-MsgGUID: CuqQq/zLQ0OGzLL/Vz5b7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84484304"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="84484304"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:22 -0700
X-CSE-ConnectionGUID: P8/Gj026TrahpB7OyKB0IQ==
X-CSE-MsgGUID: yEd31H1LSTKX7ljGKH0U9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="254578602"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:21 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 08/19] drm/xe/log: Add errno-only SIGID log helpers
Date: Thu, 23 Jul 2026 22:37:41 +0200
Message-ID: <20260723203754.3782-9-michal.wajdeczko@intel.com>
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

For the software based errors, we will usually want to pass only
the errno value as the data to be logged in the dmesg line/CPER
record. Add simple wrappers for that.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_log.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index 8e300e8b6d10..7e0c28736841 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -140,4 +140,36 @@ void xe_log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 			 __data, __len,	fmt, ##args);					\
 } while (0)
 
+/**
+ * xe_log_err() - Emit a structured SIGID error log entry on the component behalf.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @TAG: the component tag to use
+ * @err: negative errno for the failing operation, or 0 if not applicable
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ */
+#define xe_log_err(any, TAG, err, fmt, args...) \
+	xe_log_emit_comp((any), CPER_SEV_RECOVERABLE, TAG, ERR_PTR(err), 0, fmt, ##args)
+
+/**
+ * xe_log_err_fatal() - Emit a structured SIGID fatal error log entry on the component behalf.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @TAG: the component tag to use
+ * @err: negative errno for the failing operation, or 0 if not applicable
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ */
+#define xe_log_err_fatal(any, TAG, err, fmt, args...) \
+	xe_log_emit_comp((any), CPER_SEV_FATAL, TAG, ERR_PTR(err), 0, fmt, ##args)
+
+/**
+ * xe_log_info() - Emit a structured SIGID information log entry on the component behalf.
+ * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
+ * @TAG: the component tag to use
+ * @fmt: printf-style free text format string (not a stable interface)
+ * @args: arguments for the @fmt format string
+ */
+#define xe_log_info(any, TAG, fmt, args...) \
+	xe_log_emit_comp((any), CPER_SEV_INFORMATIONAL, TAG, NULL, 0, fmt, ##args)
+
 #endif
-- 
2.47.1

