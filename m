Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD74C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 13:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC34C10E6DF;
	Thu, 13 Jul 2023 13:23:20 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C735210E6D9
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 13:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689254596; x=1720790596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cR5o3UwzYUMBLriMtCg6wAQ2yzy1drHHiNWsmCW4PjA=;
 b=TF+scsRr7ZJQKTDzGnzuHDPMV7MBgL93wAqQhN9U7GW7rqUvTX3FurI0
 +mQRmVBRpiTHL9LAs+cxN3FwkM5DI2zpSeDZEQsTXuPYabhYMx8tG2ysv
 VS87YDXACxTnYrgFc7H2sarr22JWfSIi4GDEvmXKBIQc1s5vEpujr1Y6Y
 OuhNL92Ok8dIK3op/C7/Ym85khWIejLPZuwQr7aMffJbxyzmoESshxtCB
 2mTheN57vdcYEOsNnegtbzenUgy+N5wpApfLxoKhyQtLxoYrhYCQkT9Ex
 XtRhDxdAcZZ/IU4ovqOkublaTHnJ6Y7CkA5DQhIHSxDvh0FL1sxgBehru g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="345497932"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="345497932"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 06:23:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787455308"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="787455308"
Received: from rossdevx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.133])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 06:23:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 14:22:49 +0100
Message-ID: <20230713132244.459605-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713132244.459605-12-matthew.auld@intel.com>
References: <20230713132244.459605-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v13 04/10] drm/xe/guc_pc: add missing mem_access
 for freq_rpe_show
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The mem_access is meant to cover any kind of device level memory access,
mmio included.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 3093cfeff0c2..a5aae624d11e 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -422,8 +422,12 @@ static ssize_t freq_rpe_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
+	struct xe_gt *gt = pc_to_gt(pc);
+	struct xe_device *xe = gt_to_xe(gt);
 
+	xe_device_mem_access_get(xe);
 	pc_update_rp_values(pc);
+	xe_device_mem_access_put(xe);
 	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
 }
 static DEVICE_ATTR_RO(freq_rpe);
-- 
2.41.0

