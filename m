Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D0ECD37AA
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 22:02:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4958C10E69F;
	Fri, 15 Sep 2023 22:02:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEFE10E69F
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 22:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694815368; x=1726351368;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0gnBwDbrzwXl8RigXvxdixKKy1vSfRWcBlBBz+Yx148=;
 b=PDK2OmTkMeyjIWymd2qofbxw6TW0mXay2yPtCECFzxFXTXmLJrE8yh3J
 SDG7TfmeykTvsCzH6AcHUR+/EkCxrVAaXYooPTyMi7nZeqn+qbowv8veg
 5bXeb/VEtPqu2KgDM1KfQfjznYz/arZPj6iodqAjsPBngvdt2QbEymzSk
 OnmpTkiF5YPbmVXqPDEQ+/QHWOgMetwLFMSjUw+CuaERtWbvrndbhHY+e
 TmXDsizncqFEi2AxuQFeokD7oPiqDkoa7k8myip09d9kVbq04iouxKwH6
 barDP0BB3NvurDLt0iT2jtwzO5HJTEUt40rRi04YrAnjh8umhwQo0qquX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="378262640"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="378262640"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 15:02:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="748331938"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="748331938"
Received: from hamzasye-mobl2.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.212.20.72])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 15:02:46 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 19:02:33 -0300
Message-ID: <20230915220233.59736-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Simplify final return from
 xe_irq_install()
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

At the end of the function, we will always return err no matter it's
value. Simplify this by just returning the result of
drmm_add_action_or_reset().

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 3f34c507ff59..ccb934f8fa34 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -603,11 +603,7 @@ int xe_irq_install(struct xe_device *xe)
 
 	xe_irq_postinstall(xe);
 
-	err = drmm_add_action_or_reset(&xe->drm, irq_uninstall, xe);
-	if (err)
-		return err;
-
-	return err;
+	return drmm_add_action_or_reset(&xe->drm, irq_uninstall, xe);
 }
 
 void xe_irq_shutdown(struct xe_device *xe)
-- 
2.42.0

