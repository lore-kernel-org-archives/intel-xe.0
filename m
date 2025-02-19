Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B74EC021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 21:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE08B10E8A6;
	Wed, 19 Feb 2025 21:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YAE6QsjJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E685C10E8A6
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 21:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740001628; x=1771537628;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i1r3Xvli6RKrF1b+TEm5dxTnPDfBjqgSnm5TGXVRA0c=;
 b=YAE6QsjJ6vxvACnMPrSFPqNuTqkbCSUZEHwYmavZzdrQUl/Dm/G1Mb3J
 WsUtfN5IlPWqqb/KzLcl3256GYZ40OLsqX/97xeUJB9Qu4M71WwRzmDM+
 bYKt+fdE2PJEsCzQ/PAJFXFq6mPG7nluDxQoaGUa6zzNdbqTeY/lD44WT
 +kL1mLtyo8zKPlLrTY1QSjGJORD+S28+t9wp9ompZMhX11YjssV4wGbGx
 w9JHkBBtsgrOA8v9racdytwNrE59w8T8I7t7oVOTyzR+qRFlY9m64IMuf
 POckkUoNAGyp8tvxAWa99Eermjnzl/l56JEIMxHTbRw5732gXD/75g/Kt g==;
X-CSE-ConnectionGUID: Hqm75jOmSFuQoesHH2HZig==
X-CSE-MsgGUID: s1HRbaiUS5KDSKtHwg+Ffg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="39948271"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="39948271"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 13:47:07 -0800
X-CSE-ConnectionGUID: 6HEdX2EZQ4qJ6GsmzKpqtQ==
X-CSE-MsgGUID: xdSZTK1ORiq9TlzgiQ/+/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="115038226"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.96])
 by fmviesa008.fm.intel.com with ESMTP; 19 Feb 2025 13:47:06 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/devcoredump: Remove IS_ERR_OR_NULL check for kzalloc
Date: Wed, 19 Feb 2025 21:43:13 +0000
Message-Id: <20250219214313.1798569-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

kzalloc returns a valid pointer or NULL if the allocation fails.
It never returns an error pointer. It is better to check for NULL directly.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 60d15e455017..81b9d9bb3f57 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -426,8 +426,8 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
 		drm_printf(p, "Offset not word aligned: %zu", offset);
 
 	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
-	if (IS_ERR_OR_NULL(line_buff)) {
-		drm_printf(p, "Failed to allocate line buffer: %pe", line_buff);
+	if (!line_buff) {
+		drm_printf(p, "Failed to allocate line buffer\n");
 		return;
 	}
 
-- 
2.25.1

