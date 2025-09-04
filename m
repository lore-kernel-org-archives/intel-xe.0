Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67763CA1002
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 16:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A98910E263;
	Thu,  4 Sep 2025 16:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecQzDIAq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2B610E263
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 16:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757002059; x=1788538059;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i246pucGw29roJz97Sd1Odk3B2LekgwVkDkjZXGYhrI=;
 b=ecQzDIAq3M4QjTPy/o1+c/Kd8iws6jW3C2RyAMS7JoATwuZADk5qTXPX
 mViPHEvKMAjilP6eEMumjcRvcaaKi95SabdsjcJQVS6FL3OZ88tvHvFE5
 OnmnDqEA9zpc2U68PSxHbfyqr4Y8Ze5mxl1IhauwT43VIMccSsVRvX23+
 UlmgI3pg17P+OzgWqwrvxNo/X4Ohj9iwYtTYgrI3X/Q/fGX58lChoF00Y
 Y1lz6Dcafgl1gVL3DdnuJ3wrDqugl763kiA9jMxyLk1BdkPUDFpNCazON
 tQ0cxM5OWEhGNg8WoK4d0dRsLcGxzMeJmYuU/gfpYYP/IEpJ5bgA5bRPZ Q==;
X-CSE-ConnectionGUID: M3qV2G7oQUu/YelAj6azdA==
X-CSE-MsgGUID: 81hCyQSUReiD83OV5+wPzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="62988483"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="62988483"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 09:07:38 -0700
X-CSE-ConnectionGUID: bpi8Eox/QTm2vquwYo9CMA==
X-CSE-MsgGUID: DmHTAYq4ST2c3bDQIZx91g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="177201694"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora) ([10.245.244.98])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 09:07:35 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 0/3] drm/xe: Fixes around eviction and suspend
Date: Thu,  4 Sep 2025 18:07:12 +0200
Message-ID: <20250904160715.2613-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fixes to make evicted bos that are allowed both in VRAM and TT re-validated
into VRAM after eviction and suspend.

Also a fix to improve on a race where the pm notifier races with active
tasks when evicting bos for suspend.

v3:
- Don't wait_for_completion() in the rebind worker.
v4:
- Misc fixes in patch 3 as detailed in the commit log of that patch.

Thomas Hellström (3):
  drm/xe: Attempt to bring bos back to VRAM after eviction
  drm/xe: Allow the pm notifier to continue on failure
  drm/xe: Block exec and rebind worker while evicting for suspend /
    hibernate

 drivers/gpu/drm/xe/tests/xe_bo.c      |  2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 10 +------
 drivers/gpu/drm/xe/xe_bo.c            | 16 +++++++---
 drivers/gpu/drm/xe/xe_bo.h            |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h  |  6 ++++
 drivers/gpu/drm/xe/xe_dma_buf.c       |  2 +-
 drivers/gpu/drm/xe/xe_exec.c          |  9 ++++++
 drivers/gpu/drm/xe/xe_pm.c            | 42 ++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_vm.c            | 42 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.h            |  2 ++
 drivers/gpu/drm/xe/xe_vm_types.h      |  5 ++++
 11 files changed, 111 insertions(+), 27 deletions(-)

-- 
2.50.1

