Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A097C54798
	for <intel-xe@archiver.kernel.org>; Sat,  2 Mar 2024 15:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA74D10F06C;
	Sat,  2 Mar 2024 15:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="Je1FuYJL";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71F510F06C
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Mar 2024 15:40:10 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1709393989; bh=/apcQ4OfYeoYQ/y1Y1RcGK8rScS87R5a9/Db3xbe8yM=;
 h=From:To:Cc:Subject:Date:From;
 b=Je1FuYJLLzPXXatfNWtLUmqTCBMENFTBDfxkN7MshR9RUthAe8h3YAJAD34Yp9xw4
 rxrql39eYUVvpeKoKsK8zsz3W1YOcULoPYMBU6VbvZc2NkrWxIhGZ3iGUNgOmQwsnb
 craU2kg/pMOERHXR9SbnECl0GY7+Oo+REy+8LLu9KGM4PdSRdm1vQ2mzKGCOIsppcP
 MYHJnZtrQ8CjSnfvGitBNf23HdfHj//oFPhc0SGztPeNtq8+dXr4Zd67YjVHK/6t2J
 0lbVeFTMesRMcvTeY1q0q6oIWz9apVQ/2JRveYeSIKURgOcPwe/m5nP5QUxQewfY5F
 XOxte1VYr+L6w==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 422Fdj7d2602263
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 2 Mar 2024 17:39:45 +0200
Received: (from dhirschfeld@localhost)
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id
 422FdjW52602262; Sat, 2 Mar 2024 17:39:45 +0200
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: ogabbay@kernel.org, obitton@habana.ai, lucas.demarchi@intel.com,
 Dafna Hirschfeld <dhirschfeld@habana.ai>
Subject: [PATCH v3] replace 'grouped target' in Makefile with pattern rule
Date: Sat,  2 Mar 2024 17:39:28 +0200
Message-Id: <20240302153927.2602241-1-dhirschfeld@habana.ai>
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

Since 'grouped target' is used only in 'make' 4.3, it should
be avoided. Replace it with 'multi-target pattern rule' which
has the same behavior.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
---
 drivers/gpu/drm/xe/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1a59c15f4d66..5a428ca00f10 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -42,7 +42,8 @@ generated_oob := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
 quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
       cmd_wa_oob = mkdir -p $(@D); $^ $(generated_oob)
 
-$(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
+$(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
+		 $(srctree)/$(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
 uses_generated_oob := \
-- 
2.34.1

