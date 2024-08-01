Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AC1C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 22:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AE810E0CD;
	Thu,  1 Aug 2024 22:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZIXRhwml";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB7F10E0CD
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 22:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722550180; x=1754086180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p3362MXcHTH4cWvjtNqwrXBhCuhQBdm9PY1jRk474qk=;
 b=ZIXRhwmlTx4+Cv6TUOtxy5EPDuVeP/RRqZ9/Nl59wKLDo7iJHxz5mOD6
 H1F5bs22TlwjjEsbZ2XvS8ivadOKrbJxd+HNVE88rOHDtmIF24UrxMOPc
 eUuf8rRkTiWVbYk0eBnAu2jufWLC1RRqlnIGkwYrDv9ZJRGzd2tfWUBha
 OrzAjaaPzXddmlxG8LBMJHPEqutqWIzSvFGcYaJycp5LuoaV/0Xv3LIV5
 TfER1ykCAleBtmWViWW81DjVaLwbNHmMyAbxKh8LNC+2iVllQH/i7T51h
 wHhMWz8ZlaKEg6JuUnlHkvtb1GFosCJK4ErgcUWX8WkPQ6/QzWnpWx5oV Q==;
X-CSE-ConnectionGUID: 2LICJVLuRRK38YzAdoRfjQ==
X-CSE-MsgGUID: JzK1nyp0SOmIPTCOBJcScQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31943321"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="31943321"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:09:40 -0700
X-CSE-ConnectionGUID: L8T+8lZlRoy6eB82RIhVcg==
X-CSE-MsgGUID: eyf6jHukSP2I2JlxSSrz2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="54860475"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:09:41 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 1/4] Revert "drm/xe/guc: Pre-release GuC firmware v70.24.0
 for LNL/BMG/PVC"
Date: Thu,  1 Aug 2024 15:09:31 -0700
Message-ID: <20240801220934.3048796-2-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801220934.3048796-1-julia.filipchuk@intel.com>
References: <20240801220934.3048796-1-julia.filipchuk@intel.com>
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

This reverts commit dbd3e63b48f43788cb31eac045a848508a5c14df.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6b92255a769d..5b70d23724c4 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -105,10 +105,8 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 24, 0))	\
-	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 24, 0))	\
+	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
-	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
-- 
2.45.2

