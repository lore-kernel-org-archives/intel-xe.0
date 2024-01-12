Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B482FC4725D
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 13:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835D010E10B;
	Fri, 12 Jan 2024 13:22:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50ABB10EB0F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 13:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705065778; x=1736601778;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zKVgRDxBI5wfRLsmD/gN9r0qDZwzIpSsNmC1H3e+MfE=;
 b=Avakc/P1xW0mkh+nIAaSnG3PielKEl0h5ynmORJs/V48cdoycj6+DW8D
 bUAbgwvRG5bsLAi58QA93E//rJhv02ig7uRaljISv50eu6o1JMuQoGdF7
 0icXf+LUuUtJ8Rne+ZPe0RNztSXPtyKFuSi16iejZx7xQIKDBdqpKgvIu
 YW2/JpEyfWhBC5En+k+KJTqzCRKnfRplN4EMWsdzS7JzgTPlXvVPKY/xC
 zGN7hs7SSsnqSk9JhvOoTo8iebf6wpXaNnmbewvI93dKOmLjwwK+9Jxfa
 0x4w3ZMl1hTI9g92xi09hq1nXaz3m1yeMY7CoDqKBSJihbjVvNTL14/3z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="402938553"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="402938553"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 05:22:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="759129053"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="759129053"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.224])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 05:22:56 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Allow MMIO communication even if CTB is enabled
Date: Fri, 12 Jan 2024 14:22:48 +0100
Message-Id: <20240112132248.805-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

GuC is still able to communicate over MMIO even after we enable CTB
communication channel.  While there are only few limited cases when
we might want to use MMIO, we shouldn't block that with assert.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 235d27b17ff9..d4db0a34adbf 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -674,7 +674,6 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 
 	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
 
-	xe_assert(xe, !guc->ct.enabled);
 	xe_assert(xe, len);
 	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
 	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);

base-commit: 7a20187068bed91b523795a18219e570f1e84eb1
-- 
2.25.1

