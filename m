Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4256B606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 18:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a3SZ59qe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89AC10E475;
	Tue, 27 Oct 2026 18:37:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAB010F799
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 18:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793126214; x=1824662214;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3/HO2omzXJIs7mQwQ7vFsYXGCdGDfPtp4Glk07QP36U=;
 b=a3SZ59qeMjAALBlwVhBJfugHpUkv9PFp+86aapX+IoyWMl0Ce9ZfRPbR
 +PA6kdAL64KeKAVmO6BcORc29PvshnBtEbeK1iYKqcXbl9WJtbncCi6jR
 56gpmf3oL45AtadRIKP043ZRiVa/yCnef1i+B7AkjQl/VaFCLsfIhPgDr
 YAoNirfBf8tUnFq7Gh1wQEOvwgsF4Q7PQmXIhyNfwVpyKjfUH7Ap6M86j
 O2t3kZJm+Z9k5VrXh1hGpp5SKo7A0ldSiQovYigOsgmQwoSBSkWN6SybG
 LcYWCFt4icRB2FmdmDGBcLp/rnOYrCmqxUvwejTsz06rtLIQHBsbg9g0x Q==;
X-CSE-ConnectionGUID: 2fNLp+0qSOqUjnm5dQUKxA==
X-CSE-MsgGUID: UiJNlyjrQaGlDNljJ03zMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1725996"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1725996"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 11:36:43 -0700
X-CSE-ConnectionGUID: 9l/sDuYkSZyKt2tyKn5WXg==
X-CSE-MsgGUID: S2SAKYB6RwmqOZrN8aAYMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4579014"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 11:36:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 3/5] drm/xe: Leave the VM bulk move on BO release,
 not on GEM close
Date: Tue, 27 Oct 2026 11:36:36 -0700
Message-Id: <20261027183638.1031299-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027183638.1031299-1-matthew.brost@intel.com>
References: <20261027183638.1031299-1-matthew.brost@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_gem_object_close() drops a VM private BO out of the VM's LRU bulk
move as soon as the GEM handle goes away. A BO can easily outlive its
handle though, since every VM bind holds a reference, and such a BO is
still very much part of the VM's working set.

Once detached, it no longer rides along with the bulk move on exec, so
nothing ever bumps its LRU position again. It just sits where it was
left, orphaned ahead of genuinely colder BOs, and is evicted or shrunk
first even while the VM keeps using it.

Do the detach in xe_ttm_bo_release_notify() instead, where the BO
really is going away. The BO holds a reference to its VM, so the bulk
move is still alive at that point.

Assisted-by: LLM
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 42a6aa1a2e4a..ba16b260dbcb 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1869,6 +1869,14 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 	if (!xe_ttm_bo_lock_in_destructor(ttm_bo))
 		return;
 
+	/*
+	 * Leave the VM's bulk move, which is only kept alive by the VM, and
+	 * whose LRU position no longer says anything about a BO on its way
+	 * out.
+	 */
+	if (ttm_bo->bulk_move)
+		ttm_bo_set_bulk_move(ttm_bo, NULL);
+
 	/*
 	 * Scrub the preempt fences if any. The unbind fence is already
 	 * attached to the resv.
@@ -2060,20 +2068,6 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
 	ttm_bo_fini(container_of(obj, struct ttm_buffer_object, base));
 }
 
-static void xe_gem_object_close(struct drm_gem_object *obj,
-				struct drm_file *file_priv)
-{
-	struct xe_bo *bo = gem_to_xe_bo(obj);
-
-	if (bo->vm && !xe_vm_in_fault_mode(bo->vm)) {
-		xe_assert(xe_bo_device(bo), xe_bo_is_user(bo));
-
-		xe_bo_lock(bo, false);
-		ttm_bo_set_bulk_move(&bo->ttm, NULL);
-		xe_bo_unlock(bo);
-	}
-}
-
 static bool should_migrate_to_smem(struct xe_bo *bo)
 {
 	/*
@@ -2408,7 +2402,6 @@ static int xe_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct
 
 static const struct drm_gem_object_funcs xe_gem_object_funcs = {
 	.free = xe_gem_object_free,
-	.close = xe_gem_object_close,
 	.mmap = xe_gem_object_mmap,
 	.export = xe_gem_prime_export,
 	.vm_ops = &xe_gem_vm_ops,
-- 
2.34.1

