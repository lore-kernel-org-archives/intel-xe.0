Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77152C54ED0
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 18:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBA810E0C6;
	Fri, 23 May 2025 18:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6zmJFOM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B4D10E0C6
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 18:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748026499; x=1779562499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W+dNLkpKSUX6UmWloGjWHjUsiBIgxJkUc28GDxoItSg=;
 b=S6zmJFOMXnShRuLNMVBbQguB9COFBQDHtvDPc/X36MLKalUS6EtlYkRq
 yl0PnOPDB1dV4BkFGDKdODs2atvIC1Ot7TaScB9rcye3A+mt0Hz2pTXc1
 iXiVbpUD2VG1YBEx/wCzYPdMeUzh/2yzyXkNUh5YhC+HvagSSRLQX4Pjs
 RBtT7d5O0a5UFrKJD0ctPzZtIYYPWyOyTbAJ0ivUjOdnDalKVGMldSiE0
 hWzLc4K7bCmWR1UV9yFukWY+aDNHx3zI7HQH7zfXzSegjlF2Q3Q1bpxzW
 +WGqSCnkru6M0Ng/z8eZnAAio/4cj+3PXIQSkPhyzg6UgCN7gGcrRp7jH w==;
X-CSE-ConnectionGUID: 57xL9QmVTFWeosJ3xmLlug==
X-CSE-MsgGUID: ol1a82YyS4Kausi3lIrJHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50145871"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="50145871"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 11:54:54 -0700
X-CSE-ConnectionGUID: aUur6gLIQNyzHPvtU/bdPA==
X-CSE-MsgGUID: K6bpnvhrRQq0FbKF1zVonw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="164491727"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 11:54:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH 3/5] drm/xe/lrc: Sanity check bb space
Date: Fri, 23 May 2025 11:54:37 -0700
Message-ID: <20250523-wa-bb-cmds-v1-3-40b337f71bcd@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com>
References: <20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-f7671
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

4K ought to be enough for anybody, but let's add an assert that we don't
go over it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 4562049a23fb1..b489da4ed7ceb 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -979,6 +979,8 @@ static void setup_wa_bb(struct xe_lrc *lrc)
 	cmd += wa_bb_write_utilization_state(lrc, cmd);
 	*cmd++ = MI_BATCH_BUFFER_END;
 
+	xe_gt_assert(lrc->gt, cmd - cmd0 < lrc->bb_per_ctx_bo->size);
+
 	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
 			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
 }

-- 
2.49.0

