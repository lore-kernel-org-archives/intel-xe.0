Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACC4D206A2
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 07:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E7110E28C;
	Wed, 16 Oct 2024 07:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C7rxmdPi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E9110E5E1
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 07:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729062365; x=1760598365;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ypjzJUjn+svYjOW67KC7A+WiMP5aPsL/Onxx1LjZJRc=;
 b=C7rxmdPi8NbMmMmQkeuZ/WzbMyEiFj1jUH3yh7W0/rzXLmCYbn7uA0dp
 QiJ0vjmLZg5amcgp3IZxqGEadNlops6bHAtMxTaZgLGkPc6J5MzrCAsdM
 qaTJmcnlPw1uqitMWp6D6MvVZ4n1Brvkyoo5Jdp+VzeSZPpDwjlH2MKp3
 yPfORlOVkyi6uUC7/wSKPBu5VlKiSpYpB0tYYg9fGQdHy7JqFjaSXxAAS
 4gyYRGLnr9PyrLo7a2cLkkuf1LUTdJuhIWqBIBMnIX+/vZK9b/+dgdAz3
 o0+vuFOELPs93BH7qANzGu2a4yQ13tO8j204qcQr54wSqEmGtOz7ZPjbK g==;
X-CSE-ConnectionGUID: 4xvPx3AMSw2mhVrfJHDXGg==
X-CSE-MsgGUID: Y6BCgGg1RiSbCkhNox2acw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28691290"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="28691290"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 00:06:05 -0700
X-CSE-ConnectionGUID: p1ZCWrigRROOeB5Ij9eHdA==
X-CSE-MsgGUID: lRu5vpL+T2C3BtLPBwT9uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="82790600"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.80])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 00:06:03 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] locking/ww_mutex: Adjust to lockdep nest_lock requirements
Date: Wed, 16 Oct 2024 09:05:54 +0200
Message-ID: <20241016070554.2888-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
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

When using mutex_acquire_nest() with a nest_lock, lockdep refcounts the
number of acquired lockdep_maps of mutexes of the same class, and also
keeps a pointer to the first acquired lockdep_map of a class. That pointer
is then used for various comparison-, printing- and checking purposes,
but there is no mechanism to actively ensure that lockdep_map stays in
memory. Instead, a warning is printed if the lockdep_map is freed and
there are still held locks of the same lock class, even if the lockdep_map
itself has been released.

In the context of WW/WD transactions that means that if a user unlocks
and frees a ww_mutex from within an ongoing ww transaction, and that
mutex happens to be the first ww_mutex grabbed in the transaction,
such a warning is printed and there might be a risk of a UAF.

Note that this is only problem when lockdep is enabled and affects only
dereferences of struct lockdep_map.

Adjust to this by adding a fake lockdep_map to the acquired context and
make sure it is the first acquired lockdep map of the associated
ww_mutex class. Then hold it for the duration of the WW/WD transaction.

This has the side effect that trying to lock a ww mutex *without* a
ww_acquire_context but where a such context has been acquire, we'd see
a lockdep splat. The test-ww_mutex.c selftest attempts to do that, so
modify that particular test to not acquire a ww_acquire_context if it
is not going to be used.

v2:
- Lower the number of locks in the test-ww_mutex
  stress(STRESS_ALL) test to accommodate the dummy lock
  introduced in this patch without overflowing lockdep held lock
  references.

v3:
- Adjust the ww_test_normal locking-api selftest to avoid
  recursive locking (Boqun Feng)
