Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CE7C6FD1D
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 17:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D5D10E10E;
	Mon, 27 Mar 2023 17:58:43 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FD510E115
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 17:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679939921; x=1711475921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/1Vlp3J+pKeuUPgrFUXqJV8UHGhYS/fVNlaHPr9Go8o=;
 b=NHBVN6X/pxkKS38GUw/VkGMiGM5r4n/sbXrwCAzyiX1+4cLzHRhzu1ft
 HjzSz5qBRzL2+3vn7mNIy1mjJWXpfDxEuNbt704dCcUVjTLWW8EZHpyYi
 ZZ+OdYEqIaYOqIVbkwvv4jY7PEWCBbbK8VZkD7uCGPzNeavpzdWC7bBFi
 eLTb2KSZfrt4ogPcYx0KKlX1d3M4AlPZBDRhnMG0aISXeoKN9JvhM7CpD
 tI15Ml01Ns9NLJx4M3JcaAxRTkM5T+ruXTwJNF6Emda6Lnt36BWlnPhm5
 mamejht4tGi+rZGNCGTQ0DhWw4nCOFWpnVtfruZ53qu8WtlEH/w4gfl7l w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="405273516"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="405273516"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 10:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="660912973"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="660912973"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 10:58:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Mar 2023 10:58:24 -0700
Message-Id: <20230327175824.2967914-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/pat: Define PAT tables as static
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The tables are only used within this file; there's no reason for them
not to be static.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index c860b2122301..be1bea58378a 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -30,7 +30,7 @@
 #define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
 #define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
 
-const u32 tgl_pat_table[] = {
+static const u32 tgl_pat_table[] = {
 	[0] = TGL_PAT_WB,
 	[1] = TGL_PAT_WC,
 	[2] = TGL_PAT_WT,
@@ -41,7 +41,7 @@ const u32 tgl_pat_table[] = {
 	[7] = TGL_PAT_WB,
 };
 
-const u32 pvc_pat_table[] = {
+static const u32 pvc_pat_table[] = {
 	[0] = TGL_PAT_UC,
 	[1] = TGL_PAT_WC,
 	[2] = TGL_PAT_WT,
@@ -52,7 +52,7 @@ const u32 pvc_pat_table[] = {
 	[7] = PVC_PAT_CLOS(2) | TGL_PAT_WB,
 };
 
-const u32 mtl_pat_table[] = {
+static const u32 mtl_pat_table[] = {
 	[0] = MTL_PAT_0_WB,
 	[1] = MTL_PAT_1_WT,
 	[2] = MTL_PAT_3_UC,
-- 
2.39.2

