Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D70DC197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 11:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258FF10E39E;
	Mon, 20 Nov 2023 11:19:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5341410E39E
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 11:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700479188; x=1732015188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G93oZV4BJacA5zAxa7rrRBn3rq0TQSU8tNC8OMzW6eM=;
 b=BMF349thA911mSpk6C4IsR58knf16/fGElcYF/GUFrFi2iP3Zy26gXzq
 GG2yRboZ42ypDUuHK1A6sS+ZVy7l1te1T+jX+gj6bd5jKZoEFc8XqOId4
 T9ozG/rjSPYvOOYor5E7zpb3kzU/YHQMQebk27w+wq4xQvt/HSRFd1r6y
 uMGZy8sHwzP6HiEONsM1Imtykv0Mb+56OTNOF6iSuMbLoB2AIemFgmgZ/
 JUjbqi69pNzfxnNyVfFElK3fy7DpVJ/Sq5kF6VQsJOjimCPDt6U2bB67g
 +326zlPv7FUBMZGefb0Z0OC8FEXfUZu8UJTHE1pCMWLwFN74CKmWPucs6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="394447726"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="394447726"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 03:19:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="1013559423"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="1013559423"
Received: from kdaxer-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.249.46.237])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 03:19:43 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date: Mon, 20 Nov 2023 12:19:23 +0100
Message-ID: <20231120111923.232396-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Remove unnecessary "ret" variable
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
Cc: intel-xe <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Just a trivial removal of "ret" that doesn't have a good reason
to exist.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8be765adf702..f5c7f19033e2 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -50,16 +50,15 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_drm_client *client;
 	struct xe_file *xef;
-	int ret = -ENOMEM;
 
 	xef = kzalloc(sizeof(*xef), GFP_KERNEL);
 	if (!xef)
-		return ret;
+		return -ENOMEM;
 
 	client = xe_drm_client_alloc();
 	if (!client) {
 		kfree(xef);
-		return ret;
+		return -ENOMEM;
 	}
 
 	xef->drm = file;
-- 
2.42.0

