Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9507C4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 16:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8083610EA97;
	Tue, 21 Jul 2026 16:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d+NzHfqo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274C010E71D;
 Tue, 21 Jul 2026 16:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784650579; x=1816186579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xiklRf9FE8dZidCMoRx8tPEusjuSPZYsKQHhuWbkhdY=;
 b=d+NzHfqoWsj/8Da3T0Qx1sT9elijrwaoSQ6SliK2WB7dldu5Q8a2qPIP
 qNKx87GBdidiOoU2MGvUHbp2ruvSjnKK3avgKwHsR9+SRM6G3I7hSk96g
 PHwvyoCkNbrLPaPq1X7p5bZF/vyRAecK7QL0vQhuKcrdkc1Bo1o/mGbXk
 Eq5GBIlfwe+K1OYKiAo/zdofqM48uh0TuZSOCEMaUYgLffKPCSPVMQNlX
 7M8XPyvizckrF2to8GjzZ8JzX0ee4jvAeFjjOi9wY8GRm6qC+nu0wPcQm
 Pk67FA+ob5FnaVbxHpoX3VynBCzgVY2sebzc+1VK50KrXdPBRcXAX2Leg Q==;
X-CSE-ConnectionGUID: NjUfO91tR1awPJsSsAgFVw==
X-CSE-MsgGUID: XHsVP0DjRHK+zG8yy+WZgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95853553"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95853553"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 09:16:19 -0700
X-CSE-ConnectionGUID: vkvfBDHsQR6UvoLfBnJcgQ==
X-CSE-MsgGUID: PLTlmv/uTtWZ1HKA/E8S7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="253904843"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa010.fm.intel.com with ESMTP; 21 Jul 2026 09:16:17 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v5 3/9] drm/i915/vrr: Add per-CRTC vrr/cmrr debugfs control
Date: Tue, 21 Jul 2026 21:35:49 +0530
Message-ID: <20260721160556.3144646-4-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260721160556.3144646-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260721160556.3144646-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add a per-CRTC debugfs file 'intel_vrr_cmrr' that lets the user force a
CMRR target refresh rate and video-mode requirement.

The file uses a "numerator/denominator" format:
  - numerator:   requested refresh rate in milli-Hz
                 (refresh rate in Hz * 1000, e.g. 60000 for 60 Hz)
  - denominator: 1000 for a 1:1 ratio (no video timing) or
                 1001 for the 1000/1001 video timing

Reading the file reports the currently stored values; writing updates
them. The file is created only on platforms with VRR and CMRR support.

--v2:
- Drop the "vrr" debugfs subdirectory and expose a single flat,
  intel_-prefixed "intel_vrr_cmrr" file (Jani, Nikula)
- Rename struct intel_crtc.cmrr to force_cmrr to make its purpose
  explicit (Chaitanya)
- Fix parse comment: numerator unit is milli-Hz, not KHz (Chaitanya)
- Add debugfs/intel_ prefixes to the debugfs handler functions (Chaitanya)
- Expand commit message with debugfs entry semantics (Chaitanya)

--v3:
- Rename debugfs function and file name (Chaitanya)
- Remove railing new line at EOF (Chaitanya)
- Update CMRR guard conditions (Chaitanya)
- Add 0/0 default case. (Ramanaidu)

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 .../drm/i915/display/intel_display_debugfs.c  |   2 +
 .../drm/i915/display/intel_display_types.h    |   5 +
 drivers/gpu/drm/i915/display/intel_vrr.c      | 109 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vrr.h      |   2 +
 4 files changed, 118 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 3f02868ef105..2bbf4760dc30 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -49,6 +49,7 @@
 #include "intel_psr.h"
 #include "intel_psr_regs.h"
 #include "intel_vdsc.h"
+#include "intel_vrr.h"
 #include "intel_wm.h"
 #include "intel_tc.h"
 
@@ -1395,6 +1396,7 @@ void intel_crtc_debugfs_add(struct intel_crtc *crtc)
 	intel_drrs_crtc_debugfs_add(crtc);
 	intel_fbc_crtc_debugfs_add(crtc);
 	hsw_ips_crtc_debugfs_add(crtc);
+	intel_vrr_crtc_debugfs_add(crtc);
 
 	debugfs_create_file("i915_current_bpc", 0444, root, crtc,
 			    &i915_current_bpc_fops);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index b7cc361fd955..46dd980b315a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1553,6 +1553,11 @@ struct intel_crtc {
 		u64 flip_count;
 	} dc_balance;
 
