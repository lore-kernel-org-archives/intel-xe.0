Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F71FCCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91EC10E900;
	Wed, 15 Oct 2025 22:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2rsfIav";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9652710E16D
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760566030; x=1792102030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CLI2Ajfofv0mSMaRRwglJUA1dYh11Hi47v16xIC8cPw=;
 b=L2rsfIavC3gNGtooFOOYnVJhBEfkvFA/NIGxS3EWMmy8tqWnfA/E6Hih
 wjAwPyEJ9sB36DRx1VO537L+JISSB8nwCkIu7nwCjIaS8VggBADTnosbT
 DpAF3JDwRz02KEC0x5Wv84CZ9cBcAxeyy3kZeoScFaRMLwAFGI4w5RbaF
 pkMaJPux8z+dxzrqn+gl0Q5Xyi+z1Pi8Z9g3ePWMUiOOjbRAV14FkxuyC
 DKDtDAsPneRHbS3wU1bxUlccCjakvdEaJ4b9RYas3U0sq+S3dCN04W7oN
 V3I2QNMgI28kesf3+WGABdYxTgD4AHY2A2g+YhACINRTGV06a88dtOgDz Q==;
X-CSE-ConnectionGUID: 8RRT/pk4Ru20rkKlmnJ/pw==
X-CSE-MsgGUID: s6Y14GSjRd6kpUr64y3GBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62794048"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62794048"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
X-CSE-ConnectionGUID: 8VB+/0sWQMCA7o/1Div9cQ==
X-CSE-MsgGUID: e3QPL2ORTbuAcEaU6maucQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186298270"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 04/22] drm/xe: Add GT_VER() to check version specific to gt
 type
Date: Wed, 15 Oct 2025 15:06:19 -0700
Message-ID: <20251015-xe3p-v2-4-b9189b3056a2@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

In some situations we will need to check the version of the specific gt
being passed as argument, not if the device has a certain graphics/media
version.

This is extracted from a patch by Balasubramani Vivekanandan that
may need some rework, but this helper is still useful for other enabling
parts of Xe3p.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 5df2ffe3ff838..9d710049da455 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -22,6 +22,12 @@
 
 #define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
 
+#define GT_VER(gt) ({ \
+	typeof(gt) gt_ = (gt); \
+	struct xe_device *xe = gt_to_xe(gt_); \
+	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
+})
+
 extern struct fault_attr gt_reset_failure;
 static inline bool xe_fault_inject_gt_reset(void)
 {

-- 
2.51.0

