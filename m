Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3843C5CFDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60ABD10F6BB;
	Fri, 14 Aug 2026 17:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6gUfYpq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7585710E183
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727906; x=1818263906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IwrtldM82gL9iXQJe0J65zGhYygl2z2N6tx9UyE5I2s=;
 b=X6gUfYpqxDLGhIMcFoEQ7qZZo+ILNIJiv39ud3ApyvRcZIULCvOm6gMO
 1y1q9F7bal+TVMAc5pX3QK+aNYGI8PI0/MR6fyl52rlq//Jrdb82posXa
 2ymvEZaWuveZUBbvDdBg6Zw2121fQ2ye/4LRB1DYEwTOjfoGizYU5tI+Z
 WIsFVq4TXdTFWQng1v8WRjmZbD81HTKA2M2ktLy3V9UCCSe7RJQYVyWfO
 4x5/f06dETPqQLpXo43hu9vAo4FIIATGOItFgVEKjh/TH7I0qvXdKgKWM
 t/2qhrZ/5FZlK7XhY5aWoM+ZhoooxEmQiIf+CNmbyDHY1yiz+9JHvA5t1 Q==;
X-CSE-ConnectionGUID: 2xdMoz0DTQuWJuf4Gp+e6A==
X-CSE-MsgGUID: x33PA51WQVKIt1gtR2FfBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464029"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464029"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:26 -0700
X-CSE-ConnectionGUID: 17nY2Xs1QNmOultRMdjSWA==
X-CSE-MsgGUID: cNpV8cokTpm64Iv5G/tZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946083"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 07/33] drm/xe/log: Add SIGID log helpers for location &
 severity
Date: Fri, 14 Aug 2026 19:17:33 +0200
Message-ID: <20260814171801.13347-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

There are only few CPER severity levels defined, add more helpers
to avoid forcing developers to write full CPER severity name in
every function call.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: fix argument list (Sashiko)
---
 drivers/gpu/drm/xe/xe_log.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index 510cedae6e14..916218560297 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -69,4 +69,20 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 		    xe_log_location(___any), (data), (len), fmt, ##args);		\
 } while (0)
 
+#define xe_log_from_fatal(any, sig, comp, data, len, fmt, args...) \
+	xe_log_from((any), CPER_SEV_FATAL, (sig), (comp), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_from_recoverable(any, sig, comp, data, len, fmt, args...) \
+	xe_log_from((any), CPER_SEV_RECOVERABLE, (sig), (comp), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_from_corrected(any, sig, comp, data, len, fmt, args...) \
+	xe_log_from((any), CPER_SEV_CORRECTED, (sig), (comp), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_from_info(any, sig, comp, data, len, fmt, args...) \
+	xe_log_from((any), CPER_SEV_INFORMATIONAL, (sig), (comp), \
+		    (data), (len), fmt, ##args)
+
 #endif
-- 
2.47.1

