Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CA7FF8862
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 09:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5473E10E651;
	Mon, 27 Apr 2026 09:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RxTLBSNO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572E610E64B
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 09:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777282386; x=1808818386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=46b7sfT7JXAJPBe2xl26+weGICyeH1po1bAy/etSue0=;
 b=RxTLBSNO7qUGJGJONHKaeHDS+5037SNcxJk5jjffi0BdhxTvsmjBA96D
 mhgAcDNwz8+QgjOCARajrd5PDPoJ7mxVFX5z7fHyci+rJk8DuWzsoktBA
 Gpt8i+LXTC6N0ARBYCBLWVL/+TkYtqOAdDYhfCYmsGY7kLI+5uQpgIdVT
 k91QKy4PYz8AxhaKkivBuVSbeX0B7RMvH1gYGpFF+/bLwkaKTrLNm2rq5
 gHYaZJi4OeOdP1V3n/GfTYB8o7qiZoVMSa9OIMFrlZA6kewJHTH/6JY0p
 u/S/lSlLJueJNPFmqRgGDVXbFQ77AHJy+qV4jaw7jkbYxstTQIShm4XJY w==;
X-CSE-ConnectionGUID: IC/iV5Q0TDClNAGUuI7N2A==
X-CSE-MsgGUID: 4G1TsnXkQ/WBufWoh1WqbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78082629"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="78082629"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 02:32:54 -0700
X-CSE-ConnectionGUID: d0uIa1IjRge6NdaG1lc1TA==
X-CSE-MsgGUID: Fntj6Q+GRcGoujyFpyuaVg==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 27 Apr 2026 02:32:52 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com,
 badal.nilawar@intel.com, sk.anirban@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 2/3] drm/xe/guc_pc: Reorder forcewake in xe_guc_pc_fini_hw()
Date: Mon, 27 Apr 2026 14:59:27 +0530
Message-ID: <20260427092928.1181893-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427092928.1181893-1-raag.jadav@intel.com>
References: <20260427092928.1181893-1-raag.jadav@intel.com>
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

xe_guc_pc_stop() doesn't perform any MMIO operation that requires
forcewake in it's code path. Move it before pc_set_cur_freq() which
writes to RPNSWREQ and actually requires it.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Split forcewake reordering to separate patch (Rodrigo)
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 9530cddbd11d..59f2fa79ad42 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1340,10 +1340,10 @@ static void xe_guc_pc_fini_hw(void *arg)
 	if (xe_device_wedged(xe))
 		return;
 
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
 	xe_guc_pc_stop(pc);
 
 	/* Bind requested freq to mert_freq_cap before unload */
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
 	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
 }
 
-- 
2.43.0

