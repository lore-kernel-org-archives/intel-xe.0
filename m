Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAE7FB5166
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 21:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0239410E2DA;
	Mon,  6 Apr 2026 21:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jzt4Sw4Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDA410E2DA
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 21:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775510322; x=1807046322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kY0RnQN+8PbY/D7J2YXfPjOvp6dQWiYAZJW15vfwZLA=;
 b=Jzt4Sw4Yh5UwVp/A6+pCiayQgNJUs1fm/A2CDrOstAPezE3HcPX/4u6Q
 q1QJA/JMUFx6JNOhrevAlKY12Z3S4f9Lna+X3wN7Iie7cLVEpWUDmUwD3
 JnhaXrZbe1GlurFAFn5AYZs5NWxVbS4uWfvlhEq0OcBEVVdmcKHkdmp4K
 pyO3m2iO/lE2pq4AKMJCc3DFyKOSzend2Z2CtPhW3O0Lpl/t8l5/6OESQ
 UEdKYbWcmi4pqryk9KyGic3r8PQnkRN00CH9CClDnWpJoQ0Sx3Ozpj+ge
 qhZr+6eKiXW83Fs4i4C6t8zj2kPS8P5HeMJfpoH9WB2gBBD+oKPjlPa47 A==;
X-CSE-ConnectionGUID: R7gcik+dSEORmcNLSDRDRA==
X-CSE-MsgGUID: Apt87OxiTR2na6gOgTR0bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76653367"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76653367"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 14:18:42 -0700
X-CSE-ConnectionGUID: SIpBMNUKTVKo4wnWHnLepA==
X-CSE-MsgGUID: UAGMpwmpQ62vZbzo9jMt6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="227888229"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 14:18:42 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 7/7] Reapply "drm/xe/nvlp: Define GuC firmware for NVL-P"
Date: Mon,  6 Apr 2026 14:17:31 -0700
Message-ID: <20260406211759.817577-16-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406211759.817577-9-julia.filipchuk@intel.com>
References: <20260406211759.817577-9-julia.filipchuk@intel.com>
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

This reverts commit ce673fc8386895a32d4f9584d1a38252ea7d1aef.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 2b27b0678417..1693895a9871 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,8 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 60, 0))	\
+	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 60, 0))	\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 60, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 60, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 60, 0))	\
-- 
2.51.0

