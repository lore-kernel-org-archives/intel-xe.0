Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CC9606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fe0IKovx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B8A112953;
	Fri, 30 Oct 2026 17:14:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFD010E8B1;
 Fri, 30 Oct 2026 17:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793380457; x=1824916457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R86hSgFHWmSLzNSDNydJSrNP9uc/6+88fJ6RmnXKEzk=;
 b=Fe0IKovx0KdUgZSAvqyyETC0jeAB/2EJAm+AeKWl1tKS85YSrFhB7vkF
 84XdBs1xquxbCquKyte7SyCZRvvsmv005wVi4brHicR4fP1pO9X8pkiF7
 vwYNNU6B1QA8A1CNHLgY7ZtaOnAmtNBYI0TzIYqxJmKlpClZHmK73i5w2
 r4YGMRJoQXDvN4hfFRNeyitWYL6Sd3ttdBzJPVUNbstlls7qas3kB5EC/
 D34oWvF9FDNX4LTArbnCJjDEHZbrGM7vkAvjuhkr9e0b9leIYR52GKYTC
 N+xwjK31OP3v90tVv5FUAKWBnK+p3/LMS7F2xH3D9YAIrXOaUzRait+dy Q==;
X-CSE-ConnectionGUID: RJBcX9N/SeyUN0ZFpRxQgw==
X-CSE-MsgGUID: 4FKUes54S+6ZfZoB+Klb5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2144620"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2144620"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:14:16 -0700
X-CSE-ConnectionGUID: uRnxOt/IST+IKgZbwJSZJA==
X-CSE-MsgGUID: otnnpMkqSu2WhgDmjhdgZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5490956"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:14:16 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 10/10] drm/i915: Allow joiner with port sync
Date: Fri, 30 Oct 2026 19:13:26 +0200
Message-ID: <20261030171327.29829-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
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

Ever since the overhaul to use
for_each_pipe_crtc_modeset_{enable,disable)()/etc
joiner no longer interferes with the transcoder
based order imposed in skl_commit_modeset_enables()
and intel_commit_modeset_disables(). Thus we can
now allow joiner to be used in conjunction with
port sync.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 4f335bbf7076..faddb69d4403 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4675,14 +4675,8 @@ static bool m_n_equal(const struct intel_link_m_n *m_n_1,
 static bool crtcs_port_sync_compatible(const struct intel_crtc_state *crtc_state1,
 				       const struct intel_crtc_state *crtc_state2)
 {
-	/*
-	 * FIXME the modeset sequence is currently wrong and
-	 * can't deal with joiner + port sync at the same time.
-	 *
-	 * TODO VRR + port sync needs special handling
-	 */
+	/* TODO VRR + port sync needs special handling */
 	return crtc_state1->hw.active && crtc_state2->hw.active &&
-		!crtc_state1->joiner_pipes && !crtc_state2->joiner_pipes &&
 		!crtc_state1->vrr.enable && !crtc_state2->vrr.enable &&
 		crtc_state1->output_types == crtc_state2->output_types &&
 		crtc_state1->output_format == crtc_state2->output_format &&
-- 
2.55.0

