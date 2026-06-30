Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFACC43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 13:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB9E10E1A3;
	Tue, 30 Jun 2026 13:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYBwUH8W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D533F10E1A3
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782826005; x=1814362005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jxdBpXKdRoYR3VHYDOhqhe3msn3CHZO8RB/SHuAB7Fo=;
 b=FYBwUH8WF7n3OmTj+QJR/wH74ZrcK19UQKhLJb6SdtewrPWr9cEpb9KF
 5loXAGaiBp2evCJN0GUcyAogJefOP/dR/pfE/zXWbRIAKLP/gpiFniYYt
 xG7kqggDdp1oMQDVBqR7YDqGArVtGAPB8KKw/Ogz7mRcfmTFmCpCxgnDS
 XDakK1NAMOqKwlU6xoLh7vGEGVJUbVJCvEWDQHcKB81EGe74pXYO079Db
 hLV3vhJIk/xkRkccGPPbMQn5XSN6VrdDeqbj/Kf5B6Gty+ARf3zCHzMa5
 IIGlWy16bXCtwrFyQ4u14ZxIAJw/vozUcobUWetpuGKQB2cN3sSTp+YDl A==;
X-CSE-ConnectionGUID: Uq5s5KMASr+UTrurwjYFBw==
X-CSE-MsgGUID: BUX8y87OQKCqytw5/QMLRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83623509"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="83623509"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:45 -0700
X-CSE-ConnectionGUID: 85y3qV7NRXmjKLT57Y1Rcw==
X-CSE-MsgGUID: Ti6HrfKqQFK5odIkP4I+uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="256182182"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 01/13] drm/xe/guc: Allow to print single KLV
Date: Tue, 30 Jun 2026 15:26:20 +0200
Message-ID: <20260630132633.32804-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630132633.32804-1-michal.wajdeczko@intel.com>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
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

We can decode and print all KLVs from the buffer, but it might be
helpful also to allow printing just single already decoded KLV.
Extract existing code into new function and make it public.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 54 ++++++++++++++++---------
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  1 +
 2 files changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index 97600edda837..3169c7f1eebf 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -76,6 +76,39 @@ const char *xe_guc_klv_key_to_string(u16 key)
 	}
 }
 
+/**
+ * xe_guc_klv_print_one() - Print single `GuC KLV`_.
+ * @key: KLV key
+ * @len: KLV length (in u32 dwords) of the KLV @value
+ * @value: KLV value (as array of @len u32 dwords)
+ * @p: the &drm_printer
+ *
+ * The buffer may contain more than one KLV.
+ */
+void xe_guc_klv_print_one(u16 key, u16 len, const u32 *value, struct drm_printer *p)
+{
+	const char *name = xe_guc_klv_key_to_string(key);
+
+	switch (len) {
+	case 0:
+		drm_printf(p, "{ key %#06x : no value } # %s\n", key, name);
+		break;
+	case 1:
+		drm_printf(p, "{ key %#06x : 32b value %u } # %s\n",
+			   key, value[0], name);
+		break;
+	case 2:
+		drm_printf(p, "{ key %#06x : 64b value %#llx } # %s\n",
+			   key, make_u64(value[1], value[0]), name);
+		break;
+	default:
+		drm_printf(p, "{ key %#06x : %zu bytes %*ph } # %s\n",
+			   key, len * sizeof(u32), (int)(len * sizeof(u32)),
+			   value, name);
+		break;
+	}
+}
+
 /**
  * xe_guc_klv_print - Print content of the buffer with `GuC KLV`_.
  * @klvs: the buffer with KLVs
@@ -101,26 +134,7 @@ void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct drm_printer *p)
 			return;
 		}
 
-		switch (len) {
-		case 0:
-			drm_printf(p, "{ key %#06x : no value } # %s\n",
-				   key, xe_guc_klv_key_to_string(key));
-			break;
-		case 1:
-			drm_printf(p, "{ key %#06x : 32b value %u } # %s\n",
-				   key, klvs[0], xe_guc_klv_key_to_string(key));
-			break;
-		case 2:
-			drm_printf(p, "{ key %#06x : 64b value %#llx } # %s\n",
-				   key, make_u64(klvs[1], klvs[0]),
-				   xe_guc_klv_key_to_string(key));
-			break;
-		default:
-			drm_printf(p, "{ key %#06x : %zu bytes %*ph } # %s\n",
-				   key, len * sizeof(u32), (int)(len * sizeof(u32)),
-				   klvs, xe_guc_klv_key_to_string(key));
-			break;
-		}
+		xe_guc_klv_print_one(key, len, klvs, p);
 
 		klvs += len;
 		num_dwords -= len;
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
index c676d21c173b..c7b7e61c1250 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
@@ -13,6 +13,7 @@ struct drm_printer;
 
 const char *xe_guc_klv_key_to_string(u16 key);
 
+void xe_guc_klv_print_one(u16 key, u16 len, const u32 *value, struct drm_printer *p);
 void xe_guc_klv_print(const u32 *klvs, u32 num_dwords, struct drm_printer *p);
 int xe_guc_klv_count(const u32 *klvs, u32 num_dwords);
 
-- 
2.47.1

