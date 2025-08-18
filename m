Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B1FCA0EE4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 18:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C2410E03A;
	Mon, 18 Aug 2025 18:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6Uz+2V7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677AF10E03A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 18:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755540964; x=1787076964;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=t20n0Zl3TvUIQCwW5XEDBkf0vRmfmObNtYGqqHIQJLs=;
 b=D6Uz+2V7toUkogNPCYz03+EPZ+LR+zSE6O8WbHOtKB/DCwru7K/KwILN
 qv5BME1evAoXJRUUaNjXb5V4SJ8pXPo/0CmzhHR7nDmxwoH/IenV5z8cJ
 HgpiZyZmiFSk7DDRjY2vfS0MNHXOydy7GXXcHaT3xxihCM/FZd9b/SRA0
 HUXZTgorpLr0BUy2mCAXDfbUZjsjXG3zywjwqwndb4QaaLuk48W2VfIN8
 6tdOGvZviQAE7GCIVpN3TCm5B9YhwvACVWx7DP12Wzp5e1x9HMHAT59lb
 T1AiTE+zsRiV5lPBIhZQt34Ft/pwlPV/m1iMPROFEZQoDUaAIg2LnWZpw A==;
X-CSE-ConnectionGUID: 7cDsj0hESuWfpW+oD73fSw==
X-CSE-MsgGUID: j205bsr+TESDwpmS95j73w==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57688126"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57688126"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 11:16:04 -0700
X-CSE-ConnectionGUID: EQrA1DfnRzmhWS5MNK6bEA==
X-CSE-MsgGUID: Ap11juYeSpmopxGQ/VuqCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="166808938"
Received: from cmdeoliv-mobl4.amr.corp.intel.com (HELO
 gjsousa-mobl2.amr.corp.intel.com) ([10.125.108.8])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 11:16:03 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v4 0/2] Tile and GT counting improvements
Date: Mon, 18 Aug 2025 15:15:45 -0300
Message-Id: <20250818-gt_count-improvements-v4-0-ee12870c6f57@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANFto2gC/4XOwQoCIRCA4VcJzxmO2mqdeo+I2HS2hFYXNSli3
 z23SxEsHf+B+WaeJGF0mMh28SQRi0su+BpyuSDm0vozUmdrE874miku6DkfTbj5TF0/xFCwR58
 TteqEDIRgVglSd4eInbu/3f2h9sWlHOLjfabANP0nFqCMCgYNCGlPG2x3zme8rkzoySQW/q3oO
 YVXRWktwaBuNZhfRXwUDbOKmH7hXbNhgJJj862M4/gCeduy4UYBAAA=
X-Change-ID: 20250723-gt_count-improvements-d7be01330d73
To: intel-xe@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
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

This series improves the way we define values for tile_count and
gt_count. In the first patch, we move the logic that probes for
available tiles to a more appropriate location; in the second patch, we
future-proof the way gt_count is calculated.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Changes in v4:
- Fix one issue found in CI (e.g. [1]), where we were trying to read
  from the MTCFG in scenarios where mmio_multi_tile_setup() would not.
  [1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
- Link to v3: https://lore.kernel.org/r/20250818-gt_count-improvements-v3-0-32f6901e42e6@intel.com

Changes in v3:
- Rebased to get fresh CI results before applying.
- Link to v2: https://lore.kernel.org/r/20250728-gt_count-improvements-v2-0-78841ce8a81c@intel.com

Changes in v2:
- Reworded last paragraph of commit message for the first patch.
- Fixed KUnit failure.
- Link to v1: https://lore.kernel.org/r/20250723-gt_count-improvements-v1-0-3016134db9ea@intel.com

---
Gustavo Sousa (2):
      drm/xe: Probe for tile count during device info initialization
      drm/xe: Use for_each_gt to define gt_count

 drivers/gpu/drm/xe/tests/xe_pci.c |  7 ++++++
 drivers/gpu/drm/xe/xe_mmio.c      | 33 --------------------------
 drivers/gpu/drm/xe/xe_pci.c       | 50 +++++++++++++++++++++++++++++++++++++--
 3 files changed, 55 insertions(+), 35 deletions(-)
---
base-commit: edead24a80ae92312f75626eb92f2771ec5a7697
change-id: 20250723-gt_count-improvements-d7be01330d73

Best regards,
-- 
Gustavo Sousa <gustavo.sousa@intel.com>

