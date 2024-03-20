Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19E1CD11DC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 10:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E8C10F5C4;
	Wed, 20 Mar 2024 10:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ebq86ZX4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC38A10F58B
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 10:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710929451; x=1742465451;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ae2HAg8/7AwD0arpvrs1DkHfA9jVfLQdzI9phDsRR6w=;
 b=ebq86ZX4JwATRvjHc7+FGHJfrgA7UxX2k+6dvFbRxcX+xAf5/mJxnDwg
 BlsJ+RHAHKUnVJVL7FlVNGENQHuGN4zth72OEMc162VV3eR/r2ls13LQJ
 OOy14htu8GbRvrwzGhlmkqq98njUT576Ozdd2cmJiRCKUxHnqO1oTv5HJ
 0C7hLm0U+pSnt6ZqH1UhtLZnJSKwrDF7tB1dSEcZsryzNGCackfIYSN00
 JriUykSs7X2yain+RN/pkHQSAjawhampsZQ33wvtamDPLASh1zXiuaiZp
 UOiBOdL9SiKVdCkmuPy9BcfDq9q/5lZ5poF0zvGdR+nOxYIMiG0IfkR7C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5723777"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="5723777"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 03:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="37232903"
Received: from suntharx-mobl1.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.177])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 03:10:35 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 7/8] drm/xe/bo: Allow eviction of unbound local bos
Date: Wed, 20 Mar 2024 11:10:19 +0100
Message-ID: <20240320101020.5611-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240320101020.5611-1-thomas.hellstrom@linux.intel.com>
References: <20240320101020.5611-1-thomas.hellstrom@linux.intel.com>
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

