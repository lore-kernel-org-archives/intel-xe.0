Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF80C5320E
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 22:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F26B10E10E;
	Thu, 22 Aug 2024 22:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJN2elnY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3873510E10E
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 22:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724366781; x=1755902781;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZSk9Qs666xcuohyR3ISF7ZdVeEFh5weMczAYYu0zdiM=;
 b=KJN2elnYJviXefnZC3FFixETPOMoBNhsSseM/Rw1ehFSoT/GZhChMYsh
 RCM+iP5V4xekfzFP5CG/jApMRP+DsLcIqKLr3praX/jPynq42EwIHgC9V
 kswRDohMUfPjVlqA4bYDEla+nzPfnKqG6ltV7kGuXH8R2z1T9823cvdj9
 5Ba2aMxK50vLM7DeT+xM6uGxsfocVOKb4XlZLXJzSPm/BzWz5pgKoP4cI
 f/KQDJBGG9c5oOA3KjkxcR2HwbpJNyYWhhCq1IhItME0y8QgAdaJWDEaO
 wa2MakpI8xVqG1TYf23gqmkAFjgilVItqtfr9Na4tpTlRR1TgzldN1+S7 Q==;
X-CSE-ConnectionGUID: 9mnyaN4zQ/G9myvMud04yQ==
X-CSE-MsgGUID: m+2zDpKFRha1tIZSeTocyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22986034"
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; d="scan'208";a="22986034"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 15:46:21 -0700
X-CSE-ConnectionGUID: z1mcdEg9QQ6ut10vC6VSHQ==
X-CSE-MsgGUID: Z7njD7CdRAmHgBgLlHsafQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; d="scan'208";a="66508768"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 15:46:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/xe/lnl: Drop force_probe requirement
Date: Thu, 22 Aug 2024 15:46:15 -0700
Message-ID: <20240822224615.793540-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Lunar Lake has been usable for a while in a desktop setup. Bugs are
sporadically showing up in CI, but being promptly fixed. Nothing very
concerning.

All the uapi changes related to fundamental platform usage have been
finalized.

Remove the force_probe requirement and enable the platform by default.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Last concerning bug[1] should now be fixed since [2] is merged. Mesa CI
was hitting it frequently, which was badly impacting their execution.

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1705
[2] https://lore.kernel.org/intel-xe/20240821193842.352557-1-rodrigo.vivi@intel.com/T/#t

We should probably wait a few more days for this forward-looking patch
before merging it though.

 drivers/gpu/drm/xe/xe_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 0c2342988650..fa57996f9c37 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -342,7 +342,6 @@ static const struct xe_device_desc mtl_desc = {
 static const struct xe_device_desc lnl_desc = {
 	PLATFORM(LUNARLAKE),
 	.has_display = true,
-	.require_force_probe = true,
 };
 
 static const struct xe_device_desc bmg_desc = {
-- 
2.43.0

