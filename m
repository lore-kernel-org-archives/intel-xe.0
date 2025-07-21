Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7897C83F25
	for <intel-xe@archiver.kernel.org>; Mon, 21 Jul 2025 21:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA1010E5B7;
	Mon, 21 Jul 2025 21:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OC554Ni9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2416E10E5B7
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Jul 2025 21:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753134322; x=1784670322;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RpjRieyF8YeiHk3OtRlK1JnLoAgEzpbvUN79wERSais=;
 b=OC554Ni9toT2khkkEMtolnRP7iY56w20sNfCczCLlcVLjfipg5zPMakM
 nSpuzxlkfpuw+iIu3Vn6UlZE5XXnW68Tnp9Bbc54/sJRbZFF5l6lrKak9
 PMhfC8AdyCgu01tjPKOzHxL8koDGP3d7nKcIeg7v6h8k6ur56G2ucDP3K
 1bMCkCvIWT4mlkTtn4NhquKlT+5vhEWiDm2h7VwtCIBtGyOoVR8QRwrPb
 yKML569fRhAGrvawVFtoQqdEOEcPsuVB7/iuImcGUlt7e1V0RU+r3iu5I
 ySOxMhk8yZIBqxA7githuOoYTTnwiNYjNs7enhh4pvcXkjuyXvcgu71EQ g==;
X-CSE-ConnectionGUID: 74V1ZpVyRdWh9N9TSp4HIg==
X-CSE-MsgGUID: TlXvN6WcS9iU6Avm08DVKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55324217"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="55324217"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 14:45:21 -0700
X-CSE-ConnectionGUID: Kdqp6XFJTYCexyEBGpXEcQ==
X-CSE-MsgGUID: TXPJt/edRJiu2Ui5U5c7rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="158614581"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa007.fm.intel.com with ESMTP; 21 Jul 2025 14:45:21 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v1] drm/xe/uc: Fix missing unwind goto
Date: Mon, 21 Jul 2025 17:45:20 -0400
Message-Id: <20250721214520.954014-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Fix missing unwind goto on error handling.

Fixes: b2c4ac219fa4 ("drm/xe/uc: Disable GuC communication on hardware initialization error")
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_uc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 3e0c3af235f2..465bda355443 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -164,7 +164,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 
 	err = xe_guc_opt_in_features_enable(&uc->guc);
 	if (err)
-		return err;
+		goto err_out;
 
 	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
 	if (err)
-- 
2.34.1

