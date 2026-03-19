Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8777108E1F4
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 11:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8155210E92B;
	Thu, 19 Mar 2026 11:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WM1tPxno";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8034B10E934;
 Thu, 19 Mar 2026 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773920448; x=1805456448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MuOWdpRbH3rDDNVhPFF+nFqTtFcmBkwzpMI5Rg9swvo=;
 b=WM1tPxnobKSXu8vezCAQ7TQWj3uU0332pjre5L2WeNWvsbFNjyaGJ6mp
 sJ9xM9NGVIZRW6ETTXBSkZT7p7Tg8AWakEU0qGbWY8W80d4KwS4ZSRL2W
 p7JP59hePJ6DhEp1kZEOapPmpHDMYnRdMfVm4cLk3pgW8gRM3oEpg/MRZ
 dQyhNtoe8Yu6AtwS8CWUlI49DJdGapq+x9z7GkTxC/l1egI8k6yhsvFi1
 Swue38sf40NluFMnnXXXUrRp/UCIhNQvKDQwkh0WEQVCGi6zwFUFQxCjs
 MTIINDbBBRmVyzJVPJu3119o5DOoZXISZml9LcA5RpwfozrT1vg//+hSt Q==;
X-CSE-ConnectionGUID: 7S2NUwUcTf268zTWa6Yo+w==
X-CSE-MsgGUID: anIgzUC1QnWa9+h5ewk4IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="78891626"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="78891626"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 04:40:47 -0700
X-CSE-ConnectionGUID: YWUIG++GRdeve4yIYhI2pw==
X-CSE-MsgGUID: GIedqMABTz2HvOUiAAtaZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="222970858"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.169])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 04:40:46 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/9] drm/i915/wm: Reorder the arguments to
 skl_allocate_plane_ddb()
Date: Thu, 19 Mar 2026 13:40:27 +0200
Message-ID: <20260319114034.7093-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260319114034.7093-1-ville.syrjala@linux.intel.com>
References: <20260319114034.7093-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Group the ddb and data_rate together in the skl_allocate_plane_ddb()
arguments. Upcoming changes will adjust the UV plane handling and
keeing the ddb allocation and the data rate used to calculate it
together will help with clarity.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 0f99a3264f05..1664b84d0387 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -1391,9 +1391,8 @@ struct skl_plane_ddb_iter {
 
 static void
 skl_allocate_plane_ddb(struct skl_plane_ddb_iter *iter,
-		       struct skl_ddb_entry *ddb,
 		       const struct skl_wm_level *wm,
-		       u64 data_rate)
+		       struct skl_ddb_entry *ddb, u64 data_rate)
 {
 	u16 size, extra = 0;
 
@@ -1523,13 +1522,13 @@ skl_crtc_allocate_plane_ddb(struct intel_atomic_state *state,
 
 		if (DISPLAY_VER(display) < 11 &&
 		    crtc_state->nv12_planes & BIT(plane_id)) {
-			skl_allocate_plane_ddb(&iter, ddb_y, &wm->wm[level],
-					       crtc_state->rel_data_rate_y[plane_id]);
-			skl_allocate_plane_ddb(&iter, ddb, &wm->uv_wm[level],
-					       crtc_state->rel_data_rate[plane_id]);
+			skl_allocate_plane_ddb(&iter, &wm->wm[level],
+					       ddb_y, crtc_state->rel_data_rate_y[plane_id]);
+			skl_allocate_plane_ddb(&iter, &wm->uv_wm[level],
+					       ddb, crtc_state->rel_data_rate[plane_id]);
 		} else {
-			skl_allocate_plane_ddb(&iter, ddb, &wm->wm[level],
-					       crtc_state->rel_data_rate[plane_id]);
+			skl_allocate_plane_ddb(&iter, &wm->wm[level],
+					       ddb, crtc_state->rel_data_rate[plane_id]);
 		}
 
 		if (DISPLAY_VER(display) >= 30) {
-- 
2.52.0

