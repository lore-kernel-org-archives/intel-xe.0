Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7D9C7EE29
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 01:50:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366B610E239;
	Mon, 22 May 2023 01:50:36 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430D310E23C
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 01:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684720232; x=1716256232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0VKH3djgMFE3qh+sL4V/ETMk68SyLkKt936ARErGSmU=;
 b=IhKCiWubZynSx5pY9MoF5A6AoXJ/6yQNkUWqTs6hYWOk5F9BguZ8Ded3
 GxyTnKoj3/h7JoGZv/iDSHlrRb+LviTFGX3D3uf5ROfB7s2ayBjesDgnR
 H2QcB7F184zTzn6dsl6QiMH9S3QNIb7GSoe6NGILWjEEHEk4xpYvkgTXu
 91Iur/AyXp8XLvhprGczIkOoKpKaJSvS9p6CGKz1kDP6dyuYQiRt9mA0I
 jribBD2DGEVgqEenpWLHhQ8yupbtAj0EGyjH8hqCEdGlkUNRh6jYckNa9
 35borcY9+T33lg6ySlmpR6+EgNNi/5eG3zBUBn2Cq0W/Hvgxi0rijWUvN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="381030418"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; d="scan'208";a="381030418"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2023 18:50:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="697471413"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; d="scan'208";a="697471413"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2023 18:50:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Sun, 21 May 2023 18:50:38 -0700
Message-Id: <20230522015040.3849776-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522015040.3849776-1-matthew.brost@intel.com>
References: <20230522015040.3849776-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/8] drm/xe: Ensure LR engines are not persistent
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

With our ref counting scheme long running (LR) engines only close
properly if not persistent, ensure that LR engines are non-persistent.

v2: spell out LR

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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

