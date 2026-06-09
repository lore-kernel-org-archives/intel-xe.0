Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7744CD8CAD
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 23:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C4210E690;
	Tue,  9 Jun 2026 23:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fpcohj0B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5182910E687;
 Tue,  9 Jun 2026 23:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781046773; x=1812582773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RykNiMpexJw/sCA40T4W7ABJqUg/h2iETuKHrWv1rQo=;
 b=fpcohj0BgsZX7PcqCe38Dji3kU8vd0j1sSKMdjmsTFFJYYwFOuZpj1gW
 qM7uMG7W1iLz88nLdUGZK8IWd2rNp35NVSR4DkdxHNAWoJfSN05HxfZY/
 UxG9DbzcJMnlPyd9ajjz8pUyImUmOHWsi6zP7RmGgWBuhr57v+/O86gyE
 6RmslR4gQalmuKThCO+NYl0WlqSQnHBi0pR2MTxB//o7APuHOrmyosCoT
 VAb1GgbUUvxiyCVrHujVKDZc8J+6ydTVfC60nP1iccn4dN/VvRYq9Asm1
 z1SGMctmK7+Z5OODxF2UIJi95TjpyNJaBo8h0RLB+rmMVlQlONgVNz4Vl g==;
X-CSE-ConnectionGUID: hT4q6VEDQNur9JKaFrpSCg==
X-CSE-MsgGUID: jQzzVg2lR8C43ytUYBO2Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104492310"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="104492310"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 16:12:53 -0700
X-CSE-ConnectionGUID: iQdHHCECRRedgAxp+Y2Ncg==
X-CSE-MsgGUID: HwQcziCeSyOPbu9tmPBwSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="276187988"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 09 Jun 2026 16:12:52 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v1 7/9] drm/i915/scaler: linearize scaler allocation
Date: Wed, 10 Jun 2026 01:12:15 +0200
Message-ID: <20260609231217.208357-8-michal.grzelak@intel.com>
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

Remove last continue statement from intel_allocate_scaler() by inverting
the condition. Thus allocate the scaler if it has not been already
allocated.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 89920954c4b3..b3c6376c8603 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -350,12 +350,10 @@ static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
 	}
 
 	for (scaler_id = 0; scaler_id < crtc->num_scalers; scaler_id++) {
-		if (scaler_state->scalers[scaler_id].in_use)
-			continue;
-
-		scaler_state->scalers[scaler_id].in_use = true;
-
-		return scaler_id;
+		if (!scaler_state->scalers[scaler_id].in_use) {
+			scaler_state->scalers[scaler_id].in_use = true;
+			return scaler_id;
+		}
 	}
 
 	return -1;
-- 
2.45.2

