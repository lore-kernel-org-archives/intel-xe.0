Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AA0606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 16:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A7B9J/4a
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFBA112C46;
	Fri, 23 Oct 2026 16:59:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69795112C46;
 Fri, 23 Oct 2026 16:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792774736; x=1824310736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SN//vbWjhA/yxBJTKAAUI7ZWaYHTN8Q23+MiYv2Bde4=;
 b=A7B9J/4astu08hevTpXucaYgbbjgw2slyzc7i3nqBQdb6L3lDtsoGi0G
 7XzQAyOWfQa8XK0AI0E2SWZneNwIYoXkXvBSO69MNvnx1qWdAcZSWaRGI
 LE2xx1cDwk9q1DRYAUcAFmuNXcTsy//haUlblk7ZhJchSHc/6j+DfxZfY
 nHujv9JOtF+nD4W4byLXwO6ZIxQpO4tSBgd8X8YpU4Ioh+5DCi5hI6MaG
 ktlRh4UEhw5GlHFCn4mNOJYvIxBNESPLF1Lohc/0R/mcMhvIj3SVOu3wr
 XXsVls5Vj/I3/mKQRXDRaHXvy7BbdRgbqGuHWq6TLdUsSQIc2mI3TJq5u w==;
X-CSE-ConnectionGUID: PeaejRuDS7Wsjdk8XSM5Zg==
X-CSE-MsgGUID: Qojzc/VKRwmJHoJrGklhwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1428639"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1428639"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:56 -0700
X-CSE-ConnectionGUID: yzV+4OoJQlKGILLH+YhFNg==
X-CSE-MsgGUID: vfvfexjwQrCfUD9FtPrZBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="4033971"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:53 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 13/13] drm/i915: Add more vertical timing diagrams
Date: Fri, 23 Oct 2026 19:58:03 +0300
Message-ID: <20261023165803.31016-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Document what's going in the vertical blank interval on all
platforms. We already have one diagram, but that also includes
details on the frame counter vs. pixel counter differences and
whatnot, and so would probably get even messier if we added
more to it. So create a new set of simpler diagrams. We basically
have four different timing generator behaviors, add a diagram
for each.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vblank.c | 50 +++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 084f6aaea61d..d93a78cea9cc 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -68,6 +68,56 @@
  *   of horizontal active on the first line of vertical active
  */
 
+/*
+ * Overview of vertical timings:
+ *
+ * Legacy timing generator (pre-TGL):
+ * ... vactive |    vblank   | vactive ...
+ *             | "guardband" |
+ *             | FSD |
+ *             ^     ^
+ *             |     frame start (vblank interrupt on gen2/3)
+ *             vblank
+ *
+ * Legacy timing generator (TGL+):
+ * ... vactive |         vblank         | vactive ...
+ *             | window 2 | "guardband" |
+ *             |   SCL    | FSD |
+ *             ^          ^     ^
+ *             |          |     frame start
+ *             |          delayed vblank
+ *             undelayed vblank
+ *
+ * VRR timing generator (ICL):
+ * ... vactive |               vblank               | vactive ...
+ *             | window 1 | VRR stretch | guardband |
+ *                                      | FSD |
+ *                                      ^     ^
+ *                                      |     frame start
+ *                                      vblank
+ *
+ * VRR timing generator (TGL-LNL):
+ * ... vactive |                    vblank                     | vactive ...
+ *             | window 1 | VRR stretch | window 2 | guardband |
+ *                                      |   SCL    | FSD |
+ *             |    DSB safe window     |
+ *             ^                                   ^     ^
+ *             |                                   |     frame start
+ *             undelayed vblank                    delayed vblank
+ *
+ * VRR timing generator (PTL+):
+ * ... vactive |                    vblank                     | vactive ...
+ *             | window 1 | VRR stretch | window 2 | guardband |
+ *    |  SCL   |                        |   SCL    | FSD |
+ *    |         DSB safe window         |
+ *             ^                                   ^     ^
+ *             |                                   |     frame start
+ *             undelayed vblank                    delayed vblank
+ *
+ * SCL = set context latency
+ * FSD = frame start delay
+ */
+
 /*
  * Called from drm generic code, passed a 'crtc', which we use as a pipe index.
  */
-- 
2.55.0

