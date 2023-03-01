Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E210C7EE30
	for <intel-xe@archiver.kernel.org>; Wed,  1 Mar 2023 09:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE1010E09E;
	Wed,  1 Mar 2023 09:31:48 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD7210E09E
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Mar 2023 09:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677663106; x=1709199106;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1Uxx4naLPv6h4NGtfeY0UEJ1gi07r7dwalxrv12DhPE=;
 b=XT8r2Mpd30pw/MtH0mOn1N7O05iOAMHBPMgkoPCPz+Wm/XElmBNRsgSX
 PyOj1TukU2SJtYfbTdxIPkDVX4xidv+z1fYLKYLuqMK7nd5VXpzepd0TF
 aMObLpxt9NbccTIOjWuItqx+9KKK1cbzOy+JIee2OFpE3uBZ/R3G0O8Fo
 NYe2f36Ohl9Uja7Ycfb8yP/aEZc7m+9kqAy48VWBNGQUi1JnA4He0feMg
 k609FVx3jbg0ug2XALCOBqbgRMRzcQzFAoiFsGf9ZuiYG+VZZZfVLH4O8
 VGBMlF1RiBuRbNm3LEpN/aAhOIbt9up2I2erACGRqzYKpez9zVekX8uhs g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="333091752"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="333091752"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 01:31:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="1003600465"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="1003600465"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 01:31:46 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Mar 2023 01:31:05 -0800
Message-Id: <20230301093112.2893689-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/7] RTP and SR improvements for PVC WAs
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

These are the changes in the infra to accomodate the PVC workarounds, to
be added on top.

Lucas De Marchi (7):
  drm/xe/rtp: Move match function from wa to rtp
  drm/xe/rtp: Add match for render reset domain
  drm/xe: Remove dump function from reg_sr
  drm/xe: Name LRC wa after the engine it belongs
  drm/xe/debugfs: Dump register save-restore tables
  drm/xe/reg_sr: Tweak verbosity for register printing
  drm/xe/pvc: Remove A* steppings

 drivers/gpu/drm/xe/xe_gt.c              |  2 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c      | 24 ++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  5 +++
 drivers/gpu/drm/xe/xe_reg_sr.c          | 51 ++++++++++++-------------
 drivers/gpu/drm/xe/xe_reg_sr.h          |  4 +-
 drivers/gpu/drm/xe/xe_reg_sr_types.h    |  5 ---
 drivers/gpu/drm/xe/xe_rtp.c             | 16 ++++++++
 drivers/gpu/drm/xe/xe_rtp.h             | 30 +++++++++++++++
 drivers/gpu/drm/xe/xe_step.c            |  2 -
 drivers/gpu/drm/xe/xe_wa.c              |  8 +---
 10 files changed, 104 insertions(+), 43 deletions(-)

-- 
2.39.0

