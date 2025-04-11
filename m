Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD00C369A9
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 06:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC4A10EAEF;
	Fri, 11 Apr 2025 06:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJW15Edq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251B710EADC;
 Fri, 11 Apr 2025 06:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744351357; x=1775887357;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tvo0DkmWXK5DWGOEcJi2UYP+ujY/ow0zwj9QKB4+Uas=;
 b=jJW15EdqkpzAGsX7UsbVNv4urlggjt26StNE5XYxNcYz8b3kBJkAC0Gx
 uMdW56K6J5yO51Ri9ftM7fnHBoCgHp0nM/2GV0Z9sXclDClUiM5cOtoyA
 gXc9xABU0gybD1ungnJTL8N02pt61AtnXADTVT3pnyoRMoLAUbDuQs2d0
 7z/Hag4W4WCyuQsgKq0XjkzHjT9H/0aAC7g3RlO6UM4aj2BNXO/cQgDbU
 9FsPwiN8GmKPZeex6ISSHn2Ar7t04GqTiDzUQSYpP2oNXPuJe6aHHjDZ+
 +2fStazpV1dJdd3t/qLox/RKvRXF9ujvr7PslURtOv8x5+pdI8awdlSAq A==;
X-CSE-ConnectionGUID: dG7omyZXRti9SoAZOHL2UQ==
X-CSE-MsgGUID: rGQFw2KrTOyEFB4f7SzlaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="46022205"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="46022205"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 23:02:35 -0700
X-CSE-ConnectionGUID: 0qDQNQAUQ8GEHjNRQV++Xg==
X-CSE-MsgGUID: rpjdJpfKTi2w6p21Cc0oHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="129046725"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 10 Apr 2025 23:02:33 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/2] Register bit definition for EDP_GENERAL_CAP2
Date: Fri, 11 Apr 2025 11:32:34 +0530
Message-Id: <20250411060235.2732060-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add smooth brightness register bit definition for register
EDP_GENERAL_CAPABILITY 2

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (2):
  drm/dp: Add smooth brightness register bit definition
  drm/i915/backlight: Modify condition to use panel luminance

 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
 include/drm/display/drm_dp.h                          | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.34.1

