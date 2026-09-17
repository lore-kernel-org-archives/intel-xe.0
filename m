Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BE3C88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 23:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C3610E00B;
	Thu, 17 Sep 2026 23:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoU/H+in";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFE410E00B
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 23:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789689572; x=1821225572;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FxaADsBTifgv7Z4Fb15I2HxuMWV0X+qJzr2fK9GiT/4=;
 b=LoU/H+inH/bz7D9zqbprNEGelFg4dLhHR9+SKOaD5SOpigJYASh7Dm+K
 Ld8glt5lRfT5qEqX+5Tc0qE7WA529sIfMeX0FLDQmd0RqO+cx85RWWAHt
 muEjO9WUQc6uWDcmJeCzD9yJrtXFXfP0+9COT+sCwsHk7+2IKLhJkHj9m
 6uikbkBQGLvc6EuteE44efqY34p7YM4Z/mnNbiKrgq6PMQSYDwmJN/5+/
 CkuQBZABCUEFMlG+0G5+zvsejMPTImZ1A2Ikxws2dXqYkpP13zyuHtA9i
 qX9lpbZRB8vB2Jqy4BXaUOq7vNQw6jkRsmIK4LsdlLODdFSh8A/UQ9KGq A==;
X-CSE-ConnectionGUID: KGJY4AwHSiO+yidBh84+Bw==
X-CSE-MsgGUID: BzaTB9ypS32mMAinpJB/HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77727909"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77727909"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 16:59:31 -0700
X-CSE-ConnectionGUID: S+8/ExCbS+uOahaS1afhPQ==
X-CSE-MsgGUID: dCddE0aXR3izUXSGGN2ojw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270788199"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 16:59:31 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v4 0/7] Use SIG_ID logs for GuC component
Date: Thu, 17 Sep 2026 16:59:24 -0700
Message-ID: <20260917235923.1521112-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
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

Add SIG ID logging support for some parts of the GuC interface code.

v3: Add some review comments from v2. Some opens remain. will address in next
revision as discussion evolves.
v4: Review comments from v3

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Daniele Ceraolo Spurio (4):
  drm/xe/guc: Use different error codes for GuC load errors
  drm/xe/uc: Report DMA failure using SIGID
  drm/xe/guc: Report major GuC failures using SIGID
  drm/xe/guc: Report errors that cause a CT shutdown using SIGID

Umesh Nerlige Ramappa (3):
  drm/xe/guc: Handle CRASH and EXCEPTION G2H with separate helpers
  drm/xe/guc: Make ct_dead_capture available on non-debug config
  drm/xe/guc: Cleanup error codes and handling for CT errors

 drivers/gpu/drm/xe/xe_guc.c    |  40 ++---
 drivers/gpu/drm/xe/xe_guc_ct.c | 274 ++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_uc_fw.c  |  13 +-
 3 files changed, 216 insertions(+), 111 deletions(-)

-- 
2.55.0

