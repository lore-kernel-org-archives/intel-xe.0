Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768A7EB362A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 18:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB4910E48F;
	Mon,  2 Mar 2026 18:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5bYqiVT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E74F10E48F
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 18:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772475577; x=1804011577;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=ZjoSs0j3sEs0t0KKrt9f0e334X463xAyPb98YlaBxpk=;
 b=W5bYqiVTS+Nzdj+S3wedL8V3zn//NDxY8hE0k9ungZ5NGQk3Q86jwrF+
 TFiYRVnNNvTuq1Au3d3Wm0Vtq+XpL4UXRu/5HNck56JGGbLjsRZ+HICJS
 9k3xqGFaJObbNF71vpF1JuuTkbIPq44z5ybqVotyWREbKHQG/Beyyg6TO
 rtqv2YDCxyeZuyx5yt7fl36D20qVcxWOBcsldKg/dxkX/I116ihz8Fy81
 YACHcRsqW1zAPb3N+kyb2sYDOC/WDPgfAyRUKlIAai+1shba3yiMYNzQZ
 uTy/04bIRjkB1xMga9fx6ET+aweYDKNIWq8hwb4V3uIuvzWAjTVC3M4P0 g==;
X-CSE-ConnectionGUID: 5ci4s8/fTMegsKUBr+wEyA==
X-CSE-MsgGUID: 4rX4Hm8CQAuqY3I74Ob1lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73682391"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73682391"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 10:19:36 -0800
X-CSE-ConnectionGUID: CJmUMFW3RJuiDsrhYlszsQ==
X-CSE-MsgGUID: 4bhdTihNRFKdEkawCiytTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="222725649"
Received: from vverma7-desk1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.9])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 10:19:34 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 02 Mar 2026 15:18:36 -0300
Subject: [PATCH] drm/xe/hdcp: Add NULL check for media_gt in
 intel_hdcp_gsc_check_status()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v1-1-163d5f826b30@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NUQrCMBAFr1L224U0ikavIiXEdJssxrRkUxFK7
 24ozM/A8N4GQoVJ4NFtUOjLwnNu0p868NHlQMhjc9BKX9VZafSR/BunuWBeU8IPjexsqMi5USn
 ZOPrFBvH2KK1UV1dBdevN3byMuygNbXwpNPHvOH4O+/4H1c5jjogAAAA=
X-Change-ID: 20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-071898b8a402
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

When media GT is disabled via configfs, there is no allocation for
media_gt, which is kept as NULL.  In such scenario,
intel_hdcp_gsc_check_status() results in a kernel pagefault error due to
&gt->uc.gsc being evaluated as an invalid memory address.

Fix that by introducing a NULL check on media_gt and bailing out early
if so.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 29c72aa4b0d2..1cac00c17d4c 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -39,6 +39,12 @@ static bool intel_hdcp_gsc_check_status(struct drm_device *drm)
 	struct xe_gt *gt = tile->media_gt;
 	struct xe_gsc *gsc = &gt->uc.gsc;
 
+	if (!gt) {
+		drm_dbg_kms(&xe->drm,
+			    "not checking GSC status for HDCP2.x: media GT not present or disabled\n");
+		return false;
+	}
+
 	if (!gsc || !xe_uc_fw_is_available(&gsc->fw)) {
 		drm_dbg_kms(&xe->drm,
 			    "GSC Components not ready for HDCP2.x\n");

---
base-commit: 40e52ed6c66cef091579dd7fe49ccd2de135f5c5
change-id: 20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-071898b8a402

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

