Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0209D1A435
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 04:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7324210E029;
	Sat, 12 Oct 2024 04:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fke/DiMB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBAD10E029
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Oct 2024 04:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728706169; x=1760242169;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zSip9qR/CXsFU9f0kS/jVhOIpKxiu5urckbj9EAHoTU=;
 b=fke/DiMBxCUwk+5LyxK/SynH2qKFkhIOUBoK+xQJXALTFKOTo+dEcJcQ
 /50b2XIHLpxqhWjfeYneXNVkT+NPnCsBXbDtNGAvpllRlukqgb74cg0Ao
 FDgVXW4iWbQtnOVbdStADjfRC/F1fVBRV7rJbhV88Ny+J2z8eAqfYmQ4/
 C90YoeoUq4HMQP8Apa5twHet/NEWaQN7+SUXSqJyOGYoWnZst6ZgObCAH
 SvsGas6fK0NRAdo1cm1gpYAMjk/NVXfL35kg9aNpHvzMCVcGCdXVcNtNw
 tUPoRffzl8pGwpDeVI4b4i0B83mL3uev4QEz0urGVSR/IdxoQI1jgK15m A==;
X-CSE-ConnectionGUID: bfNb9fMjQbqg1c1qBjfZeA==
X-CSE-MsgGUID: pGv/EpzkQS2gM3wuY2/LVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38680665"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="38680665"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 21:09:29 -0700
X-CSE-ConnectionGUID: tCDhK7+QS9O3JbZot3VIlQ==
X-CSE-MsgGUID: zzowUnQcTl+xVJiLBnTh4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="77002934"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.61])
 by orviesa010.jf.intel.com with ESMTP; 11 Oct 2024 21:09:27 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	Alex Zuo <alex.zuo@intel.com>
Subject: [PATCH] drm/xe: Log unreliable MMIO reads during forcewake
Date: Sat, 12 Oct 2024 03:34:45 +0000
Message-Id: <20241012033445.1090373-1-shuicheng.lin@intel.com>
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

In some cases, when the driver attempts to read an MMIO register,
the hardware may return 0xFFFFFFFF. The current force wake path
code treats this as a valid response, as it only checks the BIT.
However, 0xFFFFFFFF should be considered an invalid value, indicating
a potential issue. To address this, we should add a log entry to
highlight this condition.

Suggested-by: Alex Zuo <alex.zuo@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index a64c14757c84..46f36d05293a 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -114,6 +114,10 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
 	ret = xe_mmio_wait32(&gt->mmio, domain->reg_ack, domain->val, wake ? domain->val : 0,
 			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
 			     &value, true);
+	if (value == ~0)
+		xe_gt_notice(gt,
+			     "Force wake domain %d: %s. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!\n",
+			     domain->id, str_wake_sleep(wake));
 	if (ret)
 		xe_gt_notice(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
 			     domain->id, str_wake_sleep(wake), ERR_PTR(ret),
-- 
2.25.1

