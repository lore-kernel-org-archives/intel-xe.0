Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740B6C4451C
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 14:17:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F19610E462;
	Fri, 17 Jul 2026 14:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COSjOqj5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FC210E462
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 14:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784297822; x=1815833822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=75og0wq7J5obfhUwW2PKTu+sb8cXmuKRKSnYMFdOrf8=;
 b=COSjOqj5IgBAVnBvaIa1UIDNHhgA1QisyCDhzAc/PopW6dAAQ59XAccS
 zEuq0W3UVsXZE9d7cgkrEa9/oKIwHZc/Qj03miaPYfrIn+KJgzcYIDn0F
 mnSkvTZk0vsMXrWFeEM6fKd3KdB/w1Y/D6yv9rXnpqUB2iL+pZR8D5MwD
 syNXCnzp0qMMTWvWQoEu1pi+hhpUHU+C1gbIMPSFzbqAMWWp41y1u0jLz
 1g37iC+el+Lrmndb4Vv/Zgz+O3IutAhUp+9ZxWXSJkJ5PchJjU8Jt86fk
 HlVcXHtIE+4nzDZAGDpV4BOE5TBNhZ4vfIrybvPg4d1lGyx573cfnaGY7 A==;
X-CSE-ConnectionGUID: KqojbuzTTVOCHiIEfz0Ckg==
X-CSE-MsgGUID: RXfPKBpwTLWj2vP4n5Kx4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84995761"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="84995761"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:17:02 -0700
X-CSE-ConnectionGUID: nfZHEC3QSg2vo4SWbWWmpA==
X-CSE-MsgGUID: GW9Vj62NQjmeEDp4vco2hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="255031590"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:16:59 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v10 0/3] Query Uncorrectable SoC and Device memory errors
Date: Fri, 17 Jul 2026 19:46:51 +0530
Message-ID: <20260717141650.2487761-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
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

This series adds support for querying uncorrectable soc-internal and
device memory errors from system controller on AER event and is a split
from [1] for CI

Most of the uncorrectable SoC internal errors are recovered using a
Secondary Bus Reset (SBR) apart from CSC firmware and Punit errors.
CSC firmware errors requires a firmware flash to be recovered and
Punit error requires cold-reset which is handled by [2].

Device memory errors: The recovery action for memory errors depends on
the error category. Double bit ECC (Error Correcting Code) errors will be
handled using Page offlining [3]. Poison and data parity errors are only
logged. Rest of the errors require SBR (Secondary Bus Reset) to recover.
Add helper to send offline/decline command to firmware.

[1] https://lore.kernel.org/intel-xe/20260608084700.640376-17-riana.tauro@intel.com/
[2] https://lore.kernel.org/intel-xe/20260713083939.251872-6-mallesh.koujalagi@intel.com/
[3] https://lore.kernel.org/intel-xe/20260716103949.1554216-13-tejas.upadhyay@intel.com/

Rev10: Rebase

Riana Tauro (3):
  drm/xe/xe_survivability: Decouple survivability info from boot
    survivability
  drm/xe/xe_ras: Handle uncorrectable SoC Internal errors
  drm/xe/xe_ras: Add support to query device memory errors

 drivers/gpu/drm/xe/xe_ras.c                | 77 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h          | 72 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.c | 13 +++-
 3 files changed, 160 insertions(+), 2 deletions(-)

-- 
2.47.1

