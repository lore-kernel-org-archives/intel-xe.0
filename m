Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696D8CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 16:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1DD10E8E7;
	Tue, 13 Oct 2026 16:12:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B9310E8E9;
 Tue, 13 Oct 2026 16:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791907951; x=1823443951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jpzVE95YACXHdk+5CAJUbBK2fD3J2nei38+hXi5KXEs=;
 b=K//bJCyyIA+hGHvDK+rqjDHsjoUk6s1avH6FBUq1SQe1jH4zd6Hkr/eP
 TtkuQ9qlBhl+4GuiH20t2gc4oJoO5WTgotd6uTgm5P+P9jHVeK/Q/W3ZP
 ba7624d9T2URs1pTbJxn3Rtv4UyjggfNcD4bcFGJuvV8B1dMKTTvTlcY+
 8XPkYzTwHmD1msZfndKvFSjSNahZZMHnv2yD4TGascyWcKQPJsOs+jDBb
 u0O5vHLxxtHPozxnghyA9wQkcfxImU1/BJ34aGT+X+J6euaQjCxoOv80O
 TS/jvK9DO6nvtuOwyYOwsh5VM73U8m3/VkM2md4Fd/mup+30+cX/Bdc4V Q==;
X-CSE-ConnectionGUID: 8fGq/zVbQg2tFBaI3ABgLA==
X-CSE-MsgGUID: sRAbw6MzRDuaBg3kxEF+UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="534512"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="534512"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:12:30 -0700
X-CSE-ConnectionGUID: gyTz3lzHSByrzqmO0ND9Tg==
X-CSE-MsgGUID: YJBPYaBrRfG+9O5jChhYGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1205091"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:12:30 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com,
	imre.deak@intel.com
Subject: [PATCH 2/2] drm/i915/dmc_wl: Avoid blocking on delayed wakelock
 release
Date: Tue, 13 Oct 2026 21:41:34 +0530
Message-ID: <20261013161131.2572279-6-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013161131.2572279-4-dibin.moolakadan.subrahmanian@intel.com>
References: <20261013161131.2572279-4-dibin.moolakadan.subrahmanian@intel.com>
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

intel_dmc_wl_disable() flushes the pending wakelock release work,
disables the wakelock mechanism and sets wl->enabled to false.
It then clears DMC_WAKELOCK_CTL_REQ and sets wl->taken to false.

Flushing the work forces it to run immediately and waits for completion.
When the refcount is zero, the worker clears DMC_WAKELOCK_CTL_REQ and
waits for ACK to clear. This adds workqueue scheduling and ACK polling
to the DC-exit path, just before disable clears the request itself.

Since intel_dmc_wl_put() queues the release DMC_WAKELOCK_HOLD_TIME later
and the DC-exit path reaches disable well before that, the work remains
pending and is forced to run. This delays the POWER_DOMAIN_DC_OFF get
in intel_atomic_commit_tail() for the DC3CO case, where DC3CO is entered
and exited on every flip. On a 3840x2400@120 eDP panel, dropping the
forced run reduced that get by roughly 330 us.

Cancel the pending work instead, so it is dropped rather than run. Once
wl->enabled is false, subsequent puts do not queue release work.

Use the sync variant so that an already-running worker is still waited
for, as it was with the flush.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc_wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
index ab4e0e9573df..3eae11900978 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
@@ -400,7 +400,7 @@ void intel_dmc_wl_disable(struct intel_display *display)
 	if (!__intel_dmc_wl_supported(display))
 		return;
 
-	intel_dmc_wl_flush_release_work(display);
+	cancel_delayed_work_sync(&wl->work);
 
 	spin_lock_irqsave(&wl->lock, flags);
 
-- 
2.43.0

