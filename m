Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF875F513E9
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 23:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D12210EC83;
	Thu,  5 Mar 2026 23:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWAc7T+B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A2510E112
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 23:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772751637; x=1804287637;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=tpJFkKHq/L1d1CMQAduuOeOaiix+g4HL8G/q0VXz0ig=;
 b=JWAc7T+BVbyI/c8VvL0TSZ9PmiwffwaljfbaqO373Z34MdxVtRsNAlb5
 ivwHr/Rv/x3Ns/YMncITSDPvYWGVopUEshuK294CWJpNu+hZIO8JEd/Ms
 Gu1y7dfRbE0vm2E3QdGyPcWGDB1dZEaV7fokQEn8AotExKVSJ9Xqy7+mm
 WwIrETs0TYmvfY89CQSOXb2Qe1fP6OqHtPYu/tbecs+sJzuxoXw8jY1Ik
 RuSYxzXYdSUsWzFhXUEWr79J04EFo2vZDB+AKm58L4j0JQPrHt9kWivYf
 aw9m3u5mc1z+C1MWA3WmJszHPMhQDy8O4LiOWKLydDqT1wJTnxa54rLke Q==;
X-CSE-ConnectionGUID: XB2NO8hFRtGVIAvygaJuGg==
X-CSE-MsgGUID: 9JYKoR3eS+aF4LiwvIRPpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84940886"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="84940886"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 15:00:36 -0800
X-CSE-ConnectionGUID: SL2brWjdRbmTX6Vj3Vut3g==
X-CSE-MsgGUID: DKOOBi4XQHeSuQzNqIWSOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="216004881"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 15:00:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 05 Mar 2026 14:59:28 -0800
Subject: [PATCH 2/2] drm/xe: Utilize for_each_gt_with_type() for
 type-specific GT loops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-gt-type-loops-v1-2-aa42e9fc3f06@intel.com>
References: <20260305-gt-type-loops-v1-0-aa42e9fc3f06@intel.com>
In-Reply-To: <20260305-gt-type-loops-v1-0-aa42e9fc3f06@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Farah Kassabri <farah.kassabri@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2824;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=tpJFkKHq/L1d1CMQAduuOeOaiix+g4HL8G/q0VXz0ig=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpqgsTC9LPcMYCkko9JU1c0ZZmJO2zoNLhSm3IU
 zEqf75if+eJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaaoLEwAKCRBNeSQFyHKQ
 BE5ZD/4hIU9834Le21wGvGsJ+/4GXNktCvCTNJfverjfgGgZ0hNkdEuzbwkcf33TnvEL+X5xGAN
 9dZj4/5k/0Z+brfAv7EOl0sb6Zhz9SHQSrtx0XoIdIxnvypNPp8SAhnHdIGpRpbesmDGMmLZ5wa
 VhF+r4LUuti4Sc/T+qD48I1Np82YK116M6NC+u3AZ5gJFHlgoJxiT021jN86vh37UeY+NWD9HKv
 BA4lkMxEZK0uKXVZZzLCltxqV4kwVZWsXmBdYJorvNQG5vSSDOUh25XbfSfeFaMs09Tlu9WWN7s
 WcDRSJPLlPO5wHLiz0M17lJ+HXVwsuvCAm3r6ghLTJjbOrRZfsCHSiUVDkf8iDiYCJ5+PpYJxIF
 +DslIhRrYsGVqStjgh0NA/OvVqTLCS7xaMYEQM1mgb1uqQRCRtaAklbmiBlzRqIblPuimOj5C07
 cdkzguMxkmpz2mhYz+5nW3HWbe5THPuG99f+L6EA7r04gpdc+9WblbZMFy6LIvj+qH2X3gAB1R2
 C87L6D6k24KrS3fePGCRb9AOSrQv6Yg5tyy4ecpW3gycLSUI02Rt5hPP4lIW6Urk4BMTcSTT0U0
 oKwCc5aZg2k0++Vut3hQT0ijnaV3cKJRKKSL4+ijYfRQ0aIn3adNkphl94zLWr3Om4qzAGLboih
 tLWwkUq1SecyCbA==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Convert existing loops with Coccinelle via the following semantic patch:

    @@
    identifier GT, XE, ID;
    iterator name for_each_gt, for_each_gt_with_type;
    @@
    - for_each_gt(GT, XE, ID) {
    + for_each_gt_with_type(GT, XE, ID, BIT(XE_GT_TYPE_MAIN)) {
    -         if (xe_gt_is_media_type(GT))
    -                 continue;
              ...
      }

    @@
    identifier GT, XE, ID;
    iterator name for_each_gt, for_each_gt_with_type;
    @@
    - for_each_gt(GT, XE, ID) {
    + for_each_gt_with_type(GT, XE, ID, BIT(XE_GT_TYPE_MEDIA)) {
    -         if (xe_gt_is_main_type(GT))
    -                 continue;
              ...
      }

    @@
    identifier GT, XE, ID;
    iterator name for_each_gt, for_each_gt_with_type;
    @@
    - for_each_gt(GT, XE, ID) {
    + for_each_gt_with_type(GT, XE, ID, BIT(XE_GT_TYPE_MAIN)) {
    -         if (!xe_gt_is_main_type(GT))
    -                 continue;
              ...
      }

    @@
    identifier GT, XE, ID;
    iterator name for_each_gt, for_each_gt_with_type;
    @@
    - for_each_gt(GT, XE, ID) {
    + for_each_gt_with_type(GT, XE, ID, BIT(XE_GT_TYPE_MEDIA)) {
    -         if (xe_gt_is_media_type(GT))
    -                 continue;
              ...
      }

No functional change expected.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c             | 5 +----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3462645ca13c79b9cfed0de86cfffe150b51942a..e77a3a3db73dbf8509d857b58a2dc3964d9aa0ca 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1074,10 +1074,7 @@ static void tdf_request_sync(struct xe_device *xe)
 	struct xe_gt *gt;
 	u8 id;
 
-	for_each_gt(gt, xe, id) {
-		if (xe_gt_is_media_type(gt))
-			continue;
-
+	for_each_gt_with_type(gt, xe, id, BIT(XE_GT_TYPE_MAIN)) {
 		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 		if (!fw_ref.domains)
 			return;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index b867203b49977537a31c1a1780c0409d5541c83d..2f376b5fb08827d81a070735c4b4a35338723552 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1579,10 +1579,7 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 			goto fail;
 
 		offset = 0;
-		for_each_gt(gt, xe, gtid) {
-			if (xe_gt_is_media_type(gt))
-				continue;
-
+		for_each_gt_with_type(gt, xe, gtid, BIT(XE_GT_TYPE_MAIN)) {
 			config = pf_pick_vf_config(gt, vfid);
 			bo = config->lmem_obj;
 			if (!bo)

-- 
2.53.0

