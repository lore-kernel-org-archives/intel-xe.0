Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40538C44524
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 08:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40F210E544;
	Thu, 23 Jul 2026 08:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJwQ929W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8275710E544
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 08:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784795134; x=1816331134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LoQODlEAA116k2UqMXmrE5A8kV5r0tEafkz9IauUByA=;
 b=AJwQ929WSeJ6KBASXFdANfLpLrwCfCQzKa2G8AndjR+ztGVASFD4ZpRW
 wEXfZblLdZcMiFmmGvOg1vlC+ymkatZoGHIYNEvmbzxtOqS20gfQYfQ+R
 ZgIQ4GFNHJdJFvR3wx6FlVjhJ7+AxygbpmkZN3Pq8ZdXdw2I8UWk/qGZ2
 ixLRz76s2SgvqUPvVhdh9AdePm0CyAY92X8lh+wrZZ9ZQ0DconLwI9BwP
 n3Gu9CuBLFSCGUpSl+h/HOCmujfW1KouOmzmZi/ifIVhZopTuaNJNDLHC
 91s7pdtXypu1slXqxAyJU7hCRydxUfhENbHj7ftfYq3ZFsG/dibPMoBaB Q==;
X-CSE-ConnectionGUID: YYJCJGDHR46OxyLzTRUd8A==
X-CSE-MsgGUID: +xIddYxrRR6Y5e9pFrQPyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85389069"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85389069"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:25:34 -0700
X-CSE-ConnectionGUID: RwfhdXKpSpqnawYu2eLSsQ==
X-CSE-MsgGUID: dX+VKIYYSfe6SniEIK/38A==
X-ExtLoop1: 1
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:25:31 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, michael.j.ruhl@intel.com,
 daniele.ceraolospurio@intel.com, anoop.c.vijay@intel.com,
 shamim.begum@intel.com, anthony.giardina@intel.com
Subject: [PATCH v4 0/5] Add ocode late binding support for CRI
Date: Thu, 23 Jul 2026 14:07:00 +0530
Message-ID: <20260723083659.716683-7-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
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

Ocode is the OOBMSM telemetry/manageability firmware, and on CRI it is
loaded through late binding flow.

v2: Dropped "[RFC,3/4] drm/xe/xe_late_bind_fw: Track firmware load status"

v4:
  - Fixed most of the comments from Daniele
  - Rearranged the patches
  - Introduced new patch to fix firmware leak
  - Improved "TODO: compatibility check" comments

Badal Nilawar (5):
  drm/xe/xe_late_bind_fw: Fix firmware leak on missing manifest entry
  drm/xe/xe_late_bind_fw: Convert late bind flag to mask
  drm/xe/xe_late_bind_fw: Add support to load Ocode firmware
  drm/xe/xe_late_bind_fw: Enable late binding support for CRI
  drm/xe/xe_late_bind_fw: Refactor pm flow

 drivers/gpu/drm/xe/xe_device.c             |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +-
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 118 ++++++++++++++++-----
 drivers/gpu/drm/xe/xe_late_bind_fw.h       |   4 +-
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   4 +-
 drivers/gpu/drm/xe/xe_pci.c                |   6 +-
 drivers/gpu/drm/xe/xe_pci_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_pm.c                 |   6 +-
 8 files changed, 106 insertions(+), 40 deletions(-)

-- 
2.54.0

