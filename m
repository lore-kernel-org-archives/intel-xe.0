Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF88CA1010
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 18:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CF810EC1E;
	Fri,  5 Sep 2025 18:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZjSb2qHk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9198C10EC1E
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757095359; x=1788631359;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wm+3c3xX/ghbyy8NHbCRWV2TF9SRCnl6nqexIeKoLUM=;
 b=ZjSb2qHkxMX4l1vbw+6FCCZjDdB1p1zTOYry9ljiZgYqQagPxhN0pn1k
 MzV68qahcDNYRvCwyFsgFrrRm6lveDpilI5Buy2yXD/1hXjYoYDSBtCgF
 PI79LRAvCkkMku6LoYnf6hGuGThN4qvopeAbbNrbetLzHt5ia/0i1csY2
 FE0Fv2Ln0upa09XZfUX2D9GBZrfv4/RoXDePN1wafRyVtjCoxW4U4eeCP
 JN13MLZBmFdS+XA9NSACoVdEhGTydGzRMG5Om7fbHvih9CfjfU3jFCBcG
 0chbW0Om/621kDF8TYeST2Y14M258Yh35fISIjMY5Ml4yjb3Kcfk6IUf4 A==;
X-CSE-ConnectionGUID: U8DVYsWbTgWFI5jGiavX9w==
X-CSE-MsgGUID: zMIDja3wThCV7GUxN0g8Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="69710725"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="69710725"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 11:02:39 -0700
X-CSE-ConnectionGUID: IyZ0zOo+TUabfxSdk+Dw9A==
X-CSE-MsgGUID: aNLFgR9PQCeVWa4B87Yycg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="209391724"
Received: from abaranow-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.83.253])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 11:02:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH] drm/xe/debugfs: Make residencies definitions const
Date: Fri,  5 Sep 2025 20:02:25 +0200
Message-ID: <20250905180225.8434-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

No need to keep them non-const. Also fix declaration of .name
member, as it points to the const string. This translates to:

  add/remove: 1/0 grow/shrink: 0/2 up/down: 80/-248 (-168)
  Function                                     old     new   delta
  residencies                                    -      80     +80
  dgfx_pcie_link_residencies_show              365     263    -102
  dgfx_pkg_residencies_show                    454     308    -146
  Total: Before=2821548, After=2821380, chg -0.01%

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Soham Purkait <soham.purkait@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Karthik Poosa <karthik.poosa@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 4b71570529a6..9ebd9f75746a 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -39,7 +39,7 @@ DECLARE_FAULT_ATTR(gt_reset_failure);
 DECLARE_FAULT_ATTR(inject_csc_hw_error);
 
 static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
-				   u32 offset, char *name, struct drm_printer *p)
+				   u32 offset, const char *name, struct drm_printer *p)
 {
 	u64 residency = 0;
 	int ret;
@@ -135,9 +135,9 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 	p = drm_seq_file_printer(m);
 	xe_pm_runtime_get(xe);
 	mmio = xe_root_tile_mmio(xe);
-	struct {
+	static const struct {
 		u32 offset;
-		char *name;
+		const char *name;
 	} residencies[] = {
 		{BMG_G2_RESIDENCY_OFFSET, "Package G2"},
 		{BMG_G6_RESIDENCY_OFFSET, "Package G6"},
@@ -164,9 +164,9 @@ static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
 	xe_pm_runtime_get(xe);
 	mmio = xe_root_tile_mmio(xe);
 
-	struct {
+	static const struct {
 		u32 offset;
-		char *name;
+		const char *name;
 	} residencies[] = {
 		{BMG_PCIE_LINK_L0_RESIDENCY_OFFSET, "PCIE LINK L0 RESIDENCY"},
 		{BMG_PCIE_LINK_L1_RESIDENCY_OFFSET, "PCIE LINK L1 RESIDENCY"},
-- 
2.47.1

