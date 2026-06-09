Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A625CD8CB2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 23:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82A510E653;
	Tue,  9 Jun 2026 23:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ns9zaJqc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA4010E653;
 Tue,  9 Jun 2026 23:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781046766; x=1812582766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xG62fO2wIiQnJ6j+9fmAEKUuxpDprou01idB9XcKXos=;
 b=Ns9zaJqc7zqniIR9jyZrq6o7Tsz5x5w8uFl1xVM8luSrJeDv1vLS5Mcb
 4EZvIcGPkJWl1rKNCAG3sIhukz3/XC7lpSERLzHYq5XoIVNyamp2IW0kQ
 +QFh3gskrWZKChFlSDSAv83S0hCNLRlxv0f1ENKqVNw2Csws+sRd23sC8
 gE/0wwKWfuhxIRszEnQKvE3uiXGjVD6EZd5dtmDae48aSKbKdMJBGNDS1
 rKbDkF2PjN8VrQvtwdjpZ7tPvrmwvugkVltdiY8+Nabr2lZ4vxavu/Dvg
 PZ1uJDczl/IIJofplFmw79qLY+9Rm1rA7/HrKUjfTk9uYx48acRH88yIL Q==;
X-CSE-ConnectionGUID: fesw9bUETUaO9C3eRTRQ7g==
X-CSE-MsgGUID: J2jRCYmjS1O+JkjEdp4HpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104492297"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="104492297"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 16:12:45 -0700
X-CSE-ConnectionGUID: wcBXHyTiSG+/bM4bGlE+TQ==
X-CSE-MsgGUID: 82zFtB0hQhiYV0D3VqGP9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="276187973"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 09 Jun 2026 16:12:45 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v1 2/9] drm/i915/scaler: s/i/scaler_id/
Date: Wed, 10 Jun 2026 01:12:10 +0200
Message-ID: <20260609231217.208357-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260609231217.208357-1-michal.grzelak@intel.com>
References: <20260609231217.208357-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Rename generic iterator into more descriptive one.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 4b456924fdef..0cfa5b7564ba 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -337,18 +337,18 @@ static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
 				 bool casf_scaler)
 {
 	struct intel_display *display = to_intel_display(crtc);
-	int i;
+	int scaler_id;
 
-	for (i = 0; i < crtc->num_scalers; i++) {
-		if (scaler_state->scalers[i].in_use)
+	for (scaler_id = 0; scaler_id < crtc->num_scalers; scaler_id++) {
+		if (scaler_state->scalers[scaler_id].in_use)
 			continue;
 
-		if (casf_scaler && !scaler_has_casf(display, i))
+		if (casf_scaler && !scaler_has_casf(display, scaler_id))
 			continue;
 
-		scaler_state->scalers[i].in_use = true;
+		scaler_state->scalers[scaler_id].in_use = true;
 
-		return i;
+		return scaler_id;
 	}
 
 	return -1;
-- 
2.45.2

