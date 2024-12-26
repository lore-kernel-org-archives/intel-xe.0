Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AD4E77188
	for <intel-xe@archiver.kernel.org>; Thu, 26 Dec 2024 21:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F20410E13A;
	Thu, 26 Dec 2024 21:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFsalb6m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9777810E13A
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Dec 2024 21:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735249511; x=1766785511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ecHWxQF1MrwwtVhSKQQpDFnhhGnS53Lb1t7SHPvf/sI=;
 b=bFsalb6mb4aQwfl1IDieqGmb/jhZZyNvgZQKsFHuc4sxLOU0YkWT3B6N
 RMXbBRJ5nIjsZNUyl4Rty3l++V6K5yrj3XcRCiP+jdiqNCPIVXXNY+ZwR
 mxR67W6Dyt+Fg/cd7ICrGMfTXOk0OJ4H+cjZ89rlehb/c3oxOofGb4laD
 0JwRpcjHkdUr01BIjW84Zr0w2O+kE7lU7/KlBjcYasI/g8oUivfih0qE9
 myqLm2yPJlqqB08p01OmmdhgtBuP+sKyQIFuJvB5taHzlqhSC4a6P4tvH
 qFPfs3tILDaUeOumeumn/fOZXJU5fnUKxuztG5brARGXjh/CLAXzKYkpl g==;
X-CSE-ConnectionGUID: NETISQzqQV2qqCaoCuj2aw==
X-CSE-MsgGUID: OXsn0WSKQtaMfQqhc9dNYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="53196868"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; d="scan'208";a="53196868"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2024 13:45:10 -0800
X-CSE-ConnectionGUID: doa3FGiIRfChQ/ZD4w8ysg==
X-CSE-MsgGUID: 3bcKdSGpSu604fjnqWtjlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="105098388"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2024 13:45:10 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH] drm/xe/guc: Fix GuC log/ct output via debugfs
Date: Thu, 26 Dec 2024 13:44:53 -0800
Message-ID: <20241226214453.2003897-1-julia.filipchuk@intel.com>
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

Enable GuC log dumping when accessed through debugfs (was temporarily
disabled for all code paths). Correct coverity issue of unreachable
code.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 6980304c8903..cdc2280d61c3 100644
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
+	 * When printing to dmesg stop don't output. Allow output through debugfs.
 	 */
-	return;
+	if (p->line.series > 0)
+		return;
 
 #define DMESG_MAX_LINE_LEN	800
 #define MIN_SPACE		(ASCII85_BUFSZ + 2)		/* 85 + "\n\0" */
-- 
2.47.1

