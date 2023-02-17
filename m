Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1190DC64EC4
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 00:53:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C54C10E3C2;
	Fri, 17 Feb 2023 00:53:10 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC20510E1AA
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 00:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676595185; x=1708131185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aSLKs98oOdQDGy4XYlpPyLq5hsmVl0BtbbmleERy97E=;
 b=KboI8C2wY7iQOO9SgRKirpuUOjCsK3KAxE/7tzt3GLHmVUPHge9jwi7K
 yB3Q4lzp/TyiT0SVIrvULb//HnMRD1mT82s47zCBuB4KKefTpEVla4B2F
 CckFleNskswRQejLw1KKZAMQ8X7p3pqG8FeP+5/9V62PyQjc6nKPGhCZg
 j+Q+dD7Bw6JLpAy6RikHJVpEM5EM6wGOBU+ZEXYLgdE+HomAWhqlqut3C
 QjOze6v8TpV6Lm3XYovYeGgaBmqycHB9Un67jXOEKXUzJPLt55ZjBJUjl
 wS9HxazHLS8Ppbx//nMIaANKbZZqcf1IiRSNqzV2vWVdslEvODQGbpjx+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="329602209"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="329602209"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 16:53:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="672417797"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="672417797"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 16:53:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Feb 2023 16:52:24 -0800
Message-Id: <20230217005226.106499-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217005226.106499-1-lucas.demarchi@intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 09/11] drm/xe/guc_pc: Move gt register to the
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Move a few defines from xe_guc_pc.c to the right register, now that
there is one: xe_gt_regs.h.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
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
index 0df82defa7e4..3465236b0b49 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -30,12 +30,6 @@
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

