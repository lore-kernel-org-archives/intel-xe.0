Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5349CCC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9FE112611;
	Fri, 16 Oct 2026 07:19:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA1B112611
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135149; x=1823671149;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XuRgOjFqns6E/Odk2lX4nHe7mBQ74Zr+Ee3tfqPLEuA=;
 b=hDRMp1XKDby8IOA1i3nMG5TBTu8Ie6UiZycFCrsP/E1jnobHPhUTAQjJ
 dHGVmCVviFsBEndTuUAkatcS3nB2wqqJ89/ZKhURwy+MwXxLTYUH7GMyx
 1w/hHjYE1kHn5mGdF9gMAHjg5BZqVRaDS3bOgNll8MhNdSJgj+vVOvsm2
 +s9RSAnq+/BCBQ2b72pHA5zkzWzSKZBUPQ8JpYDrpT1hsMHr06Tq+hPOU
 +ufxXckf0WRfnD+Jgedvgf0GhUEoUNyKI915q0+s7tMXvJ6+BPinQpeL6
 j+oLxSrj9Jbv0KsjAaDaPLrXD00BMzaNVeQxWJPYs879zFMT7zahPfAYw w==;
X-CSE-ConnectionGUID: D1Jz8r/RRPiY4UN9UASncA==
X-CSE-MsgGUID: 9dapIFpkQVqamBTjfi56YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813660"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813660"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:57 -0700
X-CSE-ConnectionGUID: uQsl1dtCSemJ9qq7mBil9w==
X-CSE-MsgGUID: KYg34i/TR2uFPkZVRDv6yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787295"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:56 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only v3 16/18] drm/xe/guc: Skip timeout recovery on a wedged
 device
Date: Fri, 16 Oct 2026 12:48:26 +0530
Message-ID: <20261016071832.222574-17-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
References: <20261016071832.222574-1-arvind.yadav@intel.com>
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

DO NOT REVIEW

A scheduler timeout can still run after the device has been declared
wedged. guc_submit_hint_wedged() only returns true for the no-reset
debug mode, so other wedge modes can continue into GuC timeout recovery.

The killed-queue case already preserves an existing wedge. Extend the
same check to non-killed queues, where guc_submit_hint_wedged() returns
false outside the no-reset debug mode.

If the device is already wedged, use the existing wedged cleanup path
and avoid further hardware recovery. This also avoids the
kernel-submitted job timeout warning seen after wedge isolation.

The timeout was observed as:
[ 8939.200065] xe 0000:03:00.0: [drm] Tile0: GT0: Kernel-submitted job timed out
[ 8939.200066] WARNING: xe_guc_submit.c:1683 at guc_exec_queue_timedout_job+0x1160/0x2550

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 84eb4933c930..aee4f9d909a8 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1657,10 +1657,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * Killed queues must not newly wedge the device, but preserve an
 	 * already-wedged state to avoid warning on teardown timeouts.
 	 */
-	if (!exec_queue_killed(q))
+	wedged = xe_device_wedged(xe);
+	if (!wedged && !exec_queue_killed(q))
 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
-	else
-		wedged = xe_device_wedged(xe);
 
 	/*
 	 * Only tag as GPU hang if this is the original timeout, not a
-- 
2.43.0

