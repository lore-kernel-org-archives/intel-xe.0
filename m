Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9262C78853
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 14:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91FF10E85C;
	Fri, 20 Sep 2024 14:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nx3aT5+9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A1910E83E
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 14:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726841388; x=1758377388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KlSwJvFUJHo1rJgTvtSjUEbCD9ExqpYa2qZIhKGveTk=;
 b=nx3aT5+9tSKYxNk/7nec2ur/b5iFqtB/N4S/rPBo8lDod374sQhMpOLh
 MAbJPzddluQn4unsboiOfpzBfihxgIo9/706Ujea5osFeNy6PbdoY6GBi
 r99/JSklnwzpleFT5acIGolpSpe6Psm5gMr0L/WWA7/8So3WYqNufjc1g
 lDiAWjU5GOdPRDCinzVs+XCCJ4CphOTR0J41yDOT/PJsQ3gxyav4djBSK
 rJ/JKA8AYmfnuoMAXZ5tX0vtmyKnNkgsmnIAf9PczWAx7B+snC/78uEpK
 dYTH3vorrfnc1y/dTm/Mu/VO/hz8/hPfAJBGQJjNSbBPfwp3FFmbWqwDd A==;
X-CSE-ConnectionGUID: tV9MYQrwSnmKJ0JerFn1CQ==
X-CSE-MsgGUID: 38r/QK7+TJqJ6Bv6d+wstg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="43368371"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="43368371"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 07:09:39 -0700
X-CSE-ConnectionGUID: euePYMaBSzeY3wfbX8RQNQ==
X-CSE-MsgGUID: DZkwDuLDQdK1vsemy4xt0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70182689"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 07:09:38 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com,
	john.c.harrison@intel.com
Subject: [CI 12/12] [For CI] Debug prints/logs to debug G2H timeout issue
Date: Fri, 20 Sep 2024 19:59:22 +0530
Message-Id: <20240920142922.618649-13-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920142922.618649-1-badal.nilawar@intel.com>
References: <20240920142922.618649-1-badal.nilawar@intel.com>
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

From: bnilawar <badal.nilawar@intel.com>

Debug print and GuC log in dmesg to debug possible G2H irq delay / miss

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c    | 4 +++-
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 41ff4fe65f8b..00c0550fb80f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1094,8 +1094,10 @@ int xe_guc_self_cfg64(struct xe_guc *guc, u16 key, u64 val)
 
 void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir)
 {
-	if (iir & GUC_INTR_GUC2HOST)
+	if (iir & GUC_INTR_GUC2HOST) {
+		xe_gt_dbg(guc_to_gt(guc), "G2H IRQ GT[%d]\n", guc_to_gt(guc)->info.id);
 		xe_guc_ct_irq_handler(&guc->ct);
+	}
 }
 
 void xe_guc_sanitize(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5546d4f87ebb..8f2d046bf1b5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1026,6 +1026,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x",
 			  g2h_fence.seqno, action[0]);
 		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
+		xe_guc_log_print_dmesg(&ct_to_guc(ct)->log);
 		return -ETIME;
 	}
 
@@ -1141,6 +1142,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		xe_gt_warn(gt, "G2H fence (%u) not found!\n", fence);
 		CT_DEAD(ct, NULL, PARSE_G2H_UNKNOWN);
 		g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
+		xe_guc_log_print_dmesg(&ct_to_guc(ct)->log);
 		return -EPROTO;
 	}
 
-- 
2.34.1

