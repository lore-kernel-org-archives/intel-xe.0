Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0340EE8FDB4
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 20:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9903710E07D;
	Tue,  3 Oct 2023 20:27:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36B710E071
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 20:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696364861; x=1727900861;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hSfU0KCfuK4LzKjuNerwISyf3ZNBE3lE+Bp+/u1S5hI=;
 b=Gkpyhr4M990C0zpdC/Mqo5fpXsGpR/Eti4lv0UhH+dNLGU3Lgiyt+Eqx
 89MERyXDkbq9dn6rCTr4zfNE7CSL9OQ7SLupx9MB1Hh9T2Ejt23qPR/9C
 U0Heml6Byp/rVcg4ADb6GbHHzwm/kBztK6YAZscmTYwoBA0qnaa+gJDsE
 SVp+gAfloLH3bKSPNNm2H4UhM7ytl2WZvORX8fAiBxArT4YBdPK/Bkppc
 JLAtDG/GQQBPX7WM/8W25+luKCTdqiRqYF9VBDKVYSWfD5WOrLzTeem8s
 uQHIIw40AEAlvskQ8TqVjgRnexIEcLhyTZm5D5rwC7TClSwC9RAp/pvol Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="362331331"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="362331331"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="816834314"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="816834314"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:27:40 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 13:27:26 -0700
Message-ID: <20231003202728.132545-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Fix RING_MI_MODE label in devcoredump
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

Fix a typo in RING_MI_MODE label.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 49128f640e15d..dc9dd83d99c52 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -770,7 +770,7 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 	drm_printf(p, "\tRING_HEAD:  0x%08x\n", snapshot->reg.ring_head);
 	drm_printf(p, "\tRING_TAIL:  0x%08x\n", snapshot->reg.ring_tail);
 	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
-	drm_printf(p, "\tRING_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
+	drm_printf(p, "\tRING_MI_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
 	drm_printf(p, "\tRING_MODE: 0x%08x\n",
 		   snapshot->reg.ring_mode);
 	drm_printf(p, "\tRING_IMR:   0x%08x\n", snapshot->reg.ring_imr);
-- 
2.42.0

