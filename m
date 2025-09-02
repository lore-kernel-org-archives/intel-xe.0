Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D3BCA100B
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 15:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABD410E338;
	Tue,  2 Sep 2025 15:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LiJdCAjy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F297510E1AF;
 Tue,  2 Sep 2025 15:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756827559; x=1788363559;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3/PCvos/KssPfvreLFyUGexk05sUzBGJ1A78qvqi+hM=;
 b=LiJdCAjyWlgfFeGxKs5wezWdYGEDKG4Zsy5fBy3+7h5R5P2q0y8XSFuD
 /pAy4XJqgi2lGoMnkeU48E1JQN2MZRev2Ar876X/4CRcP6WkMi0aEM5R0
 pMyprkTNnG6zwoRM8qR1uSaQ7qcA3AHnrXt5YH5PaQxGbcFeTyGOisH9d
 KDmyso1WfWk85fVwL/ZytDXW9p+ybFvhnyFtu1GFqOJvsmMCn5in0zY1u
 /f9G5rkEdEn/2i4LB9Rb1OsXEH8nvbdajxkD+u7Nn5aE1vrI79ku49PrW
 Pz3oQKLXfL9YgKvvd+ylMVChY6QwufLVLz9LdyPIWcciZQSs6KtuLBh8w w==;
X-CSE-ConnectionGUID: HC/qaIn9Q+Gh0J875IG0gQ==
X-CSE-MsgGUID: 3Palw0cCQ2uJ75magyM6zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="61748168"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="61748168"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 08:39:18 -0700
X-CSE-ConnectionGUID: BBmQ7s0SS3uvl2TFuTtmWQ==
X-CSE-MsgGUID: EzqAaefJQ++wxKX9OQX6SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="176616364"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.118])
 by orviesa005.jf.intel.com with SMTP; 02 Sep 2025 08:39:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 02 Sep 2025 18:39:15 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/i915/hpd: Fix mtp_tc_hpd_enable_detection()
Date: Tue,  2 Sep 2025 18:39:15 +0300
Message-ID: <20250902153915.4423-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Set the MTP TC hotplug bits in the correct register.

Shouldn't matter really as this only gets used for eDP
detection and there should be never eDP on TC ports on
current hw.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
index 43aee70597bf..4f72f3fb9af5 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
@@ -1025,7 +1025,7 @@ static void mtp_tc_hpd_enable_detection(struct intel_encoder *encoder)
 {
 	struct intel_display *display = to_intel_display(encoder);
 
-	intel_de_rmw(display, SHOTPLUG_CTL_DDI,
+	intel_de_rmw(display, SHOTPLUG_CTL_TC,
 		     mtp_tc_hotplug_mask(encoder->hpd_pin),
 		     mtp_tc_hotplug_enables(encoder));
 }
-- 
2.49.1

