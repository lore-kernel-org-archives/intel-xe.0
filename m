Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155CAC43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 17:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9987010E9D6;
	Mon, 29 Jun 2026 17:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSZFfBF6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1249710E9D9
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 17:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782753762; x=1814289762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bhWYd+W0CttTNgcX91dauu0Pw1MnQzuzexGKxRFURTY=;
 b=HSZFfBF6LfuEBy4z0VDgl2AeAWu2eORyABtlhZkYqWpWjZv45z98Wfam
 dTlqoTYooUCYVVCxSGztfOipmIuSgiy/HmoRgy0wqEmDz2qfaJwZUUdvn
 vus3IgGjdcWPcW4DUXaSOMqyG7L7BYvP3M7YQ2WPl+xp26nprp71XzKbN
 2m8wlShYB229TXUyf3k4EPBAg5h6TJ7ZR6JH0ycddKDn1bsVxA+KKwiE2
 eehaWxAVbRd86buWZiDhKLQCB9zBZ9yZ9bNDpU9d2bglRRSIyA/ZvIu7J
 z8PVjqgF965sFUXfdhPz662ei/Zmebugkjc0mFabWXZ84UrdfZaAPX7yA g==;
X-CSE-ConnectionGUID: SiHJmetIQmSe4x7K+lEyYg==
X-CSE-MsgGUID: lbpKzRpESVi00tQgaHSMNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94947220"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="94947220"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 10:22:41 -0700
X-CSE-ConnectionGUID: Q2usAiOLQxmLdX9MNyXBpg==
X-CSE-MsgGUID: e4Fv9/KnRHSGkJDVeWWVHA==
X-ExtLoop1: 1
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.20])
 by fmviesa003.fm.intel.com with ESMTP; 29 Jun 2026 10:22:41 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v3 1/2] drm/xe: Remove extra newlines from LRC snapshot dump
Date: Mon, 29 Jun 2026 13:22:38 -0400
Message-Id: <20260629172239.2377117-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629172239.2377117-1-zhanjun.dong@intel.com>
References: <20260629172239.2377117-1-zhanjun.dong@intel.com>
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

The LRC snapshot printer adds an extra newline before the replay
offset and replay length lines. This leaves blank lines in the
HWCTX section of the dump.

Remove the stray newlines so the snapshot output remains compact
and consistently formatted.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 3e7c995085d0..0b5f0a6d7d13 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2593,8 +2593,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	}
 
 	drm_printf(p, "\n\t[HWCTX].length: 0x%lx\n", snapshot->lrc_size - LRC_PPHWSP_SIZE);
-	drm_printf(p, "\n\t[HWCTX].replay_offset: 0x%lx\n", snapshot->replay_offset);
-	drm_printf(p, "\n\t[HWCTX].replay_length: 0x%lx\n", snapshot->replay_size);
+	drm_printf(p, "\t[HWCTX].replay_offset: 0x%lx\n", snapshot->replay_offset);
+	drm_printf(p, "\t[HWCTX].replay_length: 0x%lx\n", snapshot->replay_size);
 
 	drm_puts(p, "\t[HWCTX].data: ");
 	for (; i < snapshot->lrc_size; i += sizeof(u32)) {
-- 
2.34.1

