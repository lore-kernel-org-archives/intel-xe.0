Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E179C77B78
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 13:10:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F41310E29A;
	Wed,  3 May 2023 13:10:19 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4111C10E29A
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 13:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683119417; x=1714655417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uJP0dWb8jptvXA4Z32n1qvdXEGdqpnWdfB6vnlXsaF4=;
 b=mQerELwiahEi1Ye7yRH0LKFAIrj0XIujcOQrs3k6dJX0WTkbbTyuxN2V
 6koHF1Pi3SsB6pTZ2qiuWu7Dyflnq6LYD904C1NGnDos1YiSCdHvsLtUY
 lxUA3Og5Nq9/tfKc1QYfB0PXaeqggNqqQa+6sQ95xdKlpP9es2JDIKPsj
 SPbLxNibi/CbKrYwi5KvFio7xbzLfFCygYDlgRXLpciK475veAwww6t0y
 T75+qLq6WLrF0GaCDgsK4R5MNB4QOH4Q9GjAKUwa/u70pqAD3y3r+VSnK
 7Vt+wJGQUNsHpUm6l0mopQzhJ5wn8xUV+swNy6ng6Yy57Rnc/1/AMLtLF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="434960681"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="434960681"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="820762226"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="820762226"
Received: from ebrosekx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.204])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:10:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 16:09:48 +0300
Message-Id: <20230503131005.1602412-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503131005.1602412-1-jani.nikula@intel.com>
References: <20230503131005.1602412-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 01/18] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add struct fake_uncore, mostly to allow getting at struct xe_device when
&i915->uncore is used.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 4 ++++
 drivers/gpu/drm/xe/xe_display.c      | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 1cb404e48aaa..97f3d67f7c97 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -312,6 +312,10 @@ struct xe_device {
 	bool display_irqs_enabled;
 	u32 enabled_irq_mask;
 
+	struct fake_uncore {
+		spinlock_t lock;
+	} uncore;
+
 	/* only to allow build, not used functionally */
 	struct {
 		unsigned int hpll_freq;
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 376186bc02e5..18d638e75be2 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -140,6 +140,9 @@ int xe_display_init_nommio(struct xe_device *xe)
 	if (!xe->info.enable_display)
 		return 0;
 
+	/* Fake uncore lock */
+	spin_lock_init(&xe->uncore.lock);
+
 	/* This must be called before any calls to HAS_PCH_* */
 	intel_detect_pch(xe);
 	intel_display_irq_init(xe);
-- 
2.39.2

