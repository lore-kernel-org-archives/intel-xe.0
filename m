Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C84CCF9ED
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 05:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF91810E2CA;
	Mon, 27 Oct 2025 05:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QkQQoSsq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A382110E138
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 05:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761544681; x=1793080681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NjQI7UQjRNbJnueSV6iBU/QpIRgl5TwFb46BjBdY9H8=;
 b=QkQQoSsqhUKgBvD4mdQ8+O0+clKlHkCTlxqt8R/xtwuKhYAI0TC3z6vZ
 p+Xo/HSBCo59oum5PC9JqCWvmgyQrn9kWh75T2Mpl63vSFoxc234V+Ese
 ibsq+4KX0L3Loq1KkwB3HltBJbfaXIYk4D/F1L8uUKQ1QoRvlsHfc3EzJ
 YnI0MfgZEuzQsCCokL359RZjgZn0WU0BC0eSyQ7srRssR5F+uuotuBZ6C
 Xj/alrLizhznulCpCScqM8cY5IKa6IYP1jejLAp7d10/9f5PU6YyIHJFW
 b5VBuI34HNvI6tEL4pndqXrSiwsLQYRcy3Qva+HNB1XBeqbNiM5heF79a g==;
X-CSE-ConnectionGUID: PpEQAH5DS4OMx5Tt5QnwGA==
X-CSE-MsgGUID: +dg3gOOsSkyZdaaeHq+j4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73905952"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="73905952"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:58:01 -0700
X-CSE-ConnectionGUID: pfMzPkS6SN6YxhuuH2KzYA==
X-CSE-MsgGUID: IMw081eQSdiqB0KMip9P1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="185308479"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:58:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 6/8] drm/xe: Improve freq and throttle documentation
Date: Sun, 26 Oct 2025 22:57:18 -0700
Message-ID: <20251026-gt-throttle-cri-v2-6-41f8288a71a7@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
References: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-50d74
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

