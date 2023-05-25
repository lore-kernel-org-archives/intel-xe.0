Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C876C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 07:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057F710E7CD;
	Thu, 25 May 2023 07:42:08 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092B010E7CD
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685000526; x=1716536526;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MY1hDMpXzKe2E7Rht/LYBMHpRGx21j5s0ioeESAWLIw=;
 b=ZF+eJxIBDsETawNkcl62TghAlRex0hwx3Pqm1FzNkZTC89P9WRdXJ2hi
 sj62eq9IqaZchgp1kjkxr232d9wFS3Z3q82eqqiovEYktQYtj8oF5luqd
 1z0tXAW1V/OWudZq9FCR6TJTjqh8LIZk/jYTO7Y7q+dYTJbodR0I8Vgls
 CnoHB/Oxy9xOK1VfeE40JkK5DykGNwQqMTJbzul16WhRMIwWu6IgKzM84
 5S/Y37rXUU9N/eQSDm+XH09Prp/6ZSQOw8+bVXKLxbF5tG/ySekvdElrm
 r8d5YN9Y2F2qNQh41Hx7Pu5UJHWqrOLp99ERHqKxQ6TcfC+Ih/AdzegmN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="440174052"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="440174052"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 00:42:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="698879960"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="698879960"
Received: from lsilistr-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.226])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 00:42:03 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 09:41:44 +0200
Message-Id: <20230525074144.178961-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix vm refcount races
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

Fix a race in xe_vm_lookup() where the vm could disappear after
the lookup mutex unlock but before the get. The xe_vm_get() call
must be inside the lookup mutex.

Also fix a vm close race where multiple callers could potentially
succeed in calling xe_vm_close_and_put().

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a0306526b269..ac25afac89fd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1463,10 +1463,9 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
 
 	mutex_lock(&xef->vm.lock);
 	vm = xa_load(&xef->vm.xa, id);
-	mutex_unlock(&xef->vm.lock);
-
 	if (vm)
 		xe_vm_get(vm);
+	mutex_unlock(&xef->vm.lock);
 
 	return vm;
 }
@@ -1940,26 +1939,25 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_vm_destroy *args = data;
 	struct xe_vm *vm;
+	int err = 0;
 
 	if (XE_IOCTL_ERR(xe, args->pad))
 		return -EINVAL;
 
-	vm = xe_vm_lookup(xef, args->vm_id);
-	if (XE_IOCTL_ERR(xe, !vm))
-		return -ENOENT;
-	xe_vm_put(vm);
-
-	/* FIXME: Extend this check to non-compute mode VMs */
-	if (XE_IOCTL_ERR(xe, vm->preempt.num_engines))
-		return -EBUSY;
-
 	mutex_lock(&xef->vm.lock);
-	xa_erase(&xef->vm.xa, args->vm_id);
+	vm = xa_load(&xef->vm.xa, args->vm_id);
+	if (XE_IOCTL_ERR(xe, !vm))
+		err = -ENOENT;
+	else if (XE_IOCTL_ERR(xe, vm->preempt.num_engines))
+		err = -EBUSY;
+	else
+		xa_erase(&xef->vm.xa, args->vm_id);
 	mutex_unlock(&xef->vm.lock);
 
-	xe_vm_close_and_put(vm);
+	if (!err)
+		xe_vm_close_and_put(vm);
 
-	return 0;
+	return err;
 }
 
 static const u32 region_to_mem_type[] = {
-- 
2.39.2

