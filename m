Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D924FA3727
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 11:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305B410E3C8;
	Mon,  5 Jan 2026 11:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J41pB2eo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF3310E3C8;
 Mon,  5 Jan 2026 11:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767613920; x=1799149920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C3/NfxW0+WjjcS3g4IkZW3siOwqjI4qisJv3dgg2Omc=;
 b=J41pB2eoVEjRXE+7xQmUrk2wJyQENN9HaJcMXcka5/eCJbyobizzHzMZ
 Tm375NxDcKg/UkItjbEnzaoTAXVf49wfS474UIO5lIIp484r8VVoROx3W
 4NnVNFijBLkkpBE93VvfiZvSdp6WbJJfaKOOEv17zV1UF/ETA2WBrBInv
 dbv6o6e7zatpj37LTjE7o+7/R8egZASutT0FT+4eSZWU6CBdSaOkqwjQP
 GHDd2ST1stpk6v7J9np0bU0qDQnjr7163G2cSkbfx91yTYWf04ohv8d0d
 d7JNL7GqVc/0KfDyRYBZHDoQokJOfhVfuCoQwIJMiSPrVdhy1tGdPlnOZ Q==;
X-CSE-ConnectionGUID: a5JZSBKjQiaP9P74snK9TA==
X-CSE-MsgGUID: 8EZ7XtFsQ1yFwM/mzfbUug==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69050659"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="69050659"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 03:52:00 -0800
X-CSE-ConnectionGUID: 72K4Rm6URJKy8gnm7h6VNQ==
X-CSE-MsgGUID: OEOanILoQVe4VRY22Sn/Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="202614100"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 03:51:58 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 5/9] drm/i915/intel_dsb: Fix the SPDX identifier comment
Date: Mon,  5 Jan 2026 17:05:39 +0530
Message-ID: <20260105113544.574323-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260105113544.574323-1-ankit.k.nautiyal@intel.com>
References: <20260105113544.574323-1-ankit.k.nautiyal@intel.com>
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

Fix the SPDX identifier comment as per the licensing rules [1].

[1] https://www.kernel.org/doc/html/latest/process/license-rules.html

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.h b/drivers/gpu/drm/i915/display/intel_dsb.h
index 2f31f2c1d0c5..386a5a942572 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.h
+++ b/drivers/gpu/drm/i915/display/intel_dsb.h
@@ -1,5 +1,5 @@
-/* SPDX-License-Identifier: MIT
- *
+/* SPDX-License-Identifier: MIT */
+/*
  * Copyright © 2019 Intel Corporation
  */
 
-- 
2.45.2

