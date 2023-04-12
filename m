Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59DEC77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 18:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887FF10E920;
	Wed, 12 Apr 2023 18:48:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FD310E124
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 18:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681325322; x=1712861322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xph29d/Q6WZtGP4VerIbrC6jqLJp4xsZQ8JbaxpSteM=;
 b=gmQEnOA3SiaOFL6+9LXwuNzW8+2RMjhG4IuVOsdlPlt72dykC0BzWLC5
 VoQMUibLWuWdQqpP3L7dnEG5reTelnanMU90NZuFnnsDABN01WmLMSDx0
 e81dABN8bnVzXpCf6ol68Gw2+67IZPNs7dUpyFUFUWeqwDP8aDtbSOlA5
 2dOnfkgPCs83aMIiK5gbqyX+jhJHLVniCbrTw9TiHqIpPbqj7U9agZGFA
 VXsNUVX9IY48LkzescEasJaELfGwFldYop7Me88deKInYNbDt1tidoya9
 U3z5/cgTfJdj/h1FmXXcMgHyhroEE9b73W/kQD6XiiZWoYHIrkDtahJWa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="430276545"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="430276545"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 11:48:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="691638620"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="691638620"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 11:48:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 11:48:33 -0700
Message-Id: <20230412184835.3157780-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412184835.3157780-1-matthew.d.roper@intel.com>
References: <20230412184835.3157780-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/6] drm/xe: Fix xe_mmio_rmw32 operation
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

xe_mmio_rmw32 was failing to invert the passed in mask, resulting in a
register updated that wasn't the expected RMW operation.  Fortunately
the impact of this mistake was limited, since xe_mmio_rmw32() is only
used in two places to unmask certain GuC-related interrupts.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 388a633b438b..a3b7f9f5db67 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -40,7 +40,7 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, u32 reg, u32 mask,
 	u32 old, reg_val;
 
 	old = xe_mmio_read32(gt, reg);
-	reg_val = (old & mask) | val;
+	reg_val = (old & ~mask) | val;
 	xe_mmio_write32(gt, reg, reg_val);
 
 	return old;
-- 
2.39.2

