Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60A4C30658
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 18:37:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DFF10E673;
	Tue,  2 Jul 2024 18:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKlUXl6+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF0310E673
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 18:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719945437; x=1751481437;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zCCl8PO1+FIkxRiBpQaNvsF4u08at/JaAzKcTtY0e54=;
 b=QKlUXl6+CA4iOku3M0CbZu+f5TCd4Z0KKbvZPx9qu8fwDoRCXOeIReRK
 aZyycxUDGFVSpJ+6VvyCPbe7iVPLCpCVdlXwacdWVGdM/6AEoliiazxP6
 QfBpsrjW2suHhiCvB0vPhOMlb+OR+ppdXz12x60WVb5qtWOwP+PZJN6L/
 oskyLzUBs8YDcVHoWEd7fsuWFnjMq2G6ftSnHXi0NgjZiQBEjKG11b2PK
 EVzqiaDDa+yep3MPxr4/SPl+PbPOmqulxOp2eQjHTCjTNLKu58titLlg1
 SMi6bSnOwwhN1t/u7x/aa7MOhbXG96pHC8Yh7eZsI8IzeePlEASK9kr0k g==;
X-CSE-ConnectionGUID: x61LQTKoScOPuG6nDAPbJQ==
X-CSE-MsgGUID: e1Puor+EQhW4ycFFfqsCDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27756707"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="27756707"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 11:37:16 -0700
X-CSE-ConnectionGUID: hNdNfNTlTuK5Ok8h0CtfAQ==
X-CSE-MsgGUID: r9xVj/iBRLazOjfZ4U0uDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="50604305"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.99])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 11:37:15 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] drm/xe: Use VF_CAP_REG for device wmb
Date: Tue,  2 Jul 2024 20:37:01 +0200
Message-Id: <20240702183704.1022-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Michal Wajdeczko (3):
  drm/xe: Fix register definition order in xe_regs.h
  drm/xe: Kill regs/xe_sriov_regs.h
  drm/xe: Use VF_CAP_REG for device wmb

 drivers/gpu/drm/xe/regs/xe_gt_regs.h    |  6 ++++++
 drivers/gpu/drm/xe/regs/xe_regs.h       | 12 +++++++++---
 drivers/gpu/drm/xe/regs/xe_sriov_regs.h | 23 -----------------------
 drivers/gpu/drm/xe/xe_device.c          | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c     |  2 +-
 drivers/gpu/drm/xe/xe_lmtt.c            |  2 +-
 drivers/gpu/drm/xe/xe_sriov.c           |  2 +-
 7 files changed, 28 insertions(+), 30 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/regs/xe_sriov_regs.h

-- 
2.43.0

