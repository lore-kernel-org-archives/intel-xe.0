Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46B0D132A2
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 09:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C6310E2AD;
	Mon,  4 Nov 2024 09:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSc825un";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FBC10E2AD
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 09:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730713802; x=1762249802;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fJDRFrGeDNurCmHgi4Pxj8yJVJ+Kj804H4CpsgtVyok=;
 b=aSc825unw9lHc0eus8hHuH6TGV5Z+Yj4sDlXKhh9MWmpmeW28YRC0xQL
 PJNxinENw47ltcJ0rptya7KNhUyEG+ZmfrSA5fFxf4GTuXnNzzSEgajTE
 jBBxXmnVlFq9kcggI5sTKnNHiH3RWQms2NOOZchCGbsEJHBNf0u0SD2vT
 InjhHeCPo2Y6ESgI9xOAQ2rs2uyI+ZVBkYNiB+9dYw/cut5F3DPJIBPM5
 owOUk7+Lt6aaLIS8Dva3b2M89b3tZDY4QWbMKnspV9gJuZgjIta+2u3N3
 HR3iT/q/OKpT7x6L//Iq2dwxKMe0lHyqqNI9FodHTdsgqbhbcsYrR5uPG A==;
X-CSE-ConnectionGUID: 7VFz6/pmSF2M6G7fIPnTgw==
X-CSE-MsgGUID: 1IhJ755fQfqXoLIc+xD17Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="41034511"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="41034511"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 01:50:02 -0800
X-CSE-ConnectionGUID: fvKuVP75QkePvLkHoyrc1A==
X-CSE-MsgGUID: vO7Y+2QDSmSjQLEy8PVT6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="84046159"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 01:49:59 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe: Improve LNL work-queue flush WA warning message
Date: Mon,  4 Nov 2024 10:07:55 +0100
Message-ID: <20241104090755.85131-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Improve the LNL work-queue flush WA warning message to avoid giving a
false impression of normal operation.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Suggested-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index a405b9218ad2..63a476ba1e00 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1021,7 +1021,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	if (!ret) {
 		LNL_FLUSH_WORK(&ct->g2h_worker);
 		if (g2h_fence.done) {
-			xe_gt_warn(gt, "G2H fence %u, action %04x, done\n",
+			xe_gt_warn(gt, "G2H fence %u, action %04x, done but required a flush\n",
 				   g2h_fence.seqno, action[0]);
 			ret = 1;
 		}
-- 
2.46.0

