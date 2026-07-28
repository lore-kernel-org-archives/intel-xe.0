Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402D7C54F5B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F002510E97F;
	Tue, 28 Jul 2026 16:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJ6+DyEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FA510E97B
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255079; x=1816791079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xk/IBAjsz3IUw72EFnCzOfLo4ON//1o9VkuUOHuh+qA=;
 b=EJ6+DyEv2q/N7vGk5LiMzWrJYNnJDG52fTpyAp1QTrKreR58cbJHJDIB
 vDY2MOURXo7oRI8vXlrsGzmR7mf0ccaG2ZgD3YbC2WSYzaeJ4I5bSz5Ec
 hd+hEaXffjkLKTgn+yEPB2zeHaYkal+eJ036CVncShCLGbGloSNLLQExd
 ta2jvHz54X3vew66ruv5H3jLlAlCTJmhvkaJbeJbGNWIy4mUfWta+XirO
 wscIcjf3YedBuyuxvqaAXx1tuAxHHm76UKp/LvtVRPRy1oj5F77rsOzkC
 TqZtMwS6fNc7I6/CQeIa9qFbWsf/OrwHIFaIANOcxmnFB/HTLG8nrpFpy g==;
X-CSE-ConnectionGUID: 45jT0spFRB2mUjJUSAGxEg==
X-CSE-MsgGUID: YdNLkTNvTsm7UV1MnIE3MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103386260"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103386260"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:19 -0700
X-CSE-ConnectionGUID: 46cL8b19QhafPZ6K+m5Ztw==
X-CSE-MsgGUID: 6aAFoGCWSy+htcLrXev5dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259819305"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:18 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 07/22] drm/xe/log: Add SIGID log helpers for location &
 severity
Date: Tue, 28 Jul 2026 18:10:22 +0200
Message-ID: <20260728161039.579-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728161039.579-1-michal.wajdeczko@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
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
 drivers/gpu/drm/xe/xe_log.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
index 510cedae6e14..43deaf93ce3e 100644
--- a/drivers/gpu/drm/xe/xe_log.h
+++ b/drivers/gpu/drm/xe/xe_log.h
@@ -69,4 +69,20 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 		    xe_log_location(___any), (data), (len), fmt, ##args);		\
 } while (0)
 
+#define xe_log_from_fatal(any, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_from((any), CPER_SEV_FATAL, (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_from_recoverable(any, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_from((any), CPER_SEV_RECOVERABLE, (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_from_corrected(any, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_from((any), CPER_SEV_CORRECTED, (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
+#define xe_log_from_info(any, sig, comp, loc, data, len, fmt, args...) \
+	xe_log_from((any), CPER_SEV_INFORMATIONAL, (sig), (comp), (loc), \
+		    (data), (len), fmt, ##args)
+
 #endif
-- 
2.47.1

