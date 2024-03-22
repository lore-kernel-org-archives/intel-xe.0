Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A71C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 03:44:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B49610EDC1;
	Fri, 22 Mar 2024 03:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7lq6zPL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FAA10EDC1
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 03:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711079091; x=1742615091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rRASzHl3/K4dqz5w6r3PybXYyHZINXfJDTBcvVqjx7s=;
 b=Q7lq6zPL5APrjJ2V2aC9eheDRHrDiCt6Mw883LG8zHrNTKDw9coa0JH6
 B+FGu/3jxm7yJRbR9RLM0d//uqCWWtt9j+nzyyexBh5v7o4Q0C9Xp34Xq
 aM6muIuo9kpHco5sDrITfjTRIih6Pq/LlKYFInNWyJRh1MrWyA9aL/Lew
 JMS1H6aFK44WGpQ4f+dSpN2vc/dNlwUvYz2Mv1AMX6GZc4DoOuwb7ZNy5
 LcNjN2H5HICp6lN4NSSlBHbhAwlsYnjI2m9w/hrvJg0csnwVwDoaNcxDa
 9dTaxVPvVh3O9BK4nnUVvFtriJZ29zYI2eBOhgiC/MjV9uqec+w2ZeNE3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6233811"
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; 
   d="scan'208";a="6233811"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 20:44:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="14627050"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa010.jf.intel.com with ESMTP; 21 Mar 2024 20:44:49 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3] drm/xe/xe_devcoredump: Check NULL before dereferencing
Date: Fri, 22 Mar 2024 09:28:10 +0530
Message-Id: <20240322035810.3347272-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v3
- Define variables before code.(Ashutosh/Jose)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 7d3aa6bd3524..5b7be3b5b906 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -77,17 +77,22 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
 	struct xe_devcoredump *coredump = data;
-	struct xe_device *xe = coredump_to_xe(coredump);
-	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
+	struct xe_device *xe;
+	struct xe_devcoredump_snapshot *ss;
 	struct drm_printer p;
 	struct drm_print_iterator iter;
 	struct timespec64 ts;
 	int i;
 
-	/* Our device is gone already... */
-	if (!data || !coredump_to_xe(coredump))
+	if (!coredump)
+		return -ENODATA;
+
+	xe = coredump_to_xe(coredump);
+	if (!xe)
 		return -ENODEV;
 
+	ss = &coredump->snapshot;
+
 	/* Ensure delayed work is captured before continuing */
 	flush_work(&ss->work);
 
-- 
2.25.1

