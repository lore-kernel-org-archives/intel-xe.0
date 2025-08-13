Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77250CA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 10:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C6110E6DA;
	Wed, 13 Aug 2025 10:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2KResVl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5320B10E6DA
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755079992; x=1786615992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sImHL3TXhZ7iHGznaunduTkTU6HLYYYQjxnn0bs/ac0=;
 b=m2KResVlkFKf5bvdUnlMtKH5mQgxinEgA4fXYgNwq3pZ8o2Ls1BQWumh
 JXvet0usxEQp6/hrAvyDn9Vk1RhUMFHvbDn7gSVkbkBlANbSKjqziY3oD
 1qhO65vPvSZK0sWKtUn0wg8oVd6rZw2Q8vOPhbk7nFTY0OElYMZZWgWDd
 7Z4LbFE7fCgGRbbdhc3xzpaht7qhqMiKtRW858K5pe76sYD6R0NPRCs6C
 f69ZV3zbyuxfEaPbXZKz6W1L502/yyxNgquGjmwYgYxTBkyJmzPj2FA8m
 0fAcO+g7AbXhtEQsU9REmGiNUbECZgFQscKmJ4U0ScsyeF3PioZi7elUS w==;
X-CSE-ConnectionGUID: VKz8qUObSvKL1PO5hC485Q==
X-CSE-MsgGUID: d8F+tl5kSUCCVDBrefqKiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68745137"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="68745137"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:12:57 -0700
X-CSE-ConnectionGUID: ICIV3iBWT9a2vKLEmj6S3g==
X-CSE-MsgGUID: yWuQe0XZTnmZD7XWH1OEUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166061917"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:12:57 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Untangle vm_bind_ioctl cleanup order
Date: Wed, 13 Aug 2025 12:12:31 +0200
Message-ID: <20250813101231.196632-3-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250813101231.196632-1-christoph.manszewski@intel.com>
References: <20250813101231.196632-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Change the resource cleanup order to align with reverse allocation order.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6fd28b205453..c86337e08a55 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3567,7 +3567,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		q = xe_exec_queue_lookup(xef, args->exec_queue_id);
 		if (XE_IOCTL_DBG(xe, !q)) {
 			err = -ENOENT;
-			goto put_vm;
+			goto free_bind_ops;
 		}
 
 		if (XE_IOCTL_DBG(xe, !(q->flags & EXEC_QUEUE_FLAG_VM))) {
@@ -3613,7 +3613,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			       __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
 		if (!ops) {
 			err = -ENOMEM;
-			goto release_vm_lock;
+			goto free_bos;
 		}
 	}
 
@@ -3747,17 +3747,20 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 put_obj:
 	for (i = 0; i < args->num_binds; ++i)
 		xe_bo_put(bos[i]);
+
+	kvfree(ops);
+free_bos:
+	kvfree(bos);
 release_vm_lock:
 	up_write(&vm->lock);
 put_exec_queue:
 	if (q)
 		xe_exec_queue_put(q);
-put_vm:
-	xe_vm_put(vm);
-	kvfree(bos);
-	kvfree(ops);
+free_bind_ops:
 	if (args->num_binds > 1)
 		kvfree(bind_ops);
+put_vm:
+	xe_vm_put(vm);
 	return err;
 }
 
-- 
2.47.1

