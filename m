Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766E4C61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 10:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B63810E7D2;
	Mon, 31 Aug 2026 10:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gyh+Ge/J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF7910E7D2
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 10:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788173127; x=1819709127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1jJRCNqINp1VtrLU4RKptP1r+OmvFGEwBpiiQOJKLXU=;
 b=Gyh+Ge/J3hIh0EDgWjZ9OJA87yVWtDOe85Lr9aS0Hyng4I5r9nHGee9r
 hLyXHewRoP1HwSP/xm6Fh++021I+vWceP6pnplIsvPrwY8O1ESQ1edZ7T
 blwRqTSoZHgodrC+8CfI986WKDO85H7tfWH3ZDtQHJy3nYMlt2kyYOR7Q
 oz8WvVjWFc2IG4dov3tOZGQbKQoDALpoWKPKbn76dfOi3u3iDXEiHYR7W
 yglMXyth8MC57IMd/zWRqxVyZNXP0GyoJJ/JhvGYQi32iJrCLJkX2641S
 +u2OMGijNPaiAzi3UVPwMSbtxfb8JodAh9MAhHoStBBrDmmP0uXRw/7hI w==;
X-CSE-ConnectionGUID: HegK448lT0u01OcDIEjqDQ==
X-CSE-MsgGUID: WvTNGwGqQZWodx8+twa6FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92264629"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92264629"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 03:45:27 -0700
X-CSE-ConnectionGUID: wviqPa2pQwu4WMc3IMC18w==
X-CSE-MsgGUID: iOrWSi9hQFSU4CegtfsMdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="270685508"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 31 Aug 2026 03:45:22 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v6 4/9] drm/xe/sysctrl: Make sysctrl_read_frame() void
Date: Mon, 31 Aug 2026 16:15:01 +0530
Message-ID: <20260831104456.1770605-15-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
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

Convert it to return void and remove the unnecessary error
handling in sysctrl_process_frame().

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 3ef60067e226..4841dd7f2724 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -68,8 +68,8 @@ static void sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
 		xe_mmio_write32(sc->mmio, regs[i], val[i]);
 }
 
-static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
-			      size_t len)
+static void sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
+			       size_t len)
 {
 	static const struct xe_reg regs[] = {
 		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
@@ -85,8 +85,6 @@ static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
 		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
 
 	memcpy(frame, val, len);
-
-	return 0;
 }
 
 static void sysctrl_clear_response(struct xe_sysctrl *sc)
@@ -194,10 +192,7 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
 	total_frames = FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
 	curr_frame = FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
 
-	ret = sysctrl_read_frame(sc, out, frame_size);
-	if (ret)
-		return ret;
-
+	sysctrl_read_frame(sc, out, frame_size);
 	sysctrl_clear_response(sc);
 
 	if (curr_frame == total_frames)
-- 
2.48.1

