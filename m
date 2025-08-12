Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2D5CA0EDC
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 16:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC8E10E604;
	Tue, 12 Aug 2025 16:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtNpwfQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AE310E604
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 16:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755015564; x=1786551564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zr6TqyeTHEmGS8mgMC4T+qHeLTxOdqNMcBexks6Qbpw=;
 b=LtNpwfQiAnAK+XWp1HPp29muoKFauCviqabjeOYilkbkpkh9g04u6lea
 CkmYV7nnws8QHCsxGKT/UshAi7X//wGFHdndwxuIeFOvL+cohEtWmSd9w
 YtdbaA7YWRddlm2NVCO4F2mUELlLPTIpoPKqKayk60T2hMYWdEDiPGeAb
 6gbket7LDn123DUmMsJAUMBmrCzo4dF3wt5FO4rQMO5UWVO0DRKPsbwPo
 KwzHPGFOMAMsshd+26g3PVSpNKoUCO1n+Hz6sbbUBpyalB6D2IDpOx5qx
 aGvd9viClssOIkTfZaaZhaxUV0bsRpqglXV/149K6YHZoo9uLHone1aVU A==;
X-CSE-ConnectionGUID: byZUh9gSSk2WsdRmHlpLEg==
X-CSE-MsgGUID: ll3sdALUSNu6Xu0ggWk7VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="44874058"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="44874058"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 09:19:24 -0700
X-CSE-ConnectionGUID: oqOgOT8oQkWfH9JSIrx1Ww==
X-CSE-MsgGUID: sS6kVVFKTZexthJ7vBMH0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="203420885"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa001.jf.intel.com with ESMTP; 12 Aug 2025 09:19:22 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v6] drm/xe/pm: Disable RPM for SR-IOV VFs
Date: Tue, 12 Aug 2025 22:06:13 +0530
Message-ID: <20250812163613.9954-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

VFs without native PCIe Power Management (PM) capabilities inherit their
PF's power state as per PCIe specifications(§5.10.1 PCIe Base Spec 7.0).
Enabling Runtime Power Management (RPM) for these VFs trigger unnecessary
driver suspend/resume operations that ultimately perform no PCI-level power
transition.

Since VFs without PM capabilities cannot independently enter low-power
states, the existing RPM workflow becomes redundant:
1. Driver executes full suspend/resume sequence
2. PCI PM transition step becomes no-op
3. VF power state remains tied to PF's status

Disabling RPM for VFs eliminates this redundant processing while
maintaining proper power management through PF dependency. This
optimization ensures VFs follow their PF's power state without superfluous
runtime handling.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>

---
V5 -> V6:
- Updated comment (Rodrigo).

V4 -> V5:
- Disable RPM for VFs without checking pm_cap (Rodrigo).
- Updated commit title.

V3 -> V4:
- Fixed review comments (Rodrigo & Maarten)

V2 -> V3:
- Fixed review comments (Michal Wajdeczko).

V1 -> V2:
- Disable RPM only for VF devices when PM cap is not implemented.
---
 drivers/gpu/drm/xe/xe_pm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 5e8126ca8e27..51934d5dc44f 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -247,6 +247,10 @@ static void xe_pm_runtime_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
 
+	/* Our current VFs do not support RPM. so, disable it */
+	if (IS_SRIOV_VF(xe))
+		return;
+
 	/*
 	 * Disable the system suspend direct complete optimization.
 	 * We need to ensure that the regular device suspend/resume functions
@@ -367,6 +371,10 @@ static void xe_pm_runtime_fini(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
 
+	/* Our current VFs do not support RPM. so, disable it */
+	if (IS_SRIOV_VF(xe))
+		return;
+
 	pm_runtime_get_sync(dev);
 	pm_runtime_forbid(dev);
 }
-- 
2.43.0

