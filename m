Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BCEC636CC
	for <intel-xe@archiver.kernel.org>; Wed, 15 Feb 2023 20:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C6510EBEF;
	Wed, 15 Feb 2023 20:36:27 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B0010EBEF
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Feb 2023 20:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676493385; x=1708029385;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UavrxurouKza4b9GRSLnFZBwIyU4CvQTHoMTuNmj3RU=;
 b=CfRPlh/slz91hxZlKvW/ombOnQ0CMPEalT3AIUKP5mW+KgLivFB8cBCZ
 RueB9pv+aGMLzb+iilxV2lcZh4tazfIqLwJd95Q8+YGg6/f3NvqguE4ge
 /WIZTS8pnNhmOuy/EghfMswy17+1FCLyDC+kz57buw3SfQjK8V7w5aA5f
 PMPauVCCBeyY5cyc5QKWInyGUeAyji+lrBGMdgMn2CnBBtfHZuS91Ogyl
 5elwnh83rOs1czUTBpOMkA0sPgN0Q5Upv0ejgP2otscrVMM4GgojAiXnr
 XgL/ZoyiyXIlT+lR0i8lkH9vO6Q0AJ37URJT5px82e1/igi2uDKKnBYKo g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311168109"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="311168109"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 12:36:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="738544191"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="738544191"
Received: from miryad.jf.intel.com ([10.54.74.46])
 by fmsmga004.fm.intel.com with ESMTP; 15 Feb 2023 12:36:25 -0800
From: Carlos Santa <carlos.santa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Feb 2023 12:34:25 -0800
Message-Id: <20230215203425.1996229-1-carlos.santa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Update the list of devices to add even
 more TGL devices
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
Cc: Carlos Santa <carlos.santa@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The list of GTs got splitted a while back between GT1
and GT2 on TGL.

See here: patchwork.freedesktop.org/patch/388414

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Carlos Santa <carlos.santa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 +-
 include/drm/xe_pciids.h     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 291561a8f5af..b769cd5ba6db 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -354,7 +354,7 @@ static const struct xe_device_desc mtl_desc = {
  * PCI ID matches, otherwise we'll use the wrong info struct above.
  */
 static const struct pci_device_id pciidlist[] = {
-	XE_TGL_GT2_IDS(INTEL_VGA_DEVICE, &tgl_desc),
+	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
 	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index a857af1a0b1f..df1b977763be 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -41,8 +41,8 @@
 	MACRO__(0x9AF8, ## __VA_ARGS__)
 
 #define XE_TGL_IDS(MACRO__, ...)		\
-	XE_TGL_GT1_IDS(MACRO__, ...),		\
-	XE_TGL_GT2_IDS(MACRO__, ...)
+	XE_TGL_GT1_IDS(MACRO__, ## __VA_ARGS__),\
+	XE_TGL_GT2_IDS(MACRO__, ## __VA_ARGS__)
 
 /* RKL */
 #define XE_RKL_IDS(MACRO__, ...)		\
-- 
2.25.1

