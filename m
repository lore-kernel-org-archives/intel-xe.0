Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CF6C369D9
	for <intel-xe@archiver.kernel.org>; Thu,  1 May 2025 01:24:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94DA10E816;
	Thu,  1 May 2025 01:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dyr2QOt7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9C510E816
 for <intel-xe@lists.freedesktop.org>; Thu,  1 May 2025 01:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746062666; x=1777598666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mJQG+UopRXqBXcjGbVB/k9IpLsR9tXFEfKzVHRC38xA=;
 b=Dyr2QOt7NKBBijxoHrLLYiLC9pzovpdy3PfqW12JfZ7PESCLJyjXwQpJ
 Of8skMJYlIiHT/OcUlyzMpmHYmjbifI+HgumU6+VKTKfPxCLsLLdS5FDv
 4dURWl14XXMePd51aEQFhFR2SiRA+LPQJ8RosIIWYUb+StcVSB5GjK7ud
 dAmieyWiuZcDWvJwlZDPpal0TOwOIBeqNqjiB+DRZjTEcLDkvIgBGlz03
 D1XdQi0LcVTSoFHxRhbpmvTztYX7dnLAH2Ryejd3Q4vIbJCuGlprtT/tW
 J24GSLqHkVkBtP5kqHI47h2wS6w14+gk8bFSB3YxiNwUbaWJUGiHhKafk A==;
X-CSE-ConnectionGUID: vDxKTtpnQACDhuo9o8NEXw==
X-CSE-MsgGUID: faJgN5YBQoays/Ekov3JzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47650200"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; d="scan'208";a="47650200"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 18:24:23 -0700
X-CSE-ConnectionGUID: i+mBrKjKTS+c3YvA2aRx2g==
X-CSE-MsgGUID: nLfBAX/xSgStsyjsN0N0jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; d="scan'208";a="134020538"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 18:24:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: arnd@arndb.de
Subject: [PATCH v2] drm/xe: fix devcoredump chunk alignmnent calculation
Date: Wed, 30 Apr 2025 18:25:45 -0700
Message-Id: <20250501012545.1045247-1-matthew.brost@intel.com>
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

From: Arnd Bergmann <arnd@arndb.de>

The device core dumps are copied in 1.5GB chunks, which leads to a
link-time error on 32-bit builds because of the 64-bit division not
getting trivially turned into mask and shift operations:

ERROR: modpost: "__moddi3" [drivers/gpu/drm/xe/xe.ko] undefined!

On top of this, I noticed that the ALIGN_DOWN() usage here cannot
work because that is only defined for power-of-two alignments.
Change ALIGN_DOWN into an explicit div_u64_rem() that avoids the
link error and hopefully produces the right results.

Doing a 1.5GB kvmalloc() does seem a bit suspicious as well, e.g.
this will clearly fail on any 32-bit platform and is also likely
to run out of memory on 64-bit systems under memory pressure, so
using a much smaller power-of-two chunk size might be a good idea
instead.

v2:
 - Always call div_u64_rem (Matt)

Reported-by: kernel test robot <lkp@intel.com>
Closes:  https://lore.kernel.org/oe-kbuild-all/202504251238.JsNgFeFc-lkp@intel.com/
Fixes: c4a2e5f865b7 ("drm/xe: Add devcoredump chunking")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index a9e618abf8ac..7a8af2311318 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -177,6 +177,8 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	struct xe_devcoredump *coredump = data;
 	struct xe_devcoredump_snapshot *ss;
 	ssize_t byte_copied;
+	u32 chunk_offset;
+	ssize_t new_chunk_position;
 
 	if (!coredump)
 		return -ENODEV;
@@ -201,10 +203,14 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 		return 0;
 	}
 
+	new_chunk_position = div_u64_rem(offset,
+					 XE_DEVCOREDUMP_CHUNK_MAX,
+					 &chunk_offset);
+
 	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
 	    offset < ss->read.chunk_position) {
-		ss->read.chunk_position =
-			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
+		ss->read.chunk_position = new_chunk_position *
+			XE_DEVCOREDUMP_CHUNK_MAX;
 
 		__xe_devcoredump_read(ss->read.buffer,
 				      XE_DEVCOREDUMP_CHUNK_MAX,
@@ -213,8 +219,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 
 	byte_copied = count < ss->read.size - offset ? count :
 		ss->read.size - offset;
-	memcpy(buffer, ss->read.buffer +
-	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
+	memcpy(buffer, ss->read.buffer + chunk_offset, byte_copied);
 
 	mutex_unlock(&coredump->lock);
 
-- 
2.34.1

