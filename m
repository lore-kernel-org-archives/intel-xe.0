Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12220606A334
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 22:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R9gCScUT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB3310ECAB;
	Mon, 23 Nov 2026 22:52:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE7910ECC9;
 Mon, 23 Nov 2026 22:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795474336; x=1827010336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ihYgNZVgXO4wg2qbHfFu+nF5smR5yq+m5x2a+u7rALo=;
 b=R9gCScUTDGX67AYn9jic4PePmD1U6c6zqp6Qo8VgK4JWNh8YlTmP7/Bx
 M7wm+R0sYQ3yf6ZzKCHJ1SrjkXOpiaDC+e22l09EAEVGASToG6F+erj9E
 MLN9B7pIxRMPpxkwdVQ8ny+PDT2s5DsoX3Bk1T4r9Kj9GQDGPaDVHYC0x
 VbWXuU3VmcI+Znpiokh/XHzSCchIy9f4S8Tjg1BgKidXedcb6jj1YB+RP
 EexgC4sWc3J7eaR8fVg4BeBf0wPbW5sLJ232WqrLg4m2c+EEt6T8WDSlN
 fh8/xlnK9Yq5shCclNZKU7/QrpuvqdOYIO6YpBjoPzjkXMseIN1Nmo9gB Q==;
X-CSE-ConnectionGUID: lYFLPyLeSC2DsqxJ1CaDBg==
X-CSE-MsgGUID: Sd/E7ZiSTXWfX79M6J97WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4147464"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4147464"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:52:15 -0800
X-CSE-ConnectionGUID: rt2SRpo6SP6zglw/BknnnQ==
X-CSE-MsgGUID: j2AabrZiQPaBSUvOsF95zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11830764"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:52:14 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 7/9] drm/i915/global_state: Store the display in the global
 object and use it
Date: Tue, 24 Nov 2026 00:51:37 +0200
Message-ID: <20261123225139.23087-8-ville.syrjala@linux.intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

A few global state related dbuf functions are currently digging
out the intel_display pointer via the obj_state->state footgun.
Just store the display pointer in the global object itself
instead. Much safer.

The obj_state->state pointer is only valid up to swap_state()
after which it becomes NULL. Thus any code using it cannot be
reused between atomic_check() and atomic_commit().

intel_dbuf_enabled_slices() in particular look like something we
might even reuse during atomic_commit(). Currently the result is
getting cached in the dbuf_state itself, but since the function
is pure we might at some point entertain the idea of simply
removing the cached value and just always calling the function
instead.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_global_state.c | 1 +
 drivers/gpu/drm/i915/display/intel_global_state.h | 1 +
 drivers/gpu/drm/i915/display/skl_watermark.c      | 4 ++--
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_global_state.c b/drivers/gpu/drm/i915/display/intel_global_state.c
index 436fbaa02831..ec9d1c9317f2 100644
--- a/drivers/gpu/drm/i915/display/intel_global_state.c
+++ b/drivers/gpu/drm/i915/display/intel_global_state.c
@@ -119,6 +119,7 @@ void intel_atomic_global_obj_init(struct intel_display *display,
 
 	kref_init(&state->ref);
 
+	obj->display = display;
 	obj->state = state;
 	obj->funcs = funcs;
 	list_add_tail(&obj->head, &display->global.obj_list);
diff --git a/drivers/gpu/drm/i915/display/intel_global_state.h b/drivers/gpu/drm/i915/display/intel_global_state.h
index 9759b9339d9b..33656d74460b 100644
--- a/drivers/gpu/drm/i915/display/intel_global_state.h
+++ b/drivers/gpu/drm/i915/display/intel_global_state.h
@@ -23,6 +23,7 @@ struct intel_global_state_funcs {
 
 struct intel_global_obj {
 	struct list_head head;
+	struct intel_display *display;
 	struct intel_global_state *state;
 	const struct intel_global_state_funcs *funcs;
 };
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index a5d933f7475c..b8ed1101261c 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -494,7 +494,7 @@ static void intel_crtc_dbuf_weights(const struct intel_dbuf_state *dbuf_state,
 				    unsigned int *weight_end,
 				    unsigned int *weight_total)
 {
-	struct intel_display *display = to_intel_display(dbuf_state->base.state->base.dev);
+	struct intel_display *display = dbuf_state->base.obj->display;
 	enum pipe pipe;
 
 	*weight_start = 0;
@@ -2477,7 +2477,7 @@ skl_ddb_add_affected_planes(struct intel_atomic_state *state,
 
 static u8 intel_dbuf_enabled_slices(const struct intel_dbuf_state *dbuf_state)
 {
-	struct intel_display *display = to_intel_display(dbuf_state->base.state->base.dev);
+	struct intel_display *display = dbuf_state->base.obj->display;
 	u8 enabled_slices;
 	enum pipe pipe;
 
-- 
2.56.1

