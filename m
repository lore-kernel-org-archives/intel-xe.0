Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A45C5AD44
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CAD910E838;
	Fri, 20 Feb 2026 17:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aKJCFUzH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF1510E81F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608498; x=1803144498;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=KP+4eFsVDJ3BWlvm5YsKgAT8I2RfcL5NNjvTSTrQMmA=;
 b=aKJCFUzHWuOP2SAUjnxpNXCdhHOxXShjCJEGL1SD2Fm3Ai6Z52/j5kzf
 AoBnPJNA2E6Xg1jgigmQt+1gWCviCsE+XQ3f6g8KOHgZQa4YeZ4MSG86I
 lzTt9B/N+i2Yrtvs8TbzSV6NHnEQK0zdwiI9MPBCp2kiCjab6iNmkYIz4
 rTYbzvND/sKVAYLvhXQ3zoryjUitvp4+LI2YOsvczC27VZHYpEfppPUF3
 rFy7X/PSF3frL/yEqdhfQE13W4UaSh12bzhrvI/Cg6/GIp4IcGdn/OLXL
 a+85477RC6QxJLlpKxhyFlp+d8pPzuqljh3/kvQ1SYqwbTcJ5isGX8CjA w==;
X-CSE-ConnectionGUID: 0RNyqIFvSMaJW05PlpjAcw==
X-CSE-MsgGUID: kAnZzthSToqthKr4v2+DUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606749"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606749"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
X-CSE-ConnectionGUID: BPL5zyB4RdyriD0QWg88rQ==
X-CSE-MsgGUID: q82hEzbDRD+6+jY1fBW7xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138728"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:41 -0800
Subject: [PATCH v2 19/23] drm/xe: Consolidate workaround entries for
 Wa_18033852989
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-19-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=KP+4eFsVDJ3BWlvm5YsKgAT8I2RfcL5NNjvTSTrQMmA=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmv0kNigKfjIm3Cuisw/g25VA6FR0tSWGQ33
 VJw5UrJa+SJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrwAKCRBNeSQFyHKQ
 BKIID/4tnMFsE510V0hyRFBrnzhyMTz5BX24UlVcT2DoavQExwlcLJcGf9OVKY8uk8DYGXvzS77
 EFzXVBvwXz62p/HmfbIjFCLbTeq2CyUW5gEg5q2VDmb98psk9sMdhMb6PjHvEDZG9k1qYKNsa1x
 FAiAGnQIJh8grbmFZq7NruUEy1kIlfxWJZgIkV7XS3pm2oItcHGrUMohGWvOfAJKT+txa7c8b8G
 I5rhcuSwt0x28Al+hrynj4m7WeuZ2t74UK9YYEBlV4hePrfMth7eJ3qzxOGK6ZEdpEFF42bpPa7
 eBwx+Ot49aoj+IcMkjkL71F8vpwiSB3sZrBDsQDdovmBOVQwHbsLVILHfR0FQjGhTFS8CxV6FfY
 gkBwXD+GaHYcY0DwBkW+RKusJmYZJufzJIReLN+/JoW2VBnLVcielfjm1Kdvj1C3OMyr9JXJVEu
 /bpxvsnJwHStvaVJkoBuhl9hHBaG1+i6IoynMDJzRGQ+yuCxeSGF1wfcfbn5vjuOCtVvpaDYFq9
 FZhq1e2rlVSH8Tss7N8nUvozB0u3k5FAu2HYI/LAJLejCYYrNbJVMI3DZDlnCW4/h1b6qewTG33
 786GxG83gU3iKmHRqwseeAHUxZMqO7FiL0uEyJolDiUYLVE2750SGbA0Jxwd1QC0Tan6tNvX3IR
 cHvuUo3/Z3mCRmQ==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Wa_18033852989 applies to all graphics versions from 20.01 through 20.04
(inclusive).  Consolidate the RTP entries into a single range-based entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 0a0f94ef5c68c2e583f28ab48eb4f96b2896b665..5aa404c0cbfbc8d11c93d820b1a192ab4776def8 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -649,6 +649,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
 	},
+	{ XE_RTP_NAME("18033852989"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
+	},
 
 	/* DG1 */
 
@@ -705,10 +709,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 
 	/* Xe2_LPG */
 
-	{ XE_RTP_NAME("18033852989"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
-	},
 	{ XE_RTP_NAME("14021567978"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
 		       ENGINE_CLASS(RENDER)),
@@ -759,10 +759,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
 	},
-	{ XE_RTP_NAME("18033852989"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
-	},
 
 	/* Xe3_LPG */
 	{ XE_RTP_NAME("14021490052"),

-- 
2.53.0

