Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDD4C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6883610F0D6;
	Wed, 12 Aug 2026 19:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RTz7akqq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA82210E45F
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562116; x=1818098116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IwrtldM82gL9iXQJe0J65zGhYygl2z2N6tx9UyE5I2s=;
 b=RTz7akqq+1i7fO0n533fmDm+Y02t/4SJxZUxvU5Z3YHomKLH+fN9tb/4
 1Vs2/R5WSXQN5ChEmPCl52daJ43Cp3oU/Z5wL9967TLvrMPOJY5Gtvdd6
 5Ei9FKM6CQsB+oxf/5cvd+Nh3PFbGWjRV86at8lSZBRQsjI0GfeTKcfwv
 xrLZ23CwFoRfn6TMamraAiYqaOZial5sCcg0ouIKvXLWNV4e1KT9OI38L
 B8kyoZ8ZqWWL/XZRfqmdjnQdhlpQRXcRd200Cfx7I6S50DrCfJwyu5zqO
 Hfryg0SllyeM0jhSRflhGuDwvop1ciwnTYJoAm0b5wXLDhZWJbKB15YSt Q==;
X-CSE-ConnectionGUID: CnjJ8okJQM+pVZe8i5SR2g==
X-CSE-MsgGUID: NN2+qZ4HRi2RZfuUg2aobg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987516"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987516"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:15 -0700
X-CSE-ConnectionGUID: HG5+Eqz0RVyJyHMuZ/dTjA==
X-CSE-MsgGUID: uG1LQ3BPTuaxP5P9LsExQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268891928"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:14 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 07/32] drm/xe/log: Add SIGID log helpers for location &
 severity
Date: Wed, 12 Aug 2026 21:14:23 +0200
Message-ID: <20260812191450.11690-8-michal.wajdeczko@intel.com>
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

