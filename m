Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCC4CE7AFE
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 04:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1088810E559;
	Thu, 28 Sep 2023 04:41:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9041A10E5CC
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 04:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695876086; x=1727412086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7+xkC+Bo3SlrEUg8RQiRg3cC9zwWTc0/004vW4fc3bA=;
 b=LbJ3M1FiC3YiZvkVncY16djP4++cMNS3AlSPWBdKKOiiVQGtRVMcbJ9f
 a6YONBMcex8oxeHXtAhO7smsHYdlbgnsao347z1YPAH2JNh7go84NUaRe
 28PYgGmLAbGdTVfDO1tgYo2RFOeeupjWiME0DawyTkUPTjf+Z9HZAbOCL
 YWp9bV8iFmL0ArnbCi3hxHzbyfib6T5h7dlYb5YuisjLhElRl2phicRaa
 sT04ad75udYqvNtddaThI1wu6Cta3UabXwXJvfV1QtBWhL2FFpTKXLLeH
 mqJqY+2IDaK7gECpAewQ3yiKxH2yLJfuVZ76WBm4p6CgC3h5c9Cv6piKw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="468269716"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="468269716"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 21:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="819715282"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="819715282"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 21:41:24 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 21:43:35 -0700
Message-Id: <20230928044335.1474903-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230928044335.1474903-1-fei.yang@intel.com>
References: <20230928044335.1474903-1-fei.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] drm/xe: set PTE_AE for all platforms
 supporting it
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

Atomic access is supported by PVC, and became a common feature for all
platforms starting from Xe2. To enable that XE_VMA_ATOMIC_PTE_BIT needs
to be set, then pte encode will eventually set PTE_AE for devmem.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index beffbb1039d3..5f700c0d5ef9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -897,7 +897,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 			vma->tile_mask |= 0x1 << id;
 	}
 
-	if (vm->xe->info.platform == XE_PVC)
+	if (vm->xe->info.platform == XE_PVC || GRAPHICS_VER(vm->xe) >= 20)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
 	if (bo) {
-- 
2.25.1

