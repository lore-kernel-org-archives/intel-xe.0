Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1357C072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 17:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BED210E304;
	Fri, 17 Nov 2023 17:41:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7C210E304
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 17:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700242868; x=1731778868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/BPorvrp79MynNcCqT+z6GGtOGi+mkzgDaRP+3+YBvg=;
 b=OvsJaQ432Mr9k157QRuNhRmueOfNyg40h+dKHIup15FVsEdz/m3oDiWx
 GrK7L4ovtkuQY5WHhEsNw6a/z4TGU41lHEugdHpSXrsPBZ3XY1nvkVxjw
 TMjNFd3gOEKBp9heMZqIAuH7iZVsP9PkD+ray3/C/AvXilwJP0FZ6c1rw
 mIetZiFHUiCV0G8I3Vgvg+YAODn8yjJvi1pTnSvBMTOozhw4Emgnahtq3
 aLcxRNjY30z0olveVSl1NoNTTjRRgmUI7V4YHr5tC7brITrhI/I3tL/Yq
 GbhEZ3IvFScRkCtucz1Gp5VXeA2Qx6h54BzJaSd6YM3XObJdoVzHU5lDy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4484542"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4484542"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 09:41:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="13979369"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 09:41:07 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Nov 2023 09:40:48 -0800
Message-Id: <20231117174049.527192-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231117174049.527192-1-lucas.demarchi@intel.com>
References: <20231117174049.527192-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe/mocs: Bring comment about mocs back
 to reality
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The mocs documentation was copied from i915 and doesn't match the
reality in xe. Reword it so it matches what the code is doing.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index a072fbccc693..daf5f2a8c40a 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -123,30 +123,20 @@ struct xe_mocs_info {
  *
  * These tables are intended to be kept reasonably consistent across
  * HW platforms, and for ICL+, be identical across OSes. To achieve
- * that, for Icelake and above, list of entries is published as part
- * of bspec.
+ * that, list of entries is published as part of bspec.
  *
- * Entries not part of the following tables are undefined as far as
- * userspace is concerned and shouldn't be relied upon.  For Gen < 12
- * they will be initialized to PTE. Gen >= 12 don't have a setting for
- * PTE and those platforms except TGL/RKL will be initialized L3 WB to
- * catch accidental use of reserved and unused mocs indexes.
- *
- * The last few entries are reserved by the hardware. For ICL+ they
- * should be initialized according to bspec and never used, for older
- * platforms they should never be written to.
+ * Entries not part of the following tables are undefined as far as userspace is
+ * concerned and shouldn't be relied upon. The last few entries are reserved by
+ * the hardware. They should be initialized according to bspec and never used.
  *
  * NOTE1: These tables are part of bspec and defined as part of hardware
- *       interface for ICL+. For older platforms, they are part of kernel
- *       ABI. It is expected that, for specific hardware platform, existing
- *       entries will remain constant and the table will only be updated by
- *       adding new entries, filling unused positions.
+ * interface. It is expected that, for specific hardware platform, existing
+ * entries will remain constant and the table will only be updated by adding new
+ * entries, filling unused positions.
  *
- * NOTE2: For GEN >= 12 except TGL and RKL, reserved and unspecified MOCS
- *       indices have been set to L3 WB. These reserved entries should never
- *       be used, they may be changed to low performant variants with better
- *       coherency in the future if more entries are needed.
- *       For TGL/RKL, all the unspecified MOCS indexes are mapped to L3 UC.
+ * NOTE2: Reserved and unspecified MOCS indices have been set to L3 WB. These
+ * reserved entries should never be used. They may be changed to low performant
+ * variants with better coherency in the future if more entries are needed.
  */
 
 static const struct xe_mocs_entry gen12_mocs_desc[] = {
-- 
2.40.1

