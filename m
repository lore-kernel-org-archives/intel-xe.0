Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C946A606A321
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 22:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ayhPpWv3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D77410EC31;
	Mon, 23 Nov 2026 22:51:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2B410EC31;
 Mon, 23 Nov 2026 22:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795474309; x=1827010309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BXX+I3WIq56445nsGdXv+9fmLcYLB3f3J3p3Lf04mhI=;
 b=ayhPpWv3X8ugjJ4V4EuYYN7qbS4sOJzCIsyJTdVy6L94ICsSLDE1AtKP
 mhqP34wLpZutIdZqNjVksUILEaF+ZM3bWPl7BA3m0GX8FGVpWweVxhfHD
 dsWYTotUG/v0gU01WLhw7tqe03rOo+SXlmYgKWFMUNjOKoqE0gKcnwOH9
 GB2J+XuoBDQu8a1SkeHTADDUgUyF0Sy4vibu1CXia3ifi3snfSVbcr3Iv
 h7Baj1/WS/XyWm4nrMNlBfIeeWWUT+jLHnhm5/JV+fqm9p0EGNUA8CZCt
 TjCjWhFRGOhjKagW9eqkHQrLFOLVnUkvXodCwUPy6f8jSfdk9+sxxxniI Q==;
X-CSE-ConnectionGUID: i+v7MP24SaqsJviT50SUsg==
X-CSE-MsgGUID: iz9N1nJPSpWQnQvHAtxR4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4172968"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4172968"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:51:48 -0800
X-CSE-ConnectionGUID: RjhZxPPYSg2czwSaXHT3CA==
X-CSE-MsgGUID: 0VuUwJ+NQtCIlpU09edMPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="13400321"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:51:48 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/9] drm/i915/ddi: Pass the atomic state to
 intel_ddi_port_sync_transcoders()
Date: Tue, 24 Nov 2026 00:51:31 +0200
Message-ID: <20261123225139.23087-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123225139.23087-1-ville.syrjala@linux.intel.com>
References: <20261123225139.23087-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Stop looking at the crtc_state->uapi.state footgun and just
have the full atomic state passed into
intel_ddi_port_sync_transcoders(). In this case it's trivial
since the caller already has it passed in.

The crtc_state->uapi.state pointer is only valid up to
swap_state() after which it becomes NULL. Thus any code
using it cannot be reused between atomic_check() and
atomic_commit(). It's best if people just forget that
the pointer even exists. Then they are forced to pass in
the atomic state explicitly, thus guaranteeing its existence.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index e21c237b39f4..504265fd2671 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4612,14 +4612,13 @@ static bool crtcs_port_sync_compatible(const struct intel_crtc_state *crtc_state
 }
 
 static u16
-intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
+intel_ddi_port_sync_transcoders(struct intel_atomic_state *state,
+				const struct intel_crtc_state *ref_crtc_state,
 				int tile_group_id)
 {
 	struct intel_display *display = to_intel_display(ref_crtc_state);
 	struct drm_connector *connector;
 	const struct drm_connector_state *conn_state;
-	struct intel_atomic_state *state =
-		to_intel_atomic_state(ref_crtc_state->uapi.state);
 	u16 transcoders = 0;
 	int i;
 
@@ -4678,7 +4677,7 @@ static int intel_ddi_compute_config_late(struct intel_atomic_state *state,
 		    crtc_state->uapi.crtc->base.id, crtc_state->uapi.crtc->name);
 
 	if (connector->has_tile)
-		port_sync_transcoders = intel_ddi_port_sync_transcoders(crtc_state,
+		port_sync_transcoders = intel_ddi_port_sync_transcoders(state, crtc_state,
 									connector->tile_group->id);
 
 	/*
-- 
2.56.1

