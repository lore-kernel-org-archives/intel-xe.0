Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C8CC7115B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 21:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BF310EBCD;
	Fri, 20 Jun 2025 21:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjsphYA/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6F110EBCD
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Jun 2025 21:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750456164; x=1781992164;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WzN2Wzws/DmQAgu7KokvqxJMdjVXTaSrZX8HXWA6TZ0=;
 b=QjsphYA/hBaeqP8rWKRL9TkbdgTNhjjkzFXEz7aMhFENZbFTGLnbrFhW
 kDqxlUkqg6KWwREjEoxTEyYt3tkD+VKmZJfPJeMZhSGP9j9FU+3XKEosC
 TnrwvfxfTLigriPHOh3FBv2sXRvoDSBGH9U9wI2s2PAJYdiyynShlke82
 43eAKWox+3JgAO+XiKeu74egFr9gtFSh/KPi86TWVwAaRap6CSx5xuYrn
 gpf0c7eS9FPyIsvy7E8iIyA9vQ4GCw4c6xHdfh3Fe17eUj3KYsoeJG2Rm
 jIiCO5cr28fLMczaptuOlUL9qIEHtLBYjYuD8N1xs3+hkvRHXxAMMlPXm Q==;
X-CSE-ConnectionGUID: 7bbjoC55QaecpwfSKeLTOA==
X-CSE-MsgGUID: fMP5HyteRsGkeE3SfcrfbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="40336499"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; d="scan'208";a="40336499"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 14:49:24 -0700
X-CSE-ConnectionGUID: 0hCtL9AuQDylHXCIKESCUA==
X-CSE-MsgGUID: XxgbQtVqR36bzSSZRaKW4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; d="scan'208";a="151158385"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 14:49:23 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 0/5] drm/xe: Create and use SoC WA infrastructure
Date: Fri, 20 Jun 2025 14:49:15 -0700
Message-ID: <20250620214920.718179-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
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

There currently isnt a way to apply and track workarounds that are
needed ahead of GT init. This series adds another bit field to the
xe_device structure similar to those in the gts to track workarounds
applied at runtime.

SoC workarounds in this new infrastructure are tracked in the existing
sysfs entries gtX/workarounds.

Currently 15015404425 is the only workaround like this, so move this
workaround to this new infrastructure.

Additionally, there is currently no way for us to be able to determine
Compute die stepping before GT initialization. Workaround 15015404425
applies to PTL for only A0 silicon. During probe we will have to apply
it conditionally to the platform. After the workaround use a GT OOB
workaround to toggle the bit in the table if it no longer applies. 

Matt Atwood (5):
  drm/xe: add xe_soc_wa infrastructure
  drm/xe: Add infrastructe for SoC OOB workarounds
  drm/xe: Move Wa_15015404425 to use the new EX_SOC_WA macro
  drm/xe: extend Wa_15015404425 to apply to PTL
  drm/xe: disable wa_15015404425 for PTL B0

 drivers/gpu/drm/xe/Makefile            | 11 +++++-
 drivers/gpu/drm/xe/xe_device_types.h   |  8 +++++
 drivers/gpu/drm/xe/xe_gen_wa_oob.c     | 27 ++++++++++-----
 drivers/gpu/drm/xe/xe_mmio.c           | 10 +++---
 drivers/gpu/drm/xe/xe_pci.c            | 10 ++++++
 drivers/gpu/drm/xe/xe_rtp.c            |  5 +++
 drivers/gpu/drm/xe/xe_rtp.h            |  3 +-
 drivers/gpu/drm/xe/xe_rtp_types.h      |  2 ++
 drivers/gpu/drm/xe/xe_soc_wa_oob.rules |  2 ++
 drivers/gpu/drm/xe/xe_wa.c             | 46 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.h             | 18 ++++++++--
 drivers/gpu/drm/xe/xe_wa_oob.rules     |  1 +
 12 files changed, 125 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_soc_wa_oob.rules

-- 
2.49.0

