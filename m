Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C478D767F7
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 18:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA4710E903;
	Thu, 31 Oct 2024 18:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cWsMzMge";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1B210E435
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730398223; x=1761934223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AXcFfS8xirhY0C64mg8MDSHdrnwePzC0+Ucvq+NrH0o=;
 b=cWsMzMgeYic0TtifF2WjGN6QfDH5YwAf8DCPkLe/KRWFKSJ26B5bsNrg
 JoSsuSwg7N4RwfGQoY3aBs6N3Gi3xvT//owUP2Ww5okrVZS+sWoXjnTwu
 GLMO+wk24XD5UfvBVyEzTNtbO1TMvGLaljPa782/00LdMwSLN7abw6Li7
 oWSQWr382NfXVNmulgb7X9HXJB3F4asv4dMzMWBjMSQz1zyTwOiQsJto5
 Rgj+F1RPsumGZRJcMQynHrOMY2NF31Qne0sG6TOtnn4ESDneDFfJBPVPO
 3KOoOqNQWYXuzmJEuHZQ3cHqH1tzHGb0MrN1rHEuTDHrP0X8wnQdN8/RJ Q==;
X-CSE-ConnectionGUID: EnYMUhfPSoSgvJ0gg2FVGQ==
X-CSE-MsgGUID: iKgqbTvXST2fRC6Li1Qrug==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41255867"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41255867"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:22 -0700
X-CSE-ConnectionGUID: sK3vHpVQS96VJNNBsBwveA==
X-CSE-MsgGUID: twiL58DASLaHXcQ8PQXwMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="86637560"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v6 1/8] drm/xe: Add xe_bo_vm_access
Date: Thu, 31 Oct 2024 11:10:41 -0700
Message-Id: <20241031181048.2948948-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031181048.2948948-1-matthew.brost@intel.com>
References: <20241031181048.2948948-1-matthew.brost@intel.com>
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

Add xe_bo_vm_access which is wrapper around ttm_bo_vm_access which takes
rpm refs for device access.

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5b232f2951b1..0261a8b29351 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1236,11 +1236,26 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	return ret;
 }
 
+static int xe_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
+			   void *buf, int len, int write)
+{
+	struct ttm_buffer_object *ttm_bo = vma->vm_private_data;
+	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
+	struct xe_device *xe = xe_bo_device(bo);
+	int ret;
+
+	xe_pm_runtime_get(xe);
+	ret = ttm_bo_vm_access(vma, addr, buf, len, write);
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
 static const struct vm_operations_struct xe_gem_vm_ops = {
 	.fault = xe_gem_fault,
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
-	.access = ttm_bo_vm_access
+	.access = xe_bo_vm_access,
 };
 
 static const struct drm_gem_object_funcs xe_gem_object_funcs = {
-- 
2.34.1

