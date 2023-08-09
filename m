Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2CEC001B0
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 14:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289F510E445;
	Wed,  9 Aug 2023 14:00:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93E810E07F
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691589648; x=1723125648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wVM6Nnv846RV9EIzKP8KtLIWw1NPiI7kMiGkkDMUmPg=;
 b=UQqo+EuMKT9gZx64PnQ47JwFe5shZenvTIOK18sKDu1jwWi87xA2MTDv
 MpIxm+2DnTPvdHUK7C2699cLKxmp/EWPGImiPE4F2GYR59WWBpVOdhObw
 G5aJKfZLc5d7jcLeNS9RuT7pWVobXjErYURYT1THvSJIreRRNUPaoFdA4
 hm0A6Eff4VAKr48obtZIS6ks42fU0bSyWe6cKKxrLfsAEQI54jK/8QPHe
 htCJhZZrTUfqp0pkLRmidtZyBkdes4JBmt6Fimn2dGm168vGtytnDSSjh
 6mKNEeDIi3losFixmpRa2e9xbpUAGhH/6mKGOzV6PPpx/wrnmhv2iUF5f Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361257005"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="361257005"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 07:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1062479952"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="1062479952"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2023 07:00:47 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  9 Aug 2023 19:37:45 +0530
Message-Id: <20230809140746.1614908-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230809140746.1614908-1-tejas.upadhyay@intel.com>
References: <20230809140746.1614908-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 2/3] drm/xe: Interface xe drm client with fdinfo
 interface
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

DRM core driver has introduced recently fdinfo interface to
show memory stats of individual drm client. Lets interface
xe drm client to fdinfo interface.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     | 1 +
 drivers/gpu/drm/xe/xe_drm_client.c | 4 ++++
 drivers/gpu/drm/xe/xe_drm_client.h | 1 +
 3 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b79aaf7a66ab..e92706d5d0d2 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -160,6 +160,7 @@ static struct drm_driver driver = {
 
 	.dumb_create = xe_bo_dumb_create,
 	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
+	.show_fdinfo = xe_drm_client_fdinfo,
 	.release = &xe_driver_release,
 
 	.ioctls = xe_ioctls,
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 6349e50d0b5b..89f057ba2a22 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -32,3 +32,7 @@ void __xe_drm_client_free(struct kref *kref)
 	kfree(client);
 }
 
+void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
+{
+	/* show_meminfo() will be developed here */
+}
diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
index be097cdf5d12..6cd5a30d242d 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.h
+++ b/drivers/gpu/drm/xe/xe_drm_client.h
@@ -39,5 +39,6 @@ struct xe_drm_client *xe_drm_client_alloc(void);
 static inline struct xe_drm_client *
 xe_drm_client_get(struct xe_drm_client *client);
 static inline void xe_drm_client_put(struct xe_drm_client *client);
+void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
 
 #endif
-- 
2.25.1

