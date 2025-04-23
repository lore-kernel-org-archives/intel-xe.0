Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1E4C369D7
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 17:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F48610E21C;
	Wed, 23 Apr 2025 17:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggxfrB0K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146B110E21C
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745428572; x=1776964572;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=sB6LNzt2OUErxhBo3X9aUbWWqcumV8kfKiaSM45cnfM=;
 b=ggxfrB0Ktk8K1QtV5mHi331TjH75IZ3QZ1UXpS3vcBDMRaXnNAy88JT3
 rFhJcJpDwGIspsNnjL+jN2FuTWXZYmJRDDDlLe9WUiQxjAxymGKGtjQWS
 3zmlVmdbz8TQGujyER7jEsA5HRJAjCPchS2yrvWWgKlNltW4Sz7PANASa
 2cno2Kprhs8CBBZw5WV/8B9xxY0y3Yp0SG8ucWBoSv/K6loCdvP3IAyy9
 yJPgJs9ROHBlO3ys0q3Qp2C2qro/UIzsatKH9y779L7LxRyzzvxwCb2cw
 hxhJkuXLoZRCqn5D8Yv312kExjNBW4j6ltyJEGy/NzZNBSgzg2jeOKB7G Q==;
X-CSE-ConnectionGUID: fMBZPk1PQoCMAqbdyZLUKg==
X-CSE-MsgGUID: vNr2vBhoTRGvefOHFQV+kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="57228674"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="57228674"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 10:16:12 -0700
X-CSE-ConnectionGUID: KA5sLOXdT+2wYQO0bwBHLA==
X-CSE-MsgGUID: xL9x3fhFQAKmkSywkzAe0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137459378"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 10:16:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 3/4] drm/print: Add drm_coredump_printer_is_full
Date: Wed, 23 Apr 2025 10:17:24 -0700
Message-Id: <20250423171725.597955-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423171725.597955-1-matthew.brost@intel.com>
References: <20250423171725.597955-1-matthew.brost@intel.com>
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

Add drm_coredump_printer_is_full which indicates if a drm printer's
output is full. Useful to short circuit coredump printing once printer's
output is full.

v2:
 - s/drm_printer_is_full/drm_coredump_printer_is_full (Jani)
v3:
 - Bail if not a coredump printer (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 include/drm/drm_print.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index f31eba1c7cab..ab017b05e175 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -344,6 +344,26 @@ drm_coredump_printer(struct drm_print_iterator *iter)
 	return p;
 }
 
+/**
+ * drm_coredump_printer_is_full() - DRM coredump printer output is full
+ * @p: DRM coredump printer
+ *
+ * DRM printer output is full, useful to short circuit coredump printing once
+ * printer is full.
+ *
+ * RETURNS:
+ * True if DRM coredump printer output buffer is full, False otherwise
+ */
+static inline bool drm_coredump_printer_is_full(struct drm_printer *p)
+{
+	struct drm_print_iterator *iterator = p->arg;
+
+	if (p->printfn != __drm_printfn_coredump)
+		return true;
+
+	return !iterator->remain;
+}
+
 /**
  * drm_seq_file_printer - construct a &drm_printer that outputs to &seq_file
  * @f:  the &struct seq_file to output to
-- 
2.34.1

