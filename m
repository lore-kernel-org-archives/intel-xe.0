Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DA2C761A6
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 23:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8638110EA6E;
	Wed,  5 Apr 2023 23:34:03 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0111110EA78
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 23:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680737642; x=1712273642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JrkrfJoYv2j7ez3b5Ih+eVY+Q0edhMxeP1RKqhFxWcg=;
 b=Ay0emVD1nASsWeqYCNLPNxsxwaq0eWf3kFyC0s3ZIFEu4nRu8QYmGn2Q
 jcAfMae0WhNKJVDlGNeekW2gOPUgvF6rih8/pjJGlrmq4yXYAO2J/1Igy
 T3JfxaC5d/UFDEbVTDauoM0HEh58KWVmg/rnUIXrKedQZ4i2e99lyhU4h
 BbPZip7KUCjrKpsf+nQE/nuFpd2lYtV/O8j/uqbHrxzlcfkeK9Mht3aw+
 3P5WvVqNhogg3L6vj0iGk0E8JFZAlBYbcE3OaEGO8vdThpb2iCIpUTgEC
 D1Sq0PH+l3OqXpl9u1YSHS9yQSRKHc2qWcGNm9UdWlVOAlqcqX3YHdJpi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="326632206"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="326632206"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 16:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="756165812"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="756165812"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 16:33:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  5 Apr 2023 16:34:02 -0700
Message-Id: <20230405233403.151088-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230405233403.151088-1-matthew.brost@intel.com>
References: <20230405233403.151088-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Always write
 GEN12_RCU_MODE.GEN12_RCU_MODE_CCS_ENABLE for CCS engines
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

If CCS0 was fused we did not write this register thus CCS engine were
not enabled resulting in driver load failures.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 63a4efd5edcc..4b56c35b988d 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -253,7 +253,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 	u32 ccs_mask =
 		xe_hw_engine_mask_per_class(hwe->gt, XE_ENGINE_CLASS_COMPUTE);
 
-	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask & BIT(0))
+	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
 		xe_mmio_write32(hwe->gt, GEN12_RCU_MODE.reg,
 				_MASKED_BIT_ENABLE(GEN12_RCU_MODE_CCS_ENABLE));
 
-- 
2.34.1

