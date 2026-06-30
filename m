Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2E0C43327
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 13:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9128810E86D;
	Tue, 30 Jun 2026 13:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e0yjLwO1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2EA10E50F
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 13:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782826019; x=1814362019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/MjKhdY7OmhGNvHhD1YbO7nTL/8OohQr4/ntEA8+pr4=;
 b=e0yjLwO1LyfJEnDvhPyrz38qWWAhNaRT94W9eYxofHiU4inBerwx6tOO
 yhrzBmY7X2YK/SeT8/3yxQLCb9jxMEY4MG4CKF/U/DODdNgizq5fgGRQL
 tV6utVruRxWurDQX/15MKDr9lcrz/yDMQ0NtpPObgoEBkrrbkc8lDXYzU
 SYDr11p9CtFJJZC4+PpgqBThKx5Y21sF1nBQQxtkiHNgiW549YG/WiNRs
 IovQxxNyehZQ6YhKdVx28RVmdZ8W13ssV42XlZiqmPrfLIqZmuHEyAkn8
 +KLUAX5z/KWqoGIVeupBjnnJfFvIg2gbTbUNDg/m7zV9chlfe/idihogn A==;
X-CSE-ConnectionGUID: Pvo+4upmRQ60QAi9qKVZ3A==
X-CSE-MsgGUID: wxKqPiEzS960PD4yiFzUBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83623527"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="83623527"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:59 -0700
X-CSE-ConnectionGUID: yyGved79TxOJayDi5Hoccw==
X-CSE-MsgGUID: kfjJjeZPTL2LKjkTx+GyzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="256182256"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 13/13] drm/xe/pf: Handle migration descriptor using KLV helpers
Date: Tue, 30 Jun 2026 15:26:32 +0200
Message-ID: <20260630132633.32804-14-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630132633.32804-1-michal.wajdeczko@intel.com>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
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

As we plan to add more KLVs to the migration descriptor packet,
to simplify such extensions and avoid coding errors, start using
our KLV helpers for packet preparing and parsing.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_packet.c | 106 ++++++++++++++-------------
 1 file changed, 56 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
index 558a3697d639..e9ae9c9744ea 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.c
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -360,8 +360,7 @@ static int pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
 {
 	struct xe_sriov_packet **desc = pf_pick_descriptor(xe, vfid);
 	struct xe_sriov_packet *data;
-	unsigned int len = 0;
-	u32 *klvs;
+	u32 *klvs, *end;
 	int ret;
 
 	data = xe_sriov_packet_alloc(xe);
@@ -376,20 +375,55 @@ static int pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
 	}
 
 	klvs = data->vaddr;
-	klvs[len++] = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_DEVID_KEY,
-					 MIGRATION_KLV_DEVICE_DEVID_LEN);
-	klvs[len++] = xe->info.devid;
-	klvs[len++] = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_REVID_KEY,
-					 MIGRATION_KLV_DEVICE_REVID_LEN);
-	klvs[len++] = xe->info.revid;
+	end = klvs + MIGRATION_DESCRIPTOR_DWORDS;
 
-	xe_assert(xe, len == MIGRATION_DESCRIPTOR_DWORDS);
+	klvs = xe_guc_klv_encode_u32(klvs, end - klvs,
+				     MIGRATION_KLV_DEVICE_DEVID_KEY,
+				     xe->info.devid);
+	klvs = xe_guc_klv_encode_u32(klvs, end - klvs,
+				     MIGRATION_KLV_DEVICE_REVID_KEY,
+				     xe->info.revid);
+	xe_assert(xe, !IS_ERR(klvs));
+	xe_assert(xe, klvs == end);
 
 	*desc = data;
 
 	return 0;
 }
 
