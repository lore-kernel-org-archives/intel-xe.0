Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651BAC87FCC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 12:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC2510E691;
	Wed, 30 Jul 2025 12:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f00eal8A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B21D10E690
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 12:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753878844; x=1785414844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CTpRucvwVyV4ZiRjmb7dwwHOqVpbaAjQL+YZFofdh+c=;
 b=f00eal8AbjzI9qXb+fXKnPr27BIgHRYHk8aYn+JYHd44LnSxRJaC8s/J
 O1gcypqcC+vbUSOdy0tq0yaVjG6fM4KqJ5CLyPtNUe5bzvP/xei5AfnZq
 AHOTY65W7+qYKj6FbCzQMfqAhxeUU/AqlJU8nRxHARfyabY8waegNl1ab
 x9+s0btYT/tKpwQx2rmPUZ8ciXAWnHYAkjlGu73jHQNzHz6GTGg1trWtO
 sbayk2eu5GV4rPUr1GGhPeW8im2KdnX69ViBSkvFlSPLc2p80Mn7JIkkS
 4sUN1EXRv1hg/pSrR4PV9VTOaaSw8eTSM6qHS0mL6ZgscFoJWkpyqGdhG w==;
X-CSE-ConnectionGUID: gQjFLODSRM2lLM5aXX2dJA==
X-CSE-MsgGUID: qnsYQfRlRnmOo1XWoFzrJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66450117"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66450117"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:34:04 -0700
X-CSE-ConnectionGUID: WxhOdQ3/RgGSJ45ZuzcMMg==
X-CSE-MsgGUID: q5ri1kJgSkmUPLTlnS8nOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186649438"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2025 05:34:02 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Caterina Shablia <caterina.shablia@collabora.com>
Subject: [PATCH v5 03/25] drm/gpuvm: Support flags in drm_gpuva_op_map
Date: Wed, 30 Jul 2025 18:30:28 +0530
Message-Id: <20250730130050.1001648-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
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

This change adds support for passing flags to drm_gpuvm_sm_map() and
sm_map_ops_create(), enabling future extensions that affect split/merge
logic in drm_gpuvm.

Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Caterina Shablia <caterina.shablia@collabora.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 include/drm/drm_gpuvm.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2d24d000f2ee..75c616fdc119 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -810,6 +810,12 @@ enum drm_gpuva_op_type {
 	DRM_GPUVA_OP_DRIVER,
 };
 
+/** DOC: flags for struct drm_gpuva_op_map
+ *  %DRM_GPUVM_SM_MAP_OPS_FLAG_NONE DEFAULT split and merge,
+ *  It cannot be combined with other flags.
+ */
+#define DRM_GPUVM_SM_MAP_OPS_FLAG_NONE 0
+
 /**
  * struct drm_gpuva_op_map - GPU VA map operation
  *
@@ -847,6 +853,13 @@ struct drm_gpuva_op_map {
 		 */
 		struct drm_gem_object *obj;
 	} gem;
+
+	/**
+	 * @flags: Bitmask of DRM_GPUVM_SM_MAP_* flags.
+	 * Use DRM_GPUVM_SM_MAP_OPS_FLAG_NONE (0) for default split merge.
+	 * It cannot be combined with other flags.
+	 */
+	u32 flags;
 };
 
 /**
-- 
2.34.1

