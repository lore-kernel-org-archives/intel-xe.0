Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283A9E77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 18:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1F010E267;
	Tue,  7 Jan 2025 18:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HgA/T8Q3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE4B10E267
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jan 2025 18:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736273460; x=1767809460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eapsEjgGrVxJI7FfXEMjalyGPIjSU/gPXPvMj2/FFnw=;
 b=HgA/T8Q3wpOU+8wbgRrDpJxoSzgVuEEiS5/Nsoo7+8vqXYOCzF3zObFM
 gBa62dHIStno2UoH7IsKk6s4B0OZvVYtn4m/Dh8PAF0K4zHg6NSt2c3a+
 SYhA2w3GyLLmp9c2U0yCnFrD5f0iZffU3QWrBRjW8p6fr37bJC+kR9rvw
 1rjnTfFPgvXjuosoMfJkR0pDH42iFSppOIkoxGJ64uuDwOT4niLBQ9/vw
 JqnpYi9R9R1yYxtK6aod9/TTNv67S9/60S5pINM4xdsCWvCyeGI01QqWT
 e61Mdfu91wcyomJx9eK1Wxl438yJSvcd5zpLRNWoxXNYRBPQguahvUC6i Q==;
X-CSE-ConnectionGUID: 5ZqfC2QPTry6NM60uC+Q/g==
X-CSE-MsgGUID: nz1iO4ogSc6t0ZQXF8nj+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36357202"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36357202"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 10:10:25 -0800
X-CSE-ConnectionGUID: IYNd7ZAmSq+PqlrBWezjwg==
X-CSE-MsgGUID: +Wq+a3ETR0SirpdEyNEQjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="107895405"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 10:10:25 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2] drm/xe/guc: Fix GuC log/ct output via debugfs
Date: Tue,  7 Jan 2025 10:10:17 -0800
Message-ID: <20250107181017.2639339-1-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.47.1
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

Change to disable asci85 GuC logging only when output to devcoredump (was temporarily
disabled for all code paths).

v2: Ignore only for devcoredump case (not dmsg output). (feedback by Lucas)

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 8 +++++---
 include/drm/drm_print.h             | 2 ++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 6980304c8903..8e5d1f9866a7 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -424,10 +424,12 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
 	 * Splitting blobs across multiple lines is not compatible with the mesa
 	 * debug decoder tool. Note that even dropping the explicit '\n' below
 	 * doesn't help because the GuC log is so big some underlying implementation
-	 * still splits the lines at 512K characters. So just bail completely for
-	 * the moment.
+	 * still splits the lines at 512K characters.
+	 *
+	 * Only disable from devcoredump output.
 	 */
-	return;
+	if (p->coredump)
+		return;
 
 #define DMESG_MAX_LINE_LEN	800
 #define MIN_SPACE		(ASCII85_BUFSZ + 2)		/* 85 + "\n\0" */
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index f77fe1531cf8..f5ea7f38ba09 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -182,6 +182,7 @@ struct drm_printer {
 		unsigned int counter;
 	} line;
 	enum drm_debug_category category;
+	bool coredump;
 };
 
 void __drm_printfn_coredump(struct drm_printer *p, struct va_format *vaf);
@@ -335,6 +336,7 @@ drm_coredump_printer(struct drm_print_iterator *iter)
 		.printfn = __drm_printfn_coredump,
 		.puts = __drm_puts_coredump,
 		.arg = iter,
+		.coredump = true,
 	};
 
 	/* Set the internal offset of the iterator to zero */
-- 
2.47.1

