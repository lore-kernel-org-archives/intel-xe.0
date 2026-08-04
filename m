Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B1EC5518F
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 09:29:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A9610E92F;
	Tue,  4 Aug 2026 09:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPcr4ZoK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0160410E93E;
 Tue,  4 Aug 2026 09:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785835788; x=1817371788;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=MVCB+9V0aFuQRcaBfbvrV19x1/ZEW2eTqzC/+roU8Y4=;
 b=dPcr4ZoKT1Z75qinJtoyQRiVB8JNdEZCD65Gq44qUKJ3TyaEwZNnKemN
 PhaCzWWx5FCDsCQ75i30TMcgHR1nGEdMc5n8xD/Huc4pPDZISlRD2I0iY
 6vw8xEBOWbJ4x7Hz/RhTVzwl9Z9p4mXg1luRmKxhWYWnt+NaH5ncd1/u7
 Ip1bqxSoITCkFqQtGdY1gdjcddZ1Daz7xjiNBx9tFBkGPWBRf1ZE7ysZN
 B+oNvk0kFaRUJiwB+M8qq6vlDpLa/hjM8yt+iRzwE9DbXzNPZl/5UctGV
 E78xY5KDmKCa1ZGHCbuC3QbrzsOPWYJAZGbk4rLq149V9Fb/WR80yKO5X A==;
X-CSE-ConnectionGUID: cHO2YNEhQUOZctbCWkjLsg==
X-CSE-MsgGUID: GdKeTjnVR7Ks5B0jZ2zZDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97034053"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="97034053"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 02:29:47 -0700
X-CSE-ConnectionGUID: sYmkuYEHRdC4KwTN0Ll5rg==
X-CSE-MsgGUID: JDT4mHD0SvyOv2EIe0Vnrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="259669127"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa006.jf.intel.com with ESMTP; 04 Aug 2026 02:29:46 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 04 Aug 2026 14:58:31 +0530
Subject: [PATCH 2/2] drm/i915/display: Reconcile cdclk SW state with HW on
 DC-off exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260804-cdclk-v1-2-484864b1aafd@intel.com>
References: <20260804-cdclk-v1-0-484864b1aafd@intel.com>
In-Reply-To: <20260804-cdclk-v1-0-484864b1aafd@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Arun R Murthy <arun.r.murthy@intel.com>, 
 =?utf-8?q?Polo-Fran=C3=A7ois_Poli?= <polo.code.dev@gmail.com>
X-Mailer: b4 0.15-dev
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

Add intel_cdclk_sync_hw_state() which adopts the HW-asserted cdclk into
display->cdclk.hw and the committed cdclk_state (actual/logical) so that
future atomic checks operate on a truthful baseline. Any pipe that needs
more cdclk than HW is currently delivering will then naturally attach a
cdclk_state via intel_cdclk_atomic_check() and raise cdclk through the
normal modeset path.

voltage_level cannot be reliably read back on all gens, so the SW value
is preserved.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16595
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Tested-by: Polo-François Poli <polo.code.dev@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.h              | 2 ++
 drivers/gpu/drm/i915/display/intel_display_power_well.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.h b/drivers/gpu/drm/i915/display/intel_cdclk.h
index a60cbf745ee2638a092dbdce98b994b17d7009ef..ed78c855320ad4e92364989fd3f9248748a9de8a 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.h
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.h
@@ -69,6 +69,8 @@ int intel_cdclk_min_cdclk(const struct intel_cdclk_state *cdclk_state, enum pipe
 bool intel_cdclk_pmdemand_needs_update(struct intel_atomic_state *state);
 void intel_cdclk_force_min_cdclk(struct intel_cdclk_state *cdclk_state, int force_min_cdclk);
 void intel_cdclk_read_hw(struct intel_display *display);
+void intel_cdclk_sync_hw_state(struct intel_display *display,
+			       const struct intel_cdclk_config *hw_config);
 
 unsigned int intel_cdclk_prefill_adjustment(const struct intel_crtc_state *crtc_state);
 unsigned int intel_cdclk_prefill_adjustment_worst(const struct intel_crtc_state *crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 02cb4d800e2389fc2a7d958ed78339a74f5c057e..11b8521d9d0c8b5381d3b90b5cbf24b97deacf65 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -1105,6 +1105,7 @@ void gen9_disable_dc_states(struct intel_display *display)
 
 	intel_cdclk_get_cdclk(display, &cdclk_config);
 	/* Can't read out voltage_level so can't use intel_cdclk_changed() */
+	intel_cdclk_sync_hw_state(display, &cdclk_config);
 	drm_WARN_ON(display->drm,
 		    intel_cdclk_clock_changed(&display->cdclk.hw,
 					      &cdclk_config));

-- 
2.25.1

