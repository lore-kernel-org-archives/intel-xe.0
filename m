Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6215C27C75
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 22:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609F710E3AD;
	Mon, 10 Jun 2024 22:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxJgYlYz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2238010E27C
 for <Intel-Xe@lists.freedesktop.org>; Mon, 10 Jun 2024 22:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718060203; x=1749596203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4HaIUAtMHMP+P2lR6k8VV1Mq+3LP2KU7RB8OzpsAkM0=;
 b=BxJgYlYzxVP6CQZzLorPRa4NCg4FbEsyDQCLENpaf+PxbR+jRgVkIdS3
 VN86hJQNIFBNqQC5IkqSQhz+VdKfdkBlkee3XNRMvhp/g66EeVuYqjqFx
 BKC4Po1Ku2CbLcTwvRjmWDqQ/rhaTv5A3lnU2iobNyITdwPNmOulK7y6s
 yxT99jtQMPmKOk8Xl7uoz78PBMvtj68K08n/pBmtQTsTsfgBdmBFSPwnC
 euGh/wB3/HiCjHZmMhNvXNuj31u0KCkBraXFmcuuc3rBcHMkOFkH/SlEI
 Q+4uv0u89J9aehuNHGxLoR+oIrq5RQ/pY0QhSvzjrIPE0ojuLFKkxwWmm g==;
X-CSE-ConnectionGUID: uTH0EOMtSMC6U5+Fql3w0g==
X-CSE-MsgGUID: 9iSj0fEYTJCKuG0EkC4YMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25409020"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25409020"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 15:56:41 -0700
X-CSE-ConnectionGUID: 2NIZQNEgQt+7GqI8wndUKg==
X-CSE-MsgGUID: QDLGaZWbQNqTetMrI8/TZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39784059"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 10 Jun 2024 15:56:41 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 1/7] drm/xe/guc: Remove spurious line feed in debug print
Date: Mon, 10 Jun 2024 15:56:34 -0700
Message-ID: <20240610225640.2100465-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610225640.2100465-1-John.C.Harrison@Intel.com>
References: <20240610225640.2100465-1-John.C.Harrison@Intel.com>
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
index c1f258348f5c..83ac14b1eade 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1439,7 +1439,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 		drm_puts(p, "H2G CTB (all sizes in DW):\n");
 		guc_ctb_snapshot_print(&snapshot->h2g, p);
 
-		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
+		drm_puts(p, "G2H CTB (all sizes in DW):\n");
 		guc_ctb_snapshot_print(&snapshot->g2h, p);
 
 		drm_printf(p, "\tg2h outstanding: %d\n",
-- 
2.43.2

