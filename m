Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D40C5CFDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D712C10F6C9;
	Fri, 14 Aug 2026 17:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NbJz4DyY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE8D10E183
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727922; x=1818263922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1K5OFowb3Zq2PDxiFgoXWB05WxkPkU1WpxdHmGokcpo=;
 b=NbJz4DyYpDzH/0AAC1l9hC54SoB5qTjEqs/Iu5g/JCXTwDqa9rznEMlV
 37jAvMj820VCkp6BLDnfUlv28nqkaucHST1tKivSIXFC7cGweMQpjyFef
 k0RJ3ztibfKqdHnkC+S3UB8yIZUm5pkyfKbQFkrhT1kewPAiaJy//ZsX4
 29WkOSUIZNfN5f641htQHIOm6gKdJ/LGXqQ+GeX7C4UAP6nNU8VL9b0CN
 bzsH8gcQrt4orIN5n6bOa7Gd83ZO/JWGUa/QkkYTR5yZVI8PHT1LDWVyj
 yEJx5TSg+PjF9WezSES6Q1RlaDj5RTa0dlmePTdRLEnhObnJpdbk9dTxQ g==;
X-CSE-ConnectionGUID: JDc7Gg/hSpm8LachwQpowQ==
X-CSE-MsgGUID: mngoIGSkT7SWMYwgV5J7QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464044"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464044"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:42 -0700
X-CSE-ConnectionGUID: RxHmTZvvRDmHseSarxShPQ==
X-CSE-MsgGUID: 3M9I4Cx4SdGmYTvr9KZnZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946202"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 15/33] drm/xe/kunit: Setup driver data in the test device
Date: Fri, 14 Aug 2026 19:17:41 +0200
Message-ID: <20260814171801.13347-16-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

