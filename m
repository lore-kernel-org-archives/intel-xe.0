Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9810C3601A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 20:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E26510EB48;
	Thu,  3 Apr 2025 20:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7hAiEQt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9179510EA67;
 Thu,  3 Apr 2025 20:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743711955; x=1775247955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HzMwQuXidQMUhSnA9WwbP7ZSDx73OS5wYEVIStd5jKo=;
 b=W7hAiEQtdQnZLrYFqIRKBhruK4Foel5qcPs8rKMSOLFg7K7OOGIe/fMs
 vFG7l7oFbLvWBwbrdeZZ3HQBl7mp+Yfde5QuV9G5UWySb5dmB1Rx7j7f0
 /hO2oZCYqgZ08y3957vRj17oXrmxoTC05fnnn/iQCqkPNhhZClusqXWa3
 Fl6OwknlPaj+xBe/SxExShKLTgvgA6o/cM2J/oCas75IHdzS0cud1o291
 qXuGxwIfSEVcfUf/C19gHSHkpS6+dnpSgKhFxvoqQW7DaZLRAUp50b6Uo
 hVtLn2dC1A87OFOQ027PEtnmoL3VGSzXc8z/OrLZbKjoH9J3TYB/EJGDv Q==;
X-CSE-ConnectionGUID: Di8dcw70QE6K6OjTcvymFg==
X-CSE-MsgGUID: uNz9ytfzRPGK43bVRLEE1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55337818"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="55337818"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:25:54 -0700
X-CSE-ConnectionGUID: 7evRfP+SSbWY13yb22Lp/w==
X-CSE-MsgGUID: RziysdyMTlOlAP99a9zVtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="127972862"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:25:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/print: Add drm_printer_is_full
Date: Thu,  3 Apr 2025 13:27:04 -0700
Message-Id: <20250403202705.18488-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403202705.18488-1-matthew.brost@intel.com>
References: <20250403202705.18488-1-matthew.brost@intel.com>
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

Add drm_printer_is_full which indicates if a drm printer's output is
full. Useful to short circuit coredump printing once printer's output is
full.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm/drm_print.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index f31eba1c7cab..db7517ee1b19 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -242,6 +242,23 @@ struct drm_print_iterator {
 	ssize_t offset;
 };
 
+/**
+ * drm_printer_is_full() - DRM printer output is full
+ * @p: DRM printer
+ *
+ * DRM printer output is full, useful to short circuit coredump printing once
+ * printer is full.
+ *
+ * RETURNS:
+ * True if DRM printer output buffer is full, False otherwise
+ */
+static inline bool drm_printer_is_full(struct drm_printer *p)
+{
+	struct drm_print_iterator *iterator = p->arg;
+
+	return !iterator->remain;
+}
+
 /**
  * drm_coredump_printer - construct a &drm_printer that can output to a buffer
  * from the read function for devcoredump
-- 
2.34.1

