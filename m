Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CA3C48291
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 20:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D9110E418;
	Fri,  2 Feb 2024 20:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8cJLsW6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED34C10E2D1
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 20:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706904181; x=1738440181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4xivC86GKwzYKVN60HZ6IzV1maJVzfL5vNyZOnrcfkA=;
 b=i8cJLsW6F99hGwPLK5qKWLxEyiB0uTkJ07Kh/pkz70GMF2kflu9g90rF
 Gx6GUKfjuGtHCK0LdYLLvmuoI0mz1CuK0jrue4vnXVdwYUZAKtz7r3btg
 /dBLwrwU1VNq+2MpfBdNP54vaKXOx5Ujt8Xfib44IGnWfTVyuzOftv7l+
 NRV0pb5zzc2c1aaH1WUpHe/3Dweaw3NBWQN0dt50+011T0kItGZ3pBZjh
 ZEEFK2UFDxOAo0PqSAHs11miZgYxw+ex0o3G6sXu+KHcBwQT4l0SYJ0e5
 7C400NwJj1XSYk7xTLucO4OwakVmXaDF9oU5zzh0thFxpAXXFBHHYk3tT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3188620"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="3188620"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 12:02:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="439125"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 02 Feb 2024 12:02:59 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 2/6] Revert "drm/xe/guc: define PVC FW"
Date: Fri,  2 Feb 2024 12:00:13 -0800
Message-ID: <20240202200017.2133438-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202200017.2133438-1-John.C.Harrison@Intel.com>
References: <20240202200017.2133438-1-John.C.Harrison@Intel.com>
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

This reverts commit 6fed16fd875e413bcb9be8c90ea86260216361eb.

Reverting patch from topic/xe-for-CI branch which should be replaced
by the updated version later in this series.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 92940199ba4a..9dff96dfe455 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -103,7 +103,6 @@ struct fw_blobs_by_type {
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7))		\
-	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 9, 1))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5))		\
-- 
2.43.0

