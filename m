Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF250CE7B02
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 12:06:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62A810EA2A;
	Fri,  6 Sep 2024 12:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgT+UBDD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA96D10EA2A
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 12:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725624387; x=1757160387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5XcY4RBvfjLwH7LOnzldnxkJO4UtkUMRXvMW3/Lbz0k=;
 b=lgT+UBDDOfkKjiy8Zr1nuKinYdQH0FL5SkgSfL+uG8SdfVom4EY8ureT
 s3PKvjJi7DILJvYsqlw9KQRCJzk3Xmq0u36/660pPmcFXT6ry7/0iUWjq
 qxKPTwAxeDYbUhEHNktQWjAIccRF5fQa+uXZOdn2ZQLbUFzOGAjik6BD7
 LydGfmWBe2ctebQft5Aeiuu449vr1r07XJ2e0bmN2/FuFcpNgc9D4sbQR
 6rQa6O/w1a0ExoiHr34se+kCVyRfubBmLwu7JB3soG/wCBtdiB4N/J3PH
 GjWAv2sSp+lHzgubtkKPKQKQZ+QuWeebAlUiQqXVdFtdP/uS/Gm2rtNgO Q==;
X-CSE-ConnectionGUID: DvkQJ1VES560B/SO6j3r3g==
X-CSE-MsgGUID: aTPXGD2MT5yoSY8pBrdpMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35527215"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="35527215"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 05:06:26 -0700
X-CSE-ConnectionGUID: ue35ivq+TTKuPw5dAXDAWw==
X-CSE-MsgGUID: kiDsj1xeS3GfQXfTr+4Yew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="65982260"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.62])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 05:06:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, daniele.ceraolospurio@intel.com,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH 2/3] drm/xe/pciids: Add PVC's PCI device ID macros
Date: Fri,  6 Sep 2024 15:06:03 +0300
Message-Id: <6ac1829493a53a3fec889c746648d627a0296892.1725624296.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725624296.git.jani.nikula@intel.com>
References: <cover.1725624296.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Add PVC PCI IDs to the xe_pciids.h header. They're not yet used in the
driver.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

This is for drm-xe-next. Functionally, having the PCI IDs defined
doesn't mean anything, but it's easier all around to not carry these in
xe-for-CI.
---
 include/drm/intel/xe_pciids.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
index 644872a35c35..73d972a8aca1 100644
--- a/include/drm/intel/xe_pciids.h
+++ b/include/drm/intel/xe_pciids.h
@@ -187,6 +187,22 @@
 	MACRO__(0x7DD1, ## __VA_ARGS__),        \
 	MACRO__(0x7DD5, ## __VA_ARGS__)
 
+/* PVC */
+#define XE_PVC_IDS(MACRO__, ...)		\
+	MACRO__(0x0B69, ## __VA_ARGS__),	\
+	MACRO__(0x0B6E, ## __VA_ARGS__),	\
+	MACRO__(0x0BD4, ## __VA_ARGS__),	\
+	MACRO__(0x0BD5, ## __VA_ARGS__),	\
+	MACRO__(0x0BD6, ## __VA_ARGS__),	\
+	MACRO__(0x0BD7, ## __VA_ARGS__),	\
+	MACRO__(0x0BD8, ## __VA_ARGS__),	\
+	MACRO__(0x0BD9, ## __VA_ARGS__),	\
+	MACRO__(0x0BDA, ## __VA_ARGS__),	\
+	MACRO__(0x0BDB, ## __VA_ARGS__),	\
+	MACRO__(0x0BE0, ## __VA_ARGS__),	\
+	MACRO__(0x0BE1, ## __VA_ARGS__),	\
+	MACRO__(0x0BE5, ## __VA_ARGS__)
+
 #define XE_LNL_IDS(MACRO__, ...) \
 	MACRO__(0x6420, ## __VA_ARGS__), \
 	MACRO__(0x64A0, ## __VA_ARGS__), \
-- 
2.39.2

