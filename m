Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378F5E677F6
	for <intel-xe@archiver.kernel.org>; Sat,  2 Nov 2024 16:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4E310E120;
	Sat,  2 Nov 2024 16:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bJ4WcPdt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52D210E1A1
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Nov 2024 16:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730563996; x=1762099996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w1Y2NkqfGx7Hij9F3kWh/A06KL7be0r6E4qij6ZQ2qU=;
 b=bJ4WcPdtHrxsN1ssafWKL86CBmArF99n+HtMemPqAVyMroDo62SczHWC
 29fBHJjqxsNiI5rQ8XmSnw1t7rgy/UkQZsjPTg4OZ9LTt+CRXq5l2ug0C
 teLXUPuf8u3u4zJ/r1atycRc9unKySuIPXZgeSYIycH1W5I/cBdQEKHKa
 I6/NWN6OPLe5OaT/nMP7TNIR4fEJ52tQxQ1aT089jjXa8paz72YUOZexo
 LPxHOH6Qbjpbm2/3iMxoSJmCJjXlpEE3maAscCVjUA3lbv++MQWQjlf1j
 BuuHVLC8JHmuFywhTSF8Z0nFGP2/7wttGzG8/Yp4544wwRmWcdZ+Ept3n g==;
X-CSE-ConnectionGUID: 85KdEY+ES06HiC5R+R5J+w==
X-CSE-MsgGUID: 1WtN8xHsS/2bFMMYVn8dKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30488797"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30488797"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2024 09:13:16 -0700
X-CSE-ConnectionGUID: Uks04o/iTx+CY4yeoYVZtw==
X-CSE-MsgGUID: xpMl/wvcQma2BQNDjo/RTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; d="scan'208";a="87842233"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2024 09:13:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Raag Jadav <raag.jadav@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Wire up devcoredump in documentation
Date: Sat,  2 Nov 2024 09:12:54 -0700
Message-ID: <20241102161254.1818604-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241102161254.1818604-1-lucas.demarchi@intel.com>
References: <20241102161254.1818604-1-lucas.demarchi@intel.com>
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

Add a documentation page to detail the device coredump as implemented by
xe - it was documented in the source code, but not visible in the
rendered (html) documentation.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241031182916.1441987-3-lucas.demarchi@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/gpu/xe/index.rst          |  1 +
 Documentation/gpu/xe/xe_devcoredump.rst | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_devcoredump.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 3f07aa3b54325..92cfb25e64d32 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -23,4 +23,5 @@ DG2, etc is provided to prototype the driver.
    xe_firmware
    xe_tile
    xe_debugging
+   xe_devcoredump
    xe-drm-usage-stats.rst
diff --git a/Documentation/gpu/xe/xe_devcoredump.rst b/Documentation/gpu/xe/xe_devcoredump.rst
new file mode 100644
index 0000000000000..ae4ec0e34dc01
--- /dev/null
+++ b/Documentation/gpu/xe/xe_devcoredump.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+==================
+Xe Device Coredump
+==================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_devcoredump.c
+   :doc: Xe device coredump
+
+Internal API
+============
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_devcoredump.c
+   :internal:
-- 
2.47.0

