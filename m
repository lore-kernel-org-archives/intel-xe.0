Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A3CC5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6579610F0D8;
	Wed, 12 Aug 2026 19:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aW15twXx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AEC10F0B9
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562119; x=1818098119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ySNUcdhJDnwIAhfSIRlhs7gejQhMeG6IVBg0DZbi0gk=;
 b=aW15twXxMLGM3oNqO7E3eRVHLmNWZmUflw697OCt6GFg/fKlvqYbBV61
 AzTPEZn3xfYuYFIocg5k+3FGGhhM6gupRmPynZSrZWHqrz8FzsS2DP0zz
 Y7qrHIx/3mGL2X9MeW+ADHvCJHUXvo0FVeKn5X4JsoGqjS5OUE6pDReCD
 ivmtgJeWF0t8bEV45dDXobkzCYO8fP/1/SAQq2ZLLrrY6gDAmtNw261yp
 xHxpVArRUmHcRTfWbI0FdmkWa3ZuJdg8+6gu3KShIanBPaCa0FJQQS1Fk
 qqnAAc2pgAD27f2Nuxfg4clLtxkZmKO8EPAgda9dmMJbQxJFF8pT4+fF3 g==;
X-CSE-ConnectionGUID: Vp/IsSQWTfeg8+IX/pj+kw==
X-CSE-MsgGUID: ggDGClm0SWu4tkcNPQ4/PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987528"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987528"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:19 -0700
X-CSE-ConnectionGUID: n8FLnkceQ/OG2mhkxoox3Q==
X-CSE-MsgGUID: MXK3KDc+QBeSNEAMKicFuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268891940"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:17 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 09/32] drm/xe/log: Add SIGID log helpers for component &
 severity
Date: Wed, 12 Aug 2026 21:14:25 +0200
Message-ID: <20260812191450.11690-10-michal.wajdeczko@intel.com>
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

There are only few CPER severity levels defined, add some helpers
to avoid forcing developers to write full CPER severity enum name
in every macro call.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_log.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index c30db02950b0..c56306a183e7 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -103,4 +103,16 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 	xe_log_from((any), (cper_sev), (int)XE_LOG_COMPONENT_##TAG##_SIGID, \
 		    XE_LOG_COMPONENT_##TAG, (data), (len), fmt, ##args)
 
+#define xe_log_comp_fatal(any, TAG, data, len, fmt, args...) \
+	xe_log_comp((any), CPER_SEV_FATAL, TAG, (data), (len), fmt, ##args)
+
+#define xe_log_comp_recoverable(any, TAG, data, len, fmt, args...) \
+	xe_log_comp((any), CPER_SEV_RECOVERABLE, TAG, (data), (len), fmt, ##args)
+
+#define xe_log_comp_corrected(any, TAG, data, len, fmt, args...) \
+	xe_log_comp((any), CPER_SEV_CORRECTED, TAG, (data), (len), fmt, ##args)
+
+#define xe_log_comp_info(any, TAG, data, len, fmt, args...) \
+	xe_log_comp((any), CPER_SEV_INFORMATIONAL, TAG, (data), (len), fmt, ##args)
+
 #endif
-- 
2.47.1

