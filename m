Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB65C3DA5D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 20:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6F610E09E;
	Mon, 22 Jul 2024 20:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGJA4PSJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F59D10E09E
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 20:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721680355; x=1753216355;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a5C3WSZWmxD4bOznce9QZZcrPuApy11Qu1cncjXqSMc=;
 b=gGJA4PSJj/2zh7GJpcofAxLSQBYuNKuGCZK/XpQWp+ROU7+XYfd4V5fx
 9nYsJXe9zfGN9V3E0TS1fujPOXGyx19UwIoVbDIf4XW6KlNRN8oUmhLH0
 ilmxS2L9XfREMdIIYIrzuCQcu15ui0rClzdUWtO6mJz4qjD2W8TtmyKVH
 ioYeKBVw+odK0nwHkqgOXrAAFDvL6z5OHowrPgQam7H3zQYyaF73e7VjM
 A+UmEF6RL249JOoehK9pHmAM/U9AnwZmEtstzBbgNYIvssoIiQrJ3smLg
 sT5mDyhXBXVDl5+yIMAel5QtWhNsuFo7nrvbeDsyA91ItCSbn96PcGNrx A==;
X-CSE-ConnectionGUID: BAee5ti3SLC59PQIKu3NJw==
X-CSE-MsgGUID: OU47AyYkQ7yiNqT8CVbCTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="41796974"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="41796974"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 13:32:35 -0700
X-CSE-ConnectionGUID: 4jPZqdkxR2qoO9Z6+obDPA==
X-CSE-MsgGUID: A7Rmjre2RFChN4BmeOoFAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="56164262"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 13:32:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Decalre xe variable in xe_file_close
Date: Mon, 22 Jul 2024 13:33:18 -0700
Message-Id: <20240722203318.1608626-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Merged a bad patch which broke the build, fix this.

Fixes: d930c19fdff3 ("drm/xe: Build PM into GuC CT layer")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a8148326c69c..b677608eb592 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -141,6 +141,7 @@ void xe_file_put(struct xe_file *xef)
 
 static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 {
+	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = file->driver_priv;
 	struct xe_vm *vm;
 	struct xe_exec_queue *q;
-- 
2.34.1

