Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BA5FF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 20:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFC710E20A;
	Tue, 28 Apr 2026 20:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JmwrmL2u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D2B10E20A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 20:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777407308; x=1808943308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CSBNtay/nLw4rqy7NdeLB53kDBgNnP/DxI2zTwMoeK4=;
 b=JmwrmL2uNktRPneEFp5rMB0Q6PJb8VeNsfVwJ0gTrrA3spn5GFRYeGBp
 EtDMN9wbIBahU4ehuhkp7+HP+Ai70tQnnSOC2gc2Zz+/d/mCuDnIZOaNY
 uOdnXbZLbOh2aQmfKyQC2jni2rWz8VblKOxDFNWWzMtcwpCB5dJT6vXpn
 INttIV25z2ubFBBOvqPQVTFWYX82jAMLW45YIabu8X2t+8WU7GtDGT1Zs
 qBsCcpB2FsOV+xIyAVBJf5GT1PQJautQNepcBilh4MwSAtOOXeW0t1wEe
 km1Bw/JQl/7bwAUGWxXVeHvbOUYQvgxjK4qPwSHdjo4G054TSb4N1uKAL w==;
X-CSE-ConnectionGUID: Int2OwjIQsO4yMvV7eVdRg==
X-CSE-MsgGUID: EN2bQTGKQ9yDwFPTgl7yXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78035705"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78035705"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 13:15:07 -0700
X-CSE-ConnectionGUID: g7K1eKF5QziMrYlAZRBYXw==
X-CSE-MsgGUID: fWC7kxu2Qk+pbsyFE+nTlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238029240"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa003.jf.intel.com with ESMTP; 28 Apr 2026 13:15:06 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v2] drm/xe/pf: Fix EAGAIN sign in pf_migration_consume()
Date: Tue, 28 Apr 2026 20:14:48 +0000
Message-Id: <20260428201448.3999428-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

PTR_ERR() returns a negative value, so comparing against the positive
EAGAIN is always true for ERR_PTR(-EAGAIN), causing pf_migration_consume()
to bail out instead of continuing to the remaining GTs. On multi-GT
platforms this can skip GTs that already have data ready.

Compare against -EAGAIN to match the intent (and the following line
that correctly uses -EAGAIN). While at it, gate PTR_ERR() with
IS_ERR().

v2: add IS_ERR() guard before PTR_ERR(). (Gustavo)

Fixes: 67df4a5cbc58 ("drm/xe/pf: Add data structures and handlers for migration rings")
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index 6c4b16409cc9..150a241110fb 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -149,10 +149,11 @@ pf_migration_consume(struct xe_device *xe, unsigned int vfid)
 
 	for_each_gt(gt, xe, gt_id) {
 		data = xe_gt_sriov_pf_migration_save_consume(gt, vfid);
-		if (data && PTR_ERR(data) != EAGAIN)
+		if (!data)
+			continue;
+		if (!IS_ERR(data) || PTR_ERR(data) != -EAGAIN)
 			return data;
-		if (PTR_ERR(data) == -EAGAIN)
-			more_data = true;
+		more_data = true;
 	}
 
 	if (!more_data)
-- 
2.43.0

