Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B06C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 18:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DFE10E11B;
	Mon, 20 Nov 2023 18:07:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B9010E0FF
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 18:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700503646; x=1732039646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MlPCzTVVrYttAgOyF0Z3zseZyv8QozpiDCsfi0bm2aQ=;
 b=iro2FmaA5+tFUrsHyFCknrwv8WpwxEJFydtiH7BWliLUjYdARjY4Yh2P
 83rGTx2eplo5wq829xpYNFFofol4TbDUWsCR2WErylmUUZdsCwTCeFUzm
 2b6lPWSghGDGHI3txa1S8QfknAT1Bthq1xenWLVBUVquX3sg2gDSpDKfD
 hMRO1KN32RiCOgj89XbysS+ZYyLcaStJL16jM+i9o9H4nfU7kVusUO8lL
 BKPFa+E1Z6BoRRCv13eLnTZDUHuGyXYDNDFJyZoLYJxfQypnkvhGpGOOJ
 eUYdSEx3N3FUu7hNGJJylHQGWx849PfVS7Ge+j9okeHWEwgh0uqCbsK21 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="391454543"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="391454543"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:07:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="1013665086"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="1013665086"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:07:24 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 10:07:17 -0800
Message-ID: <20231120180717.55182-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120180717.55182-1-jose.souza@intel.com>
References: <20231120180717.55182-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Add missing RPL-P and RPL-U PCI ids
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

Those are ids present in i915 but missing in i915 for RPL.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 include/drm/xe_pciids.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 574a17c022490..6f19816ecd240 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -113,13 +113,17 @@
 #define XE_RPLU_IDS(MACRO__, ...)		\
 	MACRO__(0xA721, ## __VA_ARGS__),	\
 	MACRO__(0xA7A1, ## __VA_ARGS__),	\
-	MACRO__(0xA7A9, ## __VA_ARGS__)
+	MACRO__(0xA7A9, ## __VA_ARGS__),	\
+	MACRO__(0xA7AC, ## __VA_ARGS__),	\
+	MACRO__(0xA7AD, ## __VA_ARGS__)
 
 /* RPL-P */
 #define XE_RPLP_IDS(MACRO__, ...)		\
 	MACRO__(0xA720, ## __VA_ARGS__),	\
 	MACRO__(0xA7A0, ## __VA_ARGS__),	\
 	MACRO__(0xA7A8, ## __VA_ARGS__),	\
+	MACRO__(0xA7AA, ## __VA_ARGS__),	\
+	MACRO__(0xA7AB, ## __VA_ARGS__),	\
 	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__)
 
 /* DG2 */
-- 
2.42.1

