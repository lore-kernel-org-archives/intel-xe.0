Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21E3E67805
	for <intel-xe@archiver.kernel.org>; Sat,  2 Nov 2024 16:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8651F10E084;
	Sat,  2 Nov 2024 16:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcEESV6v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C318010E120
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Nov 2024 16:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730563996; x=1762099996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A8iWd5IcarIdqH/9jCScW3oTxMYKJtnGZ0Sp42FjKF0=;
 b=VcEESV6va0ddshJCfGtIDuyzWc6lwW2at7DxIo85/SjyR938N31pl/uM
 xlHktE0LQBzBzaRUVWpoadCvripo+6fxZHzSrzyJKiWnGMuyyAb5OQrAY
 +Y0sla0mH/iq40cNvnpfGSmy1L2L+kBrW1zkfepGOTQMHM/q0Bi18sZ+O
 r5l86Z4PlQbGGxdXGtR9diCDYthXGray1N6Fm31yTPH7P5cxGpLIh7IQ8
 cKP3KFfV1HE+WWXAVzGycSdZSx2trVtvFmp2oUgi030pSlW+YKHO8MYpQ
 dqjFxfhTexjD1X+Mh+2ZVfV/EsgX3i5NmFtAAbwpsspM7xje7VXielxrP g==;
X-CSE-ConnectionGUID: Ndi78FETTPuVzevwcxcscg==
X-CSE-MsgGUID: C2332RB5R0Kx2Q7mau1Aew==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30488796"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30488796"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2024 09:13:16 -0700
X-CSE-ConnectionGUID: +9mzYSe5RzG6B0PqOnWaLg==
X-CSE-MsgGUID: DMZGIQ4WQLO+sGmTv+zaLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; d="scan'208";a="87842229"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2024 09:13:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Raag Jadav <raag.jadav@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Improve devcoredump documentation
Date: Sat,  2 Nov 2024 09:12:53 -0700
Message-ID: <20241102161254.1818604-2-lucas.demarchi@intel.com>
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

Let the introduction be useful for both userspace and kernel. Also
improve the formatting to wire up later to the documentation build.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241031182916.1441987-2-lucas.demarchi@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 51 +++++++++++++++++------------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index d2679c5d976b0..d3570d3d573c2 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -29,30 +29,39 @@
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
+ *   The 'data' file contains a snapshot of the HW and driver states at the time
+ *   the hang happened. Due to the driver recovering from resets/crashes, it may
+ *   not correspond to the state of the system when the file is read by
+ *   userspace.
+ *
+ * **Coredump release**:
+ *   After a coredump is generated, it stays in kernel memory until released by
+ *   userpace by writing anything to it, or after an internal timer expires. The
+ *   exact timeout may vary and should not be relied upon. Example to release
+ *   a coredump:
+ *
+ *   .. code-block:: shell
+ *
+ *	$ > /sys/class/drm/card0/device/devcoredump/data
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

