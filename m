Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDF1C48BC3
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 14:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14E910E384;
	Mon, 19 Feb 2024 14:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="bXv1I6DM";
	dkim-atps=neutral
X-Greylist: delayed 660 seconds by postgrey-1.36 at gabe;
 Mon, 19 Feb 2024 14:10:12 UTC
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA1B10E364
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Feb 2024 14:10:12 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1708351134; bh=5lKyhQAhpO31FFf8jOueBwueIOazJ8sWq2sSRcB522c=;
 h=From:To:Cc:Subject:Date:From;
 b=bXv1I6DMdb5KUsbKjo7NUk1/PzQd5GqwAwx5b0Msq/ybmo8okBGsR7faOydWr9gyv
 44n6U4ECR1CI0yW9Blm2gDjl5HyZ9tIdC50uryW0VLbpjIyXbboexh3UfZceXFD34D
 +/HDbnkU3F9wj0z3EqVXjuOF/p8VW5RmKvLSgDglWsuTYddQbtOzsCVo2ZO+xkkvIs
 mzcu9q1bdlh7wQJ6hIofXHP0uC197XH7yzXoCevp0VpPF2GJhVQmWoHhWhHLNppbvY
 H9OuHOHRfW84VrOf+EayDV96Qf2eoVvbxBi5zHOlbTS6p9CmhGnJLrp333baTNNjAP
 tiqg3EQ4MCBiw==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 41JDwmVN1464006
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 19 Feb 2024 15:58:48 +0200
Received: (from dhirschfeld@localhost)
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id
 41JDwmid1464005; Mon, 19 Feb 2024 15:58:48 +0200
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: ogabbay@kernel.org, obitton@habana.ai,
 Dafna Hirschfeld <dhirschfeld@habana.ai>
Subject: [PATCH] drm/xe: avoid using 'grouped targets' in Makefile
Date: Mon, 19 Feb 2024 15:58:45 +0200
Message-Id: <20240219135845.1463992-1-dhirschfeld@habana.ai>
X-Mailer: git-send-email 2.34.1
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

The feature 'grouped target' ('&:') in makefiles is only added in 'make'
version 4.3. This cause problems in older version of 'make'.
(Specifically $(@D) is wrongly interpreted - it creates 'generated' dir
in the source path instead of the build path).
Avoid this feature.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
---
 drivers/gpu/drm/xe/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c531210695db..d2c79d3ada67 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -42,7 +42,7 @@ generated_oob := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
 quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
       cmd_wa_oob = mkdir -p $(@D); $^ $(generated_oob)
 
-$(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
+$(generated_oob): $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
 uses_generated_oob := \
-- 
2.34.1

