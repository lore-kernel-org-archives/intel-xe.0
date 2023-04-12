Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BCDC77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 11:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118B810E76C;
	Wed, 12 Apr 2023 11:11:37 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFF910E76D
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 11:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681297894; x=1712833894;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K8qqHXfnrRR1Y+OiyGlqDhABG0nBEosUu5anfzM1t+4=;
 b=cmcd/xixzXfVpgJ5j5EGryYV6oseOq0RZYuh5orfgNszrDKTfIWf7Dfx
 XSoBXEQ9WzvHxTpTGd7AmUNpKXHhc82KxHBjx+9GA0vAbmLuJkHdapm2c
 l9KpsJDkKJwt1fCW9m46YIIXiPYFdXmMOj+DV5kjGI9PUimmeviCbSfrY
 a4aVEVxpaJx1UDD8X9A384RX4E+8QyJTqxlIEtPN5CKP+LUTJ9u5XujMf
 fbFEo1lZOLQIigOxhgpOr05SnUbb041GgnfMwoWOTWl9ijnmPa43nC7Fr
 l0e8w/xlOjV34tu9AZKiIgB0CchuGcBVQhIu8C8OvTFij6cGwevtmEcR+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="345655443"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="345655443"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 04:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="691507583"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="691507583"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 04:11:31 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 14:09:23 +0300
Message-Id: <20230412110923.1081273-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: destroy clients engine and vm xarrays on
 close
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

xe_file_close cleanups the xarrays but forgets
to destroy them causing a memleak in xarray internals.
Found with kmemleak.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 45d6e5ff47fd..30415015db4a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -70,6 +70,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 		xe_engine_put(e);
 	}
 	mutex_unlock(&xef->engine.lock);
+	xa_destroy(&xef->engine.xa);
 	mutex_destroy(&xef->engine.lock);
 	device_kill_persistent_engines(xe, xef);
 
@@ -77,6 +78,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	xa_for_each(&xef->vm.xa, idx, vm)
 		xe_vm_close_and_put(vm);
 	mutex_unlock(&xef->vm.lock);
+	xa_destroy(&xef->vm.xa);
 	mutex_destroy(&xef->vm.lock);
 
 	kfree(xef);
-- 
2.34.1

