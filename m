Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE0ECA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 16:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBD110E407;
	Mon, 12 Oct 2026 16:40:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6491E10E407
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 16:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791823222; x=1823359222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CyqeW/VXiSQZfJQgX/xyOe29OE3KE4t8ZzKYQgo2rLw=;
 b=mv7V5izfsWtn09cOTC8sLEmBo18jwvJUQhav6LAcIlbLKRkAKKTBHCdl
 NiniNmIdcIcLA5UoWEuL+H2ZC/jd7bVODNo6780nj4QssWvM3Bi4iUwBJ
 ulX68PO2+S6Dz8R7f1R2ZYqrrIsc08S67D0LujxWHU8mzuLQeNuZ+FO4X
 YrlXwgzXdZ+cpgSNEfgv/jeWaqlNxp8SYlc1VvMT8jPGDKYkqEJdgf8oz
 i3d1Kl72fXULz+YTkGXkCFusRN/Rc5NeddsROf1WAJVGjARyka3H2XB1G
 jIh7i/Ue3lhqnG/axmDYIkauLyVdBdOvNJFcA++eykDIX325BPwDnQ4Hn g==;
X-CSE-ConnectionGUID: Xaq0IMtXQ+S/MYTauzCymg==
X-CSE-MsgGUID: 6OBJS+KWQIiDgpO0YY0DUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="550668"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="550668"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 09:40:22 -0700
X-CSE-ConnectionGUID: J2iXScLgT0WiBtNGPmOKZg==
X-CSE-MsgGUID: XE0LIe8PS6GX7/MvvOqdUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="896788"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa002.jf.intel.com with ESMTP; 12 Oct 2026 09:40:21 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v1 2/2] drm/xe/tuning: Restrict Anyhit NULL-query tuning to
 render engines
Date: Mon, 12 Oct 2026 22:49:04 +0530
Message-ID: <20261012171901.19508-6-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261012171901.19508-4-nitin.r.gote@intel.com>
References: <20261012171901.19508-4-nitin.r.gote@intel.com>
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

The "Disable NULL query for Anyhit Shader" tuning uses
xe_rtp_match_first_render_or_compute to program RT_CTRL once per GT.
On a GT with no render (RCS) engine, that match falls back to a
compute (CCS) engine instead, so the tuning is still written even
though RT_CTRL's ray-tracing logic has no hardware behind it there.

A CRI compute-only GT hits exactly this path, causing
igt@xe_debugfs@check-gt-reg-sr to report a save-restore mismatch:

  Mismatch on 0xe530, expected 0x400 got 0x0

Restrict the rule to ENGINE_CLASS(RENDER) so it only applies where
ray-tracing hardware is actually present. Every other in-tree platform
in this version range (BMG, LNL, PTL, NVL) always has a render engine,
which xe_rtp_match_first_render_or_compute already resolves ahead of
any compute engine, so this is a no-op for them.

Assisted-by: LLM
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_tuning.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 514deded1163..de7f0f23620d 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -120,7 +120,7 @@ static const struct xe_rtp_table_sr engine_tunings = XE_RTP_TABLE_SR(
 	},
 	{ XE_RTP_NAME("Tuning: Disable NULL query for Anyhit Shader"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
+		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
 	},
 	{ XE_RTP_NAME("Tuning: disable HW reporting of ctx switch to GHWSP"),
-- 
2.50.1

