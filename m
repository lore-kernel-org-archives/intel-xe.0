Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B86FCCFA1D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 23:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A4B10E7D0;
	Wed,  5 Nov 2025 23:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N62cALFt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DECC10E7D0
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 23:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762386480; x=1793922480;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uRFdajsNOSaLwIX20LYUQTCO+fm+r72M6LTgBz8QPYI=;
 b=N62cALFtjbMhm1nRZxWlSe2aMzHmaWtkYvpgmiugzkb9wFhqOYMgsiO4
 UykP+kTGBb2tHZb8VQ/fsQZ+HpVxCKEbT7xTR/PVqn/9+TTuhjMJrTC3x
 BxdhU4GlHS/6o54Nls0IKjT9Ac8PnRjcRcDQCa/hoZktfJxMVaDyl7ip9
 gwRnWIWK8ub5wKggGv9avINDltoe62rP3Mcw7/m0+ikYsxXC0qla9+UL3
 YEwm0KohmBvhoIKAU8KLkg9Mdv4Mkwtvz2hrR5rK/X3b93vinN90UEcD5
 8BoTLSRehJbhF/ByhmJJc35Z9Pt1aEAbHqfbEysOzsFC7MJBcJvfRJYM4 A==;
X-CSE-ConnectionGUID: 7C5qClndSaaESP2qGMuzXQ==
X-CSE-MsgGUID: ptpNaEKeTKeYDqaKbAlN3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="89980376"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="89980376"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 15:48:00 -0800
X-CSE-ConnectionGUID: TqeFNXoNRBWFM59IPiQJjw==
X-CSE-MsgGUID: Ol5U7+MVRzKz+NBJQR2xkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="188319619"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 15:48:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	badal.nilawar@intel.com
Subject: [PATCH 0/4] Add SoC remapper support for system controller
Date: Wed,  5 Nov 2025 15:47:54 -0800
Message-ID: <20251105234753.603647-6-umesh.nerlige.ramappa@intel.com>
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

Add system controller configuration using SoC remapper for Xe3p.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (4):
  drm/xe/vsec: Refactor to move remapper logic outside vsec code
  drm/xe/remapper: Add lock to serialize access to remapper index
    registers
  drm/xe/remapper: Add system controller index for remapper
  drm/xe/remapper: Reprogram remapper index on PM resume events

 drivers/gpu/drm/xe/Makefile                |  1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h           |  3 --
 drivers/gpu/drm/xe/regs/xe_remapper_regs.h | 14 ++++++
 drivers/gpu/drm/xe/xe_device.c             |  2 +
 drivers/gpu/drm/xe/xe_device_types.h       | 12 +++++
 drivers/gpu/drm/xe/xe_pm.c                 |  5 +++
 drivers/gpu/drm/xe/xe_remapper.c           | 52 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_remapper.h           | 18 ++++++++
 drivers/gpu/drm/xe/xe_vsec.c               |  5 +--
 9 files changed, 106 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_remapper_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_remapper.c
 create mode 100644 drivers/gpu/drm/xe/xe_remapper.h

-- 
2.43.0

