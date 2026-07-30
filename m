Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E54C55162
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 15:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0435710EFAB;
	Thu, 30 Jul 2026 15:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LowN+jVA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5BF10E697
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 15:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785425593; x=1816961593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MvaDtRY4MZ607aCo/N30a/sVAOXB20E3pW01lHN2rzU=;
 b=LowN+jVAqaNeusP/xkVDPp1cL+b9QGbhBdHc1UvaeS90WbnuTaoH+eKA
 2SjBl+YXPNYE05iCDPbw61g6yYlR7NATVp31r761EvrCX0ktz1OaMzGZK
 HxOz1TnT5Fr3gLAy4TRG8xBAp4+YYi+TT9areNs4dviFFUa29QmSelDCn
 BDLFgFjY3CPJ8dDK0gcoCupqSudD2f5Tz90591xGKyHyK3sunjIRKJUSO
 ZWzV0cY7Ul5gcEV1M1/WqatExuAMIl30FSBszbmtXQCwz48RU9cVHq9rM
 KNJ8Mdnn5kIviIMxxhywwx70a7lY8VJtS3C/NQShV8Ji/ybvf7xG3thhb Q==;
X-CSE-ConnectionGUID: fcPAHraERv6JBdgeW2D0hg==
X-CSE-MsgGUID: qxAOiZidS9W28fn3inEg2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="73583023"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="73583023"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:11 -0700
X-CSE-ConnectionGUID: SeVTY31uS2C7CzpMZ9HJDA==
X-CSE-MsgGUID: 2hgDOVY3QkKgDF4YgU0GsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="260387543"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:10 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 07/23] drm/xe/log: Add SIGID log helpers for location &
 severity
Date: Thu, 30 Jul 2026 17:21:03 +0200
Message-ID: <20260730152121.576-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730152121.576-1-michal.wajdeczko@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
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

