Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6B0C88E50
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 08:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C899A10F55C;
	Fri, 11 Sep 2026 08:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Id7iIfeK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3003310F55C;
 Fri, 11 Sep 2026 08:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789113931; x=1820649931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1tHOYDGKZBfJIFJqyG4Scmug7IgSD0pKWJ+2IzwIKDw=;
 b=Id7iIfeKWnHRnWlYJ+/uP5ZfKoeZwWs+IVXDjgPNjWWzMJXdMnfBqiMP
 zzAqmER1zQvQ7gcN7LiTqOqrwEJGXlXhVTtzrctqRdjRFRy0cuQFNIaYM
 AGAJ+XvXHQ7VEQP0eS+XceI0moCA8z9s6aJEFfK0xcmmxMajlPmTs3578
 PAHprjFkJ9Kp+ttbh3MU2NvXooeGM1WDLy+feBh1QTgsVUJQ8yIfY/fjQ
 v+jn/HkZw/accLcjOGdYj+QX/tkMBd5MC3bheUIkMjyp8IuymDhzv3x+y
 qK+lNmVvsE7uBMax0czrzXQmwl5Uf+dImQQUaV0QBlL6JqFwKfk5Vzp8A Q==;
X-CSE-ConnectionGUID: 6s+me8LHR/y5piQIxsU9Vg==
X-CSE-MsgGUID: GNg4HeS8RT2Rc5IRXBuDBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="101094747"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="101094747"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:30 -0700
X-CSE-ConnectionGUID: uBKSGsXST9OJ2VKBF/CtpQ==
X-CSE-MsgGUID: emcb8uzPRWKjwU95k3JE2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="295334050"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.249])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:27 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v5 06/10] drm/i915/hotplug: add helpers to track HPDs can
 generate PME
Date: Fri, 11 Sep 2026 11:04:44 +0300
Message-ID: <20260911080448.778316-7-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911080448.778316-1-vinod.govindapillai@intel.com>
References: <20260911080448.778316-1-vinod.govindapillai@intel.com>
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
this flag. The plan is, this flag will be set to true from pm runtime
suspend if PME is enabled and this flag will cleared on early runtime
resume unconditionally. This is a place holder for the flag and later
on this flag will be used for conditional IRQ resets and to decide
whether to do HPD polling.

Bspec: 52979, 52980, 68857, 68867, 68970
Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_core.h |  2 ++
 drivers/gpu/drm/i915/display/intel_hotplug.c      | 10 ++++++++++
 drivers/gpu/drm/i915/display/intel_hotplug.h      |  3 +++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index c80b4a2f74f9..b3a396800798 100644
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

