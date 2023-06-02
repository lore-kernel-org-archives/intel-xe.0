Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061A5C77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 17:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89A810E5E2;
	Fri,  2 Jun 2023 17:27:47 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3116810E5E2
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 17:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685726866; x=1717262866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pGSM6+5Z3ESBf8UzvELs8hybAHzcKh8/iw3tmVqHrmY=;
 b=Fku+2TZe6U+zfjNwbD10xTnyyI2JJ1RIv0872jponErpAeHiNTkkHxvL
 I4IJRXYvQvFLI77IiTGCnsW2S7wnRhZqBtDw62mjDwN6EHkKUuQeauLZa
 Slf9Ndfrk4sFWPXBn98zNjc1g9zg4r8hpZ8oE8aueBDCbKrKdVTvnHINc
 kwMdk9KTKnDfdN/5YhIxzJJUiGA5VZetS9TLEFOKWMgB5ovf1x8Hima5l
 UL93D1RJtoYhflkrfKZyAggxKoz6PQOalkiUarxutYZ44A+tAEke5tL/8
 OL8HYNwIVrMWvi2qEi9gB32lhpUoHXvGuB3p95k+z47tOmxpsVgO/PI8K A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="442299608"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="442299608"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:27:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="711034946"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="711034946"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:27:43 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 20:27:32 +0300
Message-Id: <20230602172732.1001057-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix unreffed ptr leak on engine lookup
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
the lock to prevent unreffed pointer escaping and
causing potential use-after-free after.

v2: remove branch prediction hint (Thomas)

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index b3036c4a8ec3..0e147bcefa68 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -161,10 +161,9 @@ struct xe_engine *xe_engine_lookup(struct xe_file *xef, u32 id)
 
 	mutex_lock(&xef->engine.lock);
 	e = xa_load(&xef->engine.xa, id);
-	mutex_unlock(&xef->engine.lock);
-
 	if (e)
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

