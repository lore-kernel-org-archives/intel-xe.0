Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039A6C3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 11:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F9B10E0A3;
	Thu,  8 May 2025 11:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BF3WyYCn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B4610E0A3
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746703790; x=1778239790;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jdSGOuPccOHhNwrCh8K+vtk5B1nLClkVYSehEQZ20q0=;
 b=BF3WyYCnCnGl9arwesKmcXstBn9jLj4kDWxBG0CKulmsOfBGy1AAhqjx
 BEeHOj7gWNHvnotZqMFGzvyziiLrGoOVJfBX9gnhDY1ae1HCUDzCNacfS
 LXI/1/+pTfDLuhJt56Doo63Ykb5IrFTl72DVL5mxKLuqzNlTjkQi9H9yp
 edct8JpDh+hH0cS3JPqRHZ4E1XPL3V8YcU0wa9xORcr+4FhgVnOQ93VAL
 83lsEDdgPd6nYLFpwBpY9FafX//4XdOBIOBcMNEk7how00VnnqVdFUotb
 pDnV6FwK2MBmtnFOGiagNrbeOPJDHNCHVxzm5u9NVSokBXugLgytyDHih g==;
X-CSE-ConnectionGUID: uQgR9SsISTuGFSFaurdXwA==
X-CSE-MsgGUID: c9O5pM4VQVKsfiRlBeHpUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52132826"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="52132826"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 04:29:49 -0700
X-CSE-ConnectionGUID: bKtdRW3DSeSIXiDl9EgStw==
X-CSE-MsgGUID: e0aGYQXXTwu4GgmxWmVt/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="141037710"
Received: from uaeoff-desk2.amr.corp.intel.com (HELO fedora..)
 ([10.124.222.207])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 04:29:47 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix the gem shrinker name
Date: Thu,  8 May 2025 13:29:31 +0200
Message-ID: <20250508112931.3347-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The xe buffer object shrinker name is visible in the
<debugfs>/shrinker directory and most if not all other shinkers
follow a naming convention that looks like
<subsystem>-<driver>_<objects>:<unique>
Follow the same convention for xe, changing the name to
drm-xe_gem:<unique>.

Other shrinkers typically use the device node for <unique> but
since drm drivers typically don't have a single unique device-
node, instead use the unique name in the drm device.

Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 8184390f9c7b..86d47aaf0358 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -227,7 +227,7 @@ struct xe_shrinker *xe_shrinker_create(struct xe_device *xe)
 	if (!shrinker)
 		return ERR_PTR(-ENOMEM);
 
-	shrinker->shrink = shrinker_alloc(0, "xe system shrinker");
+	shrinker->shrink = shrinker_alloc(0, "drm-xe_gem:%s", xe->drm.unique);
 	if (!shrinker->shrink) {
 		kfree(shrinker);
 		return ERR_PTR(-ENOMEM);
-- 
2.49.0

