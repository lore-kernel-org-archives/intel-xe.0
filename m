Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0309BC83F03
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 02:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A52910E154;
	Mon,  7 Jul 2025 02:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUfOQUpW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE09510E154
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 02:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751854590; x=1783390590;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VxyYBfD6kRD/3C/q/pmUlVumPkDerA/ByTmXStbjPrQ=;
 b=LUfOQUpWTgJq7XHTiSYIb+ts4B4VgC98yELTVLD+9+DwXwcID/CpFtSW
 qzlfaw+E3It8WyDbYgcoz4/Fg/U4y7uxF6fS6TICugHk4sJ6rFVkkvmRe
 rq8j/Poc6EbtbdvP/GBUB/GWQB5VSIRadSD57W9l9d3j2syPxw7/mqvjD
 VXzaX19zjculZ3P32JUcqEEB0p/jVVTByuW3DdLSR5hWbxbB9s38ByJO2
 jwTj/op/32nd43afuQM7GK+DYQ0TAW16Yq2GOjnFFle1z/sWp16cNLLdw
 0/03whfi73KWgRBLoKq5oq7qmgoIQieufmQjcJKuUy97yyBh6Af7y6YfF Q==;
X-CSE-ConnectionGUID: YrQwun5ASoyWCdXHWsr4Uw==
X-CSE-MsgGUID: DV0KyvTBTrGprGBAjjEUmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="71647505"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="71647505"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 19:16:23 -0700
X-CSE-ConnectionGUID: Yeyt5KDyTTWDm9rUf4rkTg==
X-CSE-MsgGUID: orMGqgqXS0+18W5Q/XS2dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="160755431"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa005.jf.intel.com with ESMTP; 06 Jul 2025 19:16:21 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/pm: Correct comment of xe_pm_set_vram_threshold()
Date: Mon,  7 Jul 2025 02:15:11 +0000
Message-ID: <20250707021510.3525028-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

The parameter threshold is with size in mb, not in bits.
Correct it to avoid any confusion.

Fixes: 30c399529f4c ("drm/xe: Document Xe PM component")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index bcfda545e74f..c7622e1c614b 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -754,7 +754,7 @@ void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
 /**
  * xe_pm_set_vram_threshold - Set a vram threshold for allowing/blocking D3Cold
  * @xe: xe device instance
- * @threshold: VRAM size in bites for the D3cold threshold
+ * @threshold: VRAM size in mb for the D3cold threshold
  *
  * Returns 0 for success, negative error code otherwise.
  */
-- 
2.49.0

