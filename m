Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D441C61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 15:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF4410E80B;
	Fri, 24 Nov 2023 15:34:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEE810E811
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 15:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700840055; x=1732376055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WkieQ64jUU9Ct8bqdZvMQ4Ps7tx+EDT8fhWyAlwN+fY=;
 b=WrWwjcvtkbZpbriEiazcBRD7lB7icbM4DOtcEwE4VXKL6fMsHktyl3zn
 2U5TOr2Y6/RM26Kg5AXYFDEYXS8Ib1eHahFkgl7ItfWCXbcKI+kjmGqNq
 UNSECErf1ekpGnggoCvlXq6KtCe+QmZm1gB0m11YmahEFP53KDva+g12v
 UxfnBxKlx7hKDmOOb4YEnd+luYab7En+aeFRsR9eZTsVZqp8i1qJC7VcC
 cI/60m6ycG5Lgt00DrESUD4OlJMu1/hk127a8qr0A9qe4IQ5BR9Yzp58v
 vdEyryUjN1eDbzelkLTD/6/CbI7oJOZ12Q98k0h428WdKjxKz0YZfCTPV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391315678"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="391315678"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:34:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="796615260"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="796615260"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.175])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:34:14 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 16:33:45 +0100
Message-ID: <20231124153345.97385-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124153345.97385-1-thomas.hellstrom@linux.intel.com>
References: <20231124153345.97385-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 4/4] drm/xe/vm: Fix ASID XA usage
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

xa_alloc_cyclic() returns 1 on successful allocation, if wrapping occurs,
but the code incorrectly treats that as an error. Fix that.
Also, xa_alloc_cyclic() requires xa_init_flags(..., XA_FLAGS_ALLOC), so
fix that, and assuming we don't want a zero ASID, instead of using
XA_FLAGS_ALLOC1, adjust the xa limits at alloc_cyclic time.

v2:
- On CONFIG_DRM_XE_DEBUG, Initialize the cyclic ASID allocation in such a
  way that the next allocated ASID will be the maximum one, and the one
  following will cause an ASID wrap, (all to have CI test high ASIDs
  and ASID wraps).
v3:
- Stricter return value checking from xa_alloc_cyclic() (Matthew Auld)

Suggested-by: Ohad Sharabi <osharabi@habana.ai>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Ohad Sharabi <osharabi@habana.ai> #v1
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 15 ++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.c     |  5 +++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8be765adf702..d60379d844d2 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -230,7 +230,20 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	init_waitqueue_head(&xe->ufence_wq);
 
 	drmm_mutex_init(&xe->drm, &xe->usm.lock);
-	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC1);
+	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
+
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+		/* Trigger a large asid and an early asid wrap. */
+		u32 asid;
+
+		BUILD_BUG_ON(XE_MAX_ASID < 2);
+		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, NULL,
+				      XA_LIMIT(XE_MAX_ASID - 2, XE_MAX_ASID - 1),
+				      &xe->usm.next_asid, GFP_KERNEL);
+		drm_WARN_ON(&xe->drm, err);
+		if (err >= 0)
+			xa_erase(&xe->usm.asid_to_vm, asid);
+	}
 
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

