Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400B0CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 05:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE52210EA29;
	Fri,  7 Nov 2025 05:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFAKksuX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E2910EA29
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 05:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762495096; x=1794031096;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o0IpD1h64kuTfJYssB339kuFzV5U7l/22kGIlUNIvqM=;
 b=gFAKksuXURaAfjYFGdbQ+kSXy6cSFKrWTxgmfGNaRNd+pCHTDYMKCwEw
 c/2a+nI0PqdSdBehD2QLvPSHyySdD5FhsHxCRTZs7W0xThHxSAuJYs7Xu
 wXw/2HEQcVSiZkY29ZBtbQPU6ieod8wELi0hjGNT3y92zEc8W8g6IniiD
 Vuxdczid3viFo1jcrVOskAUdfwnL+jbB6fpjynXJeJodi3RfYVX9TUo7c
 JxYLRh1Wb8CtmYSdMAfVk35/UqlClpmiRiKOwb2dvhry8QQdoWv/H6fWr
 r2UyEHeCbJRTzvq52DQLnJBoTEnGR4fFnQqaFNY0KJQzG4oPFbFIr5jk2 A==;
X-CSE-ConnectionGUID: eaKNcnoiSgOu7LWodM212g==
X-CSE-MsgGUID: CSzDQik1S/CAcxZ9spKmRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64341549"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="64341549"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 21:58:14 -0800
X-CSE-ConnectionGUID: WwrnMTrpQ3+0o4/EgAeWSQ==
X-CSE-MsgGUID: fS3V5eN/S+Ccm0jHVF5k4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="187615215"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 06 Nov 2025 21:58:11 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe/pcode: Convert unsupported commands to debug level
Date: Fri,  7 Nov 2025 11:26:11 +0530
Message-ID: <20251107055746.110055-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

If the device is running older pcode firmware, it is possible that newer
mailbox commands are not supported by it. The respective functionality
isn't useful in that case but neither is error logging, since it doesn't
particularly signify anything wrong with pcode firmware or device as a
whole. This is useful in cases where we want to make a decision on driver
functionality based on pcode return codes and a bit simpler design choice
compared to other solutions like checking pcode firmware version, which
comes with additional complexity of binding every single command to a
specific version and deems pcode commands useless in case driver fails to
obtain it for reasons unrelated to pcode.

v2: Split unsupported command cases

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---

Following up on earlier attempt[1] now that we really have things blowing
up. Another alternative would be to further split boottime and runtime cases
but that again is its own design discussion.

[1] https://lore.kernel.org/intel-xe/Z8n1Uy1hqAkYxeFE@black.fi.intel.com/

 drivers/gpu/drm/xe/xe_pcode.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 6a7ddb9005f9..d9a0bd7ea36c 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -47,8 +47,13 @@ static int pcode_mailbox_status(struct xe_tile *tile)
 
 	err = xe_mmio_read32(&tile->mmio, PCODE_MAILBOX) & PCODE_ERROR_MASK;
 	if (err) {
-		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
-			err_decode[err].str ?: "Unknown");
+		if (err == -ENXIO)
+			drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
+				err, err_decode[err].str ?: "Unknown");
+		else
+			drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
+				err, err_decode[err].str ?: "Unknown");
+
 		return err_decode[err].errno ?: -EPROTO;
 	}
 
-- 
2.43.0

