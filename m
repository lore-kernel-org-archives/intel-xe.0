Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF79E77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 20:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D4910E790;
	Tue,  7 Jan 2025 20:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/ioHC2J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6733A10E790
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jan 2025 20:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736281384; x=1767817384;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qNB6E1ZcCWsYXZ0UPY9xXsTjX9Yj9dv4RVv5kR3Ttdw=;
 b=J/ioHC2JayOkliUJl2AkbfhgRbCK5YIKv7T2h+KY81NMu05MuXfq2aKG
 DCEbYbNVoXgH1MO+zaVLrD2ZLM2Nj1V/SAjdB1KP/7SLms+kuTsedquNe
 K2m1tI91F2gxM+p3jhs7h7BqBmqaaJyyBHNgGVY/JroP3V7cae7E2DiU8
 JbBQjRjGCfwarNlTQI5YN8sOdjRJHocKd4XsuFJnGpXA0szWiIZqUs+Au
 POyBur/NZhubtJOwMtd1hqEwl23jJqTX/4Zmj4YNhZOvhAxcIlX7hmLQn
 +BxcVxE+Bq6O0DWPzPnZhrfoUEui6jEn7XTO/jQMyJeYizPsppZ3cNrmP g==;
X-CSE-ConnectionGUID: DJp3CcmdR+Owf7MNuTR97A==
X-CSE-MsgGUID: Tru640cWTS+WSOZS6DReeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="58951979"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="58951979"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:23:04 -0800
X-CSE-ConnectionGUID: f5VXaYCoSbm7+m8l2bGE7w==
X-CSE-MsgGUID: eCuKI4NpSOK2HxdGrVVu8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126164809"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:23:03 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v3 1/1] drm/xe/guc: Fix GuC log/ct output via debugfs
Date: Tue,  7 Jan 2025 12:22:52 -0800
Message-ID: <20250107202252.2642853-1-julia.filipchuk@intel.com>
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

Change to disable asci85 GuC logging only when output to devcoredump
(was temporarily disabled for all code paths).

v2: Ignore only for devcoredump case (not dmesg output).
v3: Rebase to resolve parent tag mismatch.

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

