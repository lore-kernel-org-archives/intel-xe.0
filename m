Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A7DCD343F
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 06:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2100110E164;
	Thu, 21 May 2026 06:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iVtr1v0J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D958710E164
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 06:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779343796; x=1810879796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jfviiits9HiqATuWUUtRutINPGYG5amH0r/rJStOLx8=;
 b=iVtr1v0JdAB3vAV5RYtQZH3FzB19ertbzoy/kElfxx1L5fOkPTjiP802
 /QgwbFWHO/E0R4Q+Kj6epvpQ2XdpvVVtksFlbhmfAi53DWQw6rOyaENJ8
 J3J5D+qaT3NAQkcZQ4pt815N9K4jJOp/qwdnYHvYaycUUOAVsewY2fuiN
 7JBxLK3NcLxMgCwzT3yhFmFnnKdyxSm1FVVcIoyMAHwprjuzw1eMHsJZt
 3G8JK3KtLwowBOQ0+72nr0Ds305Q5xB04jO83YZrhzmCll0gUyTdRbs5J
 wqAz+waWFwrdojsMnFhqx2IPVIuWXDl6BagFdrx9qFEg3jA650cgdXx/+ A==;
X-CSE-ConnectionGUID: FqCmdS6aRcWBB6kwQfLkWw==
X-CSE-MsgGUID: U+E5VnR+TQGV3Nx4la8+Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80288818"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="80288818"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 23:09:56 -0700
X-CSE-ConnectionGUID: AgLDEiNxRZuGYbcz2Qb4hQ==
X-CSE-MsgGUID: HuyTB2tcTq+Xap2a5XjQ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="278552326"
Received: from cs2n1.iind.intel.com (HELO cs2n1..) ([10.223.246.13])
 by orviesa001.jf.intel.com with ESMTP; 20 May 2026 23:09:54 -0700
From: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com
Cc: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Fix return type of disable_late_binding_set()
 in debugfs
Date: Thu, 21 May 2026 11:33:37 +0530
Message-Id: <20260521060338.2112191-2-mohanram.meenakshisundaram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521060338.2112191-1-mohanram.meenakshisundaram@intel.com>
References: <20260521060338.2112191-1-mohanram.meenakshisundaram@intel.com>
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

Fix disable_late_binding_set() to declare 'ret' as ssize_t instead of
int, consistent with the function's return type.

Signed-off-by: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 22b471303984..9800e3fc4c07 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -528,7 +528,7 @@ static ssize_t disable_late_binding_set(struct file *f, const char __user *ubuf,
 	struct xe_device *xe = file_inode(f)->i_private;
 	struct xe_late_bind *late_bind = &xe->late_bind;
 	bool val;
-	int ret;
+	ssize_t ret;
 
 	ret = kstrtobool_from_user(ubuf, size, &val);
 	if (ret)
-- 
2.34.1

