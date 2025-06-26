Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8DCC7EE30
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 18:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8379B10E8DD;
	Thu, 26 Jun 2025 18:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JpmbV3Pt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852AF10E2E7
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 18:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750962506; x=1782498506;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mc8m/UCqIAWvN7GYWq2DsCTKLifB0FXdoPui7kNxQk0=;
 b=JpmbV3PtY7NzlZNURe+KZmJAN7b6C2BrlK+Lr6rU8NVRc8/LQid7oZW+
 TtjI/je31xxkAmQEpbuZJXmCczo642n83xe9EO2YOihR52u3cwvUq7Tyx
 jhZ4w/4GG/RDcSsBpXrxzIkz+1afQFjIq6Fy9r80JOc3/k31DFRMmHhYS
 mNeV7AVPLO7UT1bow2djGzfrw8IiXkRj23Kq7PYgmJ4ujo06Z9Sx6XZKV
 SEGIRR2zzk/PF6qauEpq+UhzX21smbrESwaj790nWuAE8tRytbGYUcrpu
 /y2BkRxNEwadBBY5NL4DMXas+1UKNnUrbTRW+ByRcNWUMZdbVeoUwuCXt g==;
X-CSE-ConnectionGUID: nnl9GNqoSbmjTu340WgHAQ==
X-CSE-MsgGUID: ODgjKiDFSbmP2YTPR5zaVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64626687"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="64626687"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 11:28:22 -0700
X-CSE-ConnectionGUID: DfSZWcssQQaNOJEaM/9DBQ==
X-CSE-MsgGUID: LRivKae6RfKZKwUmo4CRXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="152766298"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 11:28:22 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH 0/7] xe/uc: PTL firmware defs + recommendation bump
Date: Thu, 26 Jun 2025 11:28:06 -0700
Message-ID: <20250626182805.1701096-9-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add the GuC and HuC FW defs for PTL. While at it, bump the recommended
FW version for BMG, LNL and DG2.

The new FW blobs for PTL are currently available in drm-firmware, but
they're not in linux-firmware yet. They will be moved if the CI on this
series comes back green.

The series is split as follows:

- The first 3 patches are not to be merged, they just indicate that
  the reverted patches should be dropped from topic/xe-for-CI

- Patches 4-5-6 include the changes we want to merge to drm-xe-next

- Patch 7 should be applied to topic/xe-for-CI after that branch has
  been rebased to include patches 4-5-6

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

Daniele Ceraolo Spurio (5):
  Revert "drm/xe/ptl: Define HuC FW version for PTL"
  Revert "drm/xe/ptl: Add GuC firmware definition"
  Revert "drm/xe/pvc: Add GuC firmware definition"
  drm/xe/ptl: Add GuC FW definition for PTL
  drm/xe/ptl: Add HuC FW definition for PTL

Julia Filipchuk (2):
  drm/xe/guc: Recommend GuC v70.46.2 for BMG, LNL, DG2
  drm/xe/pvc: Add GuC firmware definition

 drivers/gpu/drm/xe/xe_uc_fw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.43.0

