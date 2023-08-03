Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A98CC001DB
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 23:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E119B10E11F;
	Thu,  3 Aug 2023 23:42:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3240610E22B
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Aug 2023 23:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691106145; x=1722642145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mp646dDIYDIy1ZAdpy2LQbhWo+KXI4ynTGZf0SZoDlo=;
 b=SFtasUFu66jGnW/x2OuNsabfCF/OYGjQAV2YjkMVqEM0HOoL2+siLxab
 4TPzQ25DrMzMl8Vbj86kDNK9GeNypPkrezc7esx1lG/U/kBw7G0JXSnnL
 rm7hvHgnKZuh/CoRVHkzB0DidM7fvwV1B0rHNFTFUXHBQgByl+s/kSJxy
 ZK4a2tRN1+hU8UOqtsubckEy2MDTBIa4Eqfy5XGaUjtoQFUjlIdtcJKs3
 w6jYiBBD54E+DyxZHT3JFLDjpEHfpUCF0gEqdFZH5sIUmjfjROvNYoikZ
 cKSAndTRLof66SeBfkOd/yoEO4PtIIyleP85SFV9ekpriOiQuNcEmb9I+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="436344584"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="436344584"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 16:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="853488582"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="853488582"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 16:42:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  3 Aug 2023 16:42:09 -0700
Message-Id: <20230803234209.881924-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230803234209.881924-1-lucas.demarchi@intel.com>
References: <20230803234209.881924-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Fix error path in xe_guc_pc_start()
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If the forcewake failed, put xe_device_mem_access.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 19d743f92f43..c03bb58e7049 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -825,7 +825,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
-		return ret;
+		goto out_fail_force_wake;
 
 	ret = pc_action_reset(pc);
 	if (ret)
@@ -851,6 +851,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 
 out:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+out_fail_force_wake:
 	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret;
 }
-- 
2.40.1

