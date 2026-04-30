Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C933CCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 10:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179EA10F308;
	Thu, 30 Apr 2026 10:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mScpO4ZC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E5210F308
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 10:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777546419; x=1809082419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YgdMRv97Aoykai3yfwkzf8bU2pYQHJGE406anXdmJ0A=;
 b=mScpO4ZCvBgWBCQ65KGdso09oZlHHT4y9Hy+gVWfCJknujNBcF0sYXQP
 06LliSiNe1OQQgYzmw5YoXpofw4l4b8ai1M35I6gVh39yZDzq7A5B3vuC
 IXZKG6tjdAfAgZE545T+MEj7CeLivHNPnA06edauJOHYF/sY1M3NDxZDh
 s0iF9mJ3w+vyB9UxbxvIiwaVKntkqWg1feOwpq8RV5fj8UmaWlXujIOmm
 02tSbsj2xo+dhIZ0AzBjp08SqVkLBoubbwigfBKWt8D25pV8muC5e64Yt
 rSWT6zRykJFZozxz1d+DcYrqPJMfPD7GYE9wyhB7iKY9Gm9kj+wUVx3lu g==;
X-CSE-ConnectionGUID: Av7msf0TTYus/bvJf+i33w==
X-CSE-MsgGUID: OQvf4NFkTFmamghK0StZuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89586054"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="89586054"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:53:39 -0700
X-CSE-ConnectionGUID: b3hJMsNtRCWE6QUn+HUOTQ==
X-CSE-MsgGUID: /D9QjNkTSPGjrkg6yjmixg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233518895"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.250.15])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:53:34 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 19/24] drm/xe/eudebug: Allow getting eudebug instance during
 discovery
Date: Thu, 30 Apr 2026 13:51:15 +0300
Message-ID: <20260430105121.712843-20-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
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

From: Maciej Patelczyk <maciej.patelczyk@intel.com>

Allow to get eudebug instance even if discovery has not yet finished.

This is needed for internal queuing pagefault events if discovery is
running.

Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c | 35 +++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_eudebug.h |  2 ++
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 4e9977d33612..3f22924a1275 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -467,7 +467,7 @@ static int _xe_eudebug_disconnect(struct xe_eudebug *d,
 })
 
 static struct xe_eudebug *
-xe_eudebug_get_nolock(struct xe_file *xef)
+__xe_eudebug_get(struct xe_file *xef)
 {
 	struct xe_eudebug *d;
 
@@ -480,8 +480,22 @@ xe_eudebug_get_nolock(struct xe_file *xef)
 	if (!d)
 		return NULL;
 
-	if (xe_eudebug_detached(d) ||
-	    !completion_done(&d->discovery)) {
+	if (xe_eudebug_detached(d)) {
+		xe_eudebug_put(d);
+		return NULL;
+	}
+
+	return d;
+}
+
+static struct xe_eudebug *
+_xe_eudebug_get(struct xe_file *xef)
+{
+	struct xe_eudebug *d;
+
+	d = __xe_eudebug_get(xef);
+
+	if (d && !completion_done(&d->discovery)) {
 		xe_eudebug_put(d);
 		return NULL;
 	}
@@ -494,7 +508,20 @@ xe_eudebug_get(struct xe_file *xef)
 {
 	lockdep_assert_held(&xef->eudebug.ioctl_lock);
 
-	return xe_eudebug_get_nolock(xef);
+	return _xe_eudebug_get(xef);
+}
+
+struct xe_eudebug *
+xe_eudebug_get_nolock(struct xe_file *xef)
+{
+	return _xe_eudebug_get(xef);
+}
+
+/* Returns eudebug instance even if discovery is running */
+struct xe_eudebug *
+xe_eudebug_get_nolock_with_discovery(struct xe_file *xef)
+{
+	return __xe_eudebug_get(xef);
 }
 
 static int xe_eudebug_queue_event(struct xe_eudebug *d,
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index bd9fd7bf454f..b1f8a5fcc890 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -72,6 +72,8 @@ void xe_eudebug_ufence_init(struct xe_user_fence *ufence);
 void xe_eudebug_ufence_fini(struct xe_user_fence *ufence);
 bool xe_eudebug_ufence_track(struct xe_user_fence *ufence);
 
+struct xe_eudebug *xe_eudebug_get_nolock(struct xe_file *xef);
+struct xe_eudebug *xe_eudebug_get_nolock_with_discovery(struct xe_file *xef);
 void xe_eudebug_put(struct xe_eudebug *d);
 
 #else
-- 
2.43.0

