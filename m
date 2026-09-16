Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A707C982D1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 21:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CB310E367;
	Wed, 16 Sep 2026 21:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmcJgOGS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9032810E2E5
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 21:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789595929; x=1821131929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rcdvg4Xr9Iw4DWJ6a06iFb/j8j2gfTtGY2/0RxnX76o=;
 b=dmcJgOGSF98p09z1FTloJyto0QZVq+bcKUW0nfCRZrcdvWKrhLj2QvRT
 5WAfklCuQEY9QU3oI3F9VL/zZLRlL93Jpqs2TIFWsv6zQDWOYktWmlgl5
 7JIl6udvqILbLywrc4HIXZeCkGQSIfnJsKs4UTe9Vq2EZbN0Q9DPDaCVK
 rbZq7DS3ITJbx3X6UBYyINLLb/5jk45K0dMRJr7yN67dMvjiCGYkIn6nb
 BMzigcGB7b/WjXiySHO+ztRSpCfwpWq1/dykydq+90lLISsGKTxkHNaw5
 SW+31E9bh1L8wvfz7bGJIoiJaG3mK40yXfgD6NzjI60yk9kxJuoTTIejE g==;
X-CSE-ConnectionGUID: pNaPOwR4RXGxN4wWgQVDvw==
X-CSE-MsgGUID: mKGGSGyMSkGV4I17BoYFhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101325130"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101325130"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 14:58:49 -0700
X-CSE-ConnectionGUID: nIbj6r6dSvmTCBUvg9Iiwg==
X-CSE-MsgGUID: b8TAPnYOS9WhY/QJG6CY6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="267247880"
Received: from awalabdu-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.64.211])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 14:58:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/3] drm/xe/pf: Use KLV decode helpers to parse migration
 packet
Date: Wed, 16 Sep 2026 23:58:27 +0200
Message-ID: <20260916215827.13488-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916215827.13488-1-michal.wajdeczko@intel.com>
References: <20260916215827.13488-1-michal.wajdeczko@intel.com>
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

Start using recently added KLV helpers for parsing migration
packet to properly detect any malformed KLV formats.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_packet.c | 31 ++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
index e9ae9c9744ea..f50dc4e3a611 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.c
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -394,24 +394,43 @@ static int pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
 static int descriptor_decoder(void *arg, u16 key, u16 len, const u32 *value)
 {
 	struct xe_device *xe = arg;
+	int err;
 
 	xe_sriov_dbg_verbose(xe, "found KLV %#x %s\n", key, xe_guc_klv_key_to_string(key));
 
 	switch (key) {
-	case MIGRATION_KLV_DEVICE_DEVID_KEY:
-		if (*value != xe->info.devid) {
+	case MIGRATION_KLV_DEVICE_DEVID_KEY: {
+		u16 devid;
+
+		err = xe_guc_klv_decode_u16(value, len, &devid);
+		if (err) {
+			xe_sriov_warn(xe, "Aborting migration, corrupted key %#x (%pe)\n",
+				      key, ERR_PTR(err));
+			return err;
+		}
+		if (devid != xe->info.devid) {
 			xe_sriov_warn(xe, "Aborting migration, devid mismatch %#06x!=%#06x\n",
-				      *value, xe->info.devid);
+				      devid, xe->info.devid);
 			return -ENODEV;
 		}
 		break;
-	case MIGRATION_KLV_DEVICE_REVID_KEY:
-		if (*value != xe->info.revid) {
+	}
+	case MIGRATION_KLV_DEVICE_REVID_KEY: {
+		u16 revid;
+
+		err = xe_guc_klv_decode_u16(value, len, &revid);
+		if (err) {
+			xe_sriov_warn(xe, "Aborting migration, corrupted key %#x (%pe)\n",
+				      key, ERR_PTR(err));
+			return err;
+		}
+		if (revid != xe->info.revid) {
 			xe_sriov_warn(xe, "Aborting migration, revid mismatch %#06x!=%#06x\n",
-				      *value, xe->info.revid);
+				      revid, xe->info.revid);
 			return -ENODEV;
 		}
 		break;
+	}
 	default:
 		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
 			struct drm_printer p = xe_dbg_printer(xe);
-- 
2.47.1

