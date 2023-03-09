Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F6BC61DA4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 21:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4862A10E2C2;
	Thu,  9 Mar 2023 21:12:28 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E83110E2C4
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 21:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678396346; x=1709932346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/qCek4F+EtLasGThN0X/4MW6zuQnhsenvA9joGuVSG0=;
 b=G1xxN3VGMEYtXLQyhsOjWj1JMWcZTc26mF1EQtLjn8MRWgps8aZ777/r
 cuWCe0EV5eAY2l9B2GNWpCZetMQHCIq/eL9PKZYW+04k2Suv7htC3BDto
 DzDF+vx9T2W3ldXtAgfLZVVmqfA46oU8j0HOELDIqAUXp1jmPgOqkWpG5
 3lPaY6ZSho7pamlv4q/2xKhBIS9fQ0Yv6jyMynZFZLNeDOjDBDLZymBDy
 /eoLwUCCj/HYWTvvevyZA3yuhRfjICAyHsZDEOeC4MnO0YRBFwtg9RLDt
 oCqq23jEWAwqjJNz80lem3o3vywDDKtY9LIMu2rd6pp/tiRsV4VX1FZZz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="316966345"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="316966345"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 13:12:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="766577121"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="766577121"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 13:12:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Mar 2023 13:12:10 -0800
Message-Id: <20230309211210.1713613-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230309211210.1713613-1-lucas.demarchi@intel.com>
References: <20230309211210.1713613-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe/mcr: Document how to initialize
 group/instance
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a sentence about the initialization so it's clear for newcomers
how to tweak the init functions for new platforms.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index ab8fc649ba52..b7cee438f6e3 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -34,7 +34,10 @@
  * fused off or currently powered down due to power gating, the MMIO operation
  * is "terminated" by the hardware.  Terminated read operations will return a
  * value of zero and terminated unicast write operations will be silently
- * ignored.
+ * ignored. During device initialization, the goal of the various
+ * ``init_steering_*()`` functions is to apply the termination rules for each
+ * steering type and return a steering that selects an instance that is not
+ * fused off.
  */
 
 enum {
-- 
2.39.0

