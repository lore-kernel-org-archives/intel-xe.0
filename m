Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F9EC02197
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 17:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB6610E045;
	Tue,  4 Feb 2025 17:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JPZVHVR4";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A856C10E02D;
 Tue,  4 Feb 2025 17:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jnLbw6zLT2w3VpZcFxS9fDj+1ony8crhdtBiG1TyMao=; b=JPZVHVR4TfGCtAmVbZ22ffVi6j
 XGASUXr7TS7PKmR8s3MO2z6fSUWqX/7WrBPotk4lehziQfwNXqnm6HxLsWOKNVDlE4oeLMuGx1//G
 gOYanY4OFSOH6MZZ/iaSVfxqRsmc7GWK23SSWJBbnLFyB3TpNCDUmbLLssvKIOrSnDxAK16ernfbZ
 mjZCPUEHuJwigmbSVCyppqkACdBCtiUPf3ubDIqL/hv4bs3DRTm3uHBPpJ3BWOCVM/uZgcoL1XlgM
 9weUEn/RMQuVA74M1pbi7k+OiUInGFqVmVZKpMxq7Zz90rTwFn5JttflQ243Y7Nd1rB5lyLlMsJv4
 v2CQeqPg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tfMtW-003WU4-KG; Tue, 04 Feb 2025 18:39:36 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t] lib/xe: Make running under Valgrind quiet
Date: Tue,  4 Feb 2025 17:39:33 +0000
Message-ID: <20250204173933.95751-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

Let Valgrind know which memory is initialised by ioctls so running tests
under it becomes less noisy.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 lib/igt_syncobj.c |  4 +---
 lib/xe/xe_query.c | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/lib/igt_syncobj.c b/lib/igt_syncobj.c
index a53393bd7245..4a62890b4bbf 100644
--- a/lib/igt_syncobj.c
+++ b/lib/igt_syncobj.c
@@ -197,14 +197,12 @@ int
 syncobj_wait_err(int fd, uint32_t *handles, uint32_t count,
 		 uint64_t abs_timeout_nsec, uint32_t flags)
 {
-	struct drm_syncobj_wait wait;
+	struct drm_syncobj_wait wait = { };
 
 	wait.handles = to_user_pointer(handles);
 	wait.timeout_nsec = abs_timeout_nsec;
 	wait.count_handles = count;
 	wait.flags = flags;
-	wait.first_signaled = 0;
-	wait.pad = 0;
 
 	return __syncobj_wait(fd, &wait);
 }
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index ec2b127b7e87..0d2e4805c8ee 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -9,6 +9,15 @@
 #include <stdlib.h>
 #include <pthread.h>
 
+#ifdef HAVE_VALGRIND
+#include <valgrind/valgrind.h>
+#include <valgrind/memcheck.h>
+
+#define VG(x) x
+#else
+#define VG(x) do {} while (0)
+#endif
+
 #include "drmtest.h"
 #include "ioctl_wrappers.h"
 #include "igt_map.h"
@@ -34,6 +43,8 @@ static struct drm_xe_query_config *xe_query_config_new(int fd)
 	query.data = to_user_pointer(config);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
+	VG(VALGRIND_MAKE_MEM_DEFINED(config, query.size));
+
 	igt_assert(config->num_params > 0);
 
 	return config;
@@ -62,6 +73,8 @@ static uint32_t *xe_query_hwconfig_new(int fd, uint32_t *hwconfig_size)
 	/* Perform the query to get the actual data */
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
+	VG(VALGRIND_MAKE_MEM_DEFINED(hwconfig, query.size));
+
 	*hwconfig_size = query.size;
 	return hwconfig;
 }
@@ -84,6 +97,8 @@ static struct drm_xe_query_gt_list *xe_query_gt_list_new(int fd)
 	query.data = to_user_pointer(gt_list);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
+	VG(VALGRIND_MAKE_MEM_DEFINED(gt_list, query.size));
+
 	return gt_list;
 }
 
@@ -117,6 +132,8 @@ static struct drm_xe_query_engines *xe_query_engines(int fd)
 	query.data = to_user_pointer(engines);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
+	VG(VALGRIND_MAKE_MEM_DEFINED(engines, query.size));
+
 	return engines;
 }
 
@@ -138,6 +155,8 @@ static struct drm_xe_query_mem_regions *xe_query_mem_regions_new(int fd)
 	query.data = to_user_pointer(mem_regions);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
+	VG(VALGRIND_MAKE_MEM_DEFINED(mem_regions, query.size));
+
 	return mem_regions;
 }
 
@@ -161,6 +180,8 @@ static struct drm_xe_query_oa_units *xe_query_oa_units_new(int fd)
 	query.data = to_user_pointer(oa_units);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
+	VG(VALGRIND_MAKE_MEM_DEFINED(oa_units, query.size));
+
 	return oa_units;
 }
 
-- 
2.48.0

