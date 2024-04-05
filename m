Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D3CCD1299
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 21:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F8C10EA72;
	Fri,  5 Apr 2024 21:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqf13WdM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAFC10EA6D
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 21:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712351769; x=1743887769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b5pAy3nyUlY4hWH9cYMd5ECtdTGl+zhY8hj0EKkppEQ=;
 b=bqf13WdMV2E4x43cXu1NZMPnPPDeKt/ewEgh0liMGkPKNUZmZgaUBT6t
 ljsX7yqUZ7cGZX8YzDpRgdldC/ytOSa8zCV8FkBof5GkKsfdOzb1piAql
 /Bqc1wa1OdXbQMdVL4wh72zYKZ7rT7PNlgtb1ZXsANJzDuOjmrsOEcijQ
 oaMnA1eNKORwPPoG38eEq05llhdZTgds4kgPd7sCLXDkj6SPlCGASfZU6
 ZyZctZD82niltVhge8PiXbXMhXdsBet6dkHta2YQg6r91seoDyu4f1h97
 DlxDA5SCn3e+OaVVTplBtY6IbzJq21eX3H96yLfahfXBl1rtB9bXA63jo A==;
X-CSE-ConnectionGUID: ojb6sXZFSYydzfN0Hpu9OA==
X-CSE-MsgGUID: FOcxw5UnQyWVEduMEbMEOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="19132697"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="19132697"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 14:16:08 -0700
X-CSE-ConnectionGUID: WcNHgx31S+SrMx/hFEhb/w==
X-CSE-MsgGUID: rncz91eESoeCcTipwPDlDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="50249179"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 14:16:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/2] drm/xe: Capture GuC CT snapshot when stopped
Date: Fri,  5 Apr 2024 14:16:32 -0700
Message-Id: <20240405211632.223568-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405211632.223568-1-matthew.brost@intel.com>
References: <20240405211632.223568-1-matthew.brost@intel.com>
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

It is useful capture the GuC CT snapshot if the GuC CT has been
forcefully put into the stopped state. Enable snapshot capture when in
this state.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 6c37f4f9bddd..0aa3abaca66d 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1403,7 +1403,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
 		return NULL;
 	}
 
-	if (xe_guc_ct_enabled(ct)) {
+	if (xe_guc_ct_enabled(ct) || ct->state == XE_GUC_CT_STATE_STOPPED) {
 		snapshot->ct_enabled = true;
 		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
 		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
-- 
2.34.1

