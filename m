Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8991B606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 22:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bCzrJXUU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C6C10F271;
	Mon, 23 Nov 2026 22:52:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E21610F25B;
 Mon, 23 Nov 2026 22:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795474346; x=1827010346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EFX7MG97rQ3hU4hhqc+2Ouu7EM3TUeQMbc6f07eUex8=;
 b=bCzrJXUUSAoapFUTy0KhGCPweAfh6g3HddQWRnOhMhIFmT0se8eW3hY/
 9+lL4iR6tk0qE9r8gVLJ1OamlPDemIyvSMU4oSY2MOWbqm19sp5vGrHov
 de6gk36aAe8WjlDwLapymom0TVbsVNpaKn96iUsnBmIUCnmcm92CPocOn
 uU0BA7HWIR08kaTPZiu8EOWpWAmMmwsgY9U4i9PSSbOQSE0+Y3hCmmD47
 nheVJN7sW9Uu+NIuUnfFwTZSj8MkklBV0bXu+C/yMWaeFa/CV19NJdpIY
 1iJeeJkayJsgMasFWabPfO8AWcxGDF8V05OmpneLf2yJuxkNXLd6SLb3l g==;
X-CSE-ConnectionGUID: LncXxRODRjKYQbzjL9EYbA==
X-CSE-MsgGUID: 3diMWtrmSC6bHqs7GX0Xtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4184273"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4184273"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:52:25 -0800
X-CSE-ConnectionGUID: kSV8p68cSESafkrOUbVimw==
X-CSE-MsgGUID: bweVH3sPQV2SU1Q+kkX4AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11288077"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:52:23 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 9/9] drm/i915/sdvo: Add a FIXME about the
 connector_state->state footgun
Date: Tue, 24 Nov 2026 00:51:39 +0200
Message-ID: <20261123225139.23087-10-ville.syrjala@linux.intel.com>
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

The SDVO code still uses the perilous connector_state->state
pointer in its .atomic_set_property() implementation.  In this
we have no choice as the atomic core code doesn't pass in the
full atomic state explicitly. That needs to be remedied, but
in the meantime drop a FIXME into our code so that we'll remember
to clean this up once the core atomic code has been changed.

The connector_state->state pointer is only valid up to
swap_state() after which it becomes NULL. In this case we
do know that it's valid, but it's still better to stop using
it so as to not have any bad examples in the code that might
get blindly copied around. The eventual goal should be to
completely eliminate the danger by removing the
foo_state->state pointers from all kms object states.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_sdvo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 7b97f531acbf..eded145608ce 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -2447,6 +2447,10 @@ intel_sdvo_connector_atomic_set_property(struct drm_connector *connector,
 		state->tv.legacy_mode = intel_sdvo_connector->tv_format_supported[val];
 
 		if (state->crtc) {
+			/*
+			 * FIXME pass in the full atomic state to .atomic_set_property()
+			 * and stop using the state->state pointer to get at it.
+			 */
 			struct drm_crtc_state *crtc_state =
 				drm_atomic_get_new_crtc_state(state->state, state->crtc);
 
-- 
2.56.1

