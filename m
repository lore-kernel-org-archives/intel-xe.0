Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28C7CD5BA6
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 06:15:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B648510E450;
	Thu, 21 May 2026 06:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZaM+HcZf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16EC10E164
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 06:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779344128; x=1810880128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jfviiits9HiqATuWUUtRutINPGYG5amH0r/rJStOLx8=;
 b=ZaM+HcZfsNgb0Tfmb+n7s1x8ZNirw2+5o0VX6+WvQrTaI4LHC1ZOa4fo
 dY07O4Wij0SPVmOIMLz6q7UnZLPxZ7L0Zv0VqZa2Csfonlgbq/+gPI1J4
 0CLRYONJoiWkvMVZI1aFP+aRnLdURfmYK2r6zJBgkOcI35A0CorAEM6pA
 BCV3WprbjGP45kWsFYyBtXLc73Nyg3vn15LRWyfJZ91kVZrAJEd0OB6A7
 dy3WO1hE+l3/2nRxL1iYgOcVZG2UCLvbs+sRYtc8hB8am6wfAuuAF/EkZ
 SFFKQOWKqNyPv1W8L8Jqy9MBcJvIrSMc3lwnu0ahxfbjzhkODARXA88/D Q==;
X-CSE-ConnectionGUID: 5rlS6jrcRwOU6tVoJvOK5Q==
X-CSE-MsgGUID: 8XSWAmbjSGGXVEpFSlWJBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80376374"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="80376374"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 23:15:28 -0700
X-CSE-ConnectionGUID: elWsSk/gRD+nYg6RipFqeQ==
X-CSE-MsgGUID: Qnk0aEiYR5WN5QtF+3cGJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="270791786"
Received: from cs2n1.iind.intel.com (HELO cs2n1..) ([10.223.246.13])
 by orviesa002.jf.intel.com with ESMTP; 20 May 2026 23:15:27 -0700
From: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com
Cc: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Fix return type of disable_late_binding_set()
 in debugfs
Date: Thu, 21 May 2026 11:39:10 +0530
Message-Id: <20260521060911.2112210-2-mohanram.meenakshisundaram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521060911.2112210-1-mohanram.meenakshisundaram@intel.com>
References: <20260520070255.2021100-1-mohanram.meenakshisundaram@intel.com>
 <20260521060911.2112210-1-mohanram.meenakshisundaram@intel.com>
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

