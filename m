Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABAACA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 23:53:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D03C10E3C5;
	Fri, 29 Aug 2025 23:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7bhGgRP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC2610E21F
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 23:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756511604; x=1788047604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M1rtZ97cCcMsS6vD/5U2+8rX3CB29LmIyWoEekD4axY=;
 b=P7bhGgRPENCA6CTHy3x39yuAdJqw8AW6J0FqsBM24ZwcbTxxz2UndPAo
 9skJmiU9MD3AX9zyIJEpF1pR6+bZeUvfP+ljzeLgvtYl8B4UmbAowSb+t
 R7G2ALe31hvRcd/P3VuHmqjla6RMQ2NemI23FGZfyzfBLh95XLsbaQqrf
 KAgf1+qxsTh1rQLWY5afvufMsD7bKFIKECWZkuZPGQbpH/h544z6z8csh
 qxxIFY6BZJv27zFkJAYxHJ8t34frMstnMQ1//rxlNqc0sYSmxWx2tv5Oi
 uJmgAH/lEt33HDRya/1Ugxv2oFZfKuZL8WBhk7r6CLGDHOXf1jEIKV+Bb w==;
X-CSE-ConnectionGUID: vFviLj9aQ66DneTvJup7ig==
X-CSE-MsgGUID: HyO2I86QTVCkEAMgm/+gDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58906775"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58906775"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 16:53:23 -0700
X-CSE-ConnectionGUID: RTsmYG6dT2CVvbPNZkG3Xw==
X-CSE-MsgGUID: vTmKTlxPTBmo6B874HskMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170406652"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 16:53:23 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 2/3] drm/xe/guc: Recommend GUC v70.49.4 for PTL, BMG
Date: Fri, 29 Aug 2025 16:46:56 -0700
Message-ID: <20250829235305.672287-7-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829235305.672287-5-julia.filipchuk@intel.com>
References: <20250829235305.672287-5-julia.filipchuk@intel.com>
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

UAPI compatibility version 1.24.4

Resolves various BMG, SRIOV issues and adds new PTL features.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 9bbdde604923..4faf8b0fbcfe 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,8 +115,8 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 47, 0))	\
-	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 45, 2))	\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 49, 4))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 49, 4))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 45, 2))	\
-- 
2.50.1

