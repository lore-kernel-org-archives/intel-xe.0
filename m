Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1CEC47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 17:11:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0246C112633;
	Fri, 22 Mar 2024 17:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlztphsE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDAC112632
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 17:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711127493; x=1742663493;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KfenhujpZKm3oe9NChljoFwGPY4nghLsEAOMtDGBmgE=;
 b=RlztphsEaKTi8xdnEBzC2Opn8rMsHJKYSbcKNYiFXg4iRNQaLJ9jx5uL
 7f1wPuUlh1TA2PJEva1uq8Wq+P/rzPGUOT3mRMmMCXCRdTzphyMtcUqLb
 xc2JRxxAJHixoBFYvQljmVXkv/SCYDn53H6FtnmGtc08YLt3moqpmwt1h
 And9nEfrL7BbHA0mRhtGYD0Xtdh8dgbn8/IM0rvWTmtfdJq7tn+lnJNRo
 K1jFPoXlPQIiYTr3rNTnRzwZsFApTh7ZugWGxKkqva4rzjHf+L8l1X0kP
 2xSuKp98iE6U8Ahz3pDa9VJGyg8FD7XiJ5+s28rL7kBvYE3LS2gE+O6x+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="31626039"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="31626039"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 10:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="15012350"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa009.fm.intel.com with ESMTP; 22 Mar 2024 10:11:26 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4] drm/xe/xe_devcoredump: Check NULL before dereferencing
Date: Fri, 22 Mar 2024 22:54:47 +0530
Message-Id: <20240322172447.3372167-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Dereference 'coredump' to access 'xe_devcoredump_snapshot' only if
'coredump' is not NULL,

v2
- Fix commit messages.

v3
- Define variables before code.(Ashutosh/Jose)

v4
- Drop return check for coredump_to_xe. (Jose/Rodrigo)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 3a6263ecff01..a951043b2943 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -77,17 +77,19 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
 	struct xe_devcoredump *coredump = data;
-	struct xe_device *xe = coredump_to_xe(coredump);
-	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
+	struct xe_device *xe;
+	struct xe_devcoredump_snapshot *ss;
 	struct drm_printer p;
 	struct drm_print_iterator iter;
 	struct timespec64 ts;
 	int i;
 
-	/* Our device is gone already... */
-	if (!data || !coredump_to_xe(coredump))
+	if (!coredump)
 		return -ENODEV;
 
+	xe = coredump_to_xe(coredump);
+	ss = &coredump->snapshot;
+
 	/* Ensure delayed work is captured before continuing */
 	flush_work(&ss->work);
 
-- 
2.25.1