Add xe_gt_throttle under the "GT Frequency Management" and improve the
narrative making sure the documentation for both *_freq and throttle/*
attributes follow the same style.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/gpu/xe/xe_gt_freq.rst |  3 ++
 drivers/gpu/drm/xe/xe_gt_freq.c     | 30 ++++++++++---------
 drivers/gpu/drm/xe/xe_gt_throttle.c | 60 ++++++++++++++++++++-----------------
 3 files changed, 52 insertions(+), 41 deletions(-)

diff --git a/Documentation/gpu/xe/xe_gt_freq.rst b/Documentation/gpu/xe/xe_gt_freq.rst
index c0811200e3275..182d6aabeee18 100644
--- a/Documentation/gpu/xe/xe_gt_freq.rst
+++ b/Documentation/gpu/xe/xe_gt_freq.rst
@@ -7,6 +7,9 @@ Xe GT Frequency Management
 .. kernel-doc:: drivers/gpu/drm/xe/xe_gt_freq.c
    :doc: Xe GT Frequency Management
 
+.. kernel-doc:: drivers/gpu/drm/xe/xe_gt_throttle.c
+   :doc: Xe GT Throttle
+
 Internal API
 ============
 
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 701349251bbc5..9e0d94e213611 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -29,24 +29,26 @@
  * PCODE is the ultimate decision maker of the actual running frequency, based
  * on thermal and other running conditions.
  *
- * Xe's Freq provides a sysfs API for frequency management:
+ * Xe's Freq provides a sysfs API for frequency management under
+ * ``<device>/tile#/gt#/freq0/`` directory.
  *
- * device/tile#/gt#/freq0/<item>_freq *read-only* files:
+ * **Read-only** attributes:
  *
- * - act_freq: The actual resolved frequency decided by PCODE.
- * - cur_freq: The current one requested by GuC PC to the PCODE.
- * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
- * - rpa_freq: The Render Performance (RP) A level, which is the achiveable one.
- *   Calculated by PCODE at runtime based on multiple running conditions
- * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
- *   Calculated by PCODE at runtime based on multiple running conditions
- * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
+ * - ``act_freq``: The actual resolved frequency decided by PCODE.
+ * - ``cur_freq``: The current one requested by GuC PC to the PCODE.
+ * - ``rpn_freq``: The Render Performance (RP) N level, which is the minimal one.
+ * - ``rpa_freq``: The Render Performance (RP) A level, which is the achiveable one.
+ *                 Calculated by PCODE at runtime based on multiple running conditions
+ * - ``rpe_freq``: The Render Performance (RP) E level, which is the efficient one.
+ *                 Calculated by PCODE at runtime based on multiple running conditions
+ * - ``rp0_freq``: The Render Performance (RP) 0 level, which is the maximum one.
  *
- * device/tile#/gt#/freq0/<item>_freq *read-write* files:
+ * **Read-write** attributes:
  *
- * - min_freq: Min frequency request.
- * - max_freq: Max frequency request.
- *             If max <= min, then freq_min becomes a fixed frequency request.
+ * - ``min_freq``: Min frequency request.
+ * - ``max_freq``: Max frequency request.
+ *                 If max <= min, then freq_min becomes a fixed frequency
+ *                 request.
  */
 
 static struct xe_guc_pc *
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index b5317cf714e2e..8647d2c997347 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -17,35 +17,41 @@
 /**
  * DOC: Xe GT Throttle
  *
- * Provides sysfs entries and other helpers for frequency throttle reasons in GT
- *
- * device/gt#/freq0/throttle/status - Overall status
- * device/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to PL1
- * device/gt#/freq0/throttle/reason_pl2 - Frequency throttle due to PL2
- * device/gt#/freq0/throttle/reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
- * device/gt#/freq0/throttle/reason_thermal - Frequency throttle due to thermal
- * device/gt#/freq0/throttle/reason_prochot - Frequency throttle due to prochot
- * device/gt#/freq0/throttle/reason_ratl - Frequency throttle due to RATL
- * device/gt#/freq0/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
- * device/gt#/freq0/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
+ * The GT frequency may be throttled by hardware/firmware for various reasons
+ * that are provided through attributes under the ``freq0/throttle/`` directory.
+ * Their availability depend on the platform and some may not be visible if that
+ * reason is not available.
  *
  * The following attributes are available on Crescent Island platform:
- * device/gt#/freq0/throttle/status - Overall throttle status
- * device/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to package PL1
- * device/gt#/freq0/throttle/reason_pl2 - Frequency throttle due to package PL2
- * device/gt#/freq0/throttle/reason_pl4 - Frequency throttle due to PL4
- * device/gt#/freq0/throttle/reason_prochot - Frequency throttle due to prochot
- * device/gt#/freq0/throttle/reason_soc_thermal - Frequency throttle due to SoC thermal
- * device/gt#/freq0/throttle/reason_mem_thermal - Frequency throttle due to memory thermal
- * device/gt#/freq0/throttle/reason_vr_thermal - Frequency throttle due to VR thermal
- * device/gt#/freq0/throttle/reason_iccmax - Frequency throttle due to ICCMAX
- * device/gt#/freq0/throttle/reason_ratl - Frequency throttle due to RATL thermal algorithm
- * device/gt#/freq0/throttle/reason_soc_avg_thermal - Frequency throttle due to SoC average temp
- * device/gt#/freq0/throttle/reason_fastvmode - Frequency throttle due to VR is hitting FastVMode
- * device/gt#/freq0/throttle/reason_psys_pl1 - Frequency throttle due to PSYS PL1
- * device/gt#/freq0/throttle/reason_psys_pl2 - Frequency throttle due to PSYS PL2
- * device/gt#/freq0/throttle/reason_p0_freq - Frequency throttle due to P0 frequency
- * device/gt#/freq0/throttle/reason_psys_crit - Frequency throttle due to PSYS critical
+ *
+ * - ``status``: Overall throttle status
+ * - ``reason_pl1``: package PL1
+ * - ``reason_pl2``: package PL2
+ * - ``reason_pl4``: package PL4
+ * - ``reason_prochot``: prochot
+ * - ``reason_soc_thermal``: SoC thermal
+ * - ``reason_mem_thermal``: Memory thermal
+ * - ``reason_vr_thermal``: VR thermal
+ * - ``reason_iccmax``: ICCMAX
+ * - ``reason_ratl``: RATL thermal algorithm
+ * - ``reason_soc_avg_thermal``: SoC average temp
+ * - ``reason_fastvmode``: VR is hitting FastVMode
+ * - ``reason_psys_pl1``: PSYS PL1
+ * - ``reason_psys_pl2``: PSYS PL2
+ * - ``reason_p0_freq``: P0 frequency
+ * - ``reason_psys_crit``: PSYS critical
+ *
+ * Other platforms support the following reasons:
+ *
+ * - ``status``: Overall status
+ * - ``reason_pl1``: package PL1
+ * - ``reason_pl2``: package PL2
+ * - ``reason_pl4``: package PL4, Iccmax etc.
+ * - ``reason_thermal``: thermal
+ * - ``reason_prochot``: prochot
+ * - ``reason_ratl``: RATL hermal algorithm
+ * - ``reason_vr_thermalert``: VR THERMALERT
+ * - ``reason_vr_tdc``: VR TDC
  */
 
 static struct xe_gt *dev_to_gt(struct device *dev)

-- 
2.51.0

