Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7578C54E58
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 05:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6251210E7CD;
	Wed, 20 Mar 2024 05:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qv/y4X/P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142AE10E7CD
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 05:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710911043; x=1742447043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ac00n069iQE5jdhdSSoLieQTrRLehALe8OtesSNwhBo=;
 b=Qv/y4X/PqZdRvNWpRU6N0rVWvTq6Prq4EVyFnqgDuWTOFPaVsJNEvsV6
 nDiDl1s18+J6kmHuzlX97SeN8XugmjqTraZf4HDZQ5OSeYQ14f7LFv6Fx
 L5r0aUfekPQFM5N+HDkDXWY2SjjJheuI/fltPXVgXayXD/uHq4oCk344A
 Qy4sf4wc9JembNbxrW3mCBg0hB6EEiEx6kwQXgS71T8S9+BYRFTG5PsIF
 kDma+JruIwEmSOeLN2N/1FPMiciilEbavJqI6nZFyjvphBUaQvGgpfqwr
 niPnszwCHVHxws0VJv5T3VpeORzFbbUbB3UHkGMWQYYLqT0iX5z8t0jdx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5690148"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="5690148"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 22:04:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="18762331"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa005.jf.intel.com with ESMTP; 19 Mar 2024 22:04:01 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] gpu/drm/xe/xe_devcoredump: Check NULL before dereferencing
 coredump.
Date: Wed, 20 Mar 2024 10:47:19 +0530
Message-Id: <20240320051719.3248723-1-himal.prasad.ghimiray@intel.com>
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

Derefernce coredump to get xe_devcoredump_snapshot only if coredump is
not NULL.

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

