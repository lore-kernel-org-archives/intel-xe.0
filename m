Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F262C54E60
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 14:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE689112712;
	Tue, 12 Mar 2024 14:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBKBs0/u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADEA10FF70
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 14:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710252310; x=1741788310;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=j8dasSnN1yOSbi0FJGJIS9gmh9xdZpgmDmrcSL6/gMM=;
 b=oBKBs0/uEyRXePThAWgHGP5qhn2jA3cG0oVASPrQxJ9/TDI0Z/t5I8BA
 B77xQbDmc2iRXPUGBZ7d2TbbpYgz/fkJsBLwYuGb4u3g7d0I+VMkkFiuJ
 PBPVasyRlGXtHuHVMMKTHM8xlnZGRPZXIPj7WKtYRz9xLGBV2agCJpwb3
 +IoiXz0KU7FumbC1Q3jtKj4q3SU/+FxOfFOr/vj9esmF49FnTvwh5zH8c
 1Bcoh2iarveYbxmmwpRygTJGf0yvfTBVE+yr1q0YyRXesVp7Dq5/j8H8u
 qon4bCzxoODniVnNV9Y+Q31PQ2ysiWWUIPbXSX/5N+X/w2CP2lPEIDBmT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="22416000"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="22416000"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:05:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12148465"
Received: from amirafax-mobl4.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:05:09 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 6/7] drm/xe/bo: Allow eviction of unbound local bos
Date: Tue, 12 Mar 2024 15:04:46 +0100
Message-ID: <20240312140447.50437-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312140447.50437-1-thomas.hellstrom@linux.intel.com>
References: <20240312140447.50437-1-thomas.hellstrom@linux.intel.com>
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

Local bos that don't have any gpu_vmas set up are allowed
to be evicted. Support that.

Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index fb9878e13170..9b7fc51492ef 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1059,10 +1059,14 @@ static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
 		if (vm && !drm_gpuvm_is_extobj(&vm->gpuvm, &ttm_bo->base) &&
 		    vm->is_validating) {
 			xe_vm_assert_held(vm);
+			/* Not bound to the vm? */
+			if (list_empty(&ttm_bo->base.gpuva.list))
+				goto allow;
 			return false;
 		}
 	}
 
+allow:
 	return ttm_bo_eviction_valuable(ttm_bo, place);
 }
 
-- 
2.44.0

