Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B1CCFD372
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 01:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F6F10E33C;
	Tue, 25 Nov 2025 01:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrRJI1m/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DFF10E33A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 01:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764034927; x=1795570927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E4OTP0gaoydP8NFwQEU0XDvfcs1TT5AaftiIH8zc37o=;
 b=VrRJI1m/dySQKek/ZOCELuu9wAy8CuFDZ5PgOd7WntBKobdDZ8pdu4Ug
 90hq7lGOmgn/KI5pjB2D+6uy4Mx4JaLZHQefhQ2J3tB8iYA079FXIJykg
 1sRwANCcdBp0byM/MSNDHci4l+SHT1XqZvzEQVH1jkbke4+E1/sV2zhA/
 BlRBVh3RC+sURUdyf37oh9HYCcuEyA3KTRHjuSRbNWCOrzgGcZ+yV6yRT
 ewjKig+GfKa9TZ0fgg8bPij2uFT26GOrWeHlFUBx6oCfSlpx39GZdbnKr
 D1KROvsAca6KUOdM/yAylxxQ8a+P3pcDhB0DXyrnlrrrmYvBvyPjEMQdI A==;
X-CSE-ConnectionGUID: FKKh1dxAQyq/4BBkYp8Ceg==
X-CSE-MsgGUID: vIWd+48dS/qBmtOsrK4WRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83437199"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="83437199"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 17:42:07 -0800
X-CSE-ConnectionGUID: sSLXrgc1RUC7yeQe0r4nxA==
X-CSE-MsgGUID: 1FzGqK8DQNuSouOlg67uAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="196960942"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 17:42:07 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 3/8] Revert "drm/xe/pvc: Add GuC firmware definition"
Date: Mon, 24 Nov 2025 17:41:38 -0800
Message-ID: <20251125014134.2075988-13-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125014134.2075988-10-julia.filipchuk@intel.com>
References: <20251125014134.2075988-10-julia.filipchuk@intel.com>
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

This reverts commit c7b439f36e31f930bf6cbdf833d7700621686c5b.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6056ecd0b92f..622b76078567 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -119,7 +119,6 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 49, 4))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
-	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 45, 2))	\
 	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
 	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
-- 
2.51.0

