Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316B9C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 18:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FDC10E0B8;
	Mon, 20 Nov 2023 18:57:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D77910E119
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 18:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700506638; x=1732042638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EKYJIk03WIm46KJhDNtfxi234OovX+G7c/kue+Labnk=;
 b=Wb6P7IW3ZpzjZgHbAsNFgTisA/i1jS7wT5oDNgKv/hb8oHwRmBwCd8TR
 RcnVBHx78TG7bWdrt54YfARo6Nn71sCptBXOTPB96QlObpXES/dtP2h+H
 oW3bjlQmrmtccp/Mx98yVHK7wc3tP5BSU99akIXhe3vA2/sQkZ4+tesne
 3pEhbSHVv/WbJyBZtkMAv9SwWJ2PSkEjjkGvGXrQtZJlf6O2lvkLB+n3I
 sCf9moP5FKcRMlbF7RfMNsjJqRO8yzKDfgRFeBVTnl2KiOQAeoIbmFEbK
 wOcy74GJkJrAhTX+XQPkYlyJZhj0PYXlTek6U+WvgP7bsCtc6LCcY1kk7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422779888"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="422779888"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="857078184"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="857078184"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:57:17 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 10:57:12 -0800
Message-ID: <20231120185712.80150-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120185712.80150-1-jose.souza@intel.com>
References: <20231120185712.80150-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe: Add missing RPL and ADL
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

Those are ids present in i915 but missing in Xe.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 include/drm/xe_pciids.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 058a68de3bb57..269622c7ddd0d 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -67,6 +67,7 @@
 	MACRO__(0x4682, ## __VA_ARGS__),	\
 	MACRO__(0x4688, ## __VA_ARGS__),	\
 	MACRO__(0x468A, ## __VA_ARGS__),	\
+	MACRO__(0x468B, ## __VA_ARGS__),	\
 	MACRO__(0x4690, ## __VA_ARGS__),	\
 	MACRO__(0x4692, ## __VA_ARGS__),	\
 	MACRO__(0x4693, ## __VA_ARGS__)
@@ -113,14 +114,18 @@
 #define XE_RPLU_IDS(MACRO__, ...)		\
 	MACRO__(0xA721, ## __VA_ARGS__),	\
 	MACRO__(0xA7A1, ## __VA_ARGS__),	\
-	MACRO__(0xA7A9, ## __VA_ARGS__)
+	MACRO__(0xA7A9, ## __VA_ARGS__),	\
+	MACRO__(0xA7AC, ## __VA_ARGS__),	\
+	MACRO__(0xA7AD, ## __VA_ARGS__)
 
 /* RPL-P */
 #define XE_RPLP_IDS(MACRO__, ...)		\
 	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__),	\
 	MACRO__(0xA720, ## __VA_ARGS__),	\
 	MACRO__(0xA7A0, ## __VA_ARGS__),	\
-	MACRO__(0xA7A8, ## __VA_ARGS__)
+	MACRO__(0xA7A8, ## __VA_ARGS__),	\
+	MACRO__(0xA7AA, ## __VA_ARGS__),	\
+	MACRO__(0xA7AB, ## __VA_ARGS__)
 
 /* DG2 */
 #define XE_DG2_G10_IDS(MACRO__, ...)		\
-- 
2.42.1

