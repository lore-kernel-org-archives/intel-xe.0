Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FE6C369C2
	for <intel-xe@archiver.kernel.org>; Sat, 26 Apr 2025 00:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61E510E153;
	Sat, 26 Apr 2025 00:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kspmVcX2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1887610E153
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Apr 2025 00:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745626159; x=1777162159;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2q8AZ8EOANtqrH2LKj8nMqs2fcVEGr+08mgnIZ7LkZw=;
 b=kspmVcX2sOaddCqFXcpp9RtXdXsOyyCEWe5cUTg84iPIT81Sf1rfry9P
 op7SrjFwCjJAXLR61phx4dq7wPXbejFtAzR4OO2afk/ZFuEmohHUbb23s
 WQMbftHYQFOXJ/oB4de5ihjFAm4Tut21evPTmObCNlaWgBdbzqnugRujh
 EsuoZJIMdxdc4UDBGZjbYU2nXkzh0MWqGjext0OOGWGX/Dk3sMVKRwmp2
 8IusavmCgDNPTZpGj/SqVU/GbayeidTkbw52wdUvse+8TAIChCqK4vu+4
 t+kokQvtTp1wyi8taHpDC/i5nWYlsxsDLYKTJuzMWhIPiAQ0QAXage21/ Q==;
X-CSE-ConnectionGUID: xACJebTrS8aTTM3Lu8xMuQ==
X-CSE-MsgGUID: LTszVvdVQN+UBaP6UlbeBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="57493522"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="57493522"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 17:09:19 -0700
X-CSE-ConnectionGUID: HYbay7FVTcWcMm0BE9xgeg==
X-CSE-MsgGUID: m1kO9WhoT5CQAsKjOiaUmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="132948231"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 17:09:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Avoid plain modulus in devcoredump
Date: Fri, 25 Apr 2025 17:10:39 -0700
Message-Id: <20250426001039.860444-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Avoid plain modulus in devcoredump rather use div_s64_rem to fix xtensa
build.

Reported-by: kernel test robot <lkp@intel.com>
Closes:  https://lore.kernel.org/oe-kbuild-all/202504251238.JsNgFeFc-lkp@intel.com/
Fixes: c4a2e5f865b7 ("drm/xe: Add devcoredump chunking")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index a9e618abf8ac..13ee5973d2b9 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -177,6 +177,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	struct xe_devcoredump *coredump = data;
 	struct xe_devcoredump_snapshot *ss;
 	ssize_t byte_copied;
+	u32 remainder;
 
 	if (!coredump)
 		return -ENODEV;
@@ -213,8 +214,8 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 
 	byte_copied = count < ss->read.size - offset ? count :
 		ss->read.size - offset;
-	memcpy(buffer, ss->read.buffer +
-	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
+	div_s64_rem(offset, XE_DEVCOREDUMP_CHUNK_MAX, &remainder);
+	memcpy(buffer, ss->read.buffer + remainder, byte_copied);
 
 	mutex_unlock(&coredump->lock);
 
-- 
2.34.1

