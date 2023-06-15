Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F535EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 17:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5424210E534;
	Thu, 15 Jun 2023 17:32:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623CE10E530
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 17:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686850331; x=1718386331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1h0FCt0lVUqx0+rqtY4r6Q8i0ytCuPbL8WuhRjW5Jds=;
 b=K1+/qUgGKAT1/q1nCDx9r94UhYGIKozWK6v2457BBRIUpIzKik8zcjEQ
 zyQenk7DmbPl0pGcF+9C6KrMQ+sxrRtj/iwXKdGEzr6KH+WNifIF6Iovn
 BPLJXXU0WENUEcYtcSOs2MUJ2tpMmEEN/6bYVIlVELRA4ZXmZVhGODhdb
 nf+fHrnVhY85DgZerLUfPYzTLWfViX869VQyfdSiZoLrHv5zKKnT3C486
 FhieCnRjvs9Yd6l0Z0vE8E8TSfnxsR8gH1v59CjJ6rUcxyYNs9uIyj7K+
 mErftANjsb/e+4ZVNRt47YxWP1i6S2sxHmpnjY6R2hHJfTZ7zPN6TMsJF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="348695157"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="348695157"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 10:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742321906"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="742321906"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 10:30:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 15 Jun 2023 10:30:12 -0700
Message-Id: <20230615173014.258703-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615173014.258703-1-matthew.brost@intel.com>
References: <20230615173014.258703-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 6/8] drm/xe: Ensure LR engines are not
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

With our ref counting scheme long running (LR) engines only close
properly if not persistent, ensure that LR engines are non-persistent.

v2: spell out LR

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index eb5f66f07da8..48e2d1fb7d74 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -599,7 +599,9 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
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

