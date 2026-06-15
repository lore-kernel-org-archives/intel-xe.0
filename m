Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F58CD98DA
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 18:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DFB10E5DF;
	Mon, 15 Jun 2026 18:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZ1Sg/Kt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9070710E5DF;
 Mon, 15 Jun 2026 18:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781549311; x=1813085311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nYoMSBXc4f6Yi2tVMFpU4FW2nvHHHfCWbcnHBzIcqWw=;
 b=lZ1Sg/Ktg9Vrk5OpKmLRbqFp3hn50MTzkOxkiSTpf2z0ikUqU4KhQyea
 DtGYfICYdmK4HpDFb/ZkcuhtAEhZRjpmsTfvznRwyIqAJn1YEPDbBvsGP
 7bPORDgJm0guP6eiXvXQ5sAODH2MkxTxq2No1B3NNPtrUoNNkJENKpbly
 3q9Yvr/HpiY9StLx8Yei/FZG18c4EEJnmAECP7hbUBIIGg9H/iDIuX9vF
 2WlvCvcLeoueQexCTn90kbHJ8qaL9tTZn/VvYHjYMy1jg80Ok3F85Mgd8
 ZsCjF6akVCDTYmucrKwpAzuyOEleSCKygCa67rWNr/QX3F+JhodOikIiJ w==;
X-CSE-ConnectionGUID: KKxi/RJTQA6QTQ4qpFSiZQ==
X-CSE-MsgGUID: Vy/CtXL8T0SUUyJTrHmR8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81438590"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="81438590"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 11:48:31 -0700
X-CSE-ConnectionGUID: KZh6stEBR3GwWwfxM2UHtQ==
X-CSE-MsgGUID: GtQLkYI9RKea3bUgle6W1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247628625"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 11:48:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 5/6] drm/{i915,
 xe}: move opregion cleanup to intel_display_driver_remove_nogem()
Date: Mon, 15 Jun 2026 21:48:02 +0300
Message-ID: <8ccd49a5945e0560ba22079d686db1268e8e9f7f.1781549229.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781549229.git.jani.nikula@intel.com>
References: <cover.1781549229.git.jani.nikula@intel.com>
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

The intel_opregion_cleanup() call should really be in display. Move it
at the end of intel_display_driver_probe_noirq().

For xe, this is a completely non-functional change now that the
noirq/nogem cleanup calls are in the right order.

For i915, this only changes the relative order of
intel_opregion_cleanup() and i915_perf_fini(), which should be of no
consequence.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
 drivers/gpu/drm/i915/i915_driver.c                  | 3 ---
 drivers/gpu/drm/xe/display/xe_display.c             | 1 -
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 15a61f171d73..a1c91fbf737c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -662,6 +662,8 @@ void intel_display_driver_remove_nogem(struct intel_display *display)
 	intel_display_power_driver_remove(display);
 
 	intel_bios_driver_remove(display);
+
+	intel_opregion_cleanup(display);
 }
 
 void intel_display_driver_unregister(struct intel_display *display)
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 05fdcba7b2dc..68ab96b8195b 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -586,13 +586,10 @@ ALLOW_ERROR_INJECTION(i915_driver_hw_probe, ERRNO);
  */
 static void i915_driver_hw_remove(struct drm_i915_private *dev_priv)
 {
-	struct intel_display *display = dev_priv->display;
 	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
 	i915_perf_fini(dev_priv);
 
-	intel_opregion_cleanup(display);
-
 	pci_disable_msi(pdev);
 }
 
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 0d93784754c1..8be3e600838b 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -84,7 +84,6 @@ static void xe_display_fini_early(void *arg)
 	intel_hpd_cancel_work(display);
 	intel_display_driver_remove_noirq(display);
 	intel_display_driver_remove_nogem(display);
-	intel_opregion_cleanup(display);
 	intel_display_power_cleanup(display);
 }
 
-- 
2.47.3

