Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB636C27C7B
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABAF10E2B8;
	Fri, 14 Jun 2024 21:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfcIwkK6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D949510E2B7
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401651; x=1749937651;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DPifIl1kBnLNP3mTT40UrtdoC/i2GkYvJ0icFIvXjzg=;
 b=gfcIwkK6syfkCe2wRF70GaKIqi0ndrlbWWODQWn7qzpIK2nFm4v4LMdh
 gUbk+WSCfbw7Cn6qhq+JoFyGh4AE85Whu5/2Z/lOdKo7vPC15MNVD8f5a
 ceje4bwjtKOtk2LLFuC1qEMKUXUGpCboWecKhFbCM/o8jBSxWjs9A+vyr
 +PRiYZerS6emOHKzqljeTWzWVO/Q9XDCnqkQVjrIsDVUYdrp62gp6dsU9
 W8oBU29ORfOijluOA+rmSn4oD5d/9EjpioD66HNj3UycNHviBPNze2quc
 /dr21LUTXwyjZsDqeRWaKV5B98iQk4buVDEXcKXqfkG3zU4pz/iLK8rVc A==;
X-CSE-ConnectionGUID: lQrkG3JsQSmpFgKCg4JcTg==
X-CSE-MsgGUID: RaPgIT6eTuaCN+OULwUcyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886561"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886561"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:27 -0700
X-CSE-ConnectionGUID: Gg6Isig9RyCLKxk1671UDQ==
X-CSE-MsgGUID: zhZDeGrTTYekqtSzFdHHqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572399"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 07/44] mm: Add an empty implementation of zone_device_page_init
Date: Fri, 14 Jun 2024 17:57:40 -0400
Message-Id: <20240614215817.1097633-7-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add an empty implementation of zone_device_page_init when
CONFIG_ZONE_DEVICE is not enabled and print a warning message
in this empty implementation.

This is to fix some kunit test as showed below. On some architecture
such as um, ZONE_DEVICE can't be enabled and calling to
zone_device_page_int would trigger below error:

[szeng@szeng-desk kernel]$ ./tools/testing/kunit/kunit.py run --kunitconfig ./drivers/gpu/drm/xe/.kunitconfig
[11:42:42] Configuring KUnit Kernel ...
[11:42:42] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=24
ERROR:root:../drivers/gpu/drm/./drm_svm.c: In function ‘__drm_svm_init_device_pages’:
../drivers/gpu/drm/./drm_svm.c:978:3: error: implicit declaration of function ‘zone_device_page_init’ [-Werror=implicit-function-declaration]
  978 |   zone_device_page_init(page);
      |   ^~~~~~~~~~~~~~~~~~~~~

Cc: Alistair Popple <apopple@nvidia.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Cc: Lucas Demarchi <lucas.demarchi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 include/linux/memremap.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 3f7143ade32c..bf7727915a68 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -199,6 +199,16 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
 
 unsigned long memremap_compat_align(void);
 #else
+static inline void zone_device_page_init(struct page *page)
+{
+	/*
+	 * Fail attempts to call zone_device_page_init without
+	 * ZONE_DEVICE support enabled.
+	 */
+	WARN_ON_ONCE(1);
+	return;
+}
+
 static inline void *devm_memremap_pages(struct device *dev,
 		struct dev_pagemap *pgmap)
 {
-- 
2.26.3

