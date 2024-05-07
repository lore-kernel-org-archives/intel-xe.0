Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C321AC10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 19:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919CA10FBE8;
	Tue,  7 May 2024 19:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iIW5cEPi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5708B10F24B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 19:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715111597; x=1746647597;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5q/ZoK10ku0r/HeK9PpNgsOhWOye8+kkrd8Sfl+Eprg=;
 b=iIW5cEPikYxYnhAxYOb+3D0j5n1v69qX58HqA1hsxfrzQOxSjtl9lTVM
 r+9stkRYUNYU1HPoaFlNmqbyMP82NK/A6IH0xNUjKsAOKOgozATEIWGIf
 r9RgaQeRpiTaXkFBg2r/IKpYFqFm+APLMWj/NXtsnH5a3RsTvx5ixs0w7
 6i8GVOVVztZoETjHUxeeZe+AIJAEoQn79h1oHOuZg3QnYNF3O1LSHPEyz
 1PkhTEZNHvi6wnERDeFI2bjZ2j2xQNdGDu7uejc7+peKw2aE7zQFkASod
 6aURk/b/adVJH//9uA8UlsSzYbT2J8rKgIG0leBrx9gQ78Omz5D20GxAV Q==;
X-CSE-ConnectionGUID: Hm6rJ01VRJmu/Nswg5Qm0Q==
X-CSE-MsgGUID: o0KtnFb/RPGZRgy65WeBdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10803575"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="10803575"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 12:53:15 -0700
X-CSE-ConnectionGUID: rWUq8ZMwTjGrq2sunj5Kww==
X-CSE-MsgGUID: PBwJ7Q0HQGCWBpJzJXxl5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="29190055"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa008.jf.intel.com with ESMTP; 07 May 2024 12:53:13 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Change pcode timeout to 50msec while polling again
Date: Wed,  8 May 2024 01:37:29 +0530
Message-Id: <20240507200729.3214654-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

Polling is initially attempted with timeout_base_ms enabled for
preemption, and if it exceeds this timeframe, another attempt is made
without preemption, allowing an additional 50 ms before timing out.

Display driver can request for timeout of 3 msec, hence modify the
warning condition.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index c010ef16fbf5..ac3a965674c8 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -124,6 +124,8 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox,
 {
 	int slept, wait = 10;
 
+	xe_gt_assert(gt, timeout_us > 0);
+
 	for (slept = 0; slept < timeout_us; slept += wait) {
 		if (locked)
 			*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
@@ -166,7 +168,7 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox,
 int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 		      u32 reply_mask, u32 reply, int timeout_base_ms)
 {
-	u32 status;
+	u32 status = 0;
 	int ret;
 
 	mutex_lock(&gt->pcode.lock);
@@ -188,10 +190,10 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 	 */
 	drm_err(&gt_to_xe(gt)->drm,
 		"PCODE timeout, retrying with preemption disabled\n");
-	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 1);
+	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 3);
 	preempt_disable();
 	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
-				true, timeout_base_ms * 1000, true);
+				true, 50 * 1000, true);
 	preempt_enable();
 
 out:
-- 
2.25.1