+static int descriptor_decoder(void *arg, u16 key, u16 len, const u32 *value)
+{
+	struct xe_device *xe = arg;
+
+	xe_sriov_dbg_verbose(xe, "found KLV %#x %s\n", key, xe_guc_klv_key_to_string(key));
+
+	switch (key) {
+	case MIGRATION_KLV_DEVICE_DEVID_KEY:
+		if (*value != xe->info.devid) {
+			xe_sriov_warn(xe, "Aborting migration, devid mismatch %#06x!=%#06x\n",
+				      *value, xe->info.devid);
+			return -ENODEV;
+		}
+		break;
+	case MIGRATION_KLV_DEVICE_REVID_KEY:
+		if (*value != xe->info.revid) {
+			xe_sriov_warn(xe, "Aborting migration, revid mismatch %#06x!=%#06x\n",
+				      *value, xe->info.revid);
+			return -ENODEV;
+		}
+		break;
+	default:
+		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+			struct drm_printer p = xe_dbg_printer(xe);
+
+			xe_sriov_dbg(xe, "unexpected KLV %#x in descriptor!\n", key);
+			xe_guc_klv_print_one(key, len, value, &p);
+		}
+		return 0;
+	}
+	return 1;
+}
+
 /**
  * xe_sriov_packet_process_descriptor() - Process migration data descriptor packet.
  * @xe: the &xe_device
@@ -406,6 +440,7 @@ int xe_sriov_packet_process_descriptor(struct xe_device *xe, unsigned int vfid,
 {
 	u32 num_dwords = data->hdr.size / sizeof(u32);
 	u32 *klvs = data->vaddr;
+	int ret;
 
 	xe_assert(xe, data->hdr.type == XE_SRIOV_PACKET_TYPE_DESCRIPTOR);
 
@@ -415,47 +450,18 @@ int xe_sriov_packet_process_descriptor(struct xe_device *xe, unsigned int vfid,
 		return -EINVAL;
 	}
 
-	while (num_dwords >= GUC_KLV_LEN_MIN) {
-		u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
-		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
-
-		klvs += GUC_KLV_LEN_MIN;
-		num_dwords -= GUC_KLV_LEN_MIN;
-
-		if (len > num_dwords) {
-			xe_sriov_warn(xe, "Aborting migration, truncated KLV %#x, len %u\n",
-				      key, len);
-			return -EINVAL;
-		}
-
-		switch (key) {
-		case MIGRATION_KLV_DEVICE_DEVID_KEY:
-			if (*klvs != xe->info.devid) {
-				xe_sriov_warn(xe,
-					      "Aborting migration, devid mismatch %#06x!=%#06x\n",
-					      *klvs, xe->info.devid);
-				return -ENODEV;
-			}
-			break;
-		case MIGRATION_KLV_DEVICE_REVID_KEY:
-			if (*klvs != xe->info.revid) {
-				xe_sriov_warn(xe,
-					      "Aborting migration, revid mismatch %#06x!=%#06x\n",
-					      *klvs, xe->info.revid);
-				return -ENODEV;
-			}
-			break;
-		default:
-			xe_sriov_dbg(xe,
-				     "Skipping unknown migration KLV %#x, len=%u\n",
-				     key, len);
-			print_hex_dump_bytes("desc: ", DUMP_PREFIX_OFFSET, klvs,
-					     min(SZ_64, len * sizeof(u32)));
-			break;
-		}
-
-		klvs += len;
-		num_dwords -= len;
+	ret = xe_guc_klv_count(klvs, num_dwords);
+	if (ret < 0) {
+		xe_sriov_warn(xe, "Aborting migration, corrupted descriptor KLVs (%pe)\n",
+			      ERR_PTR(ret));
+		return ret;
+	}
+
+	ret = xe_guc_klv_parser(klvs, num_dwords, xe, descriptor_decoder);
+	if (ret < 0) {
+		xe_sriov_warn(xe, "Aborting migration, descriptor parsing failed (%pe)\n",
+			      ERR_PTR(ret));
+		return ret;
 	}
 
 	return 0;
-- 
2.47.1

