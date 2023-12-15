Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4399DC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 16:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D56210EA50;
	Fri, 15 Dec 2023 16:25:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289F110EA59
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 16:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702657523; x=1734193523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y5tzfa5HRm+gi6PBeVFbX7zzdK+mRSOyL2eP5kyzlJM=;
 b=OyOXJIobUjwoADeZ7DUsN9lYaZyR8q7d194EaacFSz+Bp9RPbfQ4OLU2
 ZVhl65Ow9564MrWftLNJc33J/306zDv0IaRKwXSUjmhPgIjNV0cwqEKAn
 oaEiazGMFqXlS1tH+JALqOd/SMPTernUwwyWHkhFNeDHTbHRjefIupiRi
 g5WKdoMWrzcLV5BWgBWDSX83nu43BBtEd+x3TKXjFjLSUCgZrV3+91oqh
 tdN+BTqL7q1rG3YN+BwGrW2bnpLNI70Lf+fUOe0/E1M88NamGZJTFZ9Zm
 tzPaXzqYKxgbZOsYM6X8xz+TzV/poa9xS+y03ssJfomFNWIwPdubGP+FE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="459617434"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="459617434"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:25:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1021984114"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="1021984114"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.144.211])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:25:21 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 06/10] drm/xe/kunit: Restore test->priv when done with fake
 xe device
Date: Fri, 15 Dec 2023 17:24:58 +0100
Message-Id: <20231215162502.1879-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231215162502.1879-1-michal.wajdeczko@intel.com>
References: <20231215162502.1879-1-michal.wajdeczko@intel.com>
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

Current KUnit implementation does not reset test->priv in case of
parametrized tests and that may lead to wrongly treat our output
pointer to fake xe_device from first call as input pointer with
xe_pci_fake_data on subsequent calls.  Restore test->priv to
original value to avoid invalid access.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index 6d72dbf06139..fefe79b3b75a 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -41,6 +41,13 @@ struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_alloc_xe_device);
 
+static void kunit_action_restore_priv(void *priv)
+{
+	struct kunit *test = kunit_get_current_test();
+
+	test->priv = priv;
+}
+
 /**
  * xe_kunit_helper_xe_device_test_init - Prepare a &xe_device for a KUnit test.
  * @test: the &kunit where this fake &xe_device will be used
@@ -74,6 +81,9 @@ int xe_kunit_helper_xe_device_test_init(struct kunit *test)
 	err = xe_pci_fake_device_init(xe);
 	KUNIT_ASSERT_EQ(test, err, 0);
 
+	err = kunit_add_action_or_reset(test, kunit_action_restore_priv, test->priv);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
 	test->priv = xe;
 	return 0;
 }
-- 
2.25.1

