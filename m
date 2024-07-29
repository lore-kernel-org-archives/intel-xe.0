Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EFDC3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 23:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97FD10E3CE;
	Mon, 29 Jul 2024 23:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjbwphFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F311C10E3CE
 for <Intel-Xe@lists.freedesktop.org>; Mon, 29 Jul 2024 23:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722295075; x=1753831075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6y6C2ds1dn6WztXNfgpbKxPpB4MNgSChP7XcowurabI=;
 b=NjbwphFDqJLo9ioWHJGr8CkYkLT5LgmWp+hG2FzHGhhXSo57vYeedBh4
 HTpqm7BDP5/2t1Mto0f+srAjVvZr43i7s3JDzTfuOeEcGgNUtZkZ7EiaI
 tKlarhee/IT4T5DKRq2fbbBJ4aQGcB8Afv5uREHGYibalS4eeLvFsE3mm
 ueZNiutF4y0fCcLpz+CIm1a9xhYg0De7HuLb0Y5bG10+fqa+RIAh55BCd
 GteFE2c3cRSRiW6jzh0U9imm0Dk3h4XxVFiDRdzHhLbbim75Tq0sptBD4
 joEmGRJ2UnPVVsGCXR+dDK4u+wsar3qvtrVo8VHRlxutLWB/Ix2UcUzBk A==;
X-CSE-ConnectionGUID: vIS2X37hT8aJpJbQ2zjkhA==
X-CSE-MsgGUID: NKr4xlT1QceF/IYuWiFwcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19966920"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="19966920"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 16:17:54 -0700
X-CSE-ConnectionGUID: 0AVoR7gvRPKMRGOky04YIA==
X-CSE-MsgGUID: mZB9enkvSqe3BfNe35mA7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="54103531"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa009.jf.intel.com with ESMTP; 29 Jul 2024 16:17:54 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 1/8] drm/xe/guc: Remove spurious line feed in debug print
Date: Mon, 29 Jul 2024 16:17:45 -0700
Message-ID: <20240729231753.3101070-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
References: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
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

Including line feeds at the start of a debug print messes up the
output when sent to dmesg. The break actually appears between all the
usefu prefix information and the actual string being printed. In this
case, each block of data has a very clear start line and an extra
delimeter is really not necessary. So don't do it.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index beeeb120d1fc..422c3f5c87d8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1515,7 +1515,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 		drm_puts(p, "H2G CTB (all sizes in DW):\n");
 		guc_ctb_snapshot_print(&snapshot->h2g, p);
 
-		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
+		drm_puts(p, "G2H CTB (all sizes in DW):\n");
 		guc_ctb_snapshot_print(&snapshot->g2h, p);
 
 		drm_printf(p, "\tg2h outstanding: %d\n",
-- 
2.43.2

