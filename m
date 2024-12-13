Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9B7E77180
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 17:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C796010E26D;
	Fri, 13 Dec 2024 17:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0EN65i6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8C810E26D;
 Fri, 13 Dec 2024 17:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734110915; x=1765646915;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ATm09Bi+kJ9wWgp5aT5x7AvrnmIu/Tr0NvgiF+F0CIQ=;
 b=I0EN65i6FrJH5UoZVAm1ozVvFCfxMglNnaPQilbqPryD4Ac/CBlc3Xpl
 2wveQqPK5C781dFNHKXh913pCkIM0oOXfnVzmO9sma6cCBOlqdjdgCBxN
 AGCq7KE18g4vR7BonPUvcjpuFO8TLoEpoU8fmssrih6tEE93N6nqG/QSk
 eiqvLPHWel5uy4AhdeA2FBtiqS4gLWjZo0mj61BpwXjKQGMghKHR0F7b7
 nZY7pNQrchBExGhod5RvqsImpgNT7Xg0wRoVU1J1TB4vzi0uH/Zo19fWP
 6J7bJdPVc2gjYLWcLcI6nUdMjeL6MEw3CUtIwuyYxNRZyGf0NORS3qc66 w==;
X-CSE-ConnectionGUID: EoteynvKQPSS3nVfr1kh7w==
X-CSE-MsgGUID: K2CeodEGQryysQ22dsoQ5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="33868877"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="33868877"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 09:28:34 -0800
X-CSE-ConnectionGUID: 3BzirmzsTjCJv/oqquF1Yw==
X-CSE-MsgGUID: QvNhcp5CSeCG/W452O3mcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119857010"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 13 Dec 2024 09:28:34 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Revert some changes that break a mesa debug tool
Date: Fri, 13 Dec 2024 09:28:33 -0800
Message-ID: <20241213172833.1733376-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

There is a mesa debug tool for decoding devcoredump files. Recent
changes to improve the devcoredump output broke that tool. So revert
the changes until the tool can be extended to support the new fields.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Fixes: c28fd6c358db ("drm/xe/devcoredump: Improve section headings and add tile info")
Fixes: ec1455ce7e35 ("drm/xe/devcoredump: Add ASCII85 dump helper function")
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 71636e80b71d..6980304c8903 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -119,7 +119,11 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	drm_puts(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
 
-	drm_puts(&p, "\n**** Contexts ****\n");
+	/*
+	 * Don't add a new section header here because the mesa debug decoder
+	 * tool expects the context information to be in the 'GuC CT' section.
+	 */
+	/* drm_puts(&p, "\n**** Contexts ****\n"); */
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
 
 	drm_puts(&p, "\n**** Job ****\n");
@@ -416,6 +420,15 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
 	char buff[ASCII85_BUFSZ], *line_buff;
 	size_t line_pos = 0;
 
+	/*
+	 * Splitting blobs across multiple lines is not compatible with the mesa
+	 * debug decoder tool. Note that even dropping the explicit '\n' below
+	 * doesn't help because the GuC log is so big some underlying implementation
+	 * still splits the lines at 512K characters. So just bail completely for
+	 * the moment.
+	 */
+	return;
+
 #define DMESG_MAX_LINE_LEN	800
 #define MIN_SPACE		(ASCII85_BUFSZ + 2)		/* 85 + "\n\0" */
 
-- 
2.47.0

