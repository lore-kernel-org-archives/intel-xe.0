Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ED0E7AD57
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 14:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4CF10E2A9;
	Tue,  3 Oct 2023 14:35:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB2B10E2AB
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 14:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696343737; x=1727879737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BP9TQM25F6/K9NqQcleCPOvwszvpAsifd/SZwb9EEZQ=;
 b=ZWF0AoAP08X4iKleSrqXqnuWLs0M8SkedLzJu9+o2xcmhsu4m9MNol1s
 XoUqkgjKSnesAfWdutqz68SHfaGVW3Yp9FmORs2wX3XDDCfiZXqxHI0NJ
 D7Q+EDH+g3r7d8XqVhZqmmmC0c+MoAn9FJW6b4J9PMPrG7Cn2X8MwmZB9
 EDxrjaba48FvP1dui4k8YQ9pmNYAc7VzECN41BGh3HHr12ngHLop9p3v0
 iybYY3HZzXpHaoCwPEfIJH2HtTea5zYDZJFEPzvUFSmb5+pBRCHzjVy9L
 FRaKJ2zNYDs1seYp8Dooum1wz0m8tPJGsfQeGdna06BWngVW4CwWWDaUB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="449375089"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="449375089"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="754462134"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="754462134"
Received: from akorotox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.199])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 17:34:54 +0300
Message-Id: <871baa0e5be71f89286f026d92cc2b933eab5f31.1696343521.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696343521.git.jani.nikula@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 07/10] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let the display code debug log about itself.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 32d9ef1e6dc2..b19506fe3e18 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -698,7 +698,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	xe_display_probe(xe);
 
-	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_m_s:%d tc:%d",
+	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) dma_m_s:%d tc:%d",
 		desc->platform_name,
 		subplatform_desc ? subplatform_desc->name : "",
 		xe->info.devid, xe->info.revid,
@@ -709,7 +709,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		xe->info.media_name,
 		xe->info.media_verx100 / 100,
 		xe->info.media_verx100 % 100,
-		str_yes_no(xe->info.enable_display),
 		xe->info.dma_mask_size, xe->info.tile_count);
 
 	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
-- 
2.39.2

