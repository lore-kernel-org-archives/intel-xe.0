Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4202DCD8CAA
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B247910F779;
	Mon,  8 Jun 2026 16:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSIuIM01";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C61B10F76F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937693; x=1812473693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dnhcRVG6dBhx+/eItK5Y0qEM+ciK4hgx0c8rMLqt2AY=;
 b=mSIuIM01xaaYyA90Go6ORHwZpMlb9mqUdxU1ZBg198+q7guXRfxOluH+
 9kjbqS+stidaUme4Flj1joHc02xlGEc4EwKKzF9ZTPhc6KLNvaSudnnzL
 jwLklwOFQz3xwhKYSFSWD5MMA2Y+luvtnWf+abUD5Ku8skhN3gzHmjTBC
 4nI0jOywMx/E5Cz1CaqpOhxT/JbFcoFrwkitVi+HkxSfB74S4hC4qdIwp
 ZYHoABEcAYhK8k4zdJ3d06e7BCdsIM8H3qQM0sc+u4gJbUusIBoIbkg31
 YXHEcEYis5QOnKTswIVMg1hkbP4pctyw9H2UfRBePPCalnEi6yt2vrTC/ A==;
X-CSE-ConnectionGUID: W3tkfnBpTKCs+gtP74c7Zg==
X-CSE-MsgGUID: iJAzHcB5TJupAtsPRkoYNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744563"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744563"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:53 -0700
X-CSE-ConnectionGUID: 1/j+YmsHRVu3D/RfHCo+Mg==
X-CSE-MsgGUID: XQN1dzFhQ9eCqOdI9uCUKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467580"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:51 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 10/16] drm/xe/tests: Fix fake xe_managed_bo_create_pin_map
Date: Mon,  8 Jun 2026 18:54:23 +0200
Message-ID: <20260608165429.587-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608165429.587-1-michal.wajdeczko@intel.com>
References: <20260608165429.587-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
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

To better mimic the behavior of the xe_managed_bo_create_pin_map()
we should also attempt to remove the GGTT node.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index 51e1e04001ac..c341e84b6004 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -16,6 +16,13 @@
 #define DUT_GGTT_START		SZ_1M
 #define DUT_GGTT_SIZE		SZ_2M
 
+static void remove_ggtt_node(void *arg)
+{
+	struct xe_ggtt_node *node = arg;
+
+	xe_ggtt_node_remove(node, false);
+}
+
 static struct xe_bo *replacement_xe_managed_bo_create_pin_map(struct xe_device *xe,
 							      struct xe_tile *tile,
 							      size_t size, u32 flags)
@@ -40,6 +47,10 @@ static struct xe_bo *replacement_xe_managed_bo_create_pin_map(struct xe_device *
 
 		bo->ggtt_node[tile->id] = xe_ggtt_insert_node(ggtt, xe_bo_size(bo), SZ_4K);
 		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo->ggtt_node[tile->id]);
+		KUNIT_ASSERT_EQ(test, 0,
+				devm_add_action_or_reset(xe->drm.dev,
+							 remove_ggtt_node,
+							 bo->ggtt_node[tile->id]));
 	}
 
 	return bo;
-- 
2.47.1

