Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E53C54E58
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 15:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C9A112EBA;
	Tue, 12 Mar 2024 15:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eb0VEQJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F224112EA3
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 15:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710257712; x=1741793712;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ae2HAg8/7AwD0arpvrs1DkHfA9jVfLQdzI9phDsRR6w=;
 b=Eb0VEQJ3hTN7CarIuP0RxgN4wR9G53Nq65Eikd5Dd4iLdb3mqN5EOjMM
 80nE03j6vqxFRjFlS1dAJ3630KZfMGsek2t1LDgurRwGoD+kW4mzFcVpT
 tKusT5ElO9P+lMYt2kYy+tkorGFiNh+K9SFpHp3NTzO0eWFFWmhGlOtB0
 M++GhWVreGjFAphY2m+nGuhcJ609y7dO7BkBhe1/d++K+gbdGRhwNU0Xl
 Z65oMFDapkiMZA5bw9exKxumuvvJ+zW64wHfyzcJdcWuazdhXe0mDUpOX
 W/CqsMtnNKMP24CIUjTDyhQ108qvPJ9xvBCgikvcyWQe90312PIhx84Mi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4830703"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4830703"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 08:35:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12178378"
Received: from amirafax-mobl4.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 08:35:11 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 6/7] drm/xe/bo: Allow eviction of unbound local bos
Date: Tue, 12 Mar 2024 16:34:58 +0100
Message-ID: <20240312153459.10185-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312153459.10185-1-thomas.hellstrom@linux.intel.com>
References: <20240312153459.10185-1-thomas.hellstrom@linux.intel.com>
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
index eddac9f93ef1..da1f28224057 100644
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

