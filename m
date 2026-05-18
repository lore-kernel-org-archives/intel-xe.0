Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6E7CD343F
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 19:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3CB10E14A;
	Mon, 18 May 2026 19:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lox14AJr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3EA10E14A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 19:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779132358; x=1810668358;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Kpac3ypHxGW60Eoz3liYkv4ETxZrarLgsrhKRDOAeB0=;
 b=lox14AJr3YJga7f4j2bBM62aKiCiXwvkenA6mUaHcUSqmdJqRtzCtGs1
 BDraf6+ClwSzPdTvjafm/q0EFb7ou3CwQOQuhM6YCY7gYtxtjTUW5Ddwr
 m0iE4ZDf5Cf6W9E5xYePdKghhe1LvZaXlTfJBuh0wd1kaqmTsq/67/e0u
 KB2cXMozfnYMfZQGn7v06Qfq3YEt6gdvyi5zAVJNrd5xindWG/4P/stCh
 mw3RfJco3VyTe10DgYj5AJS2g+d9xm3OzcDN0RLwRL7AKB0ihZG3bFKut
 SiHObBm/yy/rjjKO4TKsoY90MQs8Sl7EAkHbOwdAKgDvdbP3ePmOThj1F w==;
X-CSE-ConnectionGUID: e5ccgDwTROWkbnbxPtysEQ==
X-CSE-MsgGUID: 3gZ7x4MtTba5gXSwSRRgcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90304787"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="90304787"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:25:58 -0700
X-CSE-ConnectionGUID: HjFlSIn3QvKzLXug32f4+Q==
X-CSE-MsgGUID: oNftazktQv+WhEg1Rr2lOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="235276018"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:25:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/9] drm/xe/memirq: Make page layout macros private
Date: Mon, 18 May 2026 21:25:40 +0200
Message-ID: <20260518192547.600-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518192547.600-1-michal.wajdeczko@intel.com>
References: <20260518192547.600-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c       | 7 +++++++
 drivers/gpu/drm/xe/xe_memirq_types.h | 7 -------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 3848ff81c1f9..118c2285e893 100644
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

