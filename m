Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BA8C27C5F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 01:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B2510E0A6;
	Tue, 11 Jun 2024 01:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DzEMorap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE9110E0A6
 for <Intel-Xe@lists.freedesktop.org>; Tue, 11 Jun 2024 01:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718068830; x=1749604830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AYU1myseRRrvb4arBwcUi287EnJ5XaSi9Fud/U86QG0=;
 b=DzEMorapN64U+xWRbpe7p7aHDR8JxaoVbVg/pFjDNvhDJ4FzSL/g1zQk
 6DO21as03hv3gn1D5fCAoIpsBxWKSpY6tRqBkiIRroUXueUSSemhf0UQ0
 f6TeCYRkdRUWmfywV5BhcG/aYVCRmAYdLku/NR8TmArspkJlQpc6gPVc+
 Rfuos8Bf1tuEluvsiKb+ArWLeJRcDQtIed1jkPXO3cNXpCwV5zOtjvyc5
 LHx+fuoCmyJ16ko5vDkOm6zB/RZCmDC/8zfPDfPQoarlP7V4NFjTSlsJ+
 eN8IsXKp5e/vKm9GDQqHFa113zsv1EcQ7BwqjDxbqm0y9q+e6BxDb0J0B A==;
X-CSE-ConnectionGUID: JHhOjdi9QnyTAGruMhzIYQ==
X-CSE-MsgGUID: ZiyNanKtSKmPfzcbJftkwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="18612242"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="18612242"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 18:20:29 -0700
X-CSE-ConnectionGUID: FzFYkygBSfiWoCWqIcdbYw==
X-CSE-MsgGUID: z++ok8cxTf6hl8FlzksTBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43684346"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 10 Jun 2024 18:20:29 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 1/7] drm/xe/guc: Remove spurious line feed in debug print
Date: Mon, 10 Jun 2024 18:20:22 -0700
Message-ID: <20240611012028.2305024-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240611012028.2305024-1-John.C.Harrison@Intel.com>
References: <20240611012028.2305024-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Including line feeds at the start of a debug print messes up the
output when sent to dmesg. The break actually appears between all the
usefu prefix information and the actual string being printed. In this
case, each block of data has a very clear start line and an extra
delimeter is really not necessary. So don't do it.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 936b63483e96..fd74243c416c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1488,7 +1488,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 		drm_puts(p, "H2G CTB (all sizes in DW):\n");
 		guc_ctb_snapshot_print(&snapshot->h2g, p);
 
-		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
+		drm_puts(p, "G2H CTB (all sizes in DW):\n");
 		guc_ctb_snapshot_print(&snapshot->g2h, p);
 
 		drm_printf(p, "\tg2h outstanding: %d\n",
-- 
2.43.2

