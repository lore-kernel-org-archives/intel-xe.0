Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EC2C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 15:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C0710E570;
	Tue, 28 Nov 2023 15:15:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A7B10E570
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 15:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701184525; x=1732720525;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kOgPo+ErYjQyt0bBYb7F/Nby6TPjblSIaZ9SJ29oTnA=;
 b=ipOFHA7UJG200kgaw15soUCRH5xQVkFkcmRp5KRK7H2dc5PVHrtS14Pc
 Lr7/q0LY3oEAV3U0OWeJiMd29Kn7qfH6ghfUl6I71s8E4KJcXyM8uAMC2
 z0wmMrU9NVlmI5i4pdXc37H0aRjAsnG8UtCQBlw5b2NbED8fH3Yyw3lY+
 x9WFy5TZqzJDzP7BDfblktBgbS49JPiCKqEZT/exyo93mFYIIBlzIAoFf
 62WuLhy2s6Toyni2pWK2zPLMdCVRiUPXT0wwW5DIsCvsozAbSImyoPM0Z
 UbhJQ6lmDRRv5rFbqi+7er0+j4sZRsqZWt5mSerhQ1GRcBMfh0l3Ak9Vj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="11637953"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="11637953"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:15:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="744937042"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="744937042"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.140.124])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:15:23 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 16:15:06 +0100
Message-Id: <20231128151507.1015-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231128151507.1015-1-michal.wajdeczko@intel.com>
References: <20231128151507.1015-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/5] drm/xe/kunit: Enable CONFIG_PCI_IOV in
 .kunitconfig
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

We will add kunit tests for the PF specific code that is by default
enabled only under CONFIG_PCI_IOV. Update our .kunitconfig to allow
running those test cases by our CI.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/.kunitconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/.kunitconfig b/drivers/gpu/drm/xe/.kunitconfig
index 3769af94e391..9590eac91af3 100644
--- a/drivers/gpu/drm/xe/.kunitconfig
+++ b/drivers/gpu/drm/xe/.kunitconfig
@@ -1,6 +1,7 @@
 # xe dependencies
 CONFIG_KUNIT=y
 CONFIG_PCI=y
+CONFIG_PCI_IOV=y
 CONFIG_DEBUG_FS=y
 CONFIG_DRM=y
 CONFIG_DRM_FBDEV_EMULATION=y
-- 
2.25.1

