Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E178C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F9610E45C;
	Wed, 12 Aug 2026 19:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ur1f+4yM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C56D10F0D8
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562112; x=1818098112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mdnWwV9TVBhUevNQiGZ0xqwQRCRDVfe4A6GXlUNaeso=;
 b=Ur1f+4yMdPQtbzDA4D8RwYKpk7FNJRkgqZ2xOK2pFKaMx6tIYDH4XwCE
 jP8c/XFrHpIwppROw5apghIitQFq2fGz7q1HCZ4tCselXMb5KTozihL9M
 bmEiKW2LSJyAcxRBGtDyqEJi3RKCG5FFPJDSwv748BCisG1xQKdBSDnFD
 CYU3LSzwQc3pXffUWvb93q3FGGr+oxi41B/rZfQc51e9sQ2cqOPd43o7l
 eQO80uUjwEGpLSFOv7VVtBXO340ufBV54O5P/2P4Vs3iR6dqEsFxa4SuZ
 S6h2TE0k6P9jG/HVqjG2naAflDmkVLec3C0xJk5ytMPuwSRP3D3Dq9h6l g==;
X-CSE-ConnectionGUID: pN3HezWbRqWG1uxEgxC2jA==
X-CSE-MsgGUID: AISjJahHTyutjw7Siue+WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987506"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987506"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:12 -0700
X-CSE-ConnectionGUID: 5q4AiRtRTeacWnWxbeSoFA==
X-CSE-MsgGUID: OdaJNFcbSK2140FoJVY9iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268891900"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:11 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 05/32] drm/xe/log: Add SIGID log helpers for severity
Date: Wed, 12 Aug 2026 21:14:21 +0200
Message-ID: <20260812191450.11690-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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

There are only few CPER severity levels defined, add simple helper
for each of them, to avoid forcing developers to write full severity
name in every function call.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: drop support for any_to_pdev (Michal)
---
 drivers/gpu/drm/xe/xe_log.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index d475e816ee0b..73daf37d6463 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -17,4 +17,20 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 		 u32 component, u32 location, const void *data, size_t len,
 		 const char *fmt, ...);
 
+#define xe_log_emit_fatal(pdev, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit((pdev), CPER_SEV_FATAL, (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_emit_recoverable(pdev, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit((pdev), CPER_SEV_RECOVERABLE, (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_emit_corrected(pdev, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit((pdev), CPER_SEV_CORRECTED, (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_emit_info(pdev, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_emit((pdev), CPER_SEV_INFORMATIONAL, (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
 #endif
-- 
2.47.1

