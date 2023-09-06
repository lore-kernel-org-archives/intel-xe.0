Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D69EB8FA5
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 05:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA7E10E04A;
	Wed,  6 Sep 2023 05:59:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D8310E04A
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 05:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693979979; x=1725515979;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=riETao6Vc4TWwd5F+owLcuNOZMWOh90JK5DYud0JzPo=;
 b=JEO9WMpnTmVYwlRf+XI/v5uOBVYBS5hURIDSBKZPx/2Pp1vwOjvWTIo/
 FUGMUEAAxMxqIsKHnWF62U9ZPaVCh09dGBBW2dwauVHrKiM8KxqWE0a4f
 fzN5rDJ2YfmobhWIENIVYGzSeoSlYoDq15LOtmRnmf7+plksy2y9TfAfv
 ABDJKJNuAWlSOnc3IZrMihlaZ41W1rEmWy5aPxHtNbaXw511BQwkSZXv/
 VJYMy1PdQ2S+jumnRUy3RmGfqrA8eqdKxJn+wTOZKO7UY8o+1xOAZ7N7q
 WLEyePg0KhOMG0rDvDlsCgywI+D4wPxLXBXqkuPs2VknwtxZd+MjwWqVB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="463361602"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="463361602"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 22:59:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="718133761"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="718133761"
Received: from bvivekan-desk.iind.intel.com ([10.190.239.116])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 22:59:38 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Sep 2023 11:34:00 +0530
Message-Id: <20230906060400.4144425-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/display: Print display ip version
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

Print display ip version during module load

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 60f3474844e2..fc01544346d5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -844,6 +844,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		str_yes_no(xe->info.enable_display),
 		xe->info.dma_mask_size, xe->info.tile_count);
 
+	if (xe->info.enable_display)
+		drm_dbg(&xe->drm, "Display: %d.%02d\n",
+			xe->info.display_runtime.ip.ver,
+			xe->info.display_runtime.ip.rel);
+
 	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
 		xe_step_name(xe->info.step.graphics),
 		xe_step_name(xe->info.step.media),
-- 
2.25.1

