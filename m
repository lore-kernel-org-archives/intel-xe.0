Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2925CDB474
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 07:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AA810E58D;
	Fri, 20 Oct 2023 07:34:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DD810E58F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 07:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697787277; x=1729323277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=ot20zts86klCAI7VIUDKZlyveV2mXympOrXiWMDR+5w=;
 b=CobT+m4dIXUy7GsMrxIMHUhBBoaPlRMR59Nly5iQ2YjONvwrvO3jOv2O
 G26dVQho6PggUWWfztj5rxgY6961y+rDOCm+CgeoozsQ2wTn9nekAyuCX
 /lXTmiNPOEVs+glabEmoj87ULtHITnloLxiokMKYd1D/fAKsipeUfxvBq
 94Q1/LsEY9vVoGJVighe11jEqFOUWA3FbVPtRrd7iPINAHMq2zzB+BukG
 avRNYzxSPEWUA6yzpVRKpoy2esp85MJ+UeImrxYS7Hw13tgUROcRfzF+/
 2WrP+H0ZVKRzg5U9vzSrgbIrfBZR9+ou3CXAmx2GNgYFoqHkrZ/u2n7FW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="452926706"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="452926706"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 00:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="848005965"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="848005965"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 00:34:35 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.0.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3766B580BE3;
 Fri, 20 Oct 2023 00:34:35 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qtk1g-000QwZ-2R;
 Fri, 20 Oct 2023 09:34:32 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 20 Oct 2023 09:32:15 +0200
Message-ID: <20231020073430.103493-3-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020073430.103493-1-mauro.chehab@linux.intel.com>
References: <20231020073430.103493-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm: xe: xe_display_misc: fix build with W=1
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

As reported by LKP, when the Xe driver is built with W=1, a warning
will be produced:

	>> drivers/gpu/drm/xe/display/xe_display_misc.c:10:14: warning: no previous prototype for 'intel_gmch_vga_set_decode' [-Wmissing-prototypes]
	      10 | unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
	         |              ^~~~~~~~~~~~~~~~~~~~~~~~~

Currently, such function is just a stub, not used anywhere.
Yet, it is declared there without a prototype. As this is just a
reminder for something that will be implemented in the future,
change it to static and add __maybe_unused to disable compiler
warnings on it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310201234.ZZLwdoiy-lkp@intel.com/
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 drivers/gpu/drm/xe/display/xe_display_misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display_misc.c b/drivers/gpu/drm/xe/display/xe_display_misc.c
index 81ff97e704ea..53a53e500a09 100644
--- a/drivers/gpu/drm/xe/display/xe_display_misc.c
+++ b/drivers/gpu/drm/xe/display/xe_display_misc.c
@@ -7,7 +7,7 @@
 
 struct pci_dev;
 
-unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
+__maybe_unused static unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
 {
 	/* ToDo: Implement the actual handling of vga decode */
 	return 0;
-- 
2.41.0

