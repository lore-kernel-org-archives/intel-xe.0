Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D185DEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 10:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CE410E1E1;
	Mon, 26 Jun 2023 10:51:11 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D561C10E1E1
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 10:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687776669; x=1719312669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ALgxK04PnbD/M1vETMO2gXHtvEHcOAkgagC76gwmQi4=;
 b=bMngCUPv9gZWyXwyP8nOhznvMjeipEuQijLFI522UBP+MFnPnQOqg6ek
 MTp9QwgDxyYQrMGVwxUG9TavU9DfLhN0TVvGkK87iLrbfJBrBW5nx+fCh
 fDYWr5UIViw9VPLiIl0qnwas7hUHbLNridvUrLZMR+WD+nCwKj1J99bTK
 zHf8SeP1uLNkghOBAoD9248A3tBTe36v/NqdSflu3nF4T3nLumj+Orsgi
 lMsT2177dPj4rWg9kHcwk4UVH3Cn9ASpC2DeXUYuvETdVnea/JZ6a2T+G
 zcHh01S2r5nJhFIIcgTBr9Mzdgbdkt1TwmrIAAmKxrF5OQ3RsYkhkZkY7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="361279983"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="361279983"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="829182789"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="829182789"
Received: from cbrady5x-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.226])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:08 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 11:50:42 +0100
Message-ID: <20230626105037.43780-19-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626105037.43780-15-matthew.auld@intel.com>
References: <20230626105037.43780-15-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v12 04/13] drm/xe/guc_pc: add missing mem_access
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
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 5d5cf4b0d508..e3722a805837 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -430,8 +430,12 @@ static ssize_t freq_rpe_show(struct device *dev,
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

