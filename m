Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F51C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 14:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C10810F56E;
	Thu,  9 Jul 2026 14:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkZ56mxn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C354010F56E
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 14:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783607285; x=1815143285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cEwKRD5/oD+Ludf1k7RqfWxqk4A8ZZC8kGq9NZdR0Hc=;
 b=PkZ56mxnms3SxSOU28Q5/sgMGZlvWrI5gxlulT2FJnIRBQLUSrX1010c
 b40VFg/y0yDicphJ5iIE4MY8xFBAAGTmozUUc+MsV0GqWD+Fdrm4k7PAE
 6YoJ1Y/XcgVVY5tWc8aYN0DBY9pBYaGPmUBdNYbvp8016QWQCzveSNln9
 K6bBvhBgEhBcI9AXiseDAqa30fNBi83+rRWXHuRRjcyxfcilOH7P889X2
 El8KrVUYSiSlh2TLziW/V3x2vXdqnkj+Il/dACPoB4YbXCri0FzIQb2nh
 A+lbun+1N2WgrUv1lZ+QOMXmh16SPh4UqzrM8gjExdo2wn6fzFQmEPgYO g==;
X-CSE-ConnectionGUID: 6y7hgZYMQdOozFVg8fMRWQ==
X-CSE-MsgGUID: +KwyskclRwWp26RkZsK5TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84341924"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84341924"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 07:28:04 -0700
X-CSE-ConnectionGUID: vwfuLCLpQ9OQoLg1IALhVw==
X-CSE-MsgGUID: joqtnB8oSQC2flYAYxwxvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="259496534"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 07:28:02 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, michael.j.ruhl@intel.com,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v3 0/3] Add ocode late binding support for CRI
Date: Thu,  9 Jul 2026 20:09:27 +0530
Message-ID: <20260709143926.3980581-5-badal.nilawar@intel.com>
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

v3: Added TODO in patch 1 to varify ocode compatibility 


Badal Nilawar (3):
  drm/xe/xe_late_bind_fw: Add support to load Ocode firmware
  drm/xe/xe_late_bind_fw: Enable late binding support for CRI
  drm/xe/xe_late_bind_fw: Refactor pm flow

 drivers/gpu/drm/xe/xe_device.c             |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +-
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 109 ++++++++++++++++-----
 drivers/gpu/drm/xe/xe_late_bind_fw.h       |   4 +-
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   2 +
 drivers/gpu/drm/xe/xe_pci.c                |   9 +-
 drivers/gpu/drm/xe/xe_pci_types.h          |   3 +-
 drivers/gpu/drm/xe/xe_pm.c                 |   6 +-
 8 files changed, 101 insertions(+), 38 deletions(-)

-- 
2.54.0

