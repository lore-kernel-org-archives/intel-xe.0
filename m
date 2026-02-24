Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1CBEEC2B3
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 00:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6EE10E465;
	Tue, 24 Feb 2026 00:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TuEDaTDR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FE110E07A
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 00:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771891916; x=1803427916;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=y1r5CoMvKntYyuNVjs1wDzzd4CebAKmjRmIxUD+Q9vY=;
 b=TuEDaTDRgZhKEbRhcsAMxQtPZEeQWEKWLtOKKr44M5xP0Tp5c1of2eMp
 Gi6qARMV9wcLx3XZCAh7oO3AbmcLP3+TOJfXXseBngxyOvTORMxg6LaA2
 EBdOPi5ke9EPChO2wm1N/P4H4yb91QNzWzARy7Gllcb/8/MBexay+QHDS
 h65xYW7TrENPq9ajyKtNDrIgCcnig+c4rvyyMY1FDZVXfN2aAQjVEYBJI
 LjlUa3KoYX6XUjLY4jQOyR0x2VoiDsokHJBc1NfJZjA5nPmLo479zDySI
 WlPHLUKq2xVf2SVeu//BVFDZMv30wJPpzx+gsNDg8pSX6xr4vw+wlyaUn g==;
X-CSE-ConnectionGUID: 0H1dZSv3SkCUOjU52LcJLw==
X-CSE-MsgGUID: 7uEec+R2SAyN6DC8KjzPpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76729774"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="76729774"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 16:11:56 -0800
X-CSE-ConnectionGUID: MWdjGEgfT76hB8rAc6xPWw==
X-CSE-MsgGUID: vWXMUfudRIGgMYFS702mDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220251358"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 16:11:56 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Mon, 23 Feb 2026 16:11:33 -0800
Subject: [PATCH v3 2/2] drm/xe/xe2_hpg: Drop invalid workaround Wa_15010599737
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-forupstream-wa_cleanup-v3-2-7f201eb2f172@intel.com>
References: <20260223-forupstream-wa_cleanup-v3-0-7f201eb2f172@intel.com>
In-Reply-To: <20260223-forupstream-wa_cleanup-v3-0-7f201eb2f172@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1577;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=y1r5CoMvKntYyuNVjs1wDzzd4CebAKmjRmIxUD+Q9vY=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpnOzL1qAMIddbCacOmaeefZ/BWu2xLrtZCSWJT
 HKk/Oi7U8WJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZzsywAKCRBNeSQFyHKQ
 BPdRD/9ZrKM0tUn83dhI2ckwLQjtRwppg3Q1lu8562wkcjZaNhy+0hEpfCJSCZzLTprK/Leqt6O
 Wp9s7/WZBbcg4n5En0gV2UaYUL0NeyBy/CxiXh2fs9NcReinMXPzF0OXDMo15FAcrJMlcuGJy61
 qjZTP7omLwc7X8RbE/sviG/WfX8EoJhUpjdfuI8KneQaeqwoMHW9f8zLnJtxeVo63CHoa8m/zYe
 jE157Xo6JyflVTrqufWCyJXPRQNGsD8wIzuVgsmrmojz26bvDlAv/X6YPsxwLCMi9IX+WDolFGZ
 058C9OIv9nHmLbRZwIoY/yCnbH345Ty+NvOpAkpDblLFDsmG8fXLgtR4+HizBYoO41eKyIWx5EL
 w8o1Tqt1sOmJPPWCG74lXwhrlRgKGikAkc2z7RG9moS81F00c2IxTJAq3wXUq9RBi7AF5Wd+B+x
 rFK0kAHXfS6Wyz2ESW1FShTYiVMr7vxSmqRS7GjfvVJIxWbuDqJkqq5c5HPOOdv3wvMw1U0d9cI
 4VXG5GMQcn3DIHkl+aJ55tFO0I5rwlx16IsjWzgFyyzGULf52wMFceCHYo4S/EMvYhZ+MafyyKT
 OAgLpicCN18C9B5oj88LFGqdEahI06G1GOnGj/JxtvpKRLr8+LpjdhEGEe/0fP9SooA082YcEaa
 NAvlSgR1miX+Yqg==
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

Wa_15010599737 was a workaround originally proposed (and ultimately
rejected) for DG2-G10.  There's no record of it ever being relevant or
even considered for any other platforms.

The specific bit this workaround was setting is documented as "This bit
should be set to 1 for the DX9 API and 0 for all other APIs" which means
that it should almost always be left at the default value of 0 on Linux.
The register itself is directly accessible from userspace, so in the
special cases where it might be relevant (e.g., Wine/Proton running
Windows DX9 apps), the userspace drivers already have the ability to
change the setting without involvement of the kernel.

Fixes: 7f3ee7d88058 ("drm/xe/xe2hpg: Add initial GT workarounds")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index eee56b000b14b59ea66bf227905af7b84858d9d9..984115726684d5d5881dc50c376a4a1e656c77b7 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -731,10 +731,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	},
 
 	/* Xe2_HPG */
-	{ XE_RTP_NAME("15010599737"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
-	},
+
 	{ XE_RTP_NAME("14020756599"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))

-- 
2.53.0

