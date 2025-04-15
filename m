Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1E4C369BA
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 17:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F103B10E131;
	Tue, 15 Apr 2025 17:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEJelr73";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2420A10E13D
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 17:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744738500; x=1776274500;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Z84SjP7Ar+NUVFD8wbDsS4K70AGTxG1uSqSEU5vUtw8=;
 b=cEJelr73T5ZGaFDiMYSJTst+bpz2LGiVZSh3FMvqrASRKnO0+XaOggRg
 E4PJTAMoyV0zNi02/6brEl140t5bUITLZ8/sXkUi3/LjnFlknCpw9D7TE
 JGhb0Q6l+s/kZZlbqoeBx8cFDsGJTS/i8gSXrYO8Buulnyb+suAk2ERKZ
 6xl0QlzxYMF3hOXFBsqWG925cnzydZ/iMj2V/FfqwA/R0E0FDdv2VB/mm
 QnYEFhyDISpSPTnBn/DRtXIpXH110q72sUrERLh1sjVx89r6k4BhqS9hl
 sJkppLcoQCDh0WQ5b0FHu2OyP2iSPcl4T5DDroCH/8lSoeD0asZAfokw9 w==;
X-CSE-ConnectionGUID: kLUb2SZ+RXCfsiy02NSvHw==
X-CSE-MsgGUID: 307mW1csTXKnZsQMTDH7MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56441687"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="56441687"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:34:59 -0700
X-CSE-ConnectionGUID: Wa20XXXLQEOY+aQxmneENg==
X-CSE-MsgGUID: cnb4N7WAQwC4+gzaGqAWNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="131085219"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:34:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 3/4] drm/print: Add drm_coredump_printer_is_full
Date: Tue, 15 Apr 2025 10:36:12 -0700
Message-Id: <20250415173613.294522-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415173613.294522-1-matthew.brost@intel.com>
References: <20250415173613.294522-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 include/drm/drm_print.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index f31eba1c7cab..6cc35fcca4c9 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -344,6 +344,23 @@ drm_coredump_printer(struct drm_print_iterator *iter)
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
+	return !iterator->remain;
+}
+
 /**
  * drm_seq_file_printer - construct a &drm_printer that outputs to &seq_file
  * @f:  the &struct seq_file to output to
-- 
2.34.1

