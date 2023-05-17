Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECB3C7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 15:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A7D10E446;
	Wed, 17 May 2023 15:23:42 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E23310E446;
 Wed, 17 May 2023 15:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684337020; x=1715873020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kkLqJ3cCJniWzST0mH4nTp9MHVf4aGt3b6XaZGdoT0Y=;
 b=DFIqxYwF4LTtta/MFCLee7FSHQn8k0r+pUhRh6vZ4ApVFtBV4F9oQ8rO
 x98ZDYrTB3WiE1WgO3J+kTWJd6sjlZGaGCZUyPP+UvBbyyOEJUfoT65NN
 7VcCEYSparxZGvKYOvXDe51B2usRWU5uTay2gsvX4jM7kBw4sCVEH4Afu
 dQ8slotM3xD0QU8+VD5jeND5NNkb3LN/iuANA2oFLtpRsrTs3JmCtlRgz
 EAGf5dpaL33F+HRk6paJMVfT0RsPaxfx5NWpZvCtDtC3B3TbAxAZ4sAxp
 TzzZTjcNRVoVWiv5vNf33/Nb2b6TUEqvBkgheQfAbAvu9ycLGdnvdvh0H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="438132130"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="438132130"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 08:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="846129295"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="846129295"
Received: from fskirtun-mobl-g8.ger.corp.intel.com (HELO
 mwauld-desk1.intel.com) ([10.252.15.194])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 08:23:37 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 17 May 2023 16:22:38 +0100
Message-Id: <20230517152244.348171-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 1/7] drm: fix drmm_mutex_init()
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In mutex_init() lockdep seems to identify a lock by defining a static
key for each lock class. However if we wrap the whole thing in a
function the static key will be the same for everything calling that
function, which looks to be the case for drmm_mutex_init(). This then
results in impossible lockdep splats since lockdep thinks completely
unrelated locks are the same lock class. The other issue is that when
looking at splats we lose the actual lock name, where instead of seeing
something like xe->mem_access.lock for the name, we just see something
generic like lock#8.

Attempt to fix this by converting drmm_mutex_init() into a macro, which
should ensure that mutex_init() behaves as expected.

Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: e13f13e039dc ("drm: Add DRM-managed mutex_init()")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_managed.c | 26 --------------------------
 include/drm/drm_managed.h     | 23 ++++++++++++++++++++++-
 2 files changed, 22 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 4cf214de50c4..71c49819a7a2 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -263,29 +263,3 @@ void drmm_kfree(struct drm_device *dev, void *data)
 	free_dr(dr_match);
 }
 EXPORT_SYMBOL(drmm_kfree);
-
-static void drmm_mutex_release(struct drm_device *dev, void *res)
-{
-	struct mutex *lock = res;
-
-	mutex_destroy(lock);
-}
-
-/**
- * drmm_mutex_init - &drm_device-managed mutex_init()
- * @dev: DRM device
- * @lock: lock to be initialized
- *
- * Returns:
- * 0 on success, or a negative errno code otherwise.
- *
- * This is a &drm_device-managed version of mutex_init(). The initialized
- * lock is automatically destroyed on the final drm_dev_put().
- */
-int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
-{
-	mutex_init(lock);
-
-	return drmm_add_action_or_reset(dev, drmm_mutex_release, lock);
-}
-EXPORT_SYMBOL(drmm_mutex_init);
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index 359883942612..01f977e91933 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -105,6 +105,27 @@ char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
 
 void drmm_kfree(struct drm_device *dev, void *data);
 
-int drmm_mutex_init(struct drm_device *dev, struct mutex *lock);
+static inline void __drmm_mutex_release(struct drm_device *dev, void *res)
+{
+	struct mutex *lock = res;
+
+	mutex_destroy(lock);
+}
+
+/**
+ * drmm_mutex_init - &drm_device-managed mutex_init()
+ * @dev: DRM device
+ * @lock: lock to be initialized
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ *
+ * This is a &drm_device-managed version of mutex_init(). The initialized
+ * lock is automatically destroyed on the final drm_dev_put().
+ */
+#define drmm_mutex_init(dev, lock) ({					     \
+	mutex_init(lock);						     \
+	drmm_add_action_or_reset(dev, __drmm_mutex_release, lock);	     \
+})									     \
 
 #endif
-- 
2.40.1

