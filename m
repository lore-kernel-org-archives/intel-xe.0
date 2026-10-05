Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F262DCA5FF0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 14:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9907F10E98D;
	Mon,  5 Oct 2026 14:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2FiMZlQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CC910E98D
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 14:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791211269; x=1822747269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5/+7Q1jypHekt6FrFedcqVY5Nt4G9TBYcQnhw/hivc0=;
 b=F2FiMZlQRTfRvtQXcd2XYouh+kc/ZI5EmcFh02PH/yW4yTESCAqUo7ie
 G4aOMAbvzZT8SkwdWCisIc587GcITLYionmOPNUZQIqnrnrf4kmXkT10f
 s4MpCxRaYbaL+v5yzTGVoTSG2hFT3LLLSj/6T44Qnwg6cZIyjSCMqoRPt
 D3ClqzsXv2vB+XEcnzzZCbtgaTnFdf7gKLX90jydUS1aC2bHQ49Bpm81E
 lyvvSSPAb7pnqqgaWlHYOqIDr/+DKA5E3K26Eb/t/9R3MimKJIFN700mb
 WN0eYlHCf+Tu2PnyCDxixgjMMwgYJUOIISE6xFn5gholQ1PD/zJyl33zD A==;
X-CSE-ConnectionGUID: EeL2xs75TqWOem/lAC4Tcw==
X-CSE-MsgGUID: hXn/nZoWRzW1dg0kQxEs6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90918295"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="90918295"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 07:41:09 -0700
X-CSE-ConnectionGUID: wMLESAkiQl2aWVgWs7h5tQ==
X-CSE-MsgGUID: 0Ds7KSTVRC+BfZjxZq0zkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="276961737"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 07:41:08 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/3] drm/xe: Fix runtime PM get helpers for CONFIG_PM=n
Date: Mon,  5 Oct 2026 15:41:01 +0100
Message-ID: <20261005144059.1569162-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005144059.1569162-5-matthew.auld@intel.com>
References: <20261005144059.1569162-5-matthew.auld@intel.com>
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

xe_pm_runtime_get_if_active() and xe_pm_runtime_get_if_in_use() rely on
pm_runtime_get_if_active()/pm_runtime_get_if_in_use(), which return
-EINVAL when CONFIG_PM=n. This made both helpers always report the
device as inactive/not in use, even though it is always active
without runtime PM. Treat CONFIG_PM=n as always active/in use.

xe_pm_runtime_get_if_in_use() has behaved this way since it was
introduced; xe_pm_runtime_get_if_active() only started doing so once
it was converted to a bool return using the same '> 0' pattern.

Assisted-by: LLM
Reported-by: Karl Mehltretter <kmehltretter@gmail.com>
Fixes: 3b85b7bcccf4 ("drm/xe: Fix display runtime_pm handling")
Fixes: 46edb0a3eb16 ("drm/xe: Fix xe_pm_runtime_get_if_active return")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index daa7ba2df317..385b5984935d 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -872,6 +872,9 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe)
  */
 bool xe_pm_runtime_get_if_active(struct xe_device *xe)
 {
+	if (!IS_ENABLED(CONFIG_PM))
+		return true;
+
 	return pm_runtime_get_if_active(xe->drm.dev) > 0;
 }
 
@@ -884,6 +887,9 @@ bool xe_pm_runtime_get_if_active(struct xe_device *xe)
  */
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
 {
+	if (!IS_ENABLED(CONFIG_PM))
+		return true;
+
 	if (xe_pm_read_callback_task(xe) == current) {
 		/* The device is awake, grab the ref and move on */
 		pm_runtime_get_noresume(xe->drm.dev);
-- 
2.55.0

