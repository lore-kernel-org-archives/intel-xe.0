Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BBCCCD195
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 18:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A0110E150;
	Wed, 15 Oct 2025 18:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgIRfr6C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DCD10E150
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 18:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760553726; x=1792089726;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OKvmSKdblaLF4sMV/U3dpboQCMilo0jm0FP5YpUx/xc=;
 b=NgIRfr6CTu7MocowJnf16N9ClRXFMhXQB8EnBtT3gZolLPkClezDj6kS
 Hjbx9grWEMercFKIu0gbf+qStBYZjyShzg2SjpzuIR1hFK5d035adOruP
 WzvHB8etx+uhQvCe7Kn1T9V64vL43cXFeHsSsTf51x9TtEtUVCNeyZRh/
 +1WFHBgiD98iY1glcF17AGLbGqu7cKblI/4vhnu4F1rGAiMI3JRpp4UgT
 VJieH0s5uOidsW/QbWhXkQhNE4qfqSMCVoeNNTR/Ivm2WkUX5jS6s8v/G
 sW8t+fUSaaKoA8ccKlNObnvVNh9gbW8xCu5FenxpcMd88SENcO3L5r4kl Q==;
X-CSE-ConnectionGUID: z6Kwtc7TTLaiPPR79Ug8Ng==
X-CSE-MsgGUID: XeqJRZQEQ9Kd3hP/h6v8ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73015577"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="73015577"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:42:06 -0700
X-CSE-ConnectionGUID: rQ4sSpqLTtGjlEePSgzYrA==
X-CSE-MsgGUID: IHnKxLB3Q02DDThpgaMrvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186504923"
Received: from unknown (HELO linux-Raptor-Lake-Client-Platform.iind.intel.com)
 ([10.227.90.135])
 by orviesa004.jf.intel.com with ESMTP; 15 Oct 2025 11:42:04 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, karthik.poosa@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH] drm/xe/xe_debugfs: Expose G7 package state residency counter
 through debugfs
Date: Thu, 16 Oct 2025 05:42:19 +0530
Message-ID: <20251016001219.37684-1-mohammed.thasleem@intel.com>
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

Add G7 package state residency counter in debugfs alongside existing
G2,G6,G8,G10 states for complete power state visibility.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h | 1 +
 drivers/gpu/drm/xe/xe_debugfs.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index 264e9baf949c..0f79c0714454 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -24,6 +24,7 @@
 #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
 #define BMG_G2_RESIDENCY_OFFSET		(0x530)
 #define BMG_G6_RESIDENCY_OFFSET		(0x538)
+#define BMG_G7_RESIDENCY_OFFSET		(0x4B0)
 #define BMG_G8_RESIDENCY_OFFSET		(0x540)
 #define BMG_G10_RESIDENCY_OFFSET		(0x548)
 
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d67e32ebbe29..417e6df95e1c 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -142,6 +142,7 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 	} residencies[] = {
 		{BMG_G2_RESIDENCY_OFFSET, "Package G2"},
 		{BMG_G6_RESIDENCY_OFFSET, "Package G6"},
+		{BMG_G7_RESIDENCY_OFFSET, "Package G7"},
 		{BMG_G8_RESIDENCY_OFFSET, "Package G8"},
 		{BMG_G10_RESIDENCY_OFFSET, "Package G10"},
 		{BMG_MODS_RESIDENCY_OFFSET, "Package ModS"}
-- 
2.43.0

