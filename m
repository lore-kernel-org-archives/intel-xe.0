Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16E7C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 18:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADA610E264;
	Tue, 30 Jul 2024 18:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ux1yKJ/x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0293610E264
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jul 2024 18:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722365001; x=1753901001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZmIgmlljIB5XRnEBYXUZRaBdJcP0w8kJt+FO3KUDCG4=;
 b=Ux1yKJ/xMuzGUTpIKwn6FHtBhqSnI2Yzo8CT0RnkQDwYIq8hVgs+u/n8
 QTp5Cca8GGjK+HlMrNAY2gR0r4YMd9o4oZru3LZol0b0IW3mzS3mCY0cB
 lMXJkHKJScniaBZNGMyzFh9lNJTUqwvq1b+jyqwR0/hxKOXBw6HjHreTe
 tZ2IL3h3YcQFhOeQDRo+yLTs75hN/5ZNwgwQQHz5TV+VDBvZWrR5cI17g
 S/fU+IR9hBHLoAOhrbVfSMuHKq0LKjHP9Vup/3oBnj0jMxMZH9BXzrhey
 czfTmt6b3FxY12cM5qvwpkSwY/eRoRH7t2XaagvprU8in3mg7ieUbviYn w==;
X-CSE-ConnectionGUID: qi8w4FH/QReWIwLKiB+XwQ==
X-CSE-MsgGUID: 6QSgLL/eRz6t4slfq23eWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31357264"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="31357264"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 11:43:21 -0700
X-CSE-ConnectionGUID: /c6TC1kQQZuJ77k1rrtlvA==
X-CSE-MsgGUID: z2m/kd+tRCeORVN4waWUjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="91948372"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 11:43:20 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [CI] drm/xe/guc: Pick GuC from CI folder for LNL, BMG, PVC
Date: Tue, 30 Jul 2024 11:43:08 -0700
Message-ID: <20240730184309.2939144-1-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
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

This is to test the new GuC release before overwriting the existing one.
This patch will be merged to staging with clean CI.

PVC version is for CI only.
LNL, BMG will be staged for upstream.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6b92255a769d..f748771193b3 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -108,7 +108,7 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 24, 0))	\
 	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 24, 0))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
-	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 29, 2))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
-- 
2.45.2

