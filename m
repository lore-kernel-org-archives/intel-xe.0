Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F96C282DE
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 11:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6BB10E116;
	Fri,  7 Mar 2025 11:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="K4r/Wgsd";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C57A10EA1D
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 11:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M2NF/OytZvPoHX3WWfleEfcLuBFmg/QuPv7ufj9OF5U=; b=K4r/Wgsd//PctxykalbQJekRSS
 DmNmvzXau1PcDKPMO63wSeAzErFrlAvJrfyisjXk214r5fxgHDXlMstZ5NbJYX/bRgLV3HFCWl5iD
 HZoaLTbBOjMgllvEPM7ON/nsJRu/+n2eOAqE5FpKPJgNlGvZjbG/7v5Y7mNQeKtg5eLJX2d7PcVvp
 /q2MsLhjFzkaEcymcSRW0fiQ1WMQufvNH5ZoVMaXbb/EGHBeKHlvCVird0vsyasOg7jxkQR4lWnUY
 BRPnnvnD18NEDe6wzKO2Iw0+5Xpf0nxVYI2nyHL/v4hSdlZBhqY6nmQSJc0nm1JtyhTor8rCpa8Ld
 2jEurOww==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tqVeR-005Ji6-Ul; Fri, 07 Mar 2025 12:14:05 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/4] drm/xe: Fix MOCS debugfs LNCF readout
Date: Fri,  7 Mar 2025 11:13:59 +0000
Message-ID: <20250307111402.26577-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250307111402.26577-1-tvrtko.ursulin@igalia.com>
References: <20250307111402.26577-1-tvrtko.ursulin@igalia.com>
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

With only XE_FW_GT taken LNCF registers read back as all zeroes, leading
to a wild goose chase trying to figure out why is register programming
incorrect.

Fix it by grabbing XE_FORCEWAKE_ALL for affected platforms.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 54d199b5cfb2..31dade91a089 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -781,7 +781,9 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 	flags = get_mocs_settings(xe, &table);
 
 	xe_pm_runtime_get_noresume(xe);
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	fw_ref = xe_force_wake_get(gt_to_fw(gt),
+				   flags & HAS_LNCF_MOCS ?
+				   XE_FORCEWAKE_ALL : XE_FW_GT);
 	if (!fw_ref)
 		goto err_fw;
 
-- 
2.48.0

