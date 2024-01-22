Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47576C46CD2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DA710EFC3;
	Mon, 22 Jan 2024 21:34:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE84710E64D
 for <Intel-Xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705959288; x=1737495288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1SLBwVauyyKhPJJSBkm1ghv9VLN/wyYNtOu1ngtj/bw=;
 b=h1aDo3mkRLB43plydcTZVOrZAgbFTuDcmiK3oDJrHZKCiWGOdbsJHSi3
 d1egaXMaDM7OM479aQPED9a0ggX/Ef32Y+WYmjpETc3hkDiJj1eYv2i65
 UCHnb/rVjFtB1w8eY+2JAoH2vln52xRybiPkr8mHGHHVDj7LvtgOEewab
 0JK3PT56urU4GHMn7bLY/OX+pziSzQGV5m51ykv3HmBB7auhFJxJ7mDFZ
 Ud/tQuKNgKYL2BssCxUpS5KU9it2KjqYlyNlI/knIWn8wYptwLgpukIEM
 h3MC/OgjIFPC1by1+QIzJ0qb5cTdv/GboGKObd9Ul1ZhPnZwoTNdxzv46 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432489923"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="432489923"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:34:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="909073625"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="909073625"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 22 Jan 2024 13:34:47 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Subject: [PATCH 2/2] drm/xe/guc: Update to GuC firmware 70.19.1
Date: Mon, 22 Jan 2024 13:37:08 -0800
Message-ID: <20240122213708.1841488-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122213708.1841488-1-John.C.Harrison@Intel.com>
References: <20240122213708.1841488-1-John.C.Harrison@Intel.com>
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

UAPI compatibility version: 1.8.1

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index d3f0fe2101a7..8da6cbb8c9e2 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -103,14 +103,14 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7, 0))	\
-	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5, 0))	\
-	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5, 0))	\
-	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
-	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5, 0))	\
-	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
-	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
-	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5, 0))
+	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 1))	\
+	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 1))	\
+	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 1))	\
+	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 1))	\
+	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 19, 1))	\
+	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 19, 1))	\
+	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 1))	\
+	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 1))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
 	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
-- 
2.43.0

