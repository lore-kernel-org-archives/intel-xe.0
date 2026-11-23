Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450FA606A339
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 22:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PQ1ejqbc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3CB10F26B;
	Mon, 23 Nov 2026 22:52:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319C610F264;
 Mon, 23 Nov 2026 22:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795474355; x=1827010355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0BC4TObkXRotwuJfZhdJWS00rAJC8OvXnlJQwROGvEw=;
 b=PQ1ejqbczqE2GQIHHT5lqXe+HkGLGH7gc+mj6jcWwrVi3GiAk3VnMGnG
 0qKIeIsSYLoGKRYF4757zQTDsBNcXCSy49OG0KVRymDFr0ACbC4VyGxQ9
 pRX5JsUKIJWeBR2uCXYTMykdVANC8GhzwZYcLYk2jsyko6icVG+ffRXqR
 zNZYLK3yXGmO6WTX7PFhWdjSkP3qe2KCa+adqMl+3ZM7BDacW0oOMry6U
 QaKAxCRu1Y/Bx+lESOOa6ZzkDnOqoXWjSVJEMqQLDu4+drHr6UlmmdTFH
 Phq097x/pVoO5+POgoeJ4DSe9nDFhdlGJ8vp7QqVxz5ypuw217+cZ8Zfw Q==;
X-CSE-ConnectionGUID: vpuYoda5RWGkCeqm1YCnZw==
X-CSE-MsgGUID: Sa6+Otj/SeS3TLBNnEUuVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4147482"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4147482"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:52:35 -0800
X-CSE-ConnectionGUID: T+I6EBykTMqK5FuYJdxk7w==
X-CSE-MsgGUID: tq8E0dirTtCMpb//wHzmuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11830790"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:52:18 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 8/9] drm/i915/global_state: Remove the obj_state->state footgun
Date: Tue, 24 Nov 2026 00:51:38 +0200
Message-ID: <20261123225139.23087-9-ville.syrjala@linux.intel.com>
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

Completely remove the dangerous obj_state->state pointer.
This pointer is only valid up swap_state() after which
it becomes NULL. Any code that uses this pointer can
therefore not be used during the actual atomic commit
phase without oopsing, or by adding completely broken
NULL checks.

Let's remove the temptation entirely by removing the
pointer. Now if anyone needs the overall atomic state
in any global state related code they will have to pass
it in explicitly, thus guaranteeing its existence.

Ideally we'd give all the core kms object types the same
treatment, but that requires a full audit of the entire
drm subsystem and drivers, which I've not done.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_global_state.c | 4 ----
 drivers/gpu/drm/i915/display/intel_global_state.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_global_state.c b/drivers/gpu/drm/i915/display/intel_global_state.c
index ec9d1c9317f2..c4aea021fb82 100644
--- a/drivers/gpu/drm/i915/display/intel_global_state.c
+++ b/drivers/gpu/drm/i915/display/intel_global_state.c
@@ -214,7 +214,6 @@ intel_atomic_get_global_obj_state(struct intel_atomic_state *state,
 		intel_atomic_global_state_get(obj->state);
 	state->global_objs[index].new_state = obj_state;
 	state->global_objs[index].ptr = obj;
-	obj_state->state = state;
 
 	state->num_global_objs = num_objs;
 
@@ -270,9 +269,6 @@ void intel_atomic_swap_global_state(struct intel_atomic_state *state)
 
 		assert_global_state_write_locked(display);
 
-		old_obj_state->state = state;
-		new_obj_state->state = NULL;
-
 		state->global_objs[i].state = old_obj_state;
 
 		intel_atomic_global_state_put(obj->state);
diff --git a/drivers/gpu/drm/i915/display/intel_global_state.h b/drivers/gpu/drm/i915/display/intel_global_state.h
index 33656d74460b..8aef5c2ee4f2 100644
--- a/drivers/gpu/drm/i915/display/intel_global_state.h
+++ b/drivers/gpu/drm/i915/display/intel_global_state.h
@@ -30,7 +30,6 @@ struct intel_global_obj {
 
 struct intel_global_state {
 	struct intel_global_obj *obj;
-	struct intel_atomic_state *state;
 	struct intel_global_commit *commit;
 	struct kref ref;
 	bool changed, serialized;
-- 
2.56.1

