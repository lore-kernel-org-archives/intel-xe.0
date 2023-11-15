Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7FCC07548
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 11:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C579110E070;
	Wed, 15 Nov 2023 11:58:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D7010E070
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 11:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700049507; x=1731585507;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5WE+HcnQk/rTFD/1UAo0Qqq3heO5kOkg3R1Iy4yBE0Q=;
 b=DrosMTDSpF7RupdDAzKQSW38AUl0DOeNPKQP/BSEJeFz6r2LNA4IgV9E
 BB0XEN22BRhSTa7bYZJY6jdPOQhlZghDk2qmtppYnBsKfeujDkLsNQ6Ir
 4y1A9AZTjCKUNOOwwuIMh2Eo4dHgsZvGRK/DJCCLXsOBTbquJ0hEllF2G
 g3ik0rOsQ11ISgwcX5YKoProkZDOgIqsylj1JZvtEGN8cn4vnh5/3egwq
 6HIUBFawz7ZxzR9mZ2PL57ulo7yxQeUrKlfjs6o3zq5LKHEAVeMkv+23W
 RyoJvNDsWoy1jnMbzfcQeYn0tr8rfimmOv0RHofJwXk2XqDdx3iMgktPX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="375901429"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="375901429"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 03:58:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="882382093"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="882382093"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.24])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 03:58:25 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 12:58:16 +0100
Message-Id: <20231115115816.1993-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/kunit: Return number of iterated devices
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

In xe_call_for_each_device() we are already counting number of
iterated devices. Lets make that available to the caller too.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index a40879da2fbe..306ff8cb35cb 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -42,8 +42,8 @@ static int dev_to_xe_device_fn(struct device *dev, void *__data)
  * function. Across each function call, drm_dev_enter() / drm_dev_exit() is
  * called for the corresponding drm device.
  *
- * Return: Zero or the error code of a call to @xe_fn returning an error
- * code.
+ * Return: Number of devices iterated or
+ *         the error code of a call to @xe_fn returning an error code.
  */
 int xe_call_for_each_device(xe_device_fn xe_fn)
 {
@@ -59,7 +59,7 @@ int xe_call_for_each_device(xe_device_fn xe_fn)
 	if (!data.ndevs)
 		kunit_skip(current->kunit_test, "test runs only on hardware\n");
 
-	return ret;
+	return ret ?: data.ndevs;
 }
 
 /**
-- 
2.25.1

