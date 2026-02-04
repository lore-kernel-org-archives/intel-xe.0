Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084D6E8B383
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 01:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90CA10E26D;
	Wed,  4 Feb 2026 01:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DvA7DwU+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8027A10E26D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 01:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770169569; x=1801705569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FtkYGupxT9EOSTB/N9xD3I18TjNtoPfmxwazrupyO10=;
 b=DvA7DwU+pbrE5Fw68Zf/WLDTwcjRnfEbZOW0mWqhXvySCuit+Ernv4rB
 UlFK0MenGBH+HQRASjYg2uVnmnWah+I2LQQWcam4uAxg3OCs9Zf2rXgad
 EyXWCbW1iNqHnnRKJhlpBi8HR4SSsQ0gQiX6GlYiinHxFQjRJXUz/m5nd
 ir4dvYHreFY5F/GgObBdc3zrRSalnHXSNlus4j6njCAMCSiXdJ/b/pNZE
 xRzodncfo2JgHGIzZ3oo5RdayQboL0t0lc/ATksPqs3Ie5VTlm2uu2W+n
 /HGw9T78iSTJ+m/RVLUAxlxBHDtWotw3W9b/9ChPwH3mr7fSpcimnO0sW g==;
X-CSE-ConnectionGUID: ltscTQLETzSgtFKApfxxRA==
X-CSE-MsgGUID: t8OoQcf+RkGnEv9igNfbdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71250544"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="71250544"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 17:46:09 -0800
X-CSE-ConnectionGUID: vL2i5f72Qy6LNAyF91t9cg==
X-CSE-MsgGUID: 1FW3YLrBSJubjY8pQ3yKXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="214500408"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa005.fm.intel.com with ESMTP; 03 Feb 2026 17:46:09 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v8 2/3] drm/xe: Use FORCEWAKE_GT in xe_guc_pc_fini_hw()
Date: Tue,  3 Feb 2026 17:42:33 -0800
Message-Id: <20260204014234.2867763-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260204014234.2867763-1-vinay.belgaumkar@intel.com>
References: <20260204014234.2867763-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
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

No need to use FORCEWAKE_ALL since the registers being written are in
GT domain.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index c8313e308f96..878eb273c3e6 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1300,7 +1300,7 @@ static void xe_guc_pc_fini_hw(void *arg)
 	if (xe_device_wedged(xe))
 		return;
 
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 
 	/* Bind requested freq to mert_freq_cap before unload */
-- 
2.38.1

