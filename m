Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EA8C61DA4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 19:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7486A10E1DD;
	Thu,  9 Mar 2023 19:27:03 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF0310E1CB
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 19:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678390021; x=1709926021;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=SlHxVS34qAJxfBEGVKRPdv4dVAHw5pjQlmFYWcBlDP0=;
 b=Be+BvA5HZiyutmsO9q5Ji/0Fl9o5QmUy7JwrJQKmN1gpOkMdl9LT+poQ
 56DGV6GdzNBBtYzyzyyTIRwXXAzJNNTZJo2DEOp5aTVHaRoNqEbKB7DAo
 OYE+fPKBvcV+YtEfYGZ3aFzlWnIyZDX+1n2eLXuFaajUHyRuIxyVYrA2D
 WTv6CYvu77LBBfB8WTxWGdIyiWtcCyokmXg3bO4Iw5pWCWrCX9jwMNteP
 QDNiua70VslVRwwoKT7cw7PkycIVzXCFQ1Rgsah0Jxhdnv3JsaOLrq30R
 UX4Ch8+AQQyg2U60NEZwEBMKRBluIAgkSmUFPnhhBy/Mqyr0xNzWXJe+t g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="335245786"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="335245786"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 11:27:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="709975723"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="709975723"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 09 Mar 2023 11:27:00 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.13.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4D16B580BBE
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 11:27:00 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1paLuk-00DSFf-1D
 for intel-xe@lists.freedesktop.org; Thu, 09 Mar 2023 20:26:58 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Mar 2023 20:25:54 +0100
Message-Id: <20230309192553.3206772-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe_uc_fw: Use firmware files from
 standard locations
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The GuC/HuC firmware files used by Xe drivers are the same as
used by i915. Use the already-known location to find those
firmware files, for a couple of reasons:

1. Avoid having the same firmware placed on two different
   places on MODULE_FIRMWARE(), if both 915 and xe drivers
   are compiled;

2. Having firmware files located on different locations may end
   creating bigger initramfs, as the same files will be copied
   twice my mkinitrd/dracut/...;

3. this is the place where those firmware files are located at
   https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
   Upstream doesn't expect them to have on other places;

4. When built with display support, DMC firmware will be
   loaded from i915/ directory. It is very confusing to have
   some firmware files on a different place for the same driver.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas de Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index ff94eec9cafe..00408f1b73e1 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -55,12 +55,12 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
 	fw_def(TIGERLAKE,    0, huc_def(tgl,  7, 9, 3))
 
 #define __MAKE_UC_FW_PATH_MAJOR(prefix_, name_, major_) \
-	"xe/" \
+	"i915/" \
 	__stringify(prefix_) "_" name_ "_" \
 	__stringify(major_) ".bin"
 
 #define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_) \
-        "xe/" \
+        "i915/" \
        __stringify(prefix_) name_ \
        __stringify(major_) "." \
        __stringify(minor_) "." \
-- 
2.39.2

