Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C7FCD98CE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 20:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60BE10E63C;
	Mon, 15 Jun 2026 20:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eoMDFJQn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC67210E63C
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 20:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781555283; x=1813091283;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VVOPfdOzw+WLAwIVpGwAslJd/Kjt0L1/vUvlFu0jd6s=;
 b=eoMDFJQnn0YG6IwFvJ/xI/AtWEa3aLT1MNcDeY7trRb2LHsZKeq9F+1V
 YchQpwmVgQt5ZjC8GDJDXbsC1XaJyRek+cdruU2dIuSdZkTlYOnq1ncKI
 71Ve5cWrhd76nHOJwvlzvGD6xKEDTpRZ5uktWLYhdqEUitEVWM3FUf8rP
 HxElY1s4lwtyw1i3y+cahDZN386MTQg57PizCpLVwiViLgFXhYI8m7Q16
 k//N7A1/sJ5/AgcakiJiBlktr1KUvBAiu+DosM4pVuhuBg5SFf08BmqtD
 WH/YPIDGomBmeUMBkTTcNvIgR7u36d6qSmWlWxCX83C72Ug2H3xPBAGWw g==;
X-CSE-ConnectionGUID: jMjvZ9rGRiGgFm9NnFjt/w==
X-CSE-MsgGUID: FMFJrbOpRJu/1Ev4psXuCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="92867653"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="92867653"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:28:02 -0700
X-CSE-ConnectionGUID: TVnd4PFxQUqoAw/DratTUQ==
X-CSE-MsgGUID: jDSeL0dySUafX7AwzlfFxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="241198348"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:28:00 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 stuart.summers@intel.com, niranjana.vishwanathapura@intel.com
Subject: [PATCH] drm/xe/guc: Downgrade Memory CAT error message
Date: Tue, 16 Jun 2026 04:27:57 +0800
Message-ID: <20260615202757.607703-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
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

Memory CAT errors aren't any more serious than the other kinds of CAT
errors the xe_guc_exec_queue_memory_cat_error_handler function can
report, yet they are logged at error level while all other reports are
logged at info level.  Downgrade the report from xe_gt_err_ratelimited
to xe_gt_info, bringing it in line with the other reports.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index cfbfb8d40708e..a81ea3e3cc73e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3166,7 +3166,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 		 * GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any PF/VF
 		 * context. In such case only PF will be notified about that fault.
 		 */
-		xe_gt_err_ratelimited(gt, "Memory CAT error reported by GuC!\n");
+		xe_gt_info(gt, "Memory CAT error reported by GuC!\n");
 		return 0;
 	}
 
-- 
2.53.0

