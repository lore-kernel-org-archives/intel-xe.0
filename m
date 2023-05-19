Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9E4C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 16:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD7410E545;
	Fri, 19 May 2023 16:59:43 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039A710E545
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 16:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684515580; x=1716051580;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bu/xQ8/nRSxbKRwVxh/ajo7WKoPL7xLaBCReKPuUy0Q=;
 b=lMUWalkmeq51lt74MYCvjpxjDb9y+WXB32Slk1N/imcje32vNkbucP2h
 ve7YHmZkSIID1WYMubarkDZFyTlpMZR7sqCIoD2Xi16QfflSBjQA6dK3+
 z+762eCO4AilJAUJmIRFa6yy2Kn7kqYWF4x7mbepD0JMYvlPkSW+/U5Hd
 S2uFF3WaYXYtbdos5c2Jl7EdKmSJwdKzadvngFtu3nja0++Gskes7jKfA
 iw3PfiKzLE4IlsaGlHESNWKHLXoHaVAJX3eaiE5z7d4SxqWXU7Kr6UKyM
 3nNydWHyoqgfRx6TjdnNz/bvD2njIf065QjtOuDt2sijTrxLT9zDbezib g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="332030791"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="332030791"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 09:59:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="876906506"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="876906506"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.198])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 09:59:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 18:59:26 +0200
Message-Id: <20230519165927.1204-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Reorder GuC interrupt register
 definition
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We aim to have all definitions sorted by register address.

Bspec: 49813
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index b4f27cadb68f..f08966c2be20 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -89,7 +89,6 @@
 
 #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
 #define   GUC_SEND_TRIGGER			REG_BIT(0)
-#define GUC_HOST_INTERRUPT			XE_REG(0x1901f0)
 
 #define GUC_NUM_DOORBELLS			256
 
@@ -116,6 +115,8 @@ struct guc_doorbell_info {
 #define GUC_WD_VECS_IER				XE_REG(0xC558)
 #define GUC_PM_P24C_IER				XE_REG(0xC55C)
 
+#define GUC_HOST_INTERRUPT			XE_REG(0x1901f0)
+
 #define VF_SW_FLAG(n)				XE_REG(0x190240 + (n) * 4)
 #define VF_SW_FLAG_COUNT			4
 
-- 
2.25.1