- Initialize the dummy lock map with LD_WAIT_SLEEP to agree with
  how the corresponding ww_mutex lockmaps are initialized
  (Boqun Feng)

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Maarten Lankhorst <maarten@lankhorst.se>
Cc: Christian König <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: maarten.lankhorst@linux.intel.com #v1
Tested-by: Boqun Feng <boqun.feng@gmail.com>
---
 include/linux/ww_mutex.h       | 14 ++++++++++++++
 kernel/locking/test-ww_mutex.c |  8 +++++---
 lib/locking-selftest.c         |  4 ++--
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
index bb763085479a..45ff6f7a872b 100644
--- a/include/linux/ww_mutex.h
+++ b/include/linux/ww_mutex.h
@@ -65,6 +65,16 @@ struct ww_acquire_ctx {
 #endif
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 	struct lockdep_map dep_map;
+	/**
+	 * @first_lock_dep_map: fake lockdep_map for first locked ww_mutex.
+	 *
+	 * lockdep requires the lockdep_map for the first locked ww_mutex
+	 * in a ww transaction to remain in memory until all ww_mutexes of
+	 * the transaction have been unlocked. Ensure this by keeping a
+	 * fake locked ww_mutex lockdep map between ww_acquire_init() and
+	 * ww_acquire_fini().
+	 */
+	struct lockdep_map first_lock_dep_map;
 #endif
 #ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
 	unsigned int deadlock_inject_interval;
@@ -146,7 +156,10 @@ static inline void ww_acquire_init(struct ww_acquire_ctx *ctx,
 	debug_check_no_locks_freed((void *)ctx, sizeof(*ctx));
 	lockdep_init_map(&ctx->dep_map, ww_class->acquire_name,
 			 &ww_class->acquire_key, 0);
+	lockdep_init_map_wait(&ctx->first_lock_dep_map, ww_class->mutex_name,
+			      &ww_class->mutex_key, 0, LD_WAIT_SLEEP);
 	mutex_acquire(&ctx->dep_map, 0, 0, _RET_IP_);
+	mutex_acquire_nest(&ctx->first_lock_dep_map, 0, 0, &ctx->dep_map, _RET_IP_);
 #endif
 #ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
 	ctx->deadlock_inject_interval = 1;
@@ -185,6 +198,7 @@ static inline void ww_acquire_done(struct ww_acquire_ctx *ctx)
 static inline void ww_acquire_fini(struct ww_acquire_ctx *ctx)
 {
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
+	mutex_release(&ctx->first_lock_dep_map, _THIS_IP_);
 	mutex_release(&ctx->dep_map, _THIS_IP_);
 #endif
 #ifdef DEBUG_WW_MUTEXES
diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-ww_mutex.c
index 10a5736a21c2..5d58b2c0ef98 100644
--- a/kernel/locking/test-ww_mutex.c
+++ b/kernel/locking/test-ww_mutex.c
@@ -62,7 +62,8 @@ static int __test_mutex(unsigned int flags)
 	int ret;
 
 	ww_mutex_init(&mtx.mutex, &ww_class);
-	ww_acquire_init(&ctx, &ww_class);
+	if (flags & TEST_MTX_CTX)
+		ww_acquire_init(&ctx, &ww_class);
 
 	INIT_WORK_ONSTACK(&mtx.work, test_mutex_work);
 	init_completion(&mtx.ready);
@@ -90,7 +91,8 @@ static int __test_mutex(unsigned int flags)
 		ret = wait_for_completion_timeout(&mtx.done, TIMEOUT);
 	}
 	ww_mutex_unlock(&mtx.mutex);
-	ww_acquire_fini(&ctx);
+	if (flags & TEST_MTX_CTX)
+		ww_acquire_fini(&ctx);
 
 	if (ret) {
 		pr_err("%s(flags=%x): mutual exclusion failure\n",
@@ -679,7 +681,7 @@ static int __init test_ww_mutex_init(void)
 	if (ret)
 		return ret;
 
-	ret = stress(2047, hweight32(STRESS_ALL)*ncpus, STRESS_ALL);
+	ret = stress(2046, hweight32(STRESS_ALL)*ncpus, STRESS_ALL);
 	if (ret)
 		return ret;
 
diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
index 6f6a5fc85b42..6750321e3e9a 100644
--- a/lib/locking-selftest.c
+++ b/lib/locking-selftest.c
@@ -1720,8 +1720,6 @@ static void ww_test_normal(void)
 {
 	int ret;
 
-	WWAI(&t);
-
 	/*
 	 * None of the ww_mutex codepaths should be taken in the 'normal'
 	 * mutex calls. The easiest way to verify this is by using the
@@ -1770,6 +1768,8 @@ static void ww_test_normal(void)
 	ww_mutex_base_unlock(&o.base);
 	WARN_ON(o.ctx != (void *)~0UL);
 
+	WWAI(&t);
+
 	/* nest_lock */
 	o.ctx = (void *)~0UL;
 	ww_mutex_base_lock_nest_lock(&o.base, &t);
-- 
2.46.0

