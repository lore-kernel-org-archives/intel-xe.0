Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09BF606A321
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UDBiFah0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48929112955;
	Fri, 30 Oct 2026 17:13:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF7C112944;
 Fri, 30 Oct 2026 17:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793380430; x=1824916430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r41Sa4ZIoygTd7W7hqqeY6XnnQwKwN5qV+LgIDiLSQo=;
 b=UDBiFah0OQxxdMZkOUF5r2tKjsxzzLwvWOD1rjW4q9wk7gqwW+28A17M
 AjozRuR2gyGkxsg0JmFmfCarRg7DNAREoo4/fOdUlA0cjZorkK2rKPnRb
 Auygs7705cjyxvyoEqdE/QWjwzG7U3XH2yE9Gc+qNCWI/iejmTOYM/5Gj
 2t8AeRoLU6H8jaILKrD8/GHz9vIT9DP4KqrbqtadoPg+0Akm6p6c9yIIE
 sAAQ8ZNVEn4skdqT9ZCpAihrf85no+sk1maRPsq2WlS+att8UTqS8QGhY
 by5qTGD+/i3fb14maHIJrefTYeb6J19pCTKV8mL6ky82iQTk6VMQYIh83 g==;
X-CSE-ConnectionGUID: pAqxgoMVTH23Y/g+i5o6bg==
X-CSE-MsgGUID: C5M7gIbDRlyQhtE4CD8POA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2144526"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2144526"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:13:50 -0700
X-CSE-ConnectionGUID: H993j3mnTHGh7qVcBznS6w==
X-CSE-MsgGUID: K+Jfx7ioSVCIn/oBoozpFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5490925"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:13:49 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Suraj Kandpal <suraj.kandpal@intel.com>,
 Pranay Samala <pranay.samala@intel.com>
Subject: [PATCH 04/10] Revert "drm/i915/display: Avoid stale PIPE_SCANLINE
 values after crtc_enable"
Date: Fri, 30 Oct 2026 19:13:20 +0200
Message-ID: <20261030171327.29829-5-ville.syrjala@linux.intel.com>
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

This reverts commit d08e46efae16b607f13d95a4cd5b84a958b7e995.

This extra vblank wait in intel_update_crtc() seems to have been some
kind of hack to hide the problems caused by enabling the vblank
machinery before the timing generator has actually started. That
is now getting fixed properly and this extra vblank wait has in fact
become a hindrance. Once properly handled, port sync secondaries will
not have enabled vblanks at this point, and trying to call
drm_crtc_wait_one_vblank() with vblanks off will result in a WARN.

Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Pranay Samala <pranay.samala@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7dd857b0b8e7..40ffa031cfea 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7003,8 +7003,6 @@ static void intel_enable_crtc(struct intel_atomic_state *state,
 
 	display->modeset.funcs->crtc_enable(state, crtc);
 
-	intel_crtc_wait_for_next_vblank(crtc);
-
 	/* vblanks work again, re-enable pipe CRC. */
 	intel_crtc_enable_pipe_crc(crtc);
 }
-- 
2.55.0

