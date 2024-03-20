Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95084C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 05:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B9710E684;
	Wed, 20 Mar 2024 05:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ejPD8IIt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1109910E684
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 05:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710911362; x=1742447362;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Aq6lXcNh8+TavtDL5/XqCDe2jl+Jr3rrJyY+Btq9v2A=;
 b=ejPD8IItYIVgGomyqwLBg7+FN3pRdQwYA4NOAIuvjYoBsW1rRyzjJg4M
 1OrzYmKCm8QLZSpWXk5JkD9I0wcvwY0C/r0kak0255fRo6WJ/z8OEc5g6
 kwLuIWqw7ajNRbVAf81wFU4L22oc5dvUGn7Hy00e2z9NAejdqH1ZYGzVD
 /U3vba6ls3dJattKQaKeEC114BKAM3yvHYVR8t4pGfmxg5vyG4OmfDXeP
 8sPVDtCuKTWoS2FLp034oNIl3pefUFk6sVf1HyX19gZLN9uYR9YEE55Y0
 zMF7tPt4IxhrEqi3fnIY6d+llSSZryL918kw36UhLg6+BBFMMYq2Hecmu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="6427268"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="6427268"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 22:09:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="14690659"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa008.jf.intel.com with ESMTP; 19 Mar 2024 22:09:19 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe/xe_devcoredump: Check NULL before dereferencing
Date: Wed, 20 Mar 2024 10:52:39 +0530
Message-Id: <20240320052239.3249222-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

Dereference 'coredump' to access 'xe_devcoredump_snapshot' only if
'coredump' is not NULL,

v2
- Fix commit messages.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 0fcd30680323..83a1f3cd37cf 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -74,17 +74,20 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
 	struct xe_devcoredump *coredump = data;
+	if (!coredump)
+		return -ENODATA;
+
 	struct xe_device *xe = coredump_to_xe(coredump);
+	/* Our device is gone already... */
+	if (!xe)
+		return -ENODEV;
+
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
 	struct drm_printer p;
 	struct drm_print_iterator iter;
 	struct timespec64 ts;
 	int i;
 
-	/* Our device is gone already... */
-	if (!data || !coredump_to_xe(coredump))
-		return -ENODEV;
-
 	/* Ensure delayed work is captured before continuing */
 	flush_work(&ss->work);
 
-- 
2.25.1

