Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC56DC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 06:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A229510E596;
	Fri, 16 Aug 2024 06:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SdL7v4m3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E37C10E596
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 06:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723789545; x=1755325545;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BUpNXq7ZmaHu0oFxyZeQY5i8QuZramW8C6G8LdJ5f3w=;
 b=SdL7v4m3CAfESMi0Q3LZnYcVXXu+r12ScF6Opwq3wqJAo4Qb297mlE6M
 j7lz19taI1Tui+PK4SwK/QEZ6YPpfmr07DRm0pW1ZfYAQzxaw45eljUu1
 9Qh+egsNfgTLtF/3npJrEiYYIr75Kq3ocXrr+4N9sBI6DznNh/0yPrkpZ
 47+NhQ2+m0+XaTWmCMozLgdBjGTkvtzDgGrjCX8IBRPb3sZC6yQL+GGO0
 M0dszWTVtccAbrKlABRlRRIaqzfwmm1KFLVfxNOoushZ6VGLXQcHL2OjI
 SUMf2wAFh1XxLUGX4ZAP2hEjNaybN2f/EEYtKAHNwIH8AlCvs7VMG0t1O A==;
X-CSE-ConnectionGUID: zVE5mJnlTQCloTCZ7eOABQ==
X-CSE-MsgGUID: H2FOMxBWQ/uWq1Zx7bSpwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21890341"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="21890341"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 23:25:45 -0700
X-CSE-ConnectionGUID: 2ti7iEkTSy2VXA7ALVqe/A==
X-CSE-MsgGUID: +WjRt+hLR6S3AR8WpSHg4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="60367852"
Received: from singhapo-nuc7i7bnh.iind.intel.com ([10.145.169.50])
 by orviesa008.jf.intel.com with ESMTP; 15 Aug 2024 23:25:44 -0700
From: apoorva.singh@intel.com
To: intel-xe@lists.freedesktop.org
Cc: Apoorva Singh <apoorva.singh@intel.com>
Subject: [PATCH] drm/xe: Remove NULL check of lrc->bo in
 xe_lrc_snapshot_capture()
Date: Fri, 16 Aug 2024 11:54:46 +0530
Message-Id: <20240816062446.896829-1-apoorva.singh@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Apoorva Singh <apoorva.singh@intel.com>

- lrc->bo NULL check is not needed in xe_lrc_snapshot_capture() as
  its already been taken care of in xe_lrc_init()y.

Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 974a9cd8c379..aec7db39c061 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1649,7 +1649,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	if (!snapshot)
 		return NULL;
 
-	if (lrc->bo && lrc->bo->vm)
+	if (lrc->bo->vm)
 		xe_vm_get(lrc->bo->vm);
 
 	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
-- 
2.34.1

