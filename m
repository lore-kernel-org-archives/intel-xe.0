Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E8FE7C4E9
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 17:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C3E10E3A2;
	Wed,  4 Oct 2023 17:34:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBFF10E3A2
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 17:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696440859; x=1727976859;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fu8PSIp0U89xWQwRmzHgqphaLtqJzxJpHykSSzEbPiU=;
 b=XTMT6K0jrmkfSf9vwJZpYpmxWnzsMzcHjQ1EG33xorBmvgvFNArjoAoI
 wERpDLH7GQOKLFa/NpQvRQjO5Pu3JRHT2kyEKMz4grGhQtRmlfRW1ZRcW
 1yb0E8Ba4DUdD9qQF/bmZoZVUjf85qJ2IyefDXngQz5ikIxcGZMjyvvxx
 CM+fHLsmwkC2KRF+kg5aj1Ut2Jp/wanLtlHyUTMBEiYfyNmEQ0OY70JAQ
 rREUNNu10FC3BZacv48PT+nHF3JS76UnkhpJ+NrbJM0CkZGWdLDLL9jy5
 htG51y23t0WoQRieYICHho7WlT+mjSgxnvZDNOB0KpCEUSvP4wA4gGKAB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="387115437"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="387115437"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="755032810"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="755032810"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:33:53 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  4 Oct 2023 10:33:41 -0700
Message-ID: <20231004173341.3256501-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/guc: Bump PVC GuC version to 70.9.1
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

The PVC GuC version that we're currently using (70.6.4) has a known
issue that leads to dropping the disabling of contexts that have
pending page faults. This is fixed in newer blobs, so we need to
update to a more recent release.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/696
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 138960138872..edaa195fa25f 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -103,7 +103,7 @@ struct fw_blobs_by_type {
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
 	fw_def(LUNARLAKE,	mmp_ver(xe,	guc,	lnl,	70, 6, 8))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7))		\
-	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 6, 4))	\
+	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 9, 1))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5))		\
-- 
2.41.0

