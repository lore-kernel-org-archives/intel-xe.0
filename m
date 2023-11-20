Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A92CC197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 18:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABEF10E1FA;
	Mon, 20 Nov 2023 18:57:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB8210E119
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 18:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700506637; x=1732042637;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eURmysek+7RHwPF0U/jgGdR0TQQ9wFQeQVc9yy10RDQ=;
 b=AXGyXfK+dm4hN+UGpEYQZWg+QdDPVO3D6jWXDbW1XC3Ha3FzFT1nrUdI
 PB7sYGHRQbMV7n0+0rLmVDVjOABkJAcIj+CrOyaJAzK6itq8qbh89yX7w
 I/cw8UZzN7JQJ7likFGVSanCogliwd81NCsl45fF47ughk/xXyhze0jvz
 DjxrIrorzR7K8kTxnRzoQR+OVDFo9F1WCqC2C8YjeB48Pfsea3w9tDEkX
 Ca4/PpnAc6UBVZ9oDTazjc96v6h5TJvW0Dvdtalv2yToCWHWHsxAHHgoO
 na7EnPs4hXUQGHXzee1K8wbI/fTrOjPNH2C8pfcoiRL9Sq+Ye9pKycUX1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422779880"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="422779880"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:57:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="857078180"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="857078180"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:57:15 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 10:57:11 -0800
Message-ID: <20231120185712.80150-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Include RPL-U to pciidlist
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

RPL-U is defined as a subplatform but those PCI ids were
not included in pciidlist so Xe KMD would never probe device with
those ids.
This is following what i915 does to include RPL-U to PCI ids
probe list.

v2:
- change order to match i915

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 include/drm/xe_pciids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 68fbab161feb0..058a68de3bb57 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -117,6 +117,7 @@
 
 /* RPL-P */
 #define XE_RPLP_IDS(MACRO__, ...)		\
+	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__),	\
 	MACRO__(0xA720, ## __VA_ARGS__),	\
 	MACRO__(0xA7A0, ## __VA_ARGS__),	\
 	MACRO__(0xA7A8, ## __VA_ARGS__)
-- 
2.42.1

