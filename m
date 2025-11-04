Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000A0CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 18:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B682410E0ED;
	Tue,  4 Nov 2025 18:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQk/dS71";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAA310E0ED
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 18:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762281037; x=1793817037;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XhUf9TETO8VhAGRN3sk76cgJMkskQcMgWAoId71BXHs=;
 b=bQk/dS71wT5odoksgAw+aY2CWnwky90Jos30WINjMVVrhadVnJ5eeOin
 mfpvYvBa2d7dCuEiq4E8g+1l9JnxT/mXgzgl672znmKZtzJPSbAZLz/0+
 z1Fi+mM0AnlFRW6ZnDsju8ukKA9dpO5QtkFjbdy1GRzUzgaYxZg9Q4iys
 fRBOmuI7SHnmqM9xGy7MrppP6Nt6rxphj07Q9R/i5Wv93R0dEKUncTMOE
 IEaT73Vrni6OL0sIHK7Zi9zfjr6amqg+fPFlZ8f5OM+cgLd8KKn6mwbs9
 4UKw/BTW9D+EcQBeQ01xRzRon8EI7DQ4eRttKG5CV2iTfMPhrGf80CCjI g==;
X-CSE-ConnectionGUID: bgn0KuXIS92DvSZr+DPYzA==
X-CSE-MsgGUID: Cf7KSr2nRqaAF4kDboIlXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74678708"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="74678708"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:30:37 -0800
X-CSE-ConnectionGUID: ZYVPxLALRoCHHbm3XyOquw==
X-CSE-MsgGUID: kUeq2i3UQ++CsWeyAvp6VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="224480525"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:30:37 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [CI] drm/xe/guc: Test GuC v70.53.0 for BMG, LNL, PTL
Date: Tue,  4 Nov 2025 10:29:30 -0800
Message-ID: <20251104183029.1101572-1-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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

UAPI compatibility version 1.26.0

This patch is for testing only. If testing is successful the binary
blobs will replace the major versioned *_guc_70.bin files for given
platforms.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
Resubmit due to missing BAT results for series/156953.

 drivers/gpu/drm/xe/xe_uc_fw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b4cd6226ad31..a0deda4e8c84 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,11 +115,11 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 49, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 49, 4))	\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 49, 4))	\
-	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 49, 4))	\
-	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 53, 0))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	bmg,	70, 53, 0))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	lnl,	70, 53, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
 	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 45, 2))	\
-- 
2.51.0

