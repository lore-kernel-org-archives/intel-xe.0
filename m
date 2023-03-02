Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39FCC6FA8E
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 12:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8B810E275;
	Thu,  2 Mar 2023 12:43:27 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C72F10E168
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 12:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677761006; x=1709297006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xLWBCNAoEpFCBa8PN6OqlhP8uq1WnD2N3XsBl88spUg=;
 b=LlTINRIpNJEh5k+Y5jK5LBqPApGjXo2Cdb5OS9fSjGSjiqE8NogUzDJ4
 Hv+WeZ+aY259E8lcwxJsmULqhg0YYSlwhA91gMiXtBXCX+EItMOUApX77
 V6FT3Kb1yfr0v2TtsJxrsjlwoiKQEzwoGuwvEFDTaYtByfy4abaONOuzZ
 jvhtQ1KOiudMUYcolpcgA4biVPmJHgKCb8qeXptfBNSR7r3KQ2PZf+nsu
 fCNM2OXSaha0nliav6hgoYFhvsY7IQ7gm+NhV7dbNAzu/HzQ1JRH3Fm6W
 LRPt7mTKAdQtwQgOK6Wy5xDM5i5NzqN9iR5j12vnFy3yHM90kC665Zk6Z w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="322982418"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="322982418"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 04:43:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="707403010"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="707403010"
Received: from fathuddx-mobl.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.102])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 04:43:24 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  2 Mar 2023 13:42:57 +0100
Message-Id: <20230302124258.91081-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302124258.91081-1-thomas.hellstrom@linux.intel.com>
References: <20230302124258.91081-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/tests: Remove CONFIG_FB dependency
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

We currently don't have any tests that explicitly depends on this
config option, so remove that build dependency.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 9c773dd74cbd..565be3f6b9b9 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -64,7 +64,6 @@ config DRM_XE_SIMPLE_ERROR_CAPTURE
 config DRM_XE_KUNIT_TEST
         tristate "KUnit tests for the drm xe driver" if !KUNIT_ALL_TESTS
 	depends on DRM_XE && KUNIT && DEBUG_FS
-	depends on FB && FB = DRM_KMS_HELPER && DRM_FBDEV_EMULATION
 	default KUNIT_ALL_TESTS
 	select DRM_EXPORT_FOR_TESTS if m
 	help
-- 
2.39.2

