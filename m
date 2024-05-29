Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16764C27C44
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 01:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8261112C8D;
	Wed, 29 May 2024 01:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QaPQ4m9H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5B0112C8B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 01:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716944727; x=1748480727;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5CkwzO55EzMAuk+e+WdVq9SUlqfUv+gGSF7eSYeYvvQ=;
 b=QaPQ4m9HD8nr+BwozE2jAytsWv2AzyTDv2qJ8o24Sp79oXcWSC/xkBX6
 2SmERjRkaCGD436bgEl57yJa1gNw8GhelW/g4wexKZGlei+qQ+MAN/PdI
 FpHzKkiCoIAM6YBoNB9sg8DXNl+I734IxCxcWw+yYnFU4JRdH8+iG0WHg
 TUZ3gMcSfl0ALH5FTMBSsHhdtnxMBBal0SlZjAVoguDunNhvfaFUwuBIO
 JgzzBTRDU95C75OJqs6hamzIAAXkalJno3Bw2Sg6bQltR+AsTDY5dibiv
 6gfTzr0d71PIFgjNA+htSfaliwssfrNVbfanuYDSz11XkzWo4UQL/zf/P w==;
X-CSE-ConnectionGUID: B/aZGDv5TI2IjzL1w0OQcw==
X-CSE-MsgGUID: ffM9Vv6tQUWY7LEHbm1zBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30849785"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="30849785"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:17 -0700
X-CSE-ConnectionGUID: PLsXwMXDQGGn8rUiuX06oQ==
X-CSE-MsgGUID: FF5iw+rFQtir0WCUaSt14Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="72700495"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 18:05:17 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 08/26] drm: Move GPUVA_START/LAST to drm_gpuvm.h
Date: Tue, 28 May 2024 21:19:06 -0400
Message-Id: <20240529011924.4125173-8-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240529011924.4125173-1-oak.zeng@intel.com>
References: <20240529011924.4125173-1-oak.zeng@intel.com>
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

