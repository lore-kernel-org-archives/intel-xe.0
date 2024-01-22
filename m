Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBABC4725D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 13:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E253310EE96;
	Mon, 22 Jan 2024 13:18:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7DD10EE96
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 13:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705929526; x=1737465526;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fb50B2tOpnwNYrPjKAzblL53YqZzkjw6s8ehRUjpgtU=;
 b=QGTLoxJ9rSVyOJLqVfK5mnAbrXPTUhrecjPLVeJtTYgJs8uPFm1mMDDo
 R+Iq7S/9cfRe8L+jrGYR30brPH4k/qBgbPW7unyN4znC27fwX9R+6w8Bq
 2b+/4LyHvIeDRVdYmo5+qnFa484aGNGiC2AnJWxZqsYVZdBo9bUDbkxhs
 1+08S2pdi3a+YZ0qY0J6BKyh2ffxFHUtthqbXgYDxqmDRUTqRdWugHDJG
 OcNAqDQ34/bzmh7u+KcE2Vcm7V9XOWwOt9QYA9kFI0ow6Lbr6ZuAb09Kk
 0ZMh4walw19DN5bMWcGyGkhbwNuVnrx2aeGLDEFXb8g1Lc9sPzt7TAMT6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7953960"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7953960"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 05:18:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="928990150"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="928990150"
Received: from mstribae-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.89])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 05:18:38 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] drm/exec, drm/gpuvm: Prefer u32 over uint32_t
Date: Mon, 22 Jan 2024 14:18:28 +0100
Message-ID: <20240122131828.12444-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

The relatively recently introduced drm/exec utility was using uint32_t
in its interface, which was then also carried over to drm/gpuvm.

Prefer u32 in new code and update drm/exec and drm/gpuvm accordingly.

Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Danilo Krummrich <dakr@redhat.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/drm_exec.c | 2 +-
 include/drm/drm_exec.h     | 4 ++--
 include/drm/drm_gpuvm.h    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 48ee851b61d9..2da094bdf8a4 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -76,7 +76,7 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
  * If nr is non-zero then it is used as the initial objects table size.
  * In either case, the table will grow (be re-allocated) on demand.
  */
-void drm_exec_init(struct drm_exec *exec, uint32_t flags, unsigned nr)
+void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr)
 {
 	if (!nr)
 		nr = PAGE_SIZE / sizeof(void *);
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index f1a66c048721..aa786b828a0a 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -18,7 +18,7 @@ struct drm_exec {
 	/**
 	 * @flags: Flags to control locking behavior
 	 */
-	uint32_t		flags;
+	u32                     flags;
 
 	/**
 	 * @ticket: WW ticket used for acquiring locks
@@ -135,7 +135,7 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
 	return !!exec->contended;
 }
 
-void drm_exec_init(struct drm_exec *exec, uint32_t flags, unsigned nr);
+void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr);
 void drm_exec_fini(struct drm_exec *exec);
 bool drm_exec_cleanup(struct drm_exec *exec);
 int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 9060f9fae6f1..00d4e43b76b6 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -518,7 +518,7 @@ struct drm_gpuvm_exec {
 	/**
 	 * @flags: the flags for the struct drm_exec
 	 */
-	uint32_t flags;
+	u32 flags;
 
 	/**
 	 * @vm: the &drm_gpuvm to lock its DMA reservations
-- 
2.43.0

