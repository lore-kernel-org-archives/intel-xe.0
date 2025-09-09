Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F294CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 16:59:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B0F10E045;
	Tue,  9 Sep 2025 16:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O8eIEQgw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D71810E045
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 16:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757437191; x=1788973191;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u6+qTHOFAU9pvgLpilqSD53MHMxAm/eu7IF4YJV7pCQ=;
 b=O8eIEQgwwaN+lb3zWgNyTDy88WzfzfNqYR7O/Ka/6zWhDknxMtidCzzr
 cNGDuDJxzXsYYfvfdX9L2nUSMN5r/637NQKrn0Gzz5OB/ACc9sReSuqY4
 EqqeCHRxO4EHi7jPOHfxefbRknv4luO0UOLvQD0K54DyAdlGZtjg+ywzN
 gbKRizhlyKjH8BEbjwyEak/OsN6f+BPKmkqyYX0V5pHk5/QtON7kXuwxr
 KoKQZrwBxEWf08Rxy6PjJZZl286MyoKch0OPl0xzWb0jSry7HWeBWj6J/
 QnE3SJOERiSs+3VVYevwosNTulFEzQqcVjr8SJF74YHcq0eAcKVmbi1Eu Q==;
X-CSE-ConnectionGUID: sD18AP0YS3ixDjX6I8CvrQ==
X-CSE-MsgGUID: jW95lWlGTHyc12dzSFMNUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71148944"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="71148944"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:59:51 -0700
X-CSE-ConnectionGUID: BXLC3io/RYyFIf9ah14+zQ==
X-CSE-MsgGUID: idI42twcTUW6Hez6na8AXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="177426183"
Received: from dopitz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.31])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:59:49 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 0/5] RFC: Add dedicated printk macros for tile and device
Date: Tue,  9 Sep 2025 18:59:34 +0200
Message-ID: <20250909165941.31730-1-michal.wajdeczko@intel.com>
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

v1: https://patchwork.freedesktop.org/series/153985/#rev1
v2: use uppercase for FMT macro (Rodrigo)
    drop verbose debug macros (Lucas, Rodrigo)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Michal Wajdeczko (5):
  drm/xe: Keep xe_gt_err() macro definitions together
  drm/xe: Drop "gt_" prefix from xe_gt_WARN() macros
  drm/xe: Prepare format for GT-oriented messages in one place
  drm/xe: Add dedicated printk macros for tile and device
  drm/xe: Use tile-oriented messages in GGTT code

 drivers/gpu/drm/xe/xe_ggtt.c        |  12 +--
 drivers/gpu/drm/xe/xe_gt_printk.h   |  34 ++++----
 drivers/gpu/drm/xe/xe_printk.h      | 129 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile_printk.h | 127 +++++++++++++++++++++++++++
 4 files changed, 281 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_printk.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_printk.h

-- 
2.47.1

