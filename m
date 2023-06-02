Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE07BC7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 18:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C92F10E0D4;
	Fri,  2 Jun 2023 18:07:16 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75E210E0D4
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 18:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685729233; x=1717265233;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CuHfHVMXLo2Tp+8RY3NWU5hJUQ2InQeQ/dAdRSB697c=;
 b=coPkvaO68RBMOpeCzqtesSAxEv5I6o3fqKOzAuLW9f6HkUFAMH+uzYKi
 1CkPk5o0v6XaSGwK49To4TH7GLmSngPaiI99nmeSqu2kgfSa7CGGaxGou
 rFcIxMRNpNMAgWr+uRl+lJH0Cbr6zPTberA5jQWjsJ57TyAOhSVTvkYsU
 cYIJpH5Qgmn1qxpO+UsypcpZP1JjMEoLJnORZz2OEZv2zxEooZrOWOcG7
 GS7i1jY/ys0OQeeuKrKK2vG7K8Kmkm23GesujCRYopzVhj+bm/H3J1oeo
 uoEwA45NDLZaowsO9VMjyDBSOAOLvP+D4zBMMZUqTFU9m2YnpWX+FAms1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="419465148"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="419465148"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 11:07:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="658352120"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="658352120"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 11:07:12 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 11:07:02 -0700
Message-Id: <20230602180702.17380-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Use large rings for compute contexts
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
Cc: thomas.hellstrom@intel.com, chris.p.wilson@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Allow compute contexts to submit the maximal amount of work without
blocking userspace.

The original size for user LRC ring's (SZ_16K) was chosen to minimise
memory consumption, without being so small as to frequently stall in the
middle of workloads. With the main consumers being GL / media pipelines
of 2 or 3 batches per frame, we want to support ~10 requests in flight
to allow for the application to control throttling without stalling
within a frame.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index b3036c4a8ec3..47c9f119fb29 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -29,6 +29,7 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
 {
 	struct xe_engine *e;
 	struct xe_gt *gt = hwe->gt;
+	u32 ring_size;
 	int err;
 	int i;
 
@@ -65,8 +66,9 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
 		e->bind.fence_seqno = XE_FENCE_INITIAL_SEQNO;
 	}
 
+	ring_size = (e->class == XE_ENGINE_CLASS_COMPUTE) ? SZ_512K : SZ_16K;
 	for (i = 0; i < width; ++i) {
-		err = xe_lrc_init(e->lrc + i, hwe, e, vm, SZ_16K);
+		err = xe_lrc_init(e->lrc + i, hwe, e, vm, ring_size);
 		if (err)
 			goto err_lrc;
 	}
-- 
2.21.0.rc0.32.g243a4c7e27

