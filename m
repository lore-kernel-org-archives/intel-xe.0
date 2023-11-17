Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928B2C5AD4C
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 17:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4097110E311;
	Fri, 17 Nov 2023 17:56:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCEA10E311
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700243801; x=1731779801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p2NmZDPsGXfydetBTHnUcb0mXgTi2UKETAnHrejh7wY=;
 b=OyFxV5UICTBfAV8SjpmC0RLFg7b+2wl0N7FD0/MZcZJVDWsJzdp+vTeL
 5b2c5KAsVkqIhIUAR3A8QYoACffuaCnGtwX9zmH3ZBLgAq0J27fYCDquo
 1j4+sNVaWTxmV5cEhXZ7BbY/zmTMYeq6ECpLK9JQIl96O/CgNFI4zGuRn
 OegyRbxdFrCA7RCxmEUn/vQrKK4QdWugwxvIOD3kLHyvQKoB0I8CEGWTK
 MnCRMdumPwNIec0PbdrZfzKHGdJtrc951SpuCxgye43UKAbGmNXmgwmXu
 y/4RAqNd7BfLqpOoRtAW7nrS6wQ/MgMeQDRMZRAMezoio/HnK17kDXXdJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="422434023"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="422434023"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 09:56:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="856403083"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="856403083"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 09:56:41 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Nov 2023 09:56:24 -0800
Message-Id: <20231117175624.535520-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231117175624.535520-1-lucas.demarchi@intel.com>
References: <20231117175624.535520-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] fixup! drm/xe/display: Create a dummy
 version for vga decode
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

Fix build with W=1:

	  CC [M]  drivers/gpu/drm/xe/display/intel_fbdev_fb.o
	../drivers/gpu/drm/xe/display/xe_display_misc.c:10:14: error: no previous prototype for ‘intel_gmch_vga_set_decode’ [-Werror=missing-prototypes]
	   10 | unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
	      |              ^~~~~~~~~~~~~~~~~~~~~~~~~
	cc1: all warnings being treated as errors

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display_misc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_display_misc.c b/drivers/gpu/drm/xe/display/xe_display_misc.c
index 81ff97e704ea..242c2ef4ca93 100644
--- a/drivers/gpu/drm/xe/display/xe_display_misc.c
+++ b/drivers/gpu/drm/xe/display/xe_display_misc.c
@@ -7,6 +7,8 @@
 
 struct pci_dev;
 
+unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode);
+
 unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
 {
 	/* ToDo: Implement the actual handling of vga decode */
-- 
2.40.1

