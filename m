Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81C1CD98E2
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 12:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A0410E3E8;
	Mon, 15 Jun 2026 12:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kp58wPgl";
	dkim-atps=neutral
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com
 [74.125.82.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5278010E0AE
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Jun 2026 23:39:21 +0000 (UTC)
Received: by mail-dy1-f194.google.com with SMTP id
 5a478bee46e88-307631dbfedso4771073eec.0
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Jun 2026 16:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781393960; x=1781998760; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S3IGYtRAOjokZ2Tfpw10/wbISXUnINIpuDnnOueQf1E=;
 b=Kp58wPgl5A/OKRIDLwcJ4N7kYSwEdVj73YYRqDaUbTvoshOM1/d4zBtROYVLPOQMvz
 o+8aoiRzOJ/rcQ3Nyi2R0GlPAHY4FAQOdocr8lJ4YTXIUj/er4ZRKpNBxdOraaOdw/Nf
 8kvHoR5fahDrk04JnfxGwNUgtHBexcJNy3xjL0omBvgqwmM/LYgw/P1xqx1Fakz+Lp3M
 DEtHbrmbSMgb+jkWIhoWBnJlOFUCT8Rpel5amqkbhYtCfzljxkScdbtOqTIB/0TF4GNc
 7CGLwSRzhp8DBihV2TnIy4FpmQ647lDqVGD24xjv0GN5lnZFcxE7gPnp7wyeP8y2JeCd
 i9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781393960; x=1781998760;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S3IGYtRAOjokZ2Tfpw10/wbISXUnINIpuDnnOueQf1E=;
 b=cydvfB65tJJRgBbkEvUIn6odivJcMaIXM8Mg6DHbUWuVm2XSyylmW/4lWRliAEpjnu
 T3n9f7txtMSxqdpxwcX0dd++3Vj6Lr2GuG8vOWDmtxJeNBgcFeMW2hFPuvKNKCYJbRgk
 TFcdZUGTB8XNTvjlmEdfBBEloDFhUOFW2LXTs5zSVKkwZqdSDBnF/DtF7WwMpTV6fu/j
 Y/T2H+0g7zkz5suOnWmLshpuND/trXiYCl1XCg+8ue5MpHuayekHbEtwFcMh83X4bmdg
 cSTS5qwe7jkV70EB8uavq4t2Pysz61/Re57INaFM9dN2SU/7+xdupJTr86+2iHnfXpU0
 42Hg==
X-Gm-Message-State: AOJu0YyLyXgBwTrUgcFKn6dF79wv2Cf8M6LSCewAzP55KwbeOQAdzrX9
 mKCi9nxmjEVLKzb+ijukYPaLNBH/a2dc77fS6jEFNSQbaDaB0rx0FHE14Vao4idS
X-Gm-Gg: Acq92OEPnu4arkBs8fE0MwKc+xzNmRpthpRnh0UwCl6YQBBwv4K6pVLPFNqWvgwAVGT
 SRHGZ5TId7Oj23QkQ83iF3qYQllkPY1To+a0yzeDNqQvTPYHjQFHNLI2KcZdpWe8N421u6jOYqS
 VaiCORZ9fLT45PObqRCg059T4E0ppPegok/LPXJFhCSFBjpuumXu198YXBGkHili0KkFSgv+JP2
 mm9hF6f3rU+WF88UAaBkP/xZtQj/k5SjslkGsuBvIMV0guvJZeTSkCTrfzLYprlFNN5HATpIyHa
 oOkXqKWU0yUBBOuAfZoxjilX3f226EvTcgqZsLdO5nYrqp4P0Rj/ZcrZs1K/h06wPe4Z7vkA68z
 g4urQOsO9Jj5yzJQIUeB/nnnaaa8EONtgLABe/ZRgQo60Agw0ubfzcducOILpOzB4XanvfQn/sd
 04epSuS0RKy8VO95+QU/okGF/gehELCvVWwTw6gutl+t3n0Ya88uu5wt6idAxB0zx6tkyB7Yu9p
 kt7vENUcUErRkqQa1Oh9NlqjoFPBw2LOlNb4ngi6vaQhy5RvQjxCNkIzIS+yt7U3blAdFxkoiHP
 LLKDWUEWvKY3+XeGug==
X-Received: by 2002:a05:7300:b54b:b0:304:de28:1b16 with SMTP id
 5a478bee46e88-308200a60b5mr5164144eec.28.1781393960271; 
 Sat, 13 Jun 2026 16:39:20 -0700 (PDT)
Received: from ethan-latitude5420..
 (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3081ea4fe55sm9194414eec.25.2026.06.13.16.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 16:39:19 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/xe/pf: remove code guarded by nonexistent config option
Date: Sat, 13 Jun 2026 16:39:14 -0700
Message-ID: <20260613233915.162661-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Jun 2026 12:53:57 +0000
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

Some code in drivers/gpu/drm/xe/xe_lmtt_2l.c depends on
CONFIG_DRM_XE_LMTT_2L_128GB, which has never been defined in the
kernel. Remove this dead code and correct a related comment.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/gpu/drm/xe/xe_lmtt_2l.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt_2l.c b/drivers/gpu/drm/xe/xe_lmtt_2l.c
index 84bc5c4212b5..707e0d090c62 100644
--- a/drivers/gpu/drm/xe/xe_lmtt_2l.c
+++ b/drivers/gpu/drm/xe/xe_lmtt_2l.c
@@ -14,9 +14,9 @@
 /**
  * DOC: Two-Level LMTT Structure
  *
- * LMHAW (Local Memory Host Address Width) is 37 bit (128GB)
+ * LMHAW (Local Memory Host Address Width) is 35 bit (32GB)
  *
- * LMGAW (Local Memory Guest Address Width) is 37 bit (128GB)
+ * LMGAW (Local Memory Guest Address Width) is 35 bit (32GB)
  *
  * The following figure illustrates the structure and function of the 2L LMTT::
  *
@@ -54,11 +54,7 @@
 typedef u32 lmtt_2l_pde_t;
 typedef u32 lmtt_2l_pte_t;
 
-#if IS_ENABLED(CONFIG_DRM_XE_LMTT_2L_128GB)
-#define LMTT_2L_HAW			37 /* 128 GiB */
-#else
 #define LMTT_2L_HAW			35 /* 32 GiB */
-#endif
 
 #define LMTT_2L_PDE_MAX_NUM		64 /* SRIOV with PF and 63 VFs, index 0 (PF) is unused */
 #define LMTT_2L_PDE_LMTT_PTR		GENMASK(LMTT_2L_HAW - 13, 4)
@@ -79,7 +75,6 @@ static unsigned int lmtt_2l_pte_num(unsigned int level)
 	case 1:
 		return LMTT_2L_PDE_MAX_NUM;
 	case 0:
-		BUILD_BUG_ON(LMTT_2L_HAW == 37 && LMTT_2L_PTE_MAX_NUM != SZ_64K);
 		BUILD_BUG_ON(LMTT_2L_HAW == 35 && LMTT_2L_PTE_MAX_NUM != SZ_16K);
 		return LMTT_2L_PTE_MAX_NUM;
 	default:
-- 
2.43.0

