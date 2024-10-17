Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAF7D2F7E5
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 04:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA9410E12D;
	Thu, 17 Oct 2024 04:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yfa8jyqB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5828610E12D
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 04:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729138577; x=1760674577;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mKT7Rep7gYEtpUGYLlt0Es4nUSVyJNFs+Tt68rwRUNs=;
 b=Yfa8jyqB8YqChM2yp1dJr7tqVFOxIBnxSv3qBeWeiJGr4llBEcI1yFec
 +2SBnO/Pb7ZAnCg6tVQikPhgzIPQiLOwHv7lmWP1CGehg16Rs9mmQW+is
 hfVgpyJSmhD0vI7izb75VvAW4/5KzyBH8NsnSj9rjZq0/zDFordiRWqka
 dmPOcB975JUur8Dgkpie1ww1gM6JVVLk9KyqMLqbQN0XYIIxEf/H7eItJ
 xe6Qccub2EQn+acw+tASN2qjx2hi9rLlOQVoxmLPcezMpvOB8XnCAM47l
 MvzqQONFAj5i8T47uM3MWqsUoKn3CzLELaYvwOsV1WPr56I4TQkC9CbR8 A==;
X-CSE-ConnectionGUID: ZjU70lFOS0+MdeJWyRDP1w==
X-CSE-MsgGUID: d0X4k4xNR3miWopv8V/05A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51155300"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51155300"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 21:16:17 -0700
X-CSE-ConnectionGUID: f5y1+qyDTPOiTPaHjpNDPQ==
X-CSE-MsgGUID: BqMR/ladTcm2LmHMMWWVFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="83077971"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.61])
 by fmviesa004.fm.intel.com with ESMTP; 16 Oct 2024 21:16:14 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Alex Zuo <alex.zuo@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe: Log unreliable MMIO reads during forcewake
Date: Thu, 17 Oct 2024 03:40:26 +0000
Message-Id: <20241017034026.1525693-1-shuicheng.lin@intel.com>
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

v2 (Matt Brost):
  - set ret value (-EIO) to kick the error to upper layers

Suggested-by: Alex Zuo <alex.zuo@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index a64c14757c84..49ceb16e82e4 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -115,10 +115,15 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
 			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
 			     &value, true);
 	if (ret)
-		xe_gt_notice(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
-			     domain->id, str_wake_sleep(wake), ERR_PTR(ret),
-			     domain->reg_ack.addr, value);
-
+		xe_gt_err(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
+			  domain->id, str_wake_sleep(wake), ERR_PTR(ret),
+			  domain->reg_ack.addr, value);
+	if (value == ~0) {
+		xe_gt_err(gt,
+			  "Force wake domain %d: %s. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!\n",
+			  domain->id, str_wake_sleep(wake));
+		ret = -EIO;
+	}
 	return ret;
 }
 
-- 
2.25.1

