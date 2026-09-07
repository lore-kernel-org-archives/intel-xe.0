Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32812C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE24410E6D6;
	Mon,  7 Sep 2026 08:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BufcKPLW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2007C8928D
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 08:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788770173; x=1820306173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rxsSQXho5wC79YSlFVYlf2VrIVP/xd8DzDKwJGVlTO8=;
 b=BufcKPLWXKcYpKYEL01KC8Duh82vsfulL0BBHY0rlGKd/lVsLdmBmM1d
 NKjuIdmND+yOJ2P8dgz56GFdeiOgr2yK8jg0Z5DONmP4hTgy7byXe3oF0
 kU1taidYDSf8sF58gVe5FBBhAt+jyNGgsIJkWKTJ+JnPOQgv2Imda7Z2m
 QsBxmfp6LkrvXDEhNIPweVbmwJRsw08Kn1DGjTJHvsQDmlYndw2A9xfkR
 r1zVt7vdBRo6V79LUqo/aSx0WJotp5Jy+a0uWk3R3WEkcgMusMYceqbvG
 NZN6jIu02ZSaiMsRdo+pSpLcEBHEXoGb+eXJE3Uuk4PplImL1zy3Q35J/ w==;
X-CSE-ConnectionGUID: NIaSJsm8TimsW14g6EdGHQ==
X-CSE-MsgGUID: qhDHloCKSfeHeSi39VdFvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="99829309"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="99829309"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:36:13 -0700
X-CSE-ConnectionGUID: YEfTop3RQKOb+R4aigv7nA==
X-CSE-MsgGUID: CCo/B12YTWuvPVQpVswE/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="266299820"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:36:10 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 1/2] drm/xe/pcode: Increase default pcode mailbox timeout
 to 10ms
Date: Mon,  7 Sep 2026 14:05:19 +0530
Message-Id: <20260907083520.192418-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260907083520.192418-1-karthik.poosa@intel.com>
References: <20260907083520.192418-1-karthik.poosa@intel.com>
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

The previous 1ms timeout may be insufficient for some mailbox commands,
leading to spurious -ETIMEDOUT failures under load. Increase the default
timeout to 10ms and introduce PCODE_DEFAULT_TIMEOUT_MS for a shared
timeout definition, in line with pcode mailbox specification guidance.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 2 +-
 drivers/gpu/drm/xe/xe_pcode.h | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index d502205bb72a..266deecbb100 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -140,7 +140,7 @@ int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val0, u32 *val1)
 	int err;
 
 	mutex_lock(&tile->pcode.lock);
-	err = pcode_mailbox_rw(tile, mbox, val0, val1, 1, true, false);
+	err = pcode_mailbox_rw(tile, mbox, val0, val1, PCODE_DEFAULT_TIMEOUT_MS, true, false);
 	mutex_unlock(&tile->pcode.lock);
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index ba8a1d1b2152..7e43792b0037 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -18,6 +18,8 @@ struct xe_pcode_version {
 	u32 engg;
 };
 
+#define PCODE_DEFAULT_TIMEOUT_MS	10
+
 int xe_pcode_init_early(struct xe_tile *tile);
 int xe_pcode_probe_early(struct xe_device *xe);
 int xe_pcode_ready(struct xe_device *xe, bool locked);
@@ -31,7 +33,7 @@ int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
 int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version);
 
 #define xe_pcode_write(tile, mbox, val) \
-	xe_pcode_write_timeout(tile, mbox, val, 1)
+	xe_pcode_write_timeout(tile, mbox, val, PCODE_DEFAULT_TIMEOUT_MS)
 
 int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
 		     u32 reply_mask, u32 reply, int timeout_ms);
-- 
2.25.1

