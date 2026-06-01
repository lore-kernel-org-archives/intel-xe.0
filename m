Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF691CD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 14:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD87F11344A;
	Mon,  1 Jun 2026 14:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TS1ImEQO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C48113445;
 Mon,  1 Jun 2026 14:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780325052; x=1811861052;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xtoFAbkTKEFgnElqKg5w1jTnifHZ3k2NP+RDG2iXTnA=;
 b=TS1ImEQOXokuTERklAW/zKv8sUAN/f+r5p4+urFWEnWcs7F/ZFmirxSX
 l1GNMY/FqwxXx3yThWV8caG656ueH1qIfESfdJNw1Cr0et7743XGbv1yu
 +3aqPWqYDmljl7NESG3aFLh+X5F9Wlgi+gPcwScPDYKapNJvwfHqhGNa0
 QBrMO9latIn7F+t37B3KLWxDg4SAvlQspIpi24XAmhyMpKMoTL8DCLqzm
 1GrREc9Tz16gcQXlLAPH5b5Mb8Jhb98944n5QtJJD1g1hVrYih5GANIDx
 K0vANGmBaoDlVJZCTKUli8AQLyXKmVL7Rtnj3oJYqMCsDF+XLz9t/9pds w==;
X-CSE-ConnectionGUID: c+Zj5SnUSle0LFXG1HkI1A==
X-CSE-MsgGUID: CnGrMhtjRg+BkwC6H6PAkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91765659"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="91765659"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 07:44:11 -0700
X-CSE-ConnectionGUID: /n3Pj4sqQ7yV65E+2W/t0g==
X-CSE-MsgGUID: xHIdjm2XT2CCs/6nTGv98w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="239420067"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa010.fm.intel.com with ESMTP; 01 Jun 2026 07:44:10 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH] drm/i915/drrs: Synchronize drrs activate with debugfs
Date: Mon,  1 Jun 2026 20:12:55 +0530
Message-Id: <20260601144255.1481931-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

Honor the drrs deactivate coming from debugfs and keep it disabled until
the same is enabled from the user.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h |  2 ++
 drivers/gpu/drm/i915/display/intel_drrs.c          | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 84bd0d993197..709595bde8d3 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1537,6 +1537,8 @@ struct intel_crtc {
 		unsigned int busy_frontbuffer_bits;
 		enum transcoder cpu_transcoder;
 		struct intel_link_m_n m_n, m2_n2;
+		/* Runtime override; set to keep DRRS off across commits. */
+		bool force_disabled;
 	} drrs;
 
 	struct {
diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
index 0fdb32ef241c..6bebb04034e6 100644
--- a/drivers/gpu/drm/i915/display/intel_drrs.c
+++ b/drivers/gpu/drm/i915/display/intel_drrs.c
@@ -165,6 +165,12 @@ void intel_drrs_activate(const struct intel_crtc_state *crtc_state)
 
 	mutex_lock(&crtc->drrs.mutex);
 
+	/* don't re-arm DRRS if forcefully disabled by debugfs */
+	if (crtc->drrs.force_disabled) {
+		mutex_unlock(&crtc->drrs.mutex);
+		return;
+	}
+
 	crtc->drrs.cpu_transcoder = crtc_state->cpu_transcoder;
 	crtc->drrs.m_n = crtc_state->dp_m_n;
 	crtc->drrs.m2_n2 = crtc_state->dp_m2_n2;
@@ -376,6 +382,10 @@ static int intel_drrs_debugfs_ctl_set(void *data, u64 val)
 
 	drm_dbg_kms(display->drm, "Manually %sactivating DRRS\n", val ? "" : "de");
 
+	mutex_lock(&crtc->drrs.mutex);
+	crtc->drrs.force_disabled = !val;
+	mutex_unlock(&crtc->drrs.mutex);
+
 	if (val)
 		intel_drrs_activate(crtc_state);
 	else
-- 
2.25.1

