Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390A6EFCE47
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 21:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D364C10EABA;
	Wed,  4 Mar 2026 21:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vd10w/UI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D2510EABA
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 21:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772659061; x=1804195061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hwVRLqnkNVLQpiPZdNeyrCOhnkhD0ZUb6SM3d69SG9w=;
 b=Vd10w/UIU0xOgdMuuZS7G4b7kZpkUNroIkmXFr1h9bpC37DfPsysqxcI
 ztizgZN7Di00h2A8eNUNQL6hteumEg2bp8MjFMrveOOy/AttL05QkMV+L
 KMEs8Erv0IvsnbmKVjSknJoBDocja1Opbgi7k8Ozk4B2nv9guCPOkd6gq
 PE5fQJ7fwVjG4H4m5LnY08dAf30IO5jjJCOATJ/k1bF8NDJfGibqDXxbQ
 VUfxLL4GOsKywvc75P5KO70gq/jqF/MTp7QNTzx1s8kJk0niH2pZst4bS
 6MUWXvI3kKYhLVIwXerReqzpZfzZOmkrNWBSOiSONnbwY0FyTYzFPTRpe w==;
X-CSE-ConnectionGUID: /tR2CUSRThGEZa/2ncgg8A==
X-CSE-MsgGUID: 7XmH+dCGSI6jSmrNb2W3FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72932877"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="72932877"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 13:17:40 -0800
X-CSE-ConnectionGUID: +1y6WunRQc6dDFEPVb7w3A==
X-CSE-MsgGUID: uXJGH8ThQ+C9LF9PjmtuMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="241473744"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.81])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 13:17:38 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Fix overflow in guc_ct_snapshot_capture
Date: Wed,  4 Mar 2026 23:17:28 +0200
Message-ID: <20260304211728.249104-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304112501.230992-1-mika.kuoppala@linux.intel.com>
References: <20260304112501.230992-1-mika.kuoppala@linux.intel.com>
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

snapshot->ctb is u32*, so pointer arithmetic on it scales
the byte offset from xe_bo_size() by 4, overshooting the
intended start of the g2h portion and writing past the
allocated buffer.

Fix this by using void * to get the arithmetic right and
prevent future mishaps.

v2: s/u8/void for memcpy and iosys_map consistency (Matt)

Fixes: af3de6cf06f9 ("drm/xe: Split H2G and G2H into separate buffer objects")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 46ad1402347d..5da1ce5dc372 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -74,7 +74,7 @@ struct xe_guc_ct_snapshot {
 	/** @ctb_size: size of the snapshot of the CTB */
 	size_t ctb_size;
 	/** @ctb: snapshot of the entire CTB */
-	u32 *ctb;
+	void *ctb;
 };
 
 /**
-- 
2.43.0

