Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BF2CAC58F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 21:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D5E10E9E8;
	Wed, 10 Sep 2025 21:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EqPsKlS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2588810E9E5
 for <Intel-Xe@lists.freedesktop.org>; Wed, 10 Sep 2025 21:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757538159; x=1789074159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YacWeOpcFTfXOAvRbfLJyppuY927wxn4s76CCKliLoQ=;
 b=EqPsKlS6F6xKMOoXq+pa4Bv6uZkpaH1+12bGICubjm/cKWHR/rI71zD0
 u6oGF5skx5TZv9Ta6ceV9GxC+XLiUn+Y296ar8Jn5dXdIV01vu/Mm939m
 dq+z+yVv7ymHm02qTrReCnrXEoy2uOPdywfBNbjoNK2MxLWurRlMjYic0
 +CoS5ux1h+7Ybb1FpUbbJ1ikWKLWLYhuz9OB6ryAnqadkaKTzSqU01M4U
 p8rqncrb2nyU57z/V/XE1Nw17e0Q6dC0xly32JlFTf7Xx08DilYY37g7B
 v+7ChDEfImLrdCiCr44tq5+LxHX6zDkHMFsg91ZElpG651NeU0mvKaKW0 Q==;
X-CSE-ConnectionGUID: Za6maPb1TYuijhSrCyv3Bg==
X-CSE-MsgGUID: fowcJpEwR6qrL1D2w8Cy8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70958645"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="70958645"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 14:02:38 -0700
X-CSE-ConnectionGUID: kUIbs/wIScS2tOhZioM/hw==
X-CSE-MsgGUID: AfwuehSsSUeGf2ACG61AFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="174311957"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa010.fm.intel.com with ESMTP; 10 Sep 2025 14:02:38 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v3 3/4] drm/xe: Allow freeing of a managed bo
Date: Wed, 10 Sep 2025 14:02:34 -0700
Message-ID: <20250910210237.603576-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250910210237.603576-1-John.C.Harrison@Intel.com>
References: <20250910210237.603576-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

If a bo is created via xe_managed_bo_create_pin_map() then it cannot be
freed by the driver using xe_bo_unpin_map_no_vm(), or indeed any other
existing function. The DRM layer will still have a pointer stashed
away for later freeing, causing a invalid memory access on driver
unload. So add a helper for releasing the DRM action as well.

v2: Drop 'xe' parameter (review feedbak from Michal W)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +++++
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e6d16b34e5b5..8422f3cab113 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2629,6 +2629,11 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
 	return bo;
 }
 
+void xe_managed_bo_unpin_map_no_vm(struct xe_bo *bo)
+{
+	devm_release_action(xe_bo_device(bo)->drm.dev, __xe_bo_unpin_map_no_vm, bo);
+}
+
 struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 					     const void *data, size_t size, u32 flags)
 {
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 33d7c122dcc9..a77af42b5f9e 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -116,6 +116,7 @@ xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
 			     u32 flags, u64 alignment, bool intr);
 struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 					   size_t size, u32 flags);
+void xe_managed_bo_unpin_map_no_vm(struct xe_bo *bo);
 struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 					     const void *data, size_t size, u32 flags);
 int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
-- 
2.49.0

