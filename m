Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB17C61D90
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 19:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F3710E589;
	Tue, 21 Nov 2023 19:52:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDDD10E589
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 19:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700596361; x=1732132361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/9f3Xj5c6y/S6VYwNJ8NCTpizmYVuYaKvxdmIjj4hn8=;
 b=IWCti6DcTCLTulG2UpjJMzCjt9QRRx10Zh2YoUxqEHIK13MrJDk35ddp
 3j6BmXCMci5AF7G3Y4Xz60VKJ4lOcb8Eg9CQmsYLlYY8Li58yWYT9jYlq
 tC5MoLmoW7wpw2O8LWvbID7IkymFALjZi6s2WeQEtTQ/Rtj+2OnmSErFi
 PT1OkkxuUASidAyGSPm5TR5ZYKtJMiCBMJHxC6RnBcvCcgcvZAe6+FZyf
 e0TPBJz/MYVDzJCbTa5aDyocnFmwuRNx/AtWiyzlhXarvRspGZGZuGAyc
 fJ2MFLv/sShNLP7rF1T3uwaV+Pmoef0cRsvEKvTSqE2aNk99r1gKaYpDQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="372089870"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="372089870"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 11:52:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="766760210"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="766760210"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 11:52:40 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Nov 2023 11:52:09 -0800
Message-Id: <20231121195209.802235-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231121195209.802235-1-lucas.demarchi@intel.com>
References: <20231121195209.802235-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Sync MTL PCI IDs with i915
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For Xe1 platforms, it's better to follow the way i915 adds the PCI IDs
to the header, so it's easier to catch up when there is an update. This
brings the same logic applied in commit 2e3c369f23a7 ("drm/i915/mtl:
Eliminate subplatforms") to the equivalent xe header.

The end result of this header for Xe1 platforms is now in sync with i915
as of commit 5032c607e886 ("drm/i915: ATS-M device ID update"). This can
be seen by

	$ git show 5032c607e886:include/drm/i915_pciids.h > a.h
	$ git diff --color-words  --no-index a.h include/drm/xe_pciids.h

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/drm/xe_pciids.h | 37 +++++++++----------------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index c7d73d6476c8..3011d99a05c5 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -173,6 +173,15 @@
 	XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
 	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
 
+/* MTL / ARL */
+#define XE_MTL_IDS(MACRO__, ...)		\
+	MACRO__(0x7D40, ## __VA_ARGS__),	\
+	MACRO__(0x7D45, ## __VA_ARGS__),	\
+	MACRO__(0x7D55, ## __VA_ARGS__),	\
+	MACRO__(0x7D60, ## __VA_ARGS__),	\
+	MACRO__(0x7D67, ## __VA_ARGS__),	\
+	MACRO__(0x7DD5, ## __VA_ARGS__)
+
 /* PVC */
 #define XE_PVC_IDS(MACRO__, ...)		\
 	MACRO__(0x0B69, ## __VA_ARGS__),	\
@@ -188,34 +197,6 @@
 	MACRO__(0x0BE1, ## __VA_ARGS__),	\
 	MACRO__(0x0BE5, ## __VA_ARGS__)
 
-/* MTL */
-#define XE_MTL_M_IDS(MACRO__, ...)		\
-	MACRO__(0x7D40, ## __VA_ARGS__),	\
-	MACRO__(0x7D43, ## __VA_ARGS__),	\
-	MACRO__(0x7DC0, ## __VA_ARGS__)
-
-#define XE_MTL_P_IDS(MACRO__, ...)		\
-	MACRO__(0x7D45, ## __VA_ARGS__),	\
-	MACRO__(0x7D47, ## __VA_ARGS__),	\
-	MACRO__(0x7D50, ## __VA_ARGS__),	\
-	MACRO__(0x7D55, ## __VA_ARGS__),	\
-	MACRO__(0x7DC5, ## __VA_ARGS__),	\
-	MACRO__(0x7DD0, ## __VA_ARGS__),	\
-	MACRO__(0x7DD5, ## __VA_ARGS__)
-
-#define XE_MTL_S_IDS(MACRO__, ...)		\
-	MACRO__(0x7D60, ## __VA_ARGS__),	\
-	MACRO__(0x7DE0, ## __VA_ARGS__)
-
-#define XE_ARL_IDS(MACRO__, ...)		\
-	MACRO__(0x7D67, ## __VA_ARGS__)
-
-#define XE_MTL_IDS(MACRO__, ...)		\
-	XE_MTL_M_IDS(MACRO__, ## __VA_ARGS__),	\
-	XE_MTL_P_IDS(MACRO__, ## __VA_ARGS__),	\
-	XE_MTL_S_IDS(MACRO__, ## __VA_ARGS__),	\
-	XE_ARL_IDS(MACRO__, ## __VA_ARGS__)
-
 #define XE_LNL_IDS(MACRO__, ...) \
 	MACRO__(0x6420, ## __VA_ARGS__), \
 	MACRO__(0x64A0, ## __VA_ARGS__), \
-- 
2.40.1

