Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5E4C77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 16:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA8B10E536;
	Wed,  7 Jun 2023 16:05:11 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC5010E532
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686153906; x=1717689906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1h0FCt0lVUqx0+rqtY4r6Q8i0ytCuPbL8WuhRjW5Jds=;
 b=cXSNLGhlXP+tblukGR/jGBD/mh57LFIH6YR5sC/I4lFbd3rG6c9eYSGZ
 KrRlO8M7biZ0mQ/Xxyiy7OKeJpclnSZArTAJ0i3WqmBNy+TDw5rnvb7kG
 iUQGVqz6uXhHcZR0vlu1uCZPA8/G4BKCgCJmlkGClCCjEPXu5XOPx6Gf7
 RjNW63AKH7jRPIc5xoXO1ycOsSlgvZDhA5te5l4Jeyom84HSy4zPE88H0
 rqkhX9n3HKeT1kzwzzy14gsAaiQ9roxjpWBR3Bl2lLhaaF+/YCKfGk5jc
 ysWyxkbMJmfSOacAn8JKHqIOvgjuOtGyz26OglWxbFxsz6oVIy0duDYCX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="336660344"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="336660344"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 09:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="822216352"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="822216352"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 09:03:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  7 Jun 2023 09:03:32 -0700
Message-Id: <20230607160334.4111289-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230607160334.4111289-1-matthew.brost@intel.com>
References: <20230607160334.4111289-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 6/8] drm/xe: Ensure LR engines are not
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

