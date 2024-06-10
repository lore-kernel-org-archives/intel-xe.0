Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8A5C27C6E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 15:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C7D10E3C6;
	Mon, 10 Jun 2024 15:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGL1gyRL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2357C10E391
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718032856; x=1749568856;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=O9x72fNhFTU1RK12z2+rpcgrCpJ2G95ErdeNIYIrp64=;
 b=gGL1gyRLEB94Wgwit5puEw0v3tSgM2wb75KLjP0gWH81woum19qKFf1M
 vPafFz+P5k6IDfVIjvtOhp1060cz5BT3LYP0bGztCvZEbNAL0U7M8sWQ7
 un61xIJIdWRF/as4rFlCYYE9pVB3MEFMYlkFhiAvk9sVoQ+eHcMzHFOLz
 mbd6BXwxprOO4hC4KQYGcKDHU8m920seurxWSN8AeGNeXlOYPuO0GN9IW
 oNSB0S3WPfs6wiNphBVL3LveHHGy3YbAiiNffL27S2emY5gaFNphY4x5n
 nb/wkh4icJ7pExmJdk55F0JBn8Y2RItLr72wLCXwqkuRIwpqJcclL+VxO w==;
X-CSE-ConnectionGUID: 7oWVKw4mQbufVIiRwix79Q==
X-CSE-MsgGUID: U746xh+FQQy21qGbFqVULQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14820721"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14820721"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 08:20:30 -0700
X-CSE-ConnectionGUID: NTPS7fwzTLeABwdy6XVBeQ==
X-CSE-MsgGUID: 71U3F5ZYSxG6E0DJ5ZTqjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43529295"
Received: from carterle-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.62])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 08:20:30 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 3/3] drm/xe/xe-for-ci: Check whether oom was due to ww mutex
 error injection
Date: Mon, 10 Jun 2024 17:20:17 +0200
Message-ID: <20240610152017.43436-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240610152017.43436-1-thomas.hellstrom@linux.intel.com>
References: <20240610152017.43436-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When CONFIG_DEBUG_WW_MUTEX_SLOWPATH is enabled, which it is in CI, but
not in production kernels, an injected -EDEADLK error will, due to
limitations in TTM, cause false OOM notifications.

Check whether the OOM was likely caused by an -EDEADLK injection and in
that case, rerun the validation.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3399c7e5bf4d..4d10049a962e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -337,6 +337,19 @@ static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
 	/* TODO: Inform user the VM is banned */
 }
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+
+static bool xe_exec_contention_injected(struct drm_exec *exec)
+{
+	return !!exec->ticket.contending_lock;
+}
+
+#else
+
+#define xe_exec_contention_injected(_a) (false)
+
+#endif
+
 /**
  * xe_vm_validate_should_retry() - Whether to retry after a validate error.
  * @exec: The drm_exec object used for locking before validation.
@@ -356,7 +369,10 @@ static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
  */
 bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, bool *exclusive)
 {
-	if (err != -ENOMEM || *exclusive)
+	if (err == -ENOMEM && *exclusive && xe_exec_contention_injected(exec))
+		return true;
+
+	if (err != -ENOMEM || *exclusive)	  
 		return false;
 
 	*exclusive = true;
-- 
2.44.0

