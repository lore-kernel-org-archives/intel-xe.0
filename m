Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFC5C6FA99
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 22:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E6C10EA1E;
	Fri, 10 Mar 2023 22:16:30 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59F610EA1C
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 22:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678486587; x=1710022587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D+GwSEPj9AKSWt2hxU885fxjU0qX6YNLs6SMYBPskC4=;
 b=WuSWy2pXumsQCA+wSmVXoHBUca5OPjiwtaF54/8YBYbd8IpcdGlIQl0v
 /Kathz/H92yp0K6X6ydo0Qix6k+XtJih6xqWJoyjgoelvZMEJTRnSiWoS
 XrxL2uAKJe9RKYzFiMLbs8DiUWhi2G319qjPdOBcKDk9wsqnhM18oZ0dD
 5FGb2L+FUlkg7ubCVRXL0WaDTbLMpJsnX59Othhbx0Hjn1R+9pUl5BnJi
 L6QtIZYi6goX/uKnbZi3TwGNNILXLeHxH1yP5ZgtMQjEttst1ZzCaFmkG
 egVz3IGvEOfP+eTfnBnjP2camgkY2r5byElr/Hl7UqqtyPid8+xdfoHeK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423106169"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="423106169"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="821234954"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="821234954"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Mar 2023 14:15:39 -0800
Message-Id: <20230310221549.2337402-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230310221549.2337402-1-lucas.demarchi@intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 02/12] drm/xe/reg_sr: Tweak verbosity for
 register printing
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
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If there is no register to save-restore or whitelist, just return. This
drops some noise from the log, particurlarly for platforms with several
engines like PVC:

	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs0 save-restore MMIOs
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs0 registers
	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs1 save-restore MMIOs
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs1 registers
	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs2 save-restore MMIOs
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs2 registers
	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs5 save-restore MMIOs
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs5 registers
	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs6 save-restore MMIOs
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs6 registers
	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs7 save-restore MMIOs
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs7 registers
	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs8 save-restore MMIOs
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs8 registers
	[drm:xe_reg_sr_apply_mmio [xe]] Applying ccs0 save-restore MMIOs
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0x20e4] = 0x00008000
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xb01c] = 0x00000001
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe48c] = 0x00000800
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe7c8] = 0x40000000
	...

On a PVC system it should show something like below. Whitelist calls
are still there since they aren't actually empty - driver just doesn't
print each individual entry. This will be fixed in future.

	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs0 registers
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs1 registers
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs2 registers
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs5 registers
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs6 registers
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs7 registers
	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs8 registers
	[drm:xe_reg_sr_apply_mmio [xe]] Applying ccs0 save-restore MMIOs
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0x20e4] = 0x00008000
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xb01c] = 0x00000001
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe48c] = 0x00000800
	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe7c8] = 0x40000000

v2: Only tweak log verbosity, leave the whitelist printout for later
    since decoding the whitelist is more complex.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 194a5060f1b3..c6f92fe9aad1 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -168,6 +168,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	unsigned long reg;
 	int err;
 
+	if (xa_empty(&sr->xa))
+		return;
+
 	drm_dbg(&xe->drm, "Applying %s save-restore MMIOs\n", sr->name);
 
 	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
@@ -195,6 +198,9 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
 	unsigned int slot = 0;
 	int err;
 
+	if (xa_empty(&sr->xa))
+		return;
+
 	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
 
 	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
-- 
2.39.0

