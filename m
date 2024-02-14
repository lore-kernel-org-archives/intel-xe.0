Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D27C48BC1
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 11:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A2F10E797;
	Wed, 14 Feb 2024 11:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bm5bGR5c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA70E10E797
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 11:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707911890; x=1739447890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RaPnINe2GfB+CpInuDPFpU46FpEKNVZo9Qx++gb7Z4k=;
 b=Bm5bGR5cJiGgkGYRnH+hKNXxrog4PRI1tyOVTrhj/99CFK7faKbqBd5+
 49MHvnSL/k8OVlCmZiHhab+rDicgZk4rGsGgJV1KIp8Akcou57z28oCsD
 Y4kvaA6v3RNyHJugfmC730TeGT7Z6Iov1elBNyFWJ5im+E7JcxRBzO6gk
 T5n0Y7AE0W6IiZu5j5MmZGVwT4h2uPwNkwKDlwi6JSfxqcmRHsL8akHTr
 fWiugTDegsNp4MsJ/jA/HF7uHDEithUhandcJylybDzEgwio9obW5voL3
 FR8a0Xt4BzXsL28TpS9Og4kN/gYAX4dWjnMtotVLagpnbPjiH4AaYqXCX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2090349"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2090349"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 03:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3529162"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.138.241])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 03:58:09 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/3] drm/xe: Store pointer to struct xe_gt in gt/ debugfs
 directory
Date: Wed, 14 Feb 2024 12:57:54 +0100
Message-Id: <20240214115756.1525-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240214115756.1525-1-michal.wajdeczko@intel.com>
References: <20240214115756.1525-1-michal.wajdeczko@intel.com>
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

Attributes added under 'gt/' directories may wish to use that
in case they can't obtain it from elsewhere.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c4b67cf09f8f..207b992f1240 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -225,6 +225,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 		return;
 	}
 
+	/* other attributes may use parent->d_inode->i_private */
+	root->d_inode->i_private = gt;
+
 	/*
 	 * Allocate local copy as we need to pass in the GT to the debugfs
 	 * entry and drm_debugfs_create_files just references the drm_info_list
-- 
2.43.0

