Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA31C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 13:08:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B578D10E040;
	Tue, 28 Mar 2023 13:08:38 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A7D10E040
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 13:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680008915; x=1711544915;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZzYBzu6mLhGb90H3ZMekN7hruMs5A5LXnVglKE1GOoU=;
 b=gtQIrYO0TKK7Ou6j9ejuA5L4P2uQQlxaPL8lXCL/v4gP+r6SdnWcFfVZ
 bw1vYpaSgeM0R7dBJnAt5/YrVFv0hu/kpQvg2R7HSDoKNRtkQtYfvVWZ/
 HspUNiya9EzrxaZ2mp7ocl5hwKWR4yvwHmOPF8zgPEsOhduRMiAs/88l6
 Z20b1s7OZEVwPWMVm65JZfcYKSguBf/qk+iBmXj+YE1M7avJobGiOqCKY
 XvRzGK8O5VE0mTlSk605e5RAHAY9exfFKj3cFsrwTYpiZbUyMfCSPCSgs
 kVMC2eJxUdK6u2lMgejNtv3PFuy/wlyD8m9utQWtA37w+AR0/c60NFCiv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="403170622"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="403170622"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 06:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="929872435"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="929872435"
Received: from pozgax-mobl.ger.corp.intel.com (HELO localhost) ([10.213.9.37])
 by fmsmga006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 06:08:30 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Mar 2023 15:08:26 +0200
Message-Id: <20230328130826.61029-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/bo: Return object bo size on create
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

Driver may alter bo size requested by the user. Return real object
size to make userspace aware how to arrange vm bindings.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e4d079b61d52..410e797931ac 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1564,6 +1564,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		return err;
 
 	args->handle = handle;
+	args->size = bo->size;
 
 	return 0;
 }
-- 
2.34.1

