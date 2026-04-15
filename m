Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C4EF433CD
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 22:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D62C10E0BA;
	Wed, 15 Apr 2026 22:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbIudFdI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA6810E0BA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 22:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776293692; x=1807829692;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4R4CV94EevrhaFM/CiFPAfbqXSVKnJDZGme6kQ8e6u8=;
 b=lbIudFdIRO/ErMj//qVa+xxgi4+RW9kzznDh+WLRkZ10o6QjiG5bgleq
 1Wj046z3H9uAMe95d4dq4f+HTpUnYmS9TYzwM7M81mv7W4d0R4SWRsKJc
 AZNbtGaQ9vA2Y/ZhXweR5s52XHOw8F24cjBp3Qz5EUNRN8cMeCPNmsNZ6
 sjHla9/QvdXdqutX/0eLsHPMP4WMXtriEDkUwJTUKdynUD5ofLM/m82Oi
 CcPsv+C4JAr7HJy3w/SBVG9y6bVqynQFYuF+74CSaNvcbMlQ8g9ZwC9qj
 Mv7Avd53KFgj3BV93OSzm5RrSOLvIEwmpGKPp0nwscDNDVvn/uLbiGXmZ Q==;
X-CSE-ConnectionGUID: hGrJ/qSgQa6Ovl3JyGXyRg==
X-CSE-MsgGUID: RxdbrCIhTUmJJl+04PFfpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="87984100"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="87984100"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 15:54:51 -0700
X-CSE-ConnectionGUID: kNUjOSzESZSQLb53TtD0+g==
X-CSE-MsgGUID: QmaEZWTqRKG2KoqacioLTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="253992030"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa001.fm.intel.com with ESMTP; 15 Apr 2026 15:54:51 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH] drm/xe/eustall: Fix drm_dev_put called before stream disable
 in close
Date: Wed, 15 Apr 2026 22:54:28 +0000
Message-Id: <20260415225428.3399934-1-shuicheng.lin@intel.com>
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

In xe_eu_stall_stream_close(), drm_dev_put() is called before the
stream is disabled and its resources are freed. If this drops the
last reference, the device structures could be freed while the
subsequent cleanup code still accesses them, leading to a
use-after-free.

Fix this by moving drm_dev_put() after all device accesses are
complete. This matches the ordering in xe_oa_release().

Fixes: 9a0b11d4cf3b ("drm/xe/eustall: Add support to init, enable and disable EU stall sampling")
Cc: Harish Chegondi <harish.chegondi@intel.com>
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index aaf3fcc12363..b88b6c49c54a 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -871,14 +871,14 @@ static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
 	struct xe_eu_stall_data_stream *stream = file->private_data;
 	struct xe_gt *gt = stream->gt;
 
-	drm_dev_put(&gt->tile->xe->drm);
-
 	mutex_lock(&gt->eu_stall->stream_lock);
 	xe_eu_stall_disable_locked(stream);
 	xe_eu_stall_data_buf_destroy(stream);
 	xe_eu_stall_stream_free(stream);
 	mutex_unlock(&gt->eu_stall->stream_lock);
 
+	drm_dev_put(&gt->tile->xe->drm);
+
 	return 0;
 }
 
-- 
2.43.0

