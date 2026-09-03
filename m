Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1686C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 08:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4386910F441;
	Thu,  3 Sep 2026 08:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3YINmHu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8183710E65C;
 Thu,  3 Sep 2026 08:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788422676; x=1819958676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mb297ijjnZMkjE10oeAD/5IJ1WZ3Zmfat32Sc7y5rUw=;
 b=a3YINmHu5n1hkks3tZLrfIMO/Mn+PiYWKVTnhrY7+A6FLtlQjLufCxDE
 BmoQJ9TfKYRm/FS6INMjDey2+aOQW//7h/a4+4R5s6lDetEZhEbHdmSSx
 7BQK6n85D48B/1AmKOrf4Go4vkTDNEOJK7eXvtVoqHwo8WnBReYK1tGOW
 tsPbWeOkGzvtzgJ3Vc/1hnm6U3AjBw4wy9CCy3EChc4YJBoR5uTTjOOQg
 pYWeZX9R1AUgruP4GpO4s5tCYyfnOMlYjIsH+Y8d40X9lnDTxTJ3zGeP5
 M+4gCIvX9BhMYwd0yINnE/piUgt3UYSPSl8gPcIxg7GfGp6le/sfL8TlG g==;
X-CSE-ConnectionGUID: i+IoDNOVTGG63xEO70vuKA==
X-CSE-MsgGUID: rzJAEdhJTfOvGPx9AwO/Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88919214"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88919214"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 01:04:35 -0700
X-CSE-ConnectionGUID: Dl4Ls+PTSIG3AcsZmUMn1g==
X-CSE-MsgGUID: DEs40moQSoq4frsl7GaQ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="266397375"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.156])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 01:04:33 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v2 2/5] drm/i915/hotplug: add helpers to track HPDs can
 generate PME
Date: Thu,  3 Sep 2026 11:04:07 +0300
Message-ID: <20260903080410.489411-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903080410.489411-1-vinod.govindapillai@intel.com>
References: <20260903080410.489411-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

As NVL+ devices can generate PME from HPDs, introduce a flag to
keep track of such a capability and helper functions to access
this flag. This flag will be set to true from runtime pm
functions if device is capable of wakeup from HPDs. This is a
place holder for the flag and it will be used for conditional
IRQ resets and HPD polling on suspend.

Bspec: 52979, 52980, 68857, 68867, 68970
Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_core.h |  2 ++
 drivers/gpu/drm/i915/display/intel_hotplug.c      | 10 ++++++++++
 drivers/gpu/drm/i915/display/intel_hotplug.h      |  3 +++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index 7e988b7b1fe7..30b6f2524dee 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -220,6 +220,8 @@ struct intel_hotplug {
 	 * cue to ignore the long HPDs and can be set / unset using debugfs.
 	 */
 	bool ignore_long_hpd;
+
+	bool can_generate_pme;
 };
 
 struct intel_vbt_data {
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index 970aa95ee344..b24c9f360e24 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -846,6 +846,16 @@ static void i915_hpd_poll_init_work(struct work_struct *work)
 	}
 }
 
+void intel_hpd_set_pme_capable(struct intel_display *display, bool can_generate_pme)
+{
+	display->hotplug.can_generate_pme = can_generate_pme;
+}
+
+bool intel_hpd_can_generate_pme(struct intel_display *display)
+{
+	return display->hotplug.can_generate_pme;
+}
+
 /**
  * intel_hpd_poll_enable - enable polling for connectors with hpd
  * @display: display device instance
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.h b/drivers/gpu/drm/i915/display/intel_hotplug.h
index edc41c9d3d65..c57e30f8366b 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.h
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.h
@@ -35,4 +35,7 @@ void intel_hpd_enable_detection_work(struct intel_display *display);
 void intel_hpd_disable_detection_work(struct intel_display *display);
 bool intel_hpd_schedule_detection(struct intel_display *display);
 
+void intel_hpd_set_pme_capable(struct intel_display *display, bool can_generate_pme);
+bool intel_hpd_can_generate_pme(struct intel_display *display);
+
 #endif /* __INTEL_HOTPLUG_H__ */
-- 
2.43.0

