Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E2CC77B61
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 18:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BF210E1B1;
	Mon, 10 Apr 2023 18:39:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E75410E15D
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 18:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681151969; x=1712687969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rp8lMP5e4OjzEB4Fm5HC4CidqQV7YVSNSsGiudRTNqU=;
 b=Ocbk8ygQbq9a2pmx5akj8WKeSmyAdkQKiNVhQPotY25g3U4sQPphfmtC
 6rs/65QE1IGBRyntJEbzyfnJm35ysTtsGb06roWDeEpL7nxzFuPqv7ylQ
 Bti3dNBaehtgCHIgy+7dBW1Ug3+TZOVQC/1ogaTQOz6McEGE8hpF9qgi4
 o9InzhaA6cMFMfJ/9UroDaQvnRBLLI7QZ6lv7J3z5f8sxX/ip6lehO9/u
 jp3k3NjjVZ31bJOivOeHXc8kCGUfC6tw6H0CLazl8Rt4AeuH+b07pkIi/
 1uqHxKY3QIn94MTicSQgN8DF11dcd28L9/+f3cmT1KKFEKi20NuLsL8Q/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="327521141"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="327521141"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="752857967"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="752857967"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:39:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Apr 2023 11:39:10 -0700
Message-Id: <20230410183910.2696628-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230410183910.2696628-1-matthew.d.roper@intel.com>
References: <20230410183910.2696628-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Only request
 PCODE_WRITE_MIN_FREQ_TABLE on LLC platforms
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

PCODE_WRITE_MIN_FREQ_TABLE is only applicable to platforms with an LLC.
Change the discrete GPU check to an LLC check instead; this take care of
skipping not only the discrete platforms, but also integrated platforms
like MTL that do not have an LLC.

Fixes MTL dmesg error:

  xe 0000:00:02.0: [drm] *ERROR* PCODE Mailbox failed: 1 Illegal Command

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index fb1ce2d49bec..99bb730684ed 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -210,7 +210,7 @@ int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
 	int ret;
 	u32 freq;
 
-	if (IS_DGFX(gt_to_xe(gt)))
+	if (!gt_to_xe(gt)->info.has_llc)
 		return 0;
 
 	if (max_gt_freq <= min_gt_freq)
-- 
2.39.2

