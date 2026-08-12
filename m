Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E973C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB84710E42E;
	Wed, 12 Aug 2026 19:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lInSeH/1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A324310F0E6
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562129; x=1818098129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1K5OFowb3Zq2PDxiFgoXWB05WxkPkU1WpxdHmGokcpo=;
 b=lInSeH/1EYVkjRSy96m4SEC25v2w+92mP7KUASCNgaH40WrV4+liedlZ
 KVJk1PU4Pf5Oe5rIfuQs/H1SbmZg2HBJdPmL9jzyfTaESVe4uzykb68Ih
 5q5e3IXkq0chIZ5VDmZUEKRi7nnun8ZONrIWtAlyDRyKDnIaXqmfyiNvQ
 sQDgfMjNsB9CPHAuFi155yNTeVGqwFQku97qU8kuBeLFDs5d9af2Xupxh
 xrkHmxdkRqhs1PzqdqbaYFonjBsIzkizMPDW4/ePUl0D2uiOF9Fiu7H2Z
 +4ui3xeoiCKcP8okdhKVdTEqd/FMW4sxYR7Zn9dszQQLmwM3BEg9xW3q1 w==;
X-CSE-ConnectionGUID: gYT9559uR+mDUF2MhIP+1w==
X-CSE-MsgGUID: Yu9BBcPlSBmG3fZ26b7S4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987549"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987549"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:28 -0700
X-CSE-ConnectionGUID: ZiqM8CjbTd6EB2saxhxMzQ==
X-CSE-MsgGUID: S5oL0exJQLy0fzlC+KrD8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268891985"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 15/32] drm/xe/kunit: Setup driver data in the test device
Date: Wed, 12 Aug 2026 21:14:31 +0200
Message-ID: <20260812191450.11690-16-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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

While we have helpers pdev_to_xe_device() and kdev_to_xe_device()
to obtain the xe_device pointer from the struct device pointer or
from the struct pci_dev pointer, we must also setup the drm_device
pointer as driver data in the device to make them work.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index bc5156966ce9..27740b40c8ae 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -39,6 +39,10 @@ struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
 					       struct xe_device,
 					       drm, DRIVER_GEM);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
+
+	dev_set_drvdata(xe->drm.dev, &xe->drm);
+	KUNIT_ASSERT_PTR_EQ(test, xe, kdev_to_xe_device(dev));
+
 	return xe;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_alloc_xe_device);
-- 
2.47.1

