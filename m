Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4199CD4F39
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 20:32:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731FD10E607;
	Thu, 14 May 2026 20:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+yb6NPG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D6810E3DC
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 20:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778790742; x=1810326742;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kuIrj7o87EzY+4lkWfWHZ6eFXN9912wXi1o0NHsJ2Gs=;
 b=b+yb6NPG0NMZeMRqfIAu1JOfxw2iv5voaOxvF6srlqwIvTxuhU35HkcO
 cRRBzhXdxwRq37lyAhR5zt0E+/bkS+Opk1BUzJihYHMYuf8dOYOqIVCwC
 MsmLxXnXlTCFTcS4LjICZHAqeaS/2bT8bpgutdIxJ+D7dP1YU80FUAqad
 cVBKslOdzYqA9HCuJ+T8SN85ALW/p3+7nBkAn9YeifYK5ADJk5ISNrPHJ
 DpGD9VwTgVehujD5jqg264C9bvnMwov0svrBprA7U0oXncrcX5dOzfzrr
 ClzdF3+E7F2eR9B/kgEdSjxYw00mOLwd+DKAtMbIPVYF5OUBScJ1pJQyN w==;
X-CSE-ConnectionGUID: pGCLFKeBSo6vVydxB7a9VQ==
X-CSE-MsgGUID: lG119A6BSnSc+JwoWpPakA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="97171429"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="97171429"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 13:32:22 -0700
X-CSE-ConnectionGUID: 8nbQE89vRKCG7aMOnHzrFw==
X-CSE-MsgGUID: 37Jr/s/xRNGVs6SgIvx8RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="234215096"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa010.fm.intel.com with ESMTP; 14 May 2026 13:32:21 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH] drm/xe/oa: Fix exec_queue leak on width check in stream open
Date: Thu, 14 May 2026 20:32:10 +0000
Message-Id: <20260514203210.593488-1-shuicheng.lin@intel.com>
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

In xe_oa_stream_open_ioctl(), when param.exec_q->width > 1 the
function returns -EOPNOTSUPP directly, skipping the existing
err_exec_q cleanup path. The exec_queue reference obtained by
xe_exec_queue_lookup() is leaked.

The exec queue holds a reference on the xe_file, which is only
dropped during queue teardown. The leaked lookup ref is not on
the file's exec_queue xarray, so file close cannot release it.
This keeps both the exec queue and the file private state pinned
indefinitely.

Jump to err_exec_q instead of returning directly so the reference
is released.

Fixes: f0ed39830e60 ("xe/oa: Fix query mode of operation for OAR/OAC")
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 7c9071abb44f..4bf4b1f65929 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2051,8 +2051,10 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
 			return -ENOENT;
 
-		if (XE_IOCTL_DBG(oa->xe, param.exec_q->width > 1))
-			return -EOPNOTSUPP;
+		if (XE_IOCTL_DBG(oa->xe, param.exec_q->width > 1)) {
+			ret = -EOPNOTSUPP;
+			goto err_exec_q;
+		}
 	}
 
 	/*
-- 
2.43.0

