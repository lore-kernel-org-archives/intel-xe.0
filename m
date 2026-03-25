Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F431FEA80C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 05:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5D310E1EB;
	Wed, 25 Mar 2026 05:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FqM/Y6RG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F63E10E1EB
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 05:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774418049; x=1805954049;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E30Ir4hjKIfYEH7rH3PIRG+aMEt83FN0dfKGzzavHxw=;
 b=FqM/Y6RGxO1BEvpVHVGiWfHD+hpIejGo7YRpkLfsMnOTy+8Xyzkfh7Kn
 /NOoHa2RbTzZbCJ124C7OPUl5izvBpi1Go6boTg+X7aCSt4M7VeDovQ7A
 uAJbgDVRhMjo8F9Y6lV/GpMbQZAbmsPjzhR8+M8sZ+423XjQW1w69BeRU
 AmYmSJFa+BjBru6k1jIgQwYUYUpy+wweOH/PE+QZkQF5wETmoBQkZqdS/
 Olt4zhn7DZDZr93v5Z/jqIM7Sq9CZLuSNulPLdwRoYVRf6I8xD9hUmAKb
 AkvahrpvzVyW57XAHxwuD14hpTDnBzs+qmDzIJ89eLd319aE7qa/TbimS A==;
X-CSE-ConnectionGUID: 6qkn1j5LT6iVvMXz8UTlPQ==
X-CSE-MsgGUID: MwoVkqk4TiiCD/pLnGrTTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="62999080"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="62999080"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 22:54:08 -0700
X-CSE-ConnectionGUID: DdMOSCzKSa6+NiIlEqwZEA==
X-CSE-MsgGUID: E/K/LWVoRTe/7uEm3vMVYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="224842411"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 24 Mar 2026 22:54:05 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH] drm/xe: Apply WA_14026999295 to engine
Date: Wed, 25 Mar 2026 11:21:17 +0530
Message-ID: <20260325055116.509115-2-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Apply WA_14026999295 to following IPs:
Xe3p_XPC

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 84b80e83ac46..1e3f3ce491ac 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -528,6 +528,7 @@
 
 #define ROW_CHICKEN3				XE_REG_MCR(0xe49c, XE_REG_OPTION_MASKED)
 #define   XE2_EUPEND_CHK_FLUSH_DIS		REG_BIT(14)
+#define   DIS_EU_GRF_POISON_TO_LSC		REG_BIT(13)
 #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
 
 #define TDL_TSL_CHICKEN				XE_REG_MCR(0xe4c4, XE_REG_OPTION_MASKED)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 8c55cd187a0c..13853fc67381 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -360,6 +360,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
 	},
+	{ XE_RTP_NAME("14026999295"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3511),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, DIS_EU_GRF_POISON_TO_LSC))
+	},
 	{ XE_RTP_NAME("14018471104"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
-- 
2.34.1

