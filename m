Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20C6D767F9
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 18:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D70910E90D;
	Thu, 31 Oct 2024 18:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qy+kDZjF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C26510E430
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 18:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730399382; x=1761935382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ai5CxZCD39dDB/ZGBARpQN/CoWHBsamRBamiGgDDJf8=;
 b=Qy+kDZjFMwhULO3w6VVF07lx0/kjGfJdKP9Ne2p5uxdDYe7Qy6iukcnX
 ylqwfR0Dgr74IsuEnRfpdcU6e9BctPoC30DlEBPmLg7dFSiW5DivNm+QJ
 ypusmYewkq3DIoJwUfq4XQMlQPYcDoKHFpi5BweJDjJWltNmGbt9jWB6F
 GZYV62515Fj26gP4gbx3qozkIlOeN4gm4KtPxEVS4FtZZgEkzbY6LO4WC
 9mGqLhorlsp1sPHPM8ZSfhUgxIJUnrshrdrdo/bGKXGPBCjp5mmazIIKC
 6XSv0hAJPx89dNa2F+B1waoO/CWABrHKPNh/FTTKJ9anE3XEqMzx9zZ4U A==;
X-CSE-ConnectionGUID: njKa16/cTyOE06/9goFh5w==
X-CSE-MsgGUID: DEBSkGyXQZq4XnlNlORkBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30323555"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30323555"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:29:41 -0700
X-CSE-ConnectionGUID: E7AocxUjRd2NFarM8BwY+A==
X-CSE-MsgGUID: CAIIlEEkQuK5t5YCqMX8jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="82626232"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:29:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 1/2] drm/xe: Improve devcoredump documentation
Date: Thu, 31 Oct 2024 11:29:15 -0700
Message-ID: <20241031182916.1441987-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031182916.1441987-1-lucas.demarchi@intel.com>
References: <20241031182916.1441987-1-lucas.demarchi@intel.com>
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

Let the introduction be useful for both userspace and kernel. Also
improve the formatting to wire up later to the documentation build.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 40 ++++++++++++++---------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index d2679c5d976b0..2303557454b16 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -29,30 +29,28 @@
 /**
  * DOC: Xe device coredump
  *
- * Devices overview:
  * Xe uses dev_coredump infrastructure for exposing the crash errors in a
- * standardized way.
- * devcoredump exposes a temporary device under /sys/class/devcoredump/
- * which is linked with our card device directly.
- * The core dump can be accessed either from
- * /sys/class/drm/card<n>/device/devcoredump/ or from
- * /sys/class/devcoredump/devcd<m> where
- * /sys/class/devcoredump/devcd<m>/failing_device is a link to
- * /sys/class/drm/card<n>/device/.
+ * standardized way. Once a crash occurs, devcoredump exposes a temporary
+ * node under ``/sys/class/devcoredump/devcd<m>/``. The same node is also
+ * accessible in ``/sys/class/drm/card<n>/device/devcoredump/``. The
+ * ``failing_device`` symlink points to the device that crashed and created the
+ * coredump.
  *
- * Snapshot at hang:
- * The 'data' file is printed with a drm_printer pointer at devcoredump read
- * time. For this reason, we need to take snapshots from when the hang has
- * happened, and not only when the user is reading the file. Otherwise the
- * information is outdated since the resets might have happened in between.
+ * The following characteristics are observed by xe when creating a device
+ * coredump:
  *
- * 'First' failure snapshot:
- * In general, the first hang is the most critical one since the following hangs
- * can be a consequence of the initial hang. For this reason we only take the
- * snapshot of the 'first' failure and ignore subsequent calls of this function,
- * at least while the coredump device is alive. Dev_coredump has a delayed work
- * queue that will eventually delete the device and free all the dump
- * information.
+ * **Snapshot at hang**:
+ *   The 'data' file contains a snapshot of the HW state at the time the hang
+ *   happened. Due to the driver recovering from resets/crashes, it may not
+ *   correspond to the state of when the file is read by userspace.
+ *
+ * **First failure only**:
+ *   In general, the first hang is the most critical one since the following
+ *   hangs can be a consequence of the initial hang. For this reason a snapshot
+ *   is taken only for the first failure. Until the devcoredump is released by
+ *   userspace or kernel, all subsequent hangs do not override the snapshot nor
+ *   create new ones. Devcoredump has a delayed work queue that will eventually
+ *   delete the file node and free all the dump information.
  */
 
 #ifdef CONFIG_DEV_COREDUMP
-- 
2.47.0

