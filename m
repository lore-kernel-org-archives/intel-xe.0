Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20711FF8868
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A1010EBDB;
	Tue, 28 Apr 2026 14:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ci2jdFTJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1700610EC7F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386467; x=1808922467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cCJt1+hRbY5sahI3MIMsaMx41kxzCA+Qjj4tVtX4MGw=;
 b=Ci2jdFTJnTJcqp3jZqm1ZgRtUyC74zyIWWkQE0Uq65tmWP6rkltC8zHz
 H0hUSa0IEQFfTmKF/FxfIegwOLdnWjznOnqcpUYsqLnajE9r42pBKe8ie
 Sr6Kt8BDnc9CpAIcrBuCbBz7UYoG17fG2MuJcZP6N/T8ZEqyCHNugUDjR
 HE9vmEDi+yYLqOgqZ6ujaWO0zVyVa/h8rOxITJVf4iV54bD2havXFhCGM
 lNJCjwQC+kUau/ef8pQCd3Hhz1LemTy38+TWFr7CPX49ChU5L5c7B39Di
 OqVnOGpiYbhh5yDYspDgGTdVwkYnvG1jDLCn/xAx7viyg1S70W5rq35PC A==;
X-CSE-ConnectionGUID: Er1gVKt6T3Cq0v3tUeCM5w==
X-CSE-MsgGUID: uMY+AfiVS42KaHqx0iHppg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95862331"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="95862331"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:47 -0700
X-CSE-ConnectionGUID: d937utRtR7qcUSQyzFWCMA==
X-CSE-MsgGUID: TlaOp5UnRc+gCd1ZJkzwUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238942370"
Received: from orenpaz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.20.98])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 08/13] drm/xe/memirq: Make page layout macros private
Date: Tue, 28 Apr 2026 16:27:15 +0200
Message-ID: <20260428142722.582-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428142722.582-1-michal.wajdeczko@intel.com>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
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

There is no need to expose the macros describing memory-based
interrupts page layouts in the .h file as we only use them in
the private code. Move them to the .c file near the kernel-doc.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c       | 7 +++++++
 drivers/gpu/drm/xe/xe_memirq_types.h | 7 -------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 811e07136efb..519b36ce2020 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -152,6 +152,13 @@ static const char *guc_name(struct xe_guc *guc)
  *
  */
 
+/* ISR */
+#define XE_MEMIRQ_STATUS_OFFSET(inst)	((inst) * SZ_4K + 0x0)
+/* IIR */
+#define XE_MEMIRQ_SOURCE_OFFSET(inst)	((inst) * SZ_4K + 0x400)
+/* IMR */
+#define XE_MEMIRQ_ENABLE_OFFSET		0x440
+
 static inline bool hw_reports_to_instance_zero(struct xe_memirq *memirq)
 {
 	/*
diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe_memirq_types.h
index 9d0f6c1cdb9d..02ac938cadb4 100644
--- a/drivers/gpu/drm/xe/xe_memirq_types.h
+++ b/drivers/gpu/drm/xe/xe_memirq_types.h
@@ -10,13 +10,6 @@
 
 struct xe_bo;
 
-/* ISR */
-#define XE_MEMIRQ_STATUS_OFFSET(inst)	((inst) * SZ_4K + 0x0)
-/* IIR */
-#define XE_MEMIRQ_SOURCE_OFFSET(inst)	((inst) * SZ_4K + 0x400)
-/* IMR */
-#define XE_MEMIRQ_ENABLE_OFFSET		0x440
-
 /**
  * struct xe_memirq - Data used by the `Memory Based Interrupts`_.
  *
-- 
2.47.1

