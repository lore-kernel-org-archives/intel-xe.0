Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1670C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D0E10E8E9;
	Tue, 25 Aug 2026 06:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kA/0n6Wu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDE410E8DE;
 Tue, 25 Aug 2026 06:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787638760; x=1819174760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9xfomz89eou1v7C5fevyzGjFFp6iprq9o17IpBLnO+U=;
 b=kA/0n6Wu7YEAFprJqyi9n0QaWgFy8NcBrpfOzM5xzp5B03EZQ3lv0I+7
 6a8db/Lm3HoA7eVdJCTlpxmhHSdpIpWBdtAhf6kdVoUI7seWt3yeNzv/b
 KqHlO/yT+hTsRbuv2G8xT/ou0AB2FZVEP00WUTRs0l+Na5P6qRSZgYNc8
 VDfnhFEHfKf7hX9U9G17k1fVXIxFRLswbppFeozgKr2tEZzKIwJTThMdt
 NVOKKqlzdo0PJ94pYyW2P53kSC6D0aSbiHuIpAQOoo0JgCxgURGnm10mX
 EWZoHFtp5ReSWkJscAuZQWvMrkTqxAvJdCDeTqd/sNtc7/Sg/kpl6UT2x g==;
X-CSE-ConnectionGUID: Imw6jw5IRYm4B6NXdK0RAQ==
X-CSE-MsgGUID: A2vUDLa+SlWwp/7l/1TQrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112658"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112658"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:19:15 -0700
X-CSE-ConnectionGUID: D4bJk6X4S+uEUAtt/KXQbw==
X-CSE-MsgGUID: 2bY20Uj7SJa18SgE4DVflQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263912902"
Received: from unknown (HELO SRR4-3-Linux-101-amanna.iind.intel.com)
 ([10.190.238.88])
 by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2026 23:19:14 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 04/15] drm/i915/alpm: Enable debugfs for DP2.1
Date: Tue, 25 Aug 2026 11:15:25 +0530
Message-Id: <20260825054536.3455704-5-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260825054536.3455704-1-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Enable ALPM debug info through lobf debug info.

v2: cosmetic change. [Suraj]
v3: Use common api instead of DISPLAY_VER check in multiple places. [Jani]

Cc: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 08ad77cd32f8..8cfcda97cf58 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -617,11 +617,9 @@ DEFINE_SIMPLE_ATTRIBUTE(i915_edp_lobf_debug_fops,
 
 void intel_alpm_lobf_debugfs_add(struct intel_connector *connector)
 {
-	struct intel_display *display = to_intel_display(connector);
 	struct dentry *root = connector->base.debugfs_entry;
 
-	if (DISPLAY_VER(display) < 20 ||
-	    connector->base.connector_type != DRM_MODE_CONNECTOR_eDP)
+	if (!intel_alpm_source_supported(connector))
 		return;
 
 	debugfs_create_file("i915_edp_lobf_debug", 0644, root,
-- 
2.29.0

