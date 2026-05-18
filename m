Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A5DCD4F4A
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 19:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B29F10E339;
	Mon, 18 May 2026 19:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/JYdmcH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F37110E14A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 19:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779132357; x=1810668357;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ExMvDHjry2RbttYAyvm8cJFYXajiVDqce4y1fcRdO+w=;
 b=l/JYdmcH0Y9sVZorC8SsUCFb/jewTLKrwhENTzoqYVpmCSBEO1BXQu2u
 EgPpLS+5p6LXIo8blWzogMXRwC7t1OLag878Aok51kOBUeAe+/Yn8NFOy
 bYD4b9NBgH9zs38UKweB1SEh9+ZVRgEd+E+qNp9pipp9Xl2Mm0syhxVBy
 icZstwZkDN/tzD52QvqaOMhYN6Jk7S7w8CmWcppy2p7XBIJJ5+k7EtXwO
 eNCba/SNy3+snG95EHiL1GAXaQBKNN55AhX0kWrPh4DciWxieZBKSskRi
 3sgZdVTmWCiBSETY3jnZarYEYm0m+3HQYX9xYPXhoXkmSv1N5kP/rRvvc A==;
X-CSE-ConnectionGUID: 4zBWwSf2SMuT0kk/UlYBew==
X-CSE-MsgGUID: mNl3gSkpR5eIlXqyWrjCag==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90304784"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="90304784"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:25:56 -0700
X-CSE-ConnectionGUID: DIyO0DCoSeWBzFu8K46B6A==
X-CSE-MsgGUID: v0NFlC8ZRaS553SYLZqDfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="235276009"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:25:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/9] drm/xe: Refresh MEMIRQ code
Date: Mon, 18 May 2026 21:25:38 +0200
Message-ID: <20260518192547.600-1-michal.wajdeczko@intel.com>
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

v1: https://patchwork.freedesktop.org/series/166580/#rev1
v2: s/max_hwe_instance/hwe_max_count (Ilia)

Michal Wajdeczko (9):
  drm/xe: Add IRQ page to HW engine definition
  drm/xe/memirq: Make page layout macros private
  drm/xe/memirq: Update GuC initialization and IRQ handler
  drm/xe/memirq: Use IRQ page from HW engine definition
  drm/xe/memirq: Reduce buffer size
  drm/xe/memirq: Update diagnostic message
  drm/xe/memirq: Dump all source pages if MSI-X
  drm/xe/memirq: Drop cached iosys_map for MEMIRQ mask
  drm/xe/memirq: Drop cached iosys_map for MEMIRQ status

 drivers/gpu/drm/xe/xe_hw_engine.c       |  11 ++-
 drivers/gpu/drm/xe/xe_hw_engine_types.h |   2 +
 drivers/gpu/drm/xe/xe_memirq.c          | 118 ++++++++++++++----------
 drivers/gpu/drm/xe/xe_memirq_types.h    |  13 +--
 4 files changed, 83 insertions(+), 61 deletions(-)

-- 
2.47.1

