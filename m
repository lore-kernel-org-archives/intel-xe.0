Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D1CD6E2B8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 16:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9595710EA91;
	Thu, 18 Dec 2025 16:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aidcc12s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2499110EA91
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 16:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766077086; x=1797613086;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P8t9IFwn0SJ/6oPqhxb53cNE2wpP696CR2EqOLJq/xI=;
 b=Aidcc12sQQyZ3rJW9Xl25+ECz/xagTtxZUzxLIsFgwrDrJ/Ohcipq+y3
 uX6ZNJ6r1Ck5zPE8Jd1eTmhojm8o4UENHKFf0RUOIhMfIXHrxrgL+zUle
 WFQFJYsghOXvTuIOYQcDYUNQsOIl9Okt3m0Krvte6T/eRGZgLjfqV7MU0
 f+uFM3O75X46VVokADFAhY+/2D0LlFrx/Aaq31LvzZ1xpZvBq6OUBPBRB
 IeE1dA7n2oJd7ND6zIeWy/otcLQUMlQW9mZdWz4DNhn8gHeUf0dA6vS3L
 T/Z/fRrGnRbXsp9L0tP60duV/Dr/yzSOhiNAKkA7Qw3eu9eK3TpOSFSsH w==;
X-CSE-ConnectionGUID: Ok3s7a/OS36Lgm3c9FzudA==
X-CSE-MsgGUID: W05YNE2YQ0uZ3oAEC8cOtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68190154"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="68190154"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 08:58:05 -0800
X-CSE-ConnectionGUID: N4bVgAJLREOfoX2Hv/x+aw==
X-CSE-MsgGUID: 8gLJzVywStyUo2M5gAdPAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="197771045"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 08:58:05 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm/xe/xe_guc_ct: Drop smp_mb in parse_g2h_response
Date: Thu, 18 Dec 2025 16:58:04 +0000
Message-ID: <20251218165803.9042-2-jonathan.cavitt@intel.com>
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

smp_mb before wake_up_all in parse_g2h_response is superfluous.
Drop it.

Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c3df9b3f1b4d..d101b37106da 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1499,7 +1499,6 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
 
 	g2h_fence->done = true;
-	smp_mb();
 
 	wake_up_all(&ct->g2h_fence_wq);
 
-- 
2.43.0

