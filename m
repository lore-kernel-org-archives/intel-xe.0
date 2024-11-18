Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66F0D591AE
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 18:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AF210E55E;
	Mon, 18 Nov 2024 18:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q3g6D8oQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666D110E559
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Nov 2024 18:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731955527; x=1763491527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I3axkRr4fuoXgKxuKEw30sorWU/PWAagc5846hE/dDU=;
 b=Q3g6D8oQAXlP6cYEcpegzDkDH4sb47KKxUR4cBSD9/Lh0+sjcKj7mVCI
 3dAyVSX5alB9XN6cvRL/2TBGyM+uqY4CidVGvQ98kGtHfMFZWpqTUxngM
 K22o9tb7QeAmXuoRzE16rhT1uhTqkxziMCD1RX7+S/L7kM2zY//SqK4+j
 TYTRvRL9frXzF4qZRnrj82TmMPKxjr9xC2h7bjR0pIw10rRAJMD6MUSJk
 PjyrZNxsjVdToFpG8yFrBywJRG+sQQfFDfAikiQ1HHZJrjfsg6ryMRtqC
 bkntFENNjD1pT0qWYVt9AGhOcUVE0adMbSLL9OBXIKGqJBN2CVWYGCUht Q==;
X-CSE-ConnectionGUID: knb95R5SSOK1SH9o+i2pfQ==
X-CSE-MsgGUID: XcLdvlTdTVWRJ8G7c9kZeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32027862"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="32027862"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 10:45:27 -0800
X-CSE-ConnectionGUID: pmaQ0PpISle3P/032cG6TA==
X-CSE-MsgGUID: pOBJqk6OTk2H+mXf3eudtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="94391413"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 10:45:26 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Use new force-wake guard class in xe_mocs.c
Date: Mon, 18 Nov 2024 19:45:11 +0100
Message-Id: <20241118184511.258-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241118184511.258-1-michal.wajdeczko@intel.com>
References: <20241118184511.258-1-michal.wajdeczko@intel.com>
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

Start using new xe_fw class to minimize risk of leaking force-wake
references.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: rebased
---
 drivers/gpu/drm/xe/xe_mocs.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 54d199b5cfb2..f18aaa6595c7 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -776,19 +776,15 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_mocs_info table;
-	unsigned int fw_ref, flags;
+	unsigned int flags;
 
 	flags = get_mocs_settings(xe, &table);
 
 	xe_pm_runtime_get_noresume(xe);
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
-		goto err_fw;
 
-	table.ops->dump(&table, flags, gt, p);
+	scoped_guard(xe_fw, gt_to_fw(gt), XE_FW_GT)
+		table.ops->dump(&table, flags, gt, p);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-err_fw:
 	xe_pm_runtime_put(xe);
 }
 
-- 
2.43.0

