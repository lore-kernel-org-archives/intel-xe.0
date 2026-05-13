Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDECCD4F24
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 07:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06E310ED3F;
	Wed, 13 May 2026 07:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n1HUlRxz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B105E10ED3E;
 Wed, 13 May 2026 07:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778659129; x=1810195129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MucNqXhNXZdze2Pb7aH13Qz9bWNxRHNWsLhT/imfpng=;
 b=n1HUlRxzCdfkQXIi5R1ToathQwDEWJwdJtSxRZjSKUDIxkizvs2ZmJyo
 yvYnC7wvhGB5wasISi4H4QoNpfEBloCnT+ou+kaszlXr0x27t3iE7Yggy
 +q8II8aX93OSzwx7he9dHjBECb2LPEaG90so44gQ0V+EQMfFN9Xw+pCW3
 kKWBEmW9gADcM86cQR8Gjl8Oq0XrJEzTZU2zHqGHp8reCsSseqXeLUxcL
 a86878k7Zlj04xs6IOTU8xxPshbp0XI/0YVENqdPkrUt3c8YTJI4BFfGx
 FfEHiwDoKpqzIZ2Fx/Bu05WITGDQR5ezIIJ35X/S4uNwp5B0qU6r90Vpi g==;
X-CSE-ConnectionGUID: L6YCL4G8SCWwehwYEgmvbA==
X-CSE-MsgGUID: TwIRUD0gR8imve5d0Z+i9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90159440"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="90159440"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 00:58:49 -0700
X-CSE-ConnectionGUID: 6KYvLxQ3QNeJejWkfj9vcg==
X-CSE-MsgGUID: KEAVCDq6Rv2ErvIyc98p7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="242970653"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.61])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 00:58:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [RESEND 1/6] drm/{i915,
 xe}: move xe_display_flush_cleanup_work() to i915 display
Date: Wed, 13 May 2026 10:58:35 +0300
Message-ID: <7aecde385b66dbf7d0e61759528c6cd643581a3d.1778659089.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778659089.git.jani.nikula@intel.com>
References: <cover.1778659089.git.jani.nikula@intel.com>
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

xe_display_flush_cleanup_work() is a bit of an oddball function in xe
display code. There shouldn't be anything this specific or xe
specific. While I'm not sure what the correct refactor for the function
should be, move it to shared display code for starters, next to the
eerily similar but slightly different intel_has_pending_fb_unpin() that
is only called from i915 core.

The main goal here is to unblock some refactors on
for_each_intel_crtc().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 21 +++++++++++++++
 drivers/gpu/drm/i915/display/intel_display.h |  1 +
 drivers/gpu/drm/xe/display/xe_display.c      | 27 +++-----------------
 3 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index d5cf1476c7b9..50feca52b962 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -737,6 +737,27 @@ bool intel_has_pending_fb_unpin(struct intel_display *display)
 	return false;
 }
 
+void intel_display_flush_cleanup_work(struct intel_display *display)
+{
+	struct intel_crtc *crtc;
+
+	for_each_intel_crtc(display->drm, crtc) {
+		struct drm_crtc_commit *commit;
+
+		spin_lock(&crtc->base.commit_lock);
+		commit = list_first_entry_or_null(&crtc->base.commit_list,
+						  struct drm_crtc_commit, commit_entry);
+		if (commit)
+			drm_crtc_commit_get(commit);
+		spin_unlock(&crtc->base.commit_lock);
+
+		if (commit) {
+			wait_for_completion(&commit->cleanup_done);
+			drm_crtc_commit_put(commit);
+		}
+	}
+}
+
 /*
  * Finds the encoder associated with the given CRTC. This can only be
  * used when we know that the CRTC isn't feeding multiple encoders!
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index a43ada0c0502..65f8c81a7bae 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -402,6 +402,7 @@ void intel_disable_transcoder(const struct intel_crtc_state *old_crtc_state);
 void i830_enable_pipe(struct intel_display *display, enum pipe pipe);
 void i830_disable_pipe(struct intel_display *display, enum pipe pipe);
 bool intel_has_pending_fb_unpin(struct intel_display *display);
+void intel_display_flush_cleanup_work(struct intel_display *display);
 void intel_encoder_destroy(struct drm_encoder *encoder);
 struct drm_display_mode *
 intel_encoder_current_mode(struct intel_encoder *encoder);
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index aa73023b7398..ef27fdfdbab2 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -258,27 +258,6 @@ static bool suspend_to_idle(void)
 	return false;
 }
 
-static void xe_display_flush_cleanup_work(struct xe_device *xe)
-{
-	struct intel_crtc *crtc;
-
-	for_each_intel_crtc(&xe->drm, crtc) {
-		struct drm_crtc_commit *commit;
-
-		spin_lock(&crtc->base.commit_lock);
-		commit = list_first_entry_or_null(&crtc->base.commit_list,
-						  struct drm_crtc_commit, commit_entry);
-		if (commit)
-			drm_crtc_commit_get(commit);
-		spin_unlock(&crtc->base.commit_lock);
-
-		if (commit) {
-			wait_for_completion(&commit->cleanup_done);
-			drm_crtc_commit_put(commit);
-		}
-	}
-}
-
 static void xe_display_enable_d3cold(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
@@ -292,7 +271,7 @@ static void xe_display_enable_d3cold(struct xe_device *xe)
 	 */
 	intel_power_domains_disable(display);
 
-	xe_display_flush_cleanup_work(xe);
+	intel_display_flush_cleanup_work(display);
 
 	intel_opregion_suspend(display, PCI_D3cold);
 
@@ -347,7 +326,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
 		intel_display_driver_suspend(display);
 	}
 
-	xe_display_flush_cleanup_work(xe);
+	intel_display_flush_cleanup_work(display);
 
 	intel_encoder_block_all_hpds(display);
 
@@ -379,7 +358,7 @@ void xe_display_pm_shutdown(struct xe_device *xe)
 		intel_display_driver_suspend(display);
 	}
 
-	xe_display_flush_cleanup_work(xe);
+	intel_display_flush_cleanup_work(display);
 	intel_dp_mst_suspend(display);
 	intel_encoder_block_all_hpds(display);
 	intel_hpd_cancel_work(display);
-- 
2.47.3

