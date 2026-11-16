Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21423606A338
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 08:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ic4aWxlX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC03110E9A8;
	Mon, 16 Nov 2026 08:12:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFD510E3E6;
 Mon, 16 Nov 2026 08:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794816743; x=1826352743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LVY9VPluB3NYFCzignmIHJw3jGKnDlO434hUEASphz8=;
 b=ic4aWxlX10sw5JC1C3GZnPuWZJ3V+BaNl7Ehhgdqj0XQNbip1NXHJAmj
 CH8T8szfp04zfkuw4onNUTnH9Ssck/s8gdv38fH2kkjHLMGRCm6quu53s
 Wt+Pd/ktKVHUgDn0zOLrPfkE3xxecW78I9wyYN0ETaW8PYprXYMRxjhnR
 /krVqpdKFLyCTkA+Jnr9BaPrb70BG3dEmJQ1ht9SZPntt4oJMYJ8Olau5
 R3ywPgZwFRT9mRyPrauIi8FwIKIWB1L/jqvHAM2jwJOO4WU4Ann+KC0pQ
 BDWGOCyEQONUX/c3D5C+Q2B9EkMk/jMDsQ8LbmOqabe1oSQAmuODF/mJB A==;
X-CSE-ConnectionGUID: 3gY5WyGASJmLi/lscUwunQ==
X-CSE-MsgGUID: Ks0xkLm9RmSTA9Ldzi3eaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3553573"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3553573"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:11:11 -0800
X-CSE-ConnectionGUID: yLg+CympQf2eIocU5sAz7g==
X-CSE-MsgGUID: LycasLKKRnCVAG767A1FXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9557740"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 00:11:10 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/7] drm/i915/dsb: Update previous instruction tracking in
 intel_dsb_align_tail() & co.
Date: Mon, 16 Nov 2026 10:10:39 +0200
Message-ID: <20261116081041.6519-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116081041.6519-1-ville.syrjala@linux.intel.com>
References: <20261116081041.6519-1-ville.syrjala@linux.intel.com>
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

intel_dsb_align_tail() and intel_dsb_gosub_align() simply memset
a bunch of QWs to 0. What that actually does is emit a bunch of
NOOP instructions. For complete correctness let's keep the
previous instruction tracking up to date, instead of leaving
it pointing at whatever instruction preceded the alignment
NOOPs.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 75f98b31c780..f8ca64a3c076 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -601,6 +601,8 @@ static void intel_dsb_align_tail(struct intel_dsb *dsb)
 	if (aligned_tail > tail) {
 		dsb_buffer_fill(dsb, dsb->free_pos, 0, aligned_tail - tail);
 		dsb->free_pos = aligned_tail / 4;
+
+		intel_dsb_set_ins(dsb, dsb->free_pos - 2, 0, 0);
 	}
 }
 
@@ -624,6 +626,8 @@ static void intel_dsb_gosub_align(struct intel_dsb *dsb)
 	if (aligned_tail - tail <= 2 * 8) {
 		dsb_buffer_fill(dsb, dsb->free_pos, 0, aligned_tail - tail);
 		dsb->free_pos = aligned_tail / 4;
+
+		intel_dsb_set_ins(dsb, dsb->free_pos - 2, 0, 0);
 	}
 }
 
-- 
2.56.0

