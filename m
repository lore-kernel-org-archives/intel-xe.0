Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AC1C3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 09:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AA210E074;
	Thu,  8 May 2025 09:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CUhad2RJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79E710E074
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 09:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746695307; x=1778231307;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Soffn3zvt00eF4C0FfYbGzX9ubcCgrEr8XvDUeC2AJM=;
 b=CUhad2RJbevMQapd4VAFSko3j7XlGdGSil0P4Jo7opK19B36UwxVXlbd
 Gv+tyJiB10IffFr1BjfyG/XmOv6qyFgihWmG2M07yFGMWUM5wuJAqZykO
 etHSKCCh5dVDHZhQfKVdHIRMIYCXuHQ3tExhCIZ94Tmr1SZm5BqF96d4Y
 mbZa6nKcI9xckUK9ZG+xTisDMbdlbOEl2kR24R3dDLIcFAlvmeqQAgpMO
 gtNDivtm5C8MQeooI2HDkUoExp4Ty9tu7wphe0GUCx88mAFG/AqyUBbeK
 1ahnjFTqD6Sc0Or6RNeZQU49R61bDR5TzdfRnyDaLGNJ7ZWmegxP8ML88 g==;
X-CSE-ConnectionGUID: 91UXF45WSw+hTTWX9qeYxA==
X-CSE-MsgGUID: uV1Cc+VASIiZUL90X2GAfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52276406"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="52276406"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 02:08:27 -0700
X-CSE-ConnectionGUID: s3pqPGjjSdGQ8k/GJZTruQ==
X-CSE-MsgGUID: OdTZ7vVDSJeWcRUmGrjiXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="136730460"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 02:08:25 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 0/2] Wait for VRAM ready
Date: Thu,  8 May 2025 14:38:14 +0530
Message-Id: <20250508090816.216176-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Wait for VRAM initialization to complete in system and runtime resume.
This is present in probe but is missing in resume.
While there are no issues currently without this check, it's
a prudent measure to prevent any future issues.

Refactor wait_for_lmem_ready.

v2:
 - Addressed review comments.
 - Add prefix xe_device_ to wait_for_vram_ready.
 - Replace mentions of lmem to vram in xe_device.c.

Karthik Poosa (2):
  drm/xe: Rename wait_for_lmem_ready and make it non-static
  drm/xe/pm: Wait for vram ready in resume

 drivers/gpu/drm/xe/xe_device.c | 18 +++++++++---------
 drivers/gpu/drm/xe/xe_device.h |  1 +
 drivers/gpu/drm/xe/xe_pm.c     |  8 ++++++++
 3 files changed, 18 insertions(+), 9 deletions(-)

-- 
2.25.1

