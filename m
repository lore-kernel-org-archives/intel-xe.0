Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9197C072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 17:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E0D10E2FC;
	Fri, 17 Nov 2023 17:36:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF28F10E307
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 17:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700242602; x=1731778602;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s9l09aklK5/lxxRH7Ra69FrlRKwWhUtcWwxVHKPAAZ8=;
 b=beJVpU+ifWuCnK+V4madvSAtmM8L/2B8SWRIR7sApEj+eiQ97up0ToVq
 5cAdXGC0RjxXYpdBbEy/TGY/+TAWjTx1cwxYRnaS8+ELs/ERWrPVJwORU
 eoeDFktnJKxDAJCsZ57HSvn7p4Hwims7gXt5n8Yu9eIqElaGe69MSqVUv
 YH9EG/s+zxiwrymCNlP7e2X7MwwATIFsEAJ1ZoJfw1VhGhccDkp1M6U0U
 EPLZ1KCiu3HOO4odyuNcsX34fl83b0UePHXSLJ+bwbg3+vbov+I3I6Nda
 xSGtJMlqNgMVqJEevjw/ijvWRsnqGf7YcbKrxHx2Eaj/8Ld7/Pp81f5wV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="422430887"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="422430887"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 09:36:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="856400514"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="856400514"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 09:36:41 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Nov 2023 09:36:34 -0800
Message-ID: <20231117173634.61564-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Include RPL sub platform PCI ids to
 pciidlist
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

RPL-U and RPL-S were defined as a subplatform but those PCI ids were
not included in pciidlist so Xe KMD would never probe device with
those ids.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 include/drm/xe_pciids.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 68fbab161feb0..d1e54befd05f4 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -69,7 +69,8 @@
 	MACRO__(0x468A, ## __VA_ARGS__),	\
 	MACRO__(0x4690, ## __VA_ARGS__),	\
 	MACRO__(0x4692, ## __VA_ARGS__),	\
-	MACRO__(0x4693, ## __VA_ARGS__)
+	MACRO__(0x4693, ## __VA_ARGS__),	\
+	XE_RPLS_IDS(MACRO__, ## __VA_ARGS__)
 
 /* ADL-P */
 #define XE_ADLP_IDS(MACRO__, ...)		\
@@ -119,7 +120,8 @@
 #define XE_RPLP_IDS(MACRO__, ...)		\
 	MACRO__(0xA720, ## __VA_ARGS__),	\
 	MACRO__(0xA7A0, ## __VA_ARGS__),	\
-	MACRO__(0xA7A8, ## __VA_ARGS__)
+	MACRO__(0xA7A8, ## __VA_ARGS__),	\
+	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__)
 
 /* DG2 */
 #define XE_DG2_G10_IDS(MACRO__, ...)		\
-- 
2.42.1

