Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08610C624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 17:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B0610F2FB;
	Wed,  2 Sep 2026 17:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FgkIsTYU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DDB10F2FB
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788371754; x=1819907754;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bWN3JYQtbOKHvuiYkPbE2kmvHzc/eVrhs6UR7tNNHys=;
 b=FgkIsTYUpSaw4jEdObemykGE5vwpNOPiIrHeyRKn10th9jKggqLB8NGy
 z4MASlVk1Qkn5NVN1SoUNnvmnlErAKmAjeEj/7WybxarO6aPFQxfl/MuC
 g77xDYBTw/kyAMpljqydKZ+b3eIIBOFl3sr+lo8wH/qpFpUW20XBT8fFU
 PRKZQzfY2q5gEz2Npo36Uf2O/HqhW4KoTq8TrHi5vLsPoMn0LWkWLSnqF
 N4StAR3/iL4Gu/kphHuuZ1dDgaHnC/YkcSZR3zVAqBcGwBX5h/F9Eb0f9
 dWZkilug0AXEWYt4AzE4N7v4wTEOx305sTQVXntrnF69hOtfs7+9sO4lm w==;
X-CSE-ConnectionGUID: ZsIMrVcqSHa+/kK2gBeaqg==
X-CSE-MsgGUID: ebAmR42HRPyrBKNwmkPxPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="76393429"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="76393429"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 10:55:53 -0700
X-CSE-ConnectionGUID: uftjpbQeT9C/1pC00BnsxQ==
X-CSE-MsgGUID: p8rzTrvuRYuuo0LmEHTJ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="273637910"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 10:55:51 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 0/5] drm/xe/hwmon: Update hwmon thermal mailbox handling
Date: Wed,  2 Sep 2026 23:25:02 +0530
Message-Id: <20260902175507.3910573-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

This series adds CRI-specific temperature sensor handling to the Xe
hwmon implementation.

CRI platforms may report unavailable temperature sensors and support
a variable number of VRAM temperature channels depending on platform
configuration. This series adds the required sensor presence checks and
uses platform-reported thermal configuration data to expose only valid
temperature-related hwmon attributes.

The series also corrects the telemetry group selection used for memory
controller temperature reporting.

v2:
 - Address review comments from Sashiko, Badal and Raag.
 - Enable IEEE 754 temperature decoding for MMIO temperature registers.
 - Temporarily disable memory controller and PCIe temperatures on CRI.

Karthik Poosa (5):
  drm/xe/hwmon: Detect unavailable temperature sensors
  drm/xe/hwmon: Use VRAM temperature sensor count from thermal config on
    CRI
  drm/xe/hwmon: Correct group selection for memory controller
    temperature
  drm/xe/hwmon: Decode CRI temperature registers as IEEE-754
  drm/xe/hwmon: Disable memory controller and PCIe temperatures on CRI

 drivers/gpu/drm/xe/xe_hwmon.c     | 295 ++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_pcode_api.h |   1 +
 2 files changed, 244 insertions(+), 52 deletions(-)

-- 
2.25.1

