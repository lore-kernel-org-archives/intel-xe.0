Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA379C54E64
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 12:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D49610EB98;
	Thu, 28 Mar 2024 12:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ry2y/jlo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0C810E96A
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 12:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711628668; x=1743164668;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0yoQXCZlFiemjxePlSwYI0i2E2EuvSChZ1sHW8YrDsQ=;
 b=Ry2y/jloh145IxtWSNgu1uJ4+f2WWVtGn/uTA5YSHiwF9Phofsf968iV
 M2NdvEjU8stet5MrHfj7cw7ZJBgu3BeGdFR8uzCGK1c6AI5SEVEeqWMOJ
 TcKpNP5PfAgrZNqc32wUtRx+S67kU8OziizBZ0WI/WOKIhKb9ux8Ki1UZ
 K6xX88SkUQJyXsO0ULLpYjEWVNzTyXjAVP3u6KA/h99zIxwbrAYnVu7ZS
 YOgP+rLG3KRigOOj9L5Bj/c9bEF8oBgUaO7VoVjdCd2kLrxlhziHPbkf7
 UE5DlQdIwHcS+Ug9EZI4VOpUp+Q9r3LG+by2TeEpH4O0hl4uPjujFhjoi g==;
X-CSE-ConnectionGUID: c/DE6kGCTECTUeJl75wZSA==
X-CSE-MsgGUID: KAwZIo/2Q0KU52ub21X6Ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6633158"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6633158"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 05:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21351911"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa004.jf.intel.com with ESMTP; 28 Mar 2024 05:24:10 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/xe_devcoredump: Check NULL before assignments
Date: Thu, 28 Mar 2024 18:07:39 +0530
Message-Id: <20240328123739.3633428-1-himal.prasad.ghimiray@intel.com>
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

Assign 'xe_devcoredump_snapshot *' and 'xe_device *' only if
'coredump' is not NULL.

v2
- Fix commit messages.

v3
- Define variables before code.(Ashutosh/Jose)

v4
- Drop return check for coredump_to_xe. (Jose/Rodrigo)

v5
- Modify misleading commit message. (Matt)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
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

