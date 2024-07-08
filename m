Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3830AC3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 20:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C90E10E415;
	Mon,  8 Jul 2024 20:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agyDWVQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1139710E40B
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 20:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720470070; x=1752006070;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aC+Fyl8RBc3S0chCIOUvOCBtWMwDPR+9v2vqNOmYCdY=;
 b=agyDWVQijRhVwl7y4D+b89JcWCHcGPBip9zN3x5rS4IVvGRGzUbWq6AG
 KGhFe7LKjUwrv7xAOcWiZ6ZiQGmkZGK1/D4w0xTtjOJkO69GO8Yrm7LkB
 I9ITi+o4NPAAaxjJSdT8eAflI0QdRiLKr8+C67Mnm0g0jAJ38/v2C0bpU
 s4/Yzr3m9WLELXRj7UnmEkIFU1+OWW/hWWomcl4QT2jSOFJwY8pocnclP
 D77EvHqb0fMeLPzikNFc7V8BarEWod4K8l5WeCZRs++6wKTFnbVAl5bGz
 oj4+TQAIWwnz3aeTd15IAEtUWDTbTVEW5xeGYX0I7G8VSFd9+mgPysj+2 g==;
X-CSE-ConnectionGUID: 9sZyov0iRROmMNARU7vrzw==
X-CSE-MsgGUID: Gvhb/wLOTGew9vYjSPaxkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="43114140"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="43114140"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 13:21:08 -0700
X-CSE-ConnectionGUID: 76MvaBPVTNKXSFwpsbwHOA==
X-CSE-MsgGUID: YTlWbWmTQhWstXaiCxc6wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="47494989"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 13:21:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH 2/5] drm/xe: Add ref counting for xe_file
Date: Mon,  8 Jul 2024 13:21:00 -0700
Message-Id: <20240708202103.3347869-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
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

Add ref counting for xe_file.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  7 +++++--
 drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index babb697652d5..e6eacf1bcce0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -87,11 +87,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	spin_unlock(&xe->clients.lock);
 
 	file->driver_priv = xef;
+	kref_init(&xef->refcount);
+
 	return 0;
 }
 
-static void xe_file_destroy(struct xe_file *xef)
+void xe_file_destroy(struct kref *ref)
 {
+	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
 	struct xe_device *xe = xef->xe;
 	struct xe_vm *vm;
 	unsigned long idx;
@@ -130,7 +133,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 		xe_exec_queue_put(q);
 	}
 
-	xe_file_destroy(xef);
+	xe_file_put(xef);
 }
 
 static const struct drm_ioctl_desc xe_ioctls[] = {
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index bb07f5669dbb..2a8b370b1fda 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -169,5 +169,17 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 }
 
 void xe_device_declare_wedged(struct xe_device *xe);
+void xe_file_destroy(struct kref *ref);
+
+static inline struct xe_file *xe_file_get(struct xe_file *xef)
+{
+	kref_get(&xef->refcount);
+	return xef;
+}
+
+static inline void xe_file_put(struct xe_file *xef)
+{
+	kref_put(&xef->refcount, xe_file_destroy);
+}
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c37be471d11c..ec2b0fb6afe1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -566,6 +566,9 @@ struct xe_file {
 
 	/** @client: drm client */
 	struct xe_drm_client *client;
+
+	/** @refcount: ref count of this xe file */
+	struct kref refcount;
 };
 
 #endif
-- 
2.38.1

