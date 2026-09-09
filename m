Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2732AC88E45
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 15:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4CA10F1F6;
	Wed,  9 Sep 2026 15:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAo3DjCK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1064D10F1DD
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 15:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788968879; x=1820504879;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oXCAtKEiEtOMprtrsCHAjbUyC7PKXiIXQ67zRM31t+s=;
 b=ZAo3DjCKLOn4VZ0iLkxMaZwk6P3o0G+hmpUlSmdctcp4Z+Vr8WZZDD77
 lxRUa0Eql2DA3nK6/xXPE7fIYh/jelEsLagpnzCuLAWhH+rzyTivCi4vE
 E7qUj2h2stf/YAP9uutZ8kTebKuNCQZYv+TiMxaQkjK7l/aP/bbhcNRT+
 3xuVoiQwdJrOKSK3CtlcRnb01fQsdq1FLWoPq3r1vUsQ+Zn1TyNSN28e0
 6+si/FuLwlAcCtVw7TWg8xJR8GrCUqqPC00nOhQLOM1W9bJx9VdP7+R5Z
 LvBsB6U1PmFBM6GhOTx8k0gJ4p9ffSPdqIKHc5c44+3YmlGXnXy2xdQ3A g==;
X-CSE-ConnectionGUID: e6Y4AFQLTbym0mgSX8dLoQ==
X-CSE-MsgGUID: 6TpMmO5JQKuE04b/jZZidw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93091847"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="93091847"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 08:47:58 -0700
X-CSE-ConnectionGUID: DuGHYd1WSkWPNKUl1X+iGg==
X-CSE-MsgGUID: b/MXv3DtSsCvJA3QZySKXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="268102526"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 08:47:57 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v7 12/20] drm/xe/vsec: Support EAGAIN return value
Date: Wed,  9 Sep 2026 08:47:51 -0700
Message-ID: <20260909154739.1515514-34-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
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

Prep to support EAGAIN return values from pmt_telem_read().

Update call locations to reflect this new return value.

This is not an error, so no error will be logged.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 3 ++-
 drivers/gpu/drm/xe/xe_hwmon.c   | 4 +++-
 drivers/gpu/drm/xe/xe_pcode.c   | 3 ++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 80f62634fae5..a7021a1b025f 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -156,7 +156,8 @@ static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
 				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
 				&residency, offset, sizeof(residency));
 	if (ret != sizeof(residency)) {
-		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
+		if (ret != -EAGAIN)
+			drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5284cab6703d..ecd52a04175d 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -522,7 +522,9 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
 					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
 		if (ret != sizeof(pmt_val)) {
-			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
+			if (ret != -EAGAIN)
+				drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n",
+					 ret);
 			*energy = 0;
 			return;
 		}
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index d502205bb72a..8f9afa0d9440 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -372,7 +372,8 @@ int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
 				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
 				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
 	if (ret != sizeof(*version)) {
-		xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
+		if (ret != -EAGAIN)
+			xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
 		return ret;
 	}
 	xe_dbg(xe, "pcode version major %u minor %u engg %u\n", version->major,
-- 
2.43.0

