Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9589CF9C5E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 17:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77ED910E85E;
	Fri, 20 Sep 2024 17:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMS6r0Qy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC8F10E85E
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 17:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726852368; x=1758388368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OARTefxy8YJr+2PdLcexxAIzG8g+gmcPLAgY94BTEcI=;
 b=CMS6r0QyFpoaIan21kVAAomKT/KCe9SfPsPHiTTXqeGNzmKKKrqWMQeF
 BPfjbAR2+UH1inBf9HMOo3irfQhXlbwInZy4LA36cnwlsetFdysT3cv9k
 a0cijLolO+H1od+vGJLPRy4P89G3eo3TmiZczNcp6wa3N/sl3bkKybomy
 UcxF1SSV1cPCmh7S0d5iSNcu+UkAP+eBZeZlZcSj30d3byjlGe4duwUyf
 3Sd5sHACLga1xBB71MEAVByhOBdHqvpk7ShF0btesSbFkM34D/khwlwDc
 O9kWE835keqCiULs+RXgKuQI2NejodLz8EeOV4yp854+CDkVudNx7qsvX Q==;
X-CSE-ConnectionGUID: I1ytcWWDQZSpTas7G1AruQ==
X-CSE-MsgGUID: yPfbQGTcQaeW3RnKJVMyqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="29763884"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="29763884"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 10:12:48 -0700
X-CSE-ConnectionGUID: Od4/hV8PS+u7UNJGyVbTeg==
X-CSE-MsgGUID: W9lWhOEoSQOHlRIx9nx3IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="101220791"
Received: from iweiny-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.110.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 10:12:46 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 4/4] drm/xe/xe2: Add performance tuning for L3 cache
 flushing
Date: Fri, 20 Sep 2024 14:12:11 -0300
Message-ID: <20240920171223.64969-5-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240920171223.64969-1-gustavo.sousa@intel.com>
References: <20240920171223.64969-1-gustavo.sousa@intel.com>
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

A recommended performance tuning for LNL related to L3 cache flushing
was recently introduced in Bspec. Implement it.

v2:
  - Fix reference to Bspec. (Sai Teja, Tejas)
  - Use correct register name for "Tuning: L3 RW flush all Cache". (Sai
    Teja)
  - Use SCRATCH3_LBCF (with the underscore) for better readability.

Bspec: 72161
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
 drivers/gpu/drm/xe/xe_tuning.c       | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 07315eb72eff..8d8f6a113a86 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -388,6 +388,9 @@
 #define L3SQCREG3				XE_REG_MCR(0xb108)
 #define   COMPPWOVERFETCHEN			REG_BIT(28)
 
+#define SCRATCH3_LBCF				XE_REG_MCR(0xb154)
+#define   RWFLUSHALLEN				REG_BIT(17)
+
 #define XEHP_L3SQCREG5				XE_REG_MCR(0xb158)
 #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
 
@@ -405,6 +408,8 @@
 
 #define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
 
+#define XE2LPM_SCRATCH3_LBCF			XE_REG_MCR(0xb654)
+
 #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
 
 #define XE2_TDF_CTRL				XE_REG(0xb418)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 230369f108ab..39f50b6f94ce 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -75,6 +75,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
 				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
 	},
+	{ XE_RTP_NAME("Tuning: L3 RW flush all Cache"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(SCRATCH3_LBCF, RWFLUSHALLEN))
+	},
+	{ XE_RTP_NAME("Tuning: L3 RW flush all cache - media"),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3_LBCF, RWFLUSHALLEN))
+	},
 
 	{}
 };
-- 
2.46.1

