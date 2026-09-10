Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCE1C88E40
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 04:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7607510E8C2;
	Thu, 10 Sep 2026 04:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BY/ebEbr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E863210E8C2
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 04:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789016370; x=1820552370;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YP09msANSMZjnHxNe3eJJDI86V3RzYYsNKElQDmVZLA=;
 b=BY/ebEbr4PM3RvG1iWfpnPd8GgB0Tbr/dmmYtxzZsE/j2Qc3huAloLhG
 UdzKZaEYgFBnbs+1vie0Cazgfhtc3nXzg4zuL+W7sg0QYl+g/WKEE38mR
 iO6dsVAvYtAHo8Yl00WAeZnXffOzwAy906XFZFpmJVeDANLWDCAkopnSS
 ATsZpix0DGCNTJpsZLvKveLVW8Tf94crusxQp0JC8QgSrJABgl0onICCC
 Alc87tJhB8f94Zf4hOzKDTp1DMtqUhzzDEwS0S4GXX4lk8MO/sLjawpZL
 +kioxsO/O8jMwGOSNH7vuJDEFFANM5318xsyNlhUEmPolmtc9vyupfEC0 Q==;
X-CSE-ConnectionGUID: p9tbRE5VRIW1gbWG+2KGpw==
X-CSE-MsgGUID: rL2KiQNaQw2xiRD6681kkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89329567"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="89329567"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 21:59:29 -0700
X-CSE-ConnectionGUID: amrgqeYDQ0u5I5p3AH+ltQ==
X-CSE-MsgGUID: gtaYBXWYQTyWDFBoAV15KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="309775541"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 21:59:28 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: zhanjun.dong@intel.com, daniele.ceraolospurio@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH] drm/xe/guc: Demote uncorrectable local error log to info
Date: Thu, 10 Sep 2026 10:29:19 +0530
Message-ID: <20260910045919.2280655-2-varun.gupta@intel.com>
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

The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
local, queue-level context termination rather than a global device or
driver failure. This can be triggered as part of expected recovery flows,
including intentional fault-injection tests.

Printing this at ERROR level is too noisy and causes false-positive
dmesg-warn failures in CI. Switch the log level to INFO, matching the
adjacent CAT error handler.

Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f3ba8abfc228..e0662bd9154b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3495,9 +3495,9 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
-	xe_gt_err(gt,
-		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
-		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
+	xe_gt_info(gt,
+		   "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
+		   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
 
 	trace_xe_guc_uncorrectable_error(q);
 
-- 
2.43.0

