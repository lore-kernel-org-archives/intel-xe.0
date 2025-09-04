Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2084CA1015
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 13:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7855D10E252;
	Thu,  4 Sep 2025 13:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVYHjSIh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F71810E254
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 13:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756991208; x=1788527208;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0tPPoIaqj1XEOtIPCGnf9fpCg1T66emuG70lHfIKKfk=;
 b=UVYHjSIhJe9rUCAaU25JDfg0O30B64VrSuOLl/aueFov0VwTBgNMsCrC
 szV8pmikoYqKP2dqh8FlCF/zARqdg6KJiFv7fSZ6Wj5HBKZ/tBKLlD4sj
 PffQ5C0TtBk7e0GHcbkQCRRaUJlUM5wPifh4fKqUPQ2gX86OGcd770opP
 noux96jRz2LjCDGiyoe7vUQj+SLxnuit/07ptOd3ibJDo7jjWcFCFNVY2
 s+RwTrJvFmynbJYbeXbPmDMbhV1w3lcDpqWm1cSeTjr0BPcXAAvT1H7W8
 VrGYJNPX8z26e7Fp+rZOJBKm2M340PYv6/lRqtu1aruaIuRv6GDHUdyHx Q==;
X-CSE-ConnectionGUID: byLsb5c9S0KAmqwKT6QaBA==
X-CSE-MsgGUID: d46XhIYiRJ+SQFwCePf3IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76930825"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="76930825"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 06:06:48 -0700
X-CSE-ConnectionGUID: JMWhywPHQtG7L6QWUpsNKA==
X-CSE-MsgGUID: pJC2RCOETvas0hTGNuSQgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="171459078"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora) ([10.245.244.98])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 06:06:46 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 0/3] drm/xe: Fixes around eviction and suspend
Date: Thu,  4 Sep 2025 15:06:02 +0200
Message-ID: <20250904130614.3212-1-thomas.hellstrom@linux.intel.com>
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

Thomas Hellström (3):
  drm/xe: Attempt to bring bos back to VRAM after eviction
  drm/xe: Allow the pm notifier to continue on failure
  drm/xe: Block exec and rebind worker while evicting for suspend /
    hibernate

 drivers/gpu/drm/xe/tests/xe_bo.c      |  2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 10 +-----
 drivers/gpu/drm/xe/xe_bo.c            | 16 +++++++---
 drivers/gpu/drm/xe/xe_bo.h            |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h  |  6 ++++
 drivers/gpu/drm/xe/xe_dma_buf.c       |  2 +-
 drivers/gpu/drm/xe/xe_exec.c          |  9 ++++++
 drivers/gpu/drm/xe/xe_pm.c            | 37 +++++++++++++++------
 drivers/gpu/drm/xe/xe_vm.c            | 46 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.h            |  2 ++
 drivers/gpu/drm/xe/xe_vm_types.h      |  5 +++
 11 files changed, 110 insertions(+), 27 deletions(-)

-- 
2.50.1

