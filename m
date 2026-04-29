Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCB9FF8867
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 09:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3097F10EF11;
	Wed, 29 Apr 2026 09:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MhdSLB22";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F276B10EF0F;
 Wed, 29 Apr 2026 09:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777454831; x=1808990831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LSNQY47Oj4lQ3FzhetY87+h91Gpk0XjyATmWYx2cwo4=;
 b=MhdSLB22bI7pGu8aZkxzAcuMBhkxwqQvYneVQyw7eb9UPXn6j1JnlP1B
 YjAmaCMlaanBJoJXfeeCmtVZeOS32aBbPtp1UNxOci5+YxWNeZQyLn0Dp
 8gy2XEiXspuRg3dDTu+lmzr3dBTXhG2vkE1i7h6UjrYAfQWLMYrhoYyrv
 eqUlbjeovAsZy5GJCGzC5DctzhSuwqYdRoyD8NQrQnfRVlU4daI3pPeEG
 0gf8AX/YCNEdSO3MmogEZnOEIVjzKBs7DlTufjzYGjMTKjszBeplqTjW9
 Xk8Wtm4vw8RQ4IKkMYep3qgPPF+jevrX8i2fftANM6afamK+6It2tZwQL g==;
X-CSE-ConnectionGUID: UPEIDWOdTaO6dVfxy6M63A==
X-CSE-MsgGUID: JkE87cD+RJ6w96ha+qZPsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95946316"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="95946316"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:27:11 -0700
X-CSE-ConnectionGUID: x4PK/IYNS9SYfRWJTQ3J1g==
X-CSE-MsgGUID: 4ZfWi71eTwmuN24pivX/Mg==
X-ExtLoop1: 1
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:27:09 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH v3 13/13] drm/i915/display: Add DC3CO count and residency in
 dmc debugfs
Date: Wed, 29 Apr 2026 14:57:07 +0530
Message-ID: <20260429092707.485696-14-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429092707.485696-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260429092707.485696-1-dibin.moolakadan.subrahmanian@intel.com>
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

Expose DC3CO count and residency for xe3lp platforms via debugfs.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c      | 8 +++++++-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 3ba68562bf99..446d59d25c5c 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -1650,7 +1650,13 @@ static int intel_dmc_debugfs_status_show(struct seq_file *m, void *unused)
 		   DMC_VERSION_MINOR(dmc->version));
 
 	if (DISPLAY_VER(display) >= 12) {
-		if (display->platform.dgfx || DISPLAY_VER(display) >= 14) {
+		if (DISPLAY_VER(display) >= 35) {
+			seq_printf(m, "DC3CO count: %d\n",
+				   intel_de_read(display, XE3P_DMC_DC3CO_COUNT));
+
+			seq_printf(m, "DC3CO residency: %d\n",
+				   intel_de_read(display, DC_STATE_DC3CO_RESIDENCY));
+		} else if (display->platform.dgfx || DISPLAY_VER(display) >= 14) {
 			dc5_reg = DG1_DMC_DEBUG_DC5_COUNT;
 		} else {
 			dc5_reg = TGL_DMC_DEBUG_DC5_COUNT;
diff --git a/drivers/gpu/drm/i915/display/intel_dmc_regs.h b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
index 38e342b45af0..1998549b6318 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
@@ -531,6 +531,8 @@ enum pipedmc_event_id {
 #define TGL_DMC_DEBUG3		_MMIO(0x101090)
 #define DG1_DMC_DEBUG3		_MMIO(0x13415c)
 
+#define XE3P_DMC_DC3CO_COUNT	_MMIO(0x8f05C)
+
 #define DMC_WAKELOCK_CFG	_MMIO(0x8F1B0)
 #define  DMC_WAKELOCK_CFG_ENABLE REG_BIT(31)
 #define DMC_WAKELOCK1_CTL	_MMIO(0x8F140)
-- 
2.43.0

