Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F30CCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 20:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE5110E2C2;
	Tue,  4 Nov 2025 20:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHqCFb/Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B06510E2C2
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 20:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762286557; x=1793822557;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jDuCkSeWFEXQYBU/w449KWDYdesYAV3xh3PG1tNuEqs=;
 b=kHqCFb/ZlEo+o0GmFlHMJmiUg0N+e0D/OOUWa3/tVuyPV3ycGqmRl8ht
 4SjLSkhgviMYSQkZGsgrUHuxM9hMsshApLfx4yao0O35p6WS9XwFtdW2G
 6TjY/GYoLpwGj1XC0uzvi5CLfjTlHdt5aBxK5cUb9WACJ8mKReEfAgikK
 BdzwM0cxLU2eK0tmPb+OwoKE+uPdmOK45+tYSwdt6WwMbUh1VgZ+l8ozW
 v3BbptzjNj2QJvTGBJ+mfj/IBonsmN09fZ25Yz39KdTJrKdmkp92nfQln
 akafCwqGGzKmiYXhVn7ciPfCQewbuv0ov8VweoAV4/dJ0/m/0dCFGEHXO Q==;
X-CSE-ConnectionGUID: NdLgC5chS0ezU3wYs3uoXA==
X-CSE-MsgGUID: BLDr8LjFRhiiM/CZxCp99w==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75074017"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="75074017"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 12:02:36 -0800
X-CSE-ConnectionGUID: 0/TuT9CvQkGL8nsg/3cMRg==
X-CSE-MsgGUID: 8h9Q1D4eTAe+KFPNqnhwww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="186927538"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 12:02:34 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 rodrigo.vivi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v6 0/2] drm/xe/guc: Remove cached frequency values for GuC SLPC
Date: Wed,  5 Nov 2025 01:27:36 +0530
Message-ID: <20251104195735.1606126-4-sk.anirban@intel.com>
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

