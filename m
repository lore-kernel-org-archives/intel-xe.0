Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5253C77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 15:22:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A0110E18B;
	Fri,  2 Jun 2023 15:22:36 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B183510E18B
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685719354; x=1717255354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=21En8ksoJWN/FOt4EAb3U0bswxQWvweUfvzn1MVFahE=;
 b=gGMrcrGGK2sKmz9HFJ509lNp2OvpHoVCs4WLnx5ZuiK0xFGTc1HyPYQM
 HOfag9g8PexILl93Bx4WZde9T+u0eVC0bpavWbZt9MD1Ut2ycjttc2o9F
 Tp1bbIKlsOZDYR/V7dvw4iev3Kz93pKyWXWaULoafKSYvpszhJB2hGkdM
 83L/zOQOL7kN/IRKkeeIREz+9NztIAw2GWFSOsoSzPvPsphIothsgDkz4
 GpKx1a9HbNlbVvV73mhDVsaWjWb9wV3djDSm5LNXuQueDgsCJ679r7Nwt
 rit4uTASJvCSRaay6eu82vk7rCAC69m82U4gYXUZEw1qBOQw4n6qW7zVs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="442271119"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="442271119"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 08:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="685344514"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="685344514"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 08:22:13 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 18:21:49 +0300
Message-Id: <20230602152149.998293-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Get the engine ref while holding a lock
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

The engine xarray holds a ref to engine, guarded by the lock.
While we do lookup for engine, we need to take the ref inside
the lock to prevent potential use-after-free during
ioctls.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index b3036c4a8ec3..ec5a79c9f2a3 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -161,10 +161,9 @@ struct xe_engine *xe_engine_lookup(struct xe_file *xef, u32 id)
 
 	mutex_lock(&xef->engine.lock);
 	e = xa_load(&xef->engine.xa, id);
-	mutex_unlock(&xef->engine.lock);
-
-	if (e)
+	if (likely(e))
 		xe_engine_get(e);
+	mutex_unlock(&xef->engine.lock);
 
 	return e;
 }
@@ -641,26 +640,27 @@ int xe_engine_get_property_ioctl(struct drm_device *dev, void *data,
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_engine_get_property *args = data;
 	struct xe_engine *e;
+	int ret;
 
 	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
-	mutex_lock(&xef->engine.lock);
-	e = xa_load(&xef->engine.xa, args->engine_id);
-	mutex_unlock(&xef->engine.lock);
-
+	e = xe_engine_lookup(xef, args->engine_id);
 	if (XE_IOCTL_ERR(xe, !e))
 		return -ENOENT;
 
 	switch (args->property) {
 	case XE_ENGINE_GET_PROPERTY_BAN:
 		args->value = !!(e->flags & ENGINE_FLAG_BANNED);
+		ret = 0;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
-	return 0;
+	xe_engine_put(e);
+
+	return ret;
 }
 
 static void engine_kill_compute(struct xe_engine *e)
-- 
2.34.1

