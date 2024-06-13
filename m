Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642DEC27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 15:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F5010EAB4;
	Thu, 13 Jun 2024 15:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dp8eJHDY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2566F10EACD
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718292043; x=1749828043;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5CkwzO55EzMAuk+e+WdVq9SUlqfUv+gGSF7eSYeYvvQ=;
 b=dp8eJHDYtbUPlklZo2NlIfFA2YLwC4NbSwkrVPbfy9XtArlCNTZz/BHd
 DU+dPztUTC5QfiZeMi0Pu7LSpIooL7Vm6xdZRoy3DfWwnkT7rldvH4CqP
 TkFdfJs1CcUC+30SqnacPGJPjvD+K1KAX7aoK3QMyBAcNF4fH6p2vbK8j
 QbguObAt1VMg6KpqAOUuSKmGlkVYIm6qarvY7aZTvTFINPgw3+0ADiPXG
 nffnI/nGv1qXyFnMUhALhyOIx0336+3wVV7Qd98MwKdhdFQzu5Yq/RSSL
 LnI1frT7AgLfu+C9vVbnONpp3QeCmuv4JO/V4ZD/ymN4GxQ3IvzplBOK/ A==;
X-CSE-ConnectionGUID: YDeXcY/4T/aRhU9aKRDhAA==
X-CSE-MsgGUID: R+veGF5PTF2bYIYZhHIxDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15348634"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="15348634"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:41 -0700
X-CSE-ConnectionGUID: KFaPfAfsR2mWHD5hyWvWQg==
X-CSE-MsgGUID: EGLqACeoSKG1Na2eQ6x++w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40135068"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:40 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 07/42] drm: Move GPUVA_START/LAST to drm_gpuvm.h
Date: Thu, 13 Jun 2024 11:30:53 -0400
Message-Id: <20240613153128.681864-7-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613153128.681864-1-oak.zeng@intel.com>
References: <20240613153128.681864-1-oak.zeng@intel.com>
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

Move them to .h file so they can be used outside of drm_gpuvm.c.
Also add a GPUVA_END micro.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 3 ---
 include/drm/drm_gpuvm.h     | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..7402ed6f1d33 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -867,9 +867,6 @@ __drm_gpuvm_bo_list_del(struct drm_gpuvm *gpuvm, spinlock_t *lock,
 
 #define to_drm_gpuva(__node)	container_of((__node), struct drm_gpuva, rb.node)
 
-#define GPUVA_START(node) ((node)->va.addr)
-#define GPUVA_LAST(node) ((node)->va.addr + (node)->va.range - 1)
-
 /* We do not actually use drm_gpuva_it_next(), tell the compiler to not complain
  * about this.
  */
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 00d4e43b76b6..429dc0d82eba 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -38,6 +38,10 @@ struct drm_gpuvm;
 struct drm_gpuvm_bo;
 struct drm_gpuvm_ops;
 
+#define GPUVA_START(node) ((node)->va.addr)
+#define GPUVA_LAST(node) ((node)->va.addr + (node)->va.range - 1)
+#define GPUVA_END(node) ((node)->va.addr + (node)->va.range)
+
 /**
  * enum drm_gpuva_flags - flags for struct drm_gpuva
  */
-- 
2.26.3

