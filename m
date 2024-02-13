Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9F8C4829F
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 21:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B34210E8D9;
	Tue, 13 Feb 2024 21:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3O2sy0E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3106810E393
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 21:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707859477; x=1739395477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZzRpVV0Iejh+2PRwRIsfeRtCFz1Uh2c4SZGgfPY07Yc=;
 b=S3O2sy0EASw1PmGqBo+h5DeUc5mMneniaQGmW4QdJZDGULwF2VzbxNuf
 FrANufV9nqUelCQvKZo2+sNKzB6DRRCFDmVsOIvnT0wdNE1/YvrZCczBg
 v3vtJDy0og/7v5yS7ttYnNfHo1K3HoyCo+VS99ZFZVqHx1w4KA4pw1KvF
 Ioe4/QZ6hiDfhtps98k3LW/M8MUAGV2rNdfs/ODKRBUfCX1a0FHhj64RO
 qFlBxoSI3BGRpqMhWw2ACbXTUM7DM+87YtO9il2fJDJHzu3tKh6CMhZ3f
 Bvftgk5MX9MRzDCJU18c5K2KVg/tFWpXoMabHUcKgQRgBkiY2Us2D0IaG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1741161"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="1741161"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:24:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="3042951"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.153.144])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:24:35 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH 3/3] drm/xe/pf: Always use Multi-Level LMTT for newer platforms
Date: Tue, 13 Feb 2024 22:24:18 +0100
Message-Id: <20240213212418.1309-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240213212418.1309-1-michal.wajdeczko@intel.com>
References: <20240213212418.1309-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Change function logic to prefer Multi-Level LMTT variant on all
new platforms.

Bspec: 52404, 67468
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_lmtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index dfb0e1887615..ac77e9507f07 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -35,7 +35,7 @@
 
 static bool xe_has_multi_level_lmtt(struct xe_device *xe)
 {
-	return xe->info.platform == XE_PVC;
+	return xe->info.platform >= XE_PVC;
 }
 
 static struct xe_tile *lmtt_to_tile(struct xe_lmtt *lmtt)
-- 
2.43.0

