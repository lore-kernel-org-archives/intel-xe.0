Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD79C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 12:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E7C10F4AD;
	Fri,  7 Aug 2026 12:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkHD8QWn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4249010F4AD;
 Fri,  7 Aug 2026 12:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786106070; x=1817642070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kyMXz8aL+znRSmfMCj6kLaZQXoBfPtvFsHANQoz836o=;
 b=NkHD8QWnJaDeRSjmh3rFBvgZdaxzvXG07xsBmNESTdGGZYSfoaea2Gjw
 kd1vd41J1taDt4DUhXORn39mDe3/geaWPMPh+F3tgmjssqN2yjPJOKiV1
 O1B3tej3VPT0/T3uvPBzWH/WeQ1MG7683qY7CMBBd/VJtKk55z6wjX1OR
 IHgoH8lFSSJT80K+SwW5MUCxsrYhGTRlCu+SMFnKZGjsRXGJ8x9Sg32u7
 X/m6Zp65zMqir70eTDsLTYcobm1kRrV37+x9VnBWaKzjzMqJl4fvr+gfe
 ALACMu9kKW2L/nQ5j+k+ys0sDEFAsN7niq/yejnefvmqVO8n4ATuJ9glh w==;
X-CSE-ConnectionGUID: llXYReQKQt2YA7V6dwb/Vw==
X-CSE-MsgGUID: bvOBgcw3RC6FL0KkI6qRiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86824041"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86824041"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:34:30 -0700
X-CSE-ConnectionGUID: ZD/AwhCIQY+STJP28jwsgw==
X-CSE-MsgGUID: XvE8OpsyQtKJjrcz5v3gRA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:34:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	jani.nikula@intel.com
Subject: [PATCH 4/4] drm/i915/debugfs: Reject invalid force_joined_pipes harder
Date: Fri,  7 Aug 2026 15:34:07 +0300
Message-ID: <df39b8f30d27a441465b4d9bd42d4db982e5db2b.1786105831.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786105831.git.jani.nikula@intel.com>
References: <cover.1786105831.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Reject invalid joiner forcing more thoroughly, taking into account
whether bigjoiner or uncompressed joiner is available, and whether the
requested number of pipes can actually be joined.

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/i915/display/intel_display_debugfs.c  | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 2bbf4760dc30..3e302f23f247 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1285,22 +1285,11 @@ static ssize_t i915_joiner_write(struct file *file,
 	if (ret < 0)
 		return ret;
 
-	switch (force_joined_pipes) {
-	case 0:
-	case 1:
-	case 2:
-		connector->force_joined_pipes = force_joined_pipes;
-		break;
-	case 4:
-		if (HAS_ULTRAJOINER(display)) {
-			connector->force_joined_pipes = force_joined_pipes;
-			break;
-		}
-
-		fallthrough;
-	default:
+	if (force_joined_pipes &&
+	    !intel_joiner_valid_primary_pipe_mask(display, force_joined_pipes))
 		return -EINVAL;
-	}
+
+	connector->force_joined_pipes = force_joined_pipes;
 
 	*offp += len;
 
-- 
2.47.3

