Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4305C83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 18:29:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBD410E0CE;
	Mon, 28 Jul 2025 18:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJ52ZKXJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567ED10E0CE
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 18:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753727379; x=1785263379;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=Ozczj84gMBVbaMPhgj50/w69CSr3erTP506Ro96owDo=;
 b=nJ52ZKXJfWsEWumNPIcOd9vCOcUoOLveZqgFwpBlON3MDLgXoIRJLrzP
 dGAKvFHm0JBDU3p4p75j5IwUdoPJX6GH9jKHYrE0oAScoXovTvoNOMm6z
 0YvSbEWE4QvYSThxFNAwbni591thtZtOmqzb1mg/UJcm/SXq7XYx1Qhal
 O22XCc9md4GyAn4f3y/i62wa5N/51vGyZL9wp4nbYthA8z+NP2/1cIO+x
 TicApDgI5ZQ5GGnzgswUI/mZThopXqXjFPyEWRJmMVvB9n0pnlG9IRAYL
 t8pEfIX4xqkQc12VypJBMCSc9TPXaESbHFiuRmzE/gmRF7mHo6ymH3xb9 w==;
X-CSE-ConnectionGUID: PPs5uO/pQCWswqCBNoU6Ag==
X-CSE-MsgGUID: kY//mcIcTgWwx/MYsoxF7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="67067689"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="67067689"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 11:29:38 -0700
X-CSE-ConnectionGUID: dV7yKgr1QCij1kVhJRazAg==
X-CSE-MsgGUID: dIfbqn7OTz+VIIMdNUPsMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166969353"
Received: from inaky-mobl1.amr.corp.intel.com (HELO
 gjsousa-mobl2.amr.corp.intel.com) ([10.125.109.81])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 11:29:37 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v2 0/2] Tile and GT counting improvements
Date: Mon, 28 Jul 2025 15:29:04 -0300
Message-Id: <20250728-gt_count-improvements-v2-0-78841ce8a81c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHHBh2gC/4WNWwrCMBBFt1Lm20geatAv9yFF2mRsB0xSkhiUk
 r0buwE/z4F77goJI2GCS7dCxEKJgm8gdx2YefATMrKNQXJ55FoqNuW7CS+fGbklhoIOfU7M6hG
 5UIpbraBtl4gPem/dW994ppRD/Gw3Rfzsv2IRjDPFxUmogx3POFzJZ3zuTXDQ11q/13YpWLoAA
 AA=
X-Change-ID: 20250723-gt_count-improvements-d7be01330d73
To: intel-xe@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, 
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
Changes in v2:
- Reworded last paragraph of commit message for the first patch.
- Fixed KUnit failure.
- Link to v1: https://lore.kernel.org/r/20250723-gt_count-improvements-v1-0-3016134db9ea@intel.com

---
Gustavo Sousa (2):
      drm/xe: Probe for tile count during device info initialization
      drm/xe: Use for_each_gt to define gt_count

 drivers/gpu/drm/xe/tests/xe_pci.c |  7 +++++++
 drivers/gpu/drm/xe/xe_mmio.c      | 33 ------------------------------
 drivers/gpu/drm/xe/xe_pci.c       | 43 +++++++++++++++++++++++++++++++++++++--
 3 files changed, 48 insertions(+), 35 deletions(-)
---
base-commit: 51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09
change-id: 20250723-gt_count-improvements-d7be01330d73

Best regards,
-- 
Gustavo Sousa <gustavo.sousa@intel.com>

