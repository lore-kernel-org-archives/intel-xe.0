Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417B6C7EE31
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 00:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DAC10E483;
	Tue,  2 May 2023 00:17:32 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAA310E403
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 00:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682986651; x=1714522651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YEDy/AWyz03++Zp8T5OkvUskdt8RrYdVkxHoS0/acpg=;
 b=Lv1iql4ZPoLxxV9HKE/KNIjXmt3ln9Kw/Ks853gegYlu3MkAxmndgJ/C
 qNoCzaWT6L8Zo6k8KzCYRniWsGiawLTA2fhySKrdGcU4YFQ7ow8IcYupc
 1LjnefP4EtPUSy7FWJv00FzINyABBSDtZxmV3kgCkRjMiLSM7rlKCoUxT
 KXl2FXBtXCv7gXmB+6TtiuZrd14F8GSjKvr53KEBa+TIZcMD/EQ+U0NM1
 XF4B7wrLC0khKQliZDINeIpra3iTdC8RNjCPSf0d82FI7ogaQ9zDwMytB
 84aLB6StiTxq/P2LrvCQrVq7pOE9sVzEOW3LonwyPs92KRRoRVqL7+UBZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332619597"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="332619597"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765541740"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="765541740"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 17:17:22 -0700
Message-Id: <20230502001727.3211096-27-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502001727.3211096-1-matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 26/31] drm/exec: Always compile drm_exec
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
Cc: Danilo Krummrich <dakr@redhat.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We want some helpers for DRM exec in gpuva, alway compile this.

Suggested-by: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ab728632d8a2..40067970af04 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -23,6 +23,7 @@ drm-y := \
 	drm_dumb_buffers.o \
 	drm_edid.o \
 	drm_encoder.o \
+	drm_exec.o \
 	drm_file.o \
 	drm_fourcc.o \
 	drm_framebuffer.o \
@@ -81,8 +82,6 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 # Memory-management helpers
 #
 #
-obj-$(CONFIG_DRM_EXEC) += drm_exec.o
-
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
 drm_dma_helper-y := drm_gem_dma_helper.o
-- 
2.34.1

