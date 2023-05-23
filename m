Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B02FC7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 13:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCB410E441;
	Tue, 23 May 2023 13:51:12 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A1910E441
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 13:51:10 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so2235024e87.2
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hardline-pl.20221208.gappssmtp.com; s=20221208; t=1684849869; x=1687441869; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=021EnGz6At3dw2RiZUki17hEYDp3CkxmTTA+gvPmfxs=;
 b=FRl+lFGRDP5MAZNQs4i0JVuD1DG+kGjRElu43eFAvLN+XLzQ71+QP1uyevg7ZZcnVc
 oFy1Qmupo7fA8CK/6JHGSNfozMioQYk4q4fR0/JsrT+e/Za1abFMnsj8I/LvY/AyaqzS
 VR5lyBoCyHRVOMco2NaWs/VHoIDC9ga0pOYSw+l6QwghbA5p/S5HlrBqdDSM2ZfHHv2v
 QpttW7fXb515/Rh5ZdHG3Ne4I3mo3hXA3lnqtN/jYcXbc6eBoIiRkbf6htVcW1q4Fueg
 ZpI3wWca7Nr4sPxjTE4elyUdXJLXd0sJVx3WMszireX7yq/26XHdUmerRsdsoJHIx44V
 dciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684849869; x=1687441869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=021EnGz6At3dw2RiZUki17hEYDp3CkxmTTA+gvPmfxs=;
 b=CnZJVxxD10/ERkpWDQlhD0y921xHTTohg0T300/vD/YqI/nHGCYQnJ2K0MvxK+Cwdf
 C8UyXfnZGUvHomcqxiyEHLRNlHZs7jsusJNEeo4++Vc6GaOY2W8JUtNQi55cD4ThbPum
 Iak9ZwMnWOGojeSXPcGmUI8YHG83Qv6Gd7bqNQUcX/Hc0AwCRhrSBv6IGElm44SWvS+w
 u8If77ab8oyUPND7Xpgb+yfC3PffM7rOlMDkqMJC9JCAOY1IrmxpbI8ghAZS+5YQ6wzb
 668ouayXrrhPQZwYkEC/a6ri4nVEU8P1FKkGsdv5tF/dbTcJmePPRShEI1dp8Iqct0Zg
 VX3g==
X-Gm-Message-State: AC+VfDzl31VUWfa6EdEYBXboQ6U3gLdusJOzKgCwquBngw7g9xk5EXHq
 008MFhhDGj7+JRYTurVPjme8TZXnMmJnxg2/49s=
X-Google-Smtp-Source: ACHHUZ7JjPA3OfLl2VemZCJwthPSOH+ezOmDbyJgN41hmPuYOJvACP0H0DZ4o+vsJESa74otZA0+WQ==
X-Received: by 2002:a19:ee01:0:b0:4f3:79af:fcb7 with SMTP id
 g1-20020a19ee01000000b004f379affcb7mr4751663lfb.26.1684849868634; 
 Tue, 23 May 2023 06:51:08 -0700 (PDT)
Received: from localhost (83.8.55.66.ipv4.supernova.orange.pl. [83.8.55.66])
 by smtp.gmail.com with ESMTPSA id
 8-20020ac24828000000b004f26aabbd6asm1347102lft.130.2023.05.23.06.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 06:51:08 -0700 (PDT)
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal@hardline.pl>
To: intel-xe@lists.freedesktop.org
Date: Tue, 23 May 2023 15:50:20 +0200
Message-Id: <20230523135020.345596-2-michal@hardline.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523135020.345596-1-michal@hardline.pl>
References: <20230523135020.345596-1-michal@hardline.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Fix check for platform without
 geometry pipeline
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Michał Winiarski <michal.winiarski@intel.com>

It's not possible for the condition checking if we're running on
platform without geometry pipeline to ever be true, since
gt->fuse_topo.g_dss_mask is an array.

It also breaks the build:
../drivers/gpu/drm/xe/xe_rtp.c:183:50: error: address of array 'gt->fuse_topo.g_dss_mask' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 5 +++++
 drivers/gpu/drm/xe/xe_gt_topology.h | 2 ++
 drivers/gpu/drm/xe/xe_rtp.c         | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 7c3e347e4d74..d4bbd0a835c2 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -128,6 +128,11 @@ xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum)
 	return find_next_bit(mask, XE_MAX_DSS_FUSE_BITS, groupnum * groupsize);
 }
 
+bool xe_dss_mask_empty(const xe_dss_mask_t mask)
+{
+	return bitmap_empty(mask, XE_MAX_DSS_FUSE_BITS);
+}
+
 /**
  * xe_gt_topology_has_dss_in_quadrant - check fusing of DSS in GT quadrant
  * @gt: GT to check
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
index 5f35deed9128..d1b54fb52ea6 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -17,6 +17,8 @@ void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
 unsigned int
 xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
 
+bool xe_dss_mask_empty(const xe_dss_mask_t mask);
+
 bool
 xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
 
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 86fd1025b931..86427edd3bfb 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -180,7 +180,7 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 	unsigned int dss_per_gslice = 4;
 	unsigned int dss;
 
-	if (drm_WARN(&gt_to_xe(gt)->drm, !gt->fuse_topo.g_dss_mask,
+	if (drm_WARN(&gt_to_xe(gt)->drm, xe_dss_mask_empty(gt->fuse_topo.g_dss_mask),
 		     "Checking gslice for platform without geometry pipeline\n"))
 		return false;
 
-- 
2.40.1

