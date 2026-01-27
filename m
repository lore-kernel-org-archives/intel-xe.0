Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052BDD2FED2
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 19:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD63510E5B9;
	Tue, 27 Jan 2026 19:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwJ9TdkE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37F110E5B7
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 19:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769542664; x=1801078664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F5gWfHenP06ZAr+/pEOY+IXzZ+elhDD0DiDA21vw8lc=;
 b=XwJ9TdkEAPbU30Qmjhd57UMrpDlCTCIG3fB3SQ5c3WaeG8fGgnMt36ux
 6HtUIODTAJLBg64tgRy2YnvTdviDy1bS8Te5DAbdvi8DE/2XK4mp1CQoX
 0liaQmVl+HChW2TkiIiaT4ekxAdrUnq+4PgBeECgRNfRp3wtEjF1r0P1o
 MhAxs9yX1Ng/QFWfSXP1wDCR7w0fNG73LyVPGClGXpqsR13p8BrK+X54M
 PauYFv5ZLuKxWPDnPI1wzU1bqWb4bJjc1EFRmgerYYWZa8lFRZLhlDH+b
 Pb4g+M0xeT/+6FOHcI6G/YrQURDSuW2WYkiOpJjTjdfP6heoaUwKrLr1d g==;
X-CSE-ConnectionGUID: asNENXIaRGOifI9UdvKxAg==
X-CSE-MsgGUID: OB8w21LNTVGmV4LslpskrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69764784"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="69764784"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:37:43 -0800
X-CSE-ConnectionGUID: 7oznbiMpSJ+bBxcb7CgqKw==
X-CSE-MsgGUID: lIJoMKqURCm7bRGWi6kz/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207958954"
Received: from mahadzix-mobl.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:37:43 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 6/6] drm/xe/guc: Allow second H2G retry on FLR
Date: Tue, 27 Jan 2026 20:37:26 +0100
Message-ID: <20260127193727.601-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127193727.601-1-michal.wajdeczko@intel.com>
References: <20260127193727.601-1-michal.wajdeczko@intel.com>
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

During VF FLR the scratch registers could be cleared both by the
GuC and by the PF driver. Allow to retry more times once we find
out that the HXG header was cleared and wait at least 256ms before
resending the same message again to the GuC.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: rebased
---
 drivers/gpu/drm/xe/xe_guc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 231844bce1e0..70ce1d7aec21 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1389,6 +1389,9 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
 	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
 }
 
+#define MAX_RETRIES_ON_FLR	2
+#define MIN_SLEEP_MS_ON_FLR	256
+
 int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 			  u32 len, u32 *response_buf)
 {
@@ -1399,7 +1402,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
 	const u32 LAST_INDEX = VF_SW_FLAG_COUNT - 1;
 	unsigned int sleep_period_ms = 1;
-	bool lost = false;
+	unsigned int lost = 0;
 	u32 header;
 	int ret;
 	int i;
@@ -1435,9 +1438,14 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 			     50000, &header, false);
 	if (ret) {
 		/* scratch registers might be cleared during FLR, try once more */
-		if (!header && !lost) {
+		if (!header) {
+			if (++lost > MAX_RETRIES_ON_FLR) {
+				xe_gt_err(gt, "GuC mmio request %#x: lost, too many retries %u\n",
+					  request[0], lost);
+				return -ENOLINK;
+			}
 			xe_gt_dbg(gt, "GuC mmio request %#x: lost, trying again\n", request[0]);
-			lost = true;
+			xe_sleep_relaxed_ms(MIN_SLEEP_MS_ON_FLR);
 			goto retry;
 		}
 timeout:
-- 
2.47.1

