Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E73C61D9C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 11:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E679B10E5FE;
	Wed, 22 Nov 2023 11:04:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB7A10E5FE
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 11:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700651061; x=1732187061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QYfZ8QINkl+jzd70ShdOtjz9GS+Fzp/DZSiYtDKkqDo=;
 b=LhGVDliQWU52lGkT0MqWdwChQ0P7SemyMRGq/rgrLoCA+C0AIJCE51T1
 OhHSaVxFiMHT8Pe2iU8rVb/nNV4XZBHsFcS1kSjU9tIV5/7fZfTTYvhHv
 ovMr/oX44B2CypEjyJ+bVCwmRve7OxZGKHsa/xK38LsPKUfMuAqAO2eJ9
 ndsPAwqefIVDqzY0g8dninSGb6oIWdB+p+A/fz2B86GbI0Qsm3cUnQL5o
 8+stqOtmRWsM/OWDM4gUrvLPfP/pNc03umfjjIupHI54ZiCg1szWVABwt
 lKHVMuFcds2S0z8/VR9zBVOupJTh8fKqvt9P3hJnZgVftZlfktTFZ8ETQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="5224037"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="5224037"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 03:04:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="14868116"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.158])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 03:04:19 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 12:03:59 +0100
Message-ID: <20231122110359.4087-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
References: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe/vm: Fix ASID XA usage
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

xa_alloc_cyclic() returns 1 on successful allocation, if wrapping occurs,
but the code incorrectly treats that as an error. Fix that.
Also, xa_alloc_cyclic() requires xa_init_flags(..., XA_FLAGS_ALLOC), so
fix that, and assuming we don't want a zero ASID, instead of using
XA_FLAGS_ALLOC1, adjust the xa limits at alloc_cyclic time.

Suggested-by: Ohad Sharabi <osharabi@habana.ai>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 drivers/gpu/drm/xe/xe_vm.c     | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8be765adf702..a67aaa15b4ae 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -230,7 +230,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	init_waitqueue_head(&xe->ufence_wq);
 
 	drmm_mutex_init(&xe->drm, &xe->usm.lock);
-	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC1);
+	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
 
 	drmm_mutex_init(&xe->drm, &xe->persistent_engines.lock);
 	INIT_LIST_HEAD(&xe->persistent_engines.list);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b39c6f43f01f..85b9d6f864ec 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1994,13 +1994,14 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (xe->info.has_asid) {
 		mutex_lock(&xe->usm.lock);
 		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
-				      XA_LIMIT(0, XE_MAX_ASID - 1),
+				      XA_LIMIT(1, XE_MAX_ASID - 1),
 				      &xe->usm.next_asid, GFP_KERNEL);
 		mutex_unlock(&xe->usm.lock);
-		if (err) {
+		if (err < 0) {
 			xe_vm_close_and_put(vm);
 			return err;
 		}
+		err = 0;
 		vm->usm.asid = asid;
 	}
 
-- 
2.41.0

