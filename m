Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CC8FF886F
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23A710EBD9;
	Tue, 28 Apr 2026 14:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfTfQ1B2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2746410EBC4
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 14:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386457; x=1808922457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cs5YoJgR7dclPe88zEydvu8ziUk7VDGpomwK3Vq0Ues=;
 b=lfTfQ1B2GNE4uCt8GLOTF6jZCgnu1pyGHOLwUjZIYFdFg4ysw4rDDjt3
 J6kelmfYPOhN/a5R88ZMntLKKK8Zxs4n7RDHWQFhB/zBm526/fOp37LGb
 kDxoGUwtxsLM18XEEffQjOUs8vmgT38RRvGy/Pfm0uceD6MkLBetBURq6
 +wV9p2Ohr1C3Mi4VFuhg/sbChDm9GZpeJS3FBrlWHtRHkZYb/7NVOe22S
 ub65Mbq7dvVFY25rmu6ytInYjaAMv3a25O2orvX+/TvrAiCH3UVWtzHhp
 VN6Gj1+/bAZnap0zDh3Fpm0625pwb6dB198XiUmCj+AMrV9s7wN5HTEVn g==;
X-CSE-ConnectionGUID: S465T0sPQbWrew0OawTNMg==
X-CSE-MsgGUID: nl5HCm1OR+ay7yAH1WkjLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95862310"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="95862310"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:37 -0700
X-CSE-ConnectionGUID: OV50T9crRauWQ4JoN2uFZQ==
X-CSE-MsgGUID: 6EJdTcFbTO2Np3IxEhdSig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238942338"
Received: from orenpaz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.20.98])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 01/13] drm/xe/ggtt: Rename parameter name in
 xe_ggtt_init_kunit()
Date: Tue, 28 Apr 2026 16:27:08 +0200
Message-ID: <20260428142722.582-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428142722.582-1-michal.wajdeczko@intel.com>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
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

The parameter name was changed by the commit 22437f30d2f0 ("drm/xe:
Start using ggtt->start in preparation of balloon removal"), but we
missed then to update the function prototype.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index c864cc975a69..f0ac7ec0502a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -15,7 +15,7 @@ struct drm_exec;
 
 struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile);
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
-int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size);
+int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
 void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_base);
-- 
2.47.1

