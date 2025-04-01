Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D036C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 20:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D015310E670;
	Tue,  1 Apr 2025 20:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdYp3nax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19AE10E670
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 20:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743541054; x=1775077054;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=euCgtyVem8NZfK/ZjWqzTr/YYjm/6ljZmRUmHLo9Qtw=;
 b=mdYp3naxoMdHxHDazzXKlbN1CpoDeIR0Ffpsuy7xm7HBeQJXmeExQPV7
 dr5JqnLaxFRDSwElUxkRTnMuIw5hvXu1BSZM1ghbqQPZTuaRc6LrXDXGP
 mQA702qLTPwLrAdlN+3M4JrRpSGg6uZ22sMkhTWiASYQZBVyGNwRWtxOH
 CngiZI1Vk/A0GFLGcuvmf4Kr51+WcRB2XA31jC4HaqBAwVhEueCC72y4o
 E7CKCsbpioPyfuDknDvcub1s4o85tmL3/kCLett4UlyddxHRgNoZwbPc4
 em0zJBOAS40oQOck/H4H/lw8RTzKjnyaFxJpdu0Iv9j/SJZazRH87Mkjq w==;
X-CSE-ConnectionGUID: f83BuxZQRNK68lEcG13mHA==
X-CSE-MsgGUID: SDM0E2i5RKWp2fTXyNwiow==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55518666"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="55518666"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 13:57:33 -0700
X-CSE-ConnectionGUID: so7y89+BR+iDGpdrcx5boA==
X-CSE-MsgGUID: 7h8P1x2ySButSIoJuI0VAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="131492292"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.96])
 by orviesa004.jf.intel.com with ESMTP; 01 Apr 2025 13:57:32 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2] drm/xe: Add the missed value paramter of LE_COS
Date: Tue,  1 Apr 2025 20:57:03 +0000
Message-Id: <20250401205703.4179906-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

value is missed for LE_COS

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index da1f198ac107..042c8401aee9 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -62,7 +62,7 @@
 #define   LE_SSE_MASK				REG_GENMASK(18, 17)
 #define   LE_SSE(value)				REG_FIELD_PREP(LE_SSE_MASK, value)
 #define   LE_COS_MASK				REG_GENMASK(16, 15)
-#define   LE_COS(value)				REG_FIELD_PREP(LE_COS_MASK)
+#define   LE_COS(value)				REG_FIELD_PREP(LE_COS_MASK, value)
 #define   LE_SCF_MASK				REG_BIT(14)
 #define   LE_SCF(value)				REG_FIELD_PREP(LE_SCF_MASK, value)
 #define   LE_PFM_MASK				REG_GENMASK(13, 11)
-- 
2.25.1

