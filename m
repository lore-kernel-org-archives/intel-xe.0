Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B142C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 19:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296A610E17D;
	Tue, 28 Nov 2023 19:42:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FB810E17D
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 19:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701200531; x=1732736531;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1BvEkPh3Q9gbrR8xdz2cr1LQ3Zs2LPR8Y8+PplEXneQ=;
 b=J2+fqhEAruMPer/pgEpH50GmCRWhCpp83VOQg/mr5LVqKJq8Eek8cpxr
 68jNfNRZA89TZcnPkXzWWcz4VKkDWxaDFsg0jV14cqOVV53Cbu3hSx7p1
 3QqfxjOlVs/u6UU60kRvDAFFlqRm/aag3DeAv7qW+N7D39sNBqJ7inkXR
 QivnuHWxzMnbeF1KS4XeHZDqLH6YmzhuD8+tzoA9rrPW4pac72jRrO282
 QGWIoqe4SXBQqvIh+R33fjIvJelM+rwIEhXc76pagJSEGaG1mG13JQTQx
 nluAgOhCNB/h1xy6QRKJlZCy0mQTDEy1cRb8KsHG6G+abdylpEdz1JoQ9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="395828861"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="395828861"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 11:42:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="1100226590"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="1100226590"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.140.124])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 11:42:09 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 20:42:02 +0100
Message-Id: <20231128194202.1103-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI] drm/xe/kunit: Return number of iterated devices
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
We will use that functionality in upcoming patches.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

