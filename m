Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3866BCD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 12:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F306010E7B8;
	Wed, 27 May 2026 12:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3XK1pgG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9340B10E7A6
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 12:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779884525; x=1811420525;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dhaml/89ZNiCBDgDB8C0tgS7DAcDg1jLct0b+HZkKJ4=;
 b=T3XK1pgGz/hCIA6iyN/wn89FAWqJYz7O/8v4QLCRFxrvx+gXwdhqRIl+
 eBdHtiRuIRIaXPNBb1/xmhbYQojLD1LDVR7wSK7hCnnp+4dgMrmQI3YGz
 J5WN5IyAt9qLYmXzJEGEf80/Zva/m8y1OZ5tsbPmXbxtCbUUnqAdjJd1u
 p62F8mMzi7wjNsgWi1F8FR0SOPwhls4V0pCZQFReB8ndbG6WXD1gJxm2z
 Y8taQ14jkvDTFF5PYLSURVrG2LrZCHhEf+mLWlcU+Wnupna8Fo5XEEwOs
 5woESZciS3w/973eun0coYuBaAnu9DsjFrogItmlOujsv+n7yrg9pK9ng w==;
X-CSE-ConnectionGUID: mwfExxdjSxao7g1tHEoK0A==
X-CSE-MsgGUID: ikYxAqTcQhivXSRQvnLH8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84572044"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="84572044"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 05:22:05 -0700
X-CSE-ConnectionGUID: X+qyMbN9SJ+EAz5e2ibDLQ==
X-CSE-MsgGUID: KZxVZAbsSLKOAjjxyce2rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="247309106"
Received: from padamowi-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.18.63])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 05:22:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH] drm/xe/ggtt: Fix xe_ggtt documentation
Date: Wed, 27 May 2026 14:21:54 +0200
Message-ID: <20260527122154.22480-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

The following error is reported during the htmldocs build:

 ... Documentation/gpu/xe/xe_mm:22:
     ../drivers/gpu/drm/xe/xe_ggtt.c:125:
        ERROR: Unexpected indentation. [docutils]

Fix this by adding a blank line before the enumeration.
While around correct some invalid spaces.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index a351c578b170..8ec23862477f 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -111,14 +111,14 @@ struct xe_ggtt_pt_ops {
 struct xe_ggtt {
 	/** @tile: Back pointer to tile where this GGTT belongs */
 	struct xe_tile *tile;
-        /** @start: Start offset of GGTT */
+	/** @start: Start offset of GGTT */
 	u64 start;
 	/** @size: Total usable size of this GGTT */
 	u64 size;
-
 	/**
-	 * @flags: Flags for this GGTT
+	 * @flags: Flags for this GGTT.
 	 * Acceptable flags:
+	 *
 	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
 	 * - %XE_GGTT_FLAGS_ONLINE - is GGTT online, protected by ggtt->lock
 	 *   after init
@@ -129,7 +129,7 @@ struct xe_ggtt {
 	/** @lock: Mutex lock to protect GGTT data */
 	struct mutex lock;
 	/**
-	 *  @gsm: The iomem pointer to the actual location of the translation
+	 * @gsm: The iomem pointer to the actual location of the translation
 	 * table located in the GSM for easy PTE manipulation
 	 */
 	u64 __iomem *gsm;
-- 
2.47.1

