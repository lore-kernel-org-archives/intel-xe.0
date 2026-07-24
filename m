Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250A4C531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 21:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6BF10F4A2;
	Fri, 24 Jul 2026 21:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dz8yTb5q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A15610F49F
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 21:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784929567; x=1816465567;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=pvAWRtPnBMxfgSMCFq2r99vOTXMxWh0KZnx+V25SAJw=;
 b=Dz8yTb5qAyikdcz75SAGFoT8TouqYEEWKDv47IU9pECPqyC1gCqBVUTN
 lweaOHHem7NRp1cLWiIL6vD8bHyWMQx8oSK0j5LgoA2FpGmj7XIHrMVp8
 SZaFBvqxI2Goasw8/eik4Fc9KSf1DFFhqz6mfUTDS1TKmLdSwliw2aVmA
 9G/+0HfR28kn79VmyNecQNfam8RQTKVsN/RXmkKH1qLSn2+XmbT3SJBEX
 qzQgSa6GlPT0vwALnbiL2iT1PUe83O/AzM/CFvByWeMwzWXuWbqFnOfIA
 Zkt4Pt3twi4cZEhZ672R1DiaZBxPtb1EUuAqBFa9jsUF/0IehJlMx1w0r Q==;
X-CSE-ConnectionGUID: a6jRMWxSR+iC1EQtFoE2CA==
X-CSE-MsgGUID: SBlaBJbjRS6lWm44bIm65g==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="108394951"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="108394951"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:45:38 -0700
X-CSE-ConnectionGUID: O7chjJHGTiOMpoGzoM8zfg==
X-CSE-MsgGUID: jOe3IczlS6SF1eYsJBKpeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="256165265"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.243])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:45:35 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v2 0/3] drm/xe: Update Wa_14026539277
Date: Fri, 24 Jul 2026 18:44:16 -0300
Message-Id: <20260724-wa_14026539277-v2-0-ad786cc6ba1e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XMQQrCMBCF4auUWRuZJK0xrryHFIntxA5oKkmJS
 undjcWdy//B+2ZIFJkSHKoZImVOPIYSalNBN7hwJcF9aVCodmhQiqc7y7pEo60yRtheW0do3cU
 0UE6PSJ5fK3hqSw+cpjG+Vz/L7/qj1B+VpUCB1juJymvc10cOE9223XiHdlmWD+Lbsi2sAAAA
X-Change-ID: 20260701-wa_14026539277-9d39ae09ab75
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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

The definition of Wa_14026539277 has been updated in the workaround
database and requires a different implementation.  Let's revert the
existing one and then add the up-to-date implementation.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Changes in v2:
- Details of the changes are in the patch's changelog.
- Link to v1: https://patch.msgid.link/20260721-wa_14026539277-v1-0-09fa102f3084@intel.com

---
Gustavo Sousa (3):
      drm/xe: Extract override_has_cached_pt()
      Revert "drm/xe/nvlp: Implement Wa_14026539277"
      drm/xe: Add up-to-date implementation for Wa_14026539277

 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  4 --
 drivers/gpu/drm/xe/xe_pat.h               | 10 +++++
 drivers/gpu/drm/xe/xe_device.c            | 28 ++++++++++----
 drivers/gpu/drm/xe/xe_gt.c                | 39 --------------------
 drivers/gpu/drm/xe/xe_pat.c               | 61 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.c                |  5 +++
 drivers/gpu/drm/xe/xe_vm_madvise.c        |  3 ++
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 -
 drivers/gpu/drm/xe/xe_wa_oob.rules        |  1 +
 9 files changed, 94 insertions(+), 58 deletions(-)
---
base-commit: 03696c1dc9eabc0658baefcff8787dab48c89d93
change-id: 20260701-wa_14026539277-9d39ae09ab75

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

