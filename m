Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561DBC7EE26
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 00:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E4D10E48E;
	Tue,  2 May 2023 00:17:33 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1414010E3F9
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 00:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682986649; x=1714522649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DqNzN/uSHWqR/PdjW8dwsE/LI0huyCcgosqRdc+aUms=;
 b=WlNxSEhsF7V3NxQ48ugeYHiY0VKr4ibbAj8E4J7SYdh/G7vFqu58yGDu
 EScydUMD/AcOcBYtAtGfOQTTnnuOyOt+XhYOWoz/AA3+9qZjtV+W7TNMx
 1bfH1VJAlDY4LOb+ZjIxxXaIYhAs+8UTJ9s7Ol7J7i8Dpkkc1LW7QHe3/
 mrsxU4HQ8zVLj4GK1nPPO2qgcADjVLvzzhtEIbUubqK+cm7ujxsYtWRrZ
 9IzD8RwuDi+IsAxUOaV7aecT5Re63ERo7ssUtXANRTbh106cu/PgttLbk
 tJY72mQvhCFkEKVKtEETXU27E7acd2smnAmrDbVW8bhhrZq1oQULE8L2C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332619566"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="332619566"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765541678"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="765541678"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 17:17:02 -0700
Message-Id: <20230502001727.3211096-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502001727.3211096-1-matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 06/31] drm/xe: Ensure LR engines are not
 persistent
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

With our ref counting scheme LR engines only close properly if not
persistent, ensure that LR engines are non-persistent.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index d1e84d7adbd4..91600b1e8249 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -596,7 +596,9 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 			return -ENOENT;
 
 		e = xe_engine_create(xe, vm, logical_mask,
-				     args->width, hwe, ENGINE_FLAG_PERSISTENT);
+				     args->width, hwe,
+				     xe_vm_no_dma_fences(vm) ? 0 :
+				     ENGINE_FLAG_PERSISTENT);
 		xe_vm_put(vm);
 		if (IS_ERR(e))
 			return PTR_ERR(e);
-- 
2.34.1

