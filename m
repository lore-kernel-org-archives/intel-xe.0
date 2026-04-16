Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C668F8D762
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 18:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DADD10E20E;
	Thu, 16 Apr 2026 18:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IuM6+tMW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D70B10E20E
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 18:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776363480; x=1807899480;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=XWMmqzyxLumcAVRDuPukov78JlwxzZMLH5Gpo1YLIGM=;
 b=IuM6+tMW+aJuLqVkw0E3BwHXyLiIqx94CtHoyQ+0F/jkJ3ggMC1PckD3
 768KfIsA71a1VCr0rVn0JmfIIaHnENZ0xVfri4AjwPYE6cwkm3n9gMrIf
 hwHypFhz0JURUm90e1Y7px0lbdi16RRVX6qYmsfaEWIZGezjVhOJGq2Wc
 CDisSQdGdQ4cqnGkEcCwUu15RlQfdnwkdp7yLNbxDUf6ry8MeM12aBYXu
 tGP3593SbCX4vtSqsaAWBQmMyE3Z4zb699OoJsWYRVjvsxOWzfU0rKtqB
 gZVsVonbKphmCSUSERadzIYaTsbmQcbLslM/08b8ZSIePfv+K5pg2w9Ug A==;
X-CSE-ConnectionGUID: kCagyhsBQ0KNgGmtMjVTAA==
X-CSE-MsgGUID: oViopJfXQZCAX1phg/yKeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="87995217"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="87995217"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 11:18:00 -0700
X-CSE-ConnectionGUID: f0u4XkSzQcyAOs9+LPqjng==
X-CSE-MsgGUID: q1ayImAhTt2BD70RFTN+sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235180082"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.207])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 11:17:59 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 16 Apr 2026 15:17:19 -0300
Subject: [PATCH v2] drm/xe/hdcp: Add NULL check for media_gt in
 intel_hdcp_gsc_check_status()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v2-1-9adb9fd3b621@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6WOUQ7CIBBEr2L4FkOpVvTLe5iGUNiWjS00QBtN0
 7uLXMHM/rzJZGc2EiEgRHI/bCTAihG9y8CPB6KtcgNQNJkJZ7xhNeNUW9Av2vtA3TKOdAKDSg6
 JosuXYJTW6FkOUcuSlDGptETKrpW4iU6oM+MkP58D9Pguxc82s8WYfPiUHWv1c/+uXCua1dTm0
 gvedDV7lPRJ+4m0+75/ASU80lb8AAAA
X-Change-ID: 20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-071898b8a402
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
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

While at it, also drop the NULL check for gsc, since it can't be NULL if
media_gt is not NULL.

v2:
  - Get address for gsc only after checking that gt is not NULL.
    (Shuicheng)
  - Drop the NULL check for gsc. (Shuicheng)

Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v1-1-163d5f826b30@intel.com
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 29c72aa4b0d2..33494b86205d 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -37,9 +37,17 @@ static bool intel_hdcp_gsc_check_status(struct drm_device *drm)
 	struct xe_device *xe = to_xe_device(drm);
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
 	struct xe_gt *gt = tile->media_gt;
-	struct xe_gsc *gsc = &gt->uc.gsc;
+	struct xe_gsc *gsc;
+
+	if (!gt) {
+		drm_dbg_kms(&xe->drm,
+			    "not checking GSC status for HDCP2.x: media GT not present or disabled\n");
+		return false;
+	}
+
+	gsc = &gt->uc.gsc;
 
-	if (!gsc || !xe_uc_fw_is_available(&gsc->fw)) {
+	if (!xe_uc_fw_is_available(&gsc->fw)) {
 		drm_dbg_kms(&xe->drm,
 			    "GSC Components not ready for HDCP2.x\n");
 		return false;

---
base-commit: 9ac7dca8d82a4e6d9806ac6c991f0777338833bb
change-id: 20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-071898b8a402

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

