Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF08CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 10:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEE310E5B7;
	Tue,  4 Nov 2025 10:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bz195xUd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656FA10E5B7
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 10:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762253217; x=1793789217;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jDuCkSeWFEXQYBU/w449KWDYdesYAV3xh3PG1tNuEqs=;
 b=Bz195xUdiMHHBFBT6NJB1DS3rw5dxx2Kbgns3WKzNBA8wPTj9u1/gRwV
 WekiZgzqIXEqA4aQXXz8on53bON+hQgV4diDUfunMhDMPr4V+/Q5kxMbB
 wCxm/+N+aPvAi0OxlXxONuRzfhwL0dztZ+CZqxMFXLFKT94SCspb/QZ0D
 rtyG08i3eKhKnD67BrrcYjDt/6mijl6QB/5x/Nbd3l/SQiEuqR9W5KaXE
 Zrl/gxA4bdxmAu9nE9rcO+CYr1OcM7NFlgC1dVlATsmzlEajoBNtnXQd9
 2GnW0MwOG5wae4KFsZaBjsQZnVwbYXgTa1HzPCapj63Oa0A93+cSs5Gm1 g==;
X-CSE-ConnectionGUID: ZCmF4pGsRDirMpir2hh5Hw==
X-CSE-MsgGUID: BeyiPxXVRu66FfqkP9YmvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64383675"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64383675"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:46:56 -0800
X-CSE-ConnectionGUID: fod0Hlk2RF2dGlJnFi5VpA==
X-CSE-MsgGUID: s+XeHQ6kTueWsOhlMw/XEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="224377403"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:46:52 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 rodrigo.vivi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v5 0/2] drm/xe/guc: Remove cached frequency values for GuC SLPC
Date: Tue,  4 Nov 2025 16:12:08 +0530
Message-ID: <20251104104207.696448-4-sk.anirban@intel.com>
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

This series eliminates cached frequency values that were causing stale
data in GuC SLPC parameter handling. Both RPe and RPa frequencies are
now read live from hardware registers on each request.

Sk Anirban (2):
  drm/xe/guc: Eliminate RPe caching for SLPC parameter handling
  drm/xe/guc: Eliminate RPa frequency caching

 drivers/gpu/drm/xe/xe_guc_pc.c       | 107 +++++++++++++--------------
 drivers/gpu/drm/xe/xe_guc_pc_types.h |   4 -
 2 files changed, 53 insertions(+), 58 deletions(-)

-- 
2.43.0