+	struct {
+		u32 numerator;
+		u32 denominator;
+	} force_cmrr;
+
 	int scanline_offset;
 
 	struct {
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index d3cad81bba89..21fdf473342f 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -4,6 +4,10 @@
  *
  */
 
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/string.h>
+
 #include <drm/drm_print.h>
 #include <drm/intel/step.h>
 
@@ -1231,3 +1235,108 @@ int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_st
 
 	return intel_vrr_vblank_start(crtc_state, VRR_DCB_VMAX(tmp) + 1);
 }
+
+static
+int intel_vrr_cmrr_parse_ratio(char *str, u32 *numerator, u32 *denominator)
+{
+	char *sep;
+	int ret;
+
+	/*
+	 * Parse a "numerator/denominator" CMRR ratio string. The numerator
+	 * is the requested refresh rate in milli-Hz (refresh rate in Hz * 1000)
+	 * and the denominator selects the timing: 1000 for a 1:1 ratio
+	 * (no video timing) or 1001 for the 1000/1001 video timing.
+	 */
+
+	sep = strchr(str, '/');
+	if (!sep)
+		return -EINVAL;
+
+	*sep = '\0';
+
+	ret = kstrtou32(strim(str), 10, numerator);
+	if (ret)
+		return ret;
+
+	ret = kstrtou32(strim(sep + 1), 10, denominator);
+	if (ret)
+		return ret;
+	/*
+	 * "0/0" clears any previously configured CMRR override.
+	 * A zero numerator already means "CMRR not requested" in
+	 * intel_vrr_cmrr_compute_config(), so just let it through.
+	 */
+	if (*numerator == 0 && *denominator == 0)
+		return 0;
+
+	if (*numerator == 0)
+		return -EINVAL;
+
+	if (*denominator != 1000 && *denominator != 1001)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int intel_vrr_debugfs_target_rr_show(struct seq_file *m, void *data)
+{
+	struct intel_crtc *crtc = m->private;
+
+	seq_printf(m, "%u/%u\n", crtc->force_cmrr.numerator, crtc->force_cmrr.denominator);
+
+	return 0;
+}
+
+static int intel_vrr_debugfs_target_rr_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, intel_vrr_debugfs_target_rr_show, inode->i_private);
+}
+
+static ssize_t intel_vrr_debugfs_target_rr_write(struct file *file, const char __user *ubuf,
+						 size_t len, loff_t *offp)
+{
+	struct seq_file *m = file->private_data;
+	struct intel_crtc *crtc = m->private;
+	u32 numerator, denominator;
+	char kbuf[32];
+	int ret;
+
+	if (len >= sizeof(kbuf))
+		return -EINVAL;
+
+	if (copy_from_user(kbuf, ubuf, len))
+		return -EFAULT;
+
+	kbuf[len] = '\0';
+
+	ret = intel_vrr_cmrr_parse_ratio(kbuf, &numerator, &denominator);
+	if (ret)
+		return ret;
+
+	crtc->force_cmrr.numerator = numerator;
+	crtc->force_cmrr.denominator = denominator;
+
+	return len;
+}
+
+static const struct file_operations intel_vrr_debugfs_target_rr_fops = {
+	.owner = THIS_MODULE,
+	.open = intel_vrr_debugfs_target_rr_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+	.write = intel_vrr_debugfs_target_rr_write,
+};
+
+void intel_vrr_crtc_debugfs_add(struct intel_crtc *crtc)
+{
+	struct intel_display *display = to_intel_display(crtc);
+
+	if (!HAS_VRR(display))
+		return;
+
+	if (HAS_CMRR(display) && intel_vrr_always_use_vrr_tg(display))
+		debugfs_create_file("intel_vrr_target_refresh_rate", 0600, crtc->base.debugfs_entry,
+				    crtc, &intel_vrr_debugfs_target_rr_fops);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
index 55e9c429f579..19c7990be1b2 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr.h
@@ -56,4 +56,6 @@ int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_sta
 int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_state);
 int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_state);
 
+void intel_vrr_crtc_debugfs_add(struct intel_crtc *crtc);
+
 #endif /* __INTEL_VRR_H__ */
-- 
2.48.1

