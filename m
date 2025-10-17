Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EFBCCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A4110EAE9;
	Fri, 17 Oct 2025 02:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALd7kNf5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9AA10EAE3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668037; x=1792204037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MX2LpMtXPzAGYKkLevGF0xED+/TY50zzJiyNggtGQ2Y=;
 b=ALd7kNf58Mq8r872RSRVpmbs9+2BqU313cNV5FJd+PKGpB+zSzOengbr
 hppEo6oIwenEvG0G5M4eb9hBlElspURW3UZtRrLoxTGC5Y9UAeEA1iXAn
 FaKuhqRvox//kKMSqVPXuAWO5mYZlRX8BOIVQofOfMh7BeB0ZSo3Qyv8/
 T4QFpru16agFC2mmspAJKZWMKQmb5VUnXGvoowXGzuLBZuDCHTJE7HFO6
 p0hRBpGbIrcRoSHVR+MbryK58NVstSiZO0KLZyG1+2n40d3eQMgYip1XM
 wvdgjOZ80JJuvnDdVh9nIaDC85E/cIU/ww5OJ/zFdyvyjq/q0CARU4wYq Q==;
X-CSE-ConnectionGUID: 7IB56W1+SMeBcnHG7ed99w==
X-CSE-MsgGUID: YwNocoqLR1Kjb78ji5/8bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739207"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739207"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:16 -0700
X-CSE-ConnectionGUID: fFUVEvQdTf+ctbozgK4ngQ==
X-CSE-MsgGUID: arhqqLa8TQOc8U5Xn1G4PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089168"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 04/24] drm/xe: Add GT_VER() to check version specific to gt
 type
Date: Thu, 16 Oct 2025 19:26:23 -0700
Message-ID: <20251016-xe3p-v3-4-3dd173a3097a@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
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

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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

