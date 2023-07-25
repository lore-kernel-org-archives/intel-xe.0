Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9611FC04A6A
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 17:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0A710E3EF;
	Tue, 25 Jul 2023 17:33:17 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C722710E16B
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 17:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690306395; x=1721842395;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=14qdt0bEXbIBBe4vTgCNsrdXvrWDpCqinT57ibMCJLI=;
 b=jOK3d/8Zg+OVxlCK4mnRnAdIL49jiDhAm1KG/P4l291gjMbK+hN0Wnmn
 dF9qWzJYUnwlp9d8EG2jRb4ClwCrKH5GiAcQTiUk/pw8HLKOki2moBQvn
 1UwOOVPI7lt5jsNTE3FOUyo4hFa6utuZj6e1S85nd/L/2MBV0DHqgrd8O
 tAWS4eoaWSXVY8gngYS3ceDvqxYwE4sM6Mz5UJKCIkHkyBraofXoOQSjT
 gIyhGaO2iyWyjDaLgDmyRobR+2QqbZQslAlnEgfsraXynS0gKKpXgg2i3
 SYTdAIP5COY8v6N08qeEzTGFQFo4ze2W9T6LSbmxj1VascY5CMqEq+ACW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398714960"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="398714960"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 10:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729461035"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="729461035"
Received: from kkbrenna-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.31.100])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 10:33:12 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 18:32:49 +0100
Message-ID: <20230725173245.159053-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725173245.159053-5-matthew.auld@intel.com>
References: <20230725173245.159053-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 4/4] HAX: force small-bar
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

Just for CI.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index aa9c573b1243..5a57a12c407b 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -90,6 +90,9 @@ static void xe_resize_vram_bar(struct xe_device *xe)
 	if (!bar_size_mask)
 		return;
 
+	if (IS_DGFX(xe))
+		force_vram_bar_size = 256;
+
 	/* set to a specific size? */
 	if (force_vram_bar_size) {
 		u32 bar_size_bit;
-- 
2.41.0

