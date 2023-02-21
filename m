Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6F1C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 19:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C70010E88B;
	Tue, 21 Feb 2023 19:41:22 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E5410E831
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 19:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677008479; x=1708544479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hny0hGgdk9vdZccuToH9nMM1aonaSSCxzP1b+OkvLGk=;
 b=Uz1oFsQugtfPqTpx/lu75EKoI2QD/ZHsqhSaio9XQImbPMktEScJ4MP0
 O3ncnz0c4nE3A73EABrjAdR4j6pjoUCHGFD1NcYaH4Ok6wyM8G6NEXrVc
 KA6dfFnkvG4Oc0KnBoXYB7EM0MlbCZ4EiUgdxfREZYOjEahkny2ZeVVed
 PSpKZMN5zTtqJavWLmvgmOQkfVAchnphH7epCU6jeKUU/o9Z+gHJWORDw
 kMSUM16LBZJXE+dBzBSjcbq05gqwH71xHyEkxwGpGoMOHaBkp9kn7dh5z
 h3/m8neShF95SjGiVGwzJ2LXCj5ps0tsbik6/xbm2FNZIpNg1VuR8pvdi g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="332735705"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="332735705"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="621622214"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="621622214"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:15 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 11:39:58 -0800
Message-Id: <20230221194002.819026-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230221194002.819026-1-lucas.demarchi@intel.com>
References: <20230221194002.819026-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 09/13] drm/xe/guc_pc: Move gt register to the
 proper place
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Move a few defines from xe_guc_pc.c to the right register, now that
there is one: xe_gt_regs.h.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
 drivers/gpu/drm/xe/xe_guc_pc.c       | 6 ------
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index da40133252fb..ab8c9e51f62e 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -186,6 +186,7 @@
 #define   DFR_DISABLE				(1 << 9)
 
 #define GEN6_RPNSWREQ				_MMIO(0xa008)
+#define   REQ_RATIO_MASK			REG_GENMASK(31, 23)
 #define GEN6_RC_CONTROL				_MMIO(0xa090)
 #define GEN6_RC_STATE				_MMIO(0xa094)
 
@@ -242,6 +243,7 @@
 #define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
 
 #define GEN6_GT_CORE_STATUS			_MMIO(0x138060)
+#define   RCN_MASK				REG_GENMASK(2, 0)
 #define   GEN6_RC0				0
 #define   GEN6_RC6				3
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index acaba5c375e5..d91dad8638ef 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -31,12 +31,6 @@
 #define GEN10_FREQ_INFO_REC	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
 #define   RPE_MASK		REG_GENMASK(15, 8)
 
-/* For GEN6_RPNSWREQ.reg to be merged when the definition moves to Xe */
-#define   REQ_RATIO_MASK	REG_GENMASK(31, 23)
-
-/* For GEN6_GT_CORE_STATUS.reg to be merged when the definition moves to Xe */
-#define   RCN_MASK	REG_GENMASK(2, 0)
-
 #define GEN12_RPSTAT1		_MMIO(0x1381b4)
 #define   GEN12_CAGF_MASK	REG_GENMASK(19, 11)
 
-- 
2.39.0

