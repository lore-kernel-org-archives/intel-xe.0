Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D336C48BF6
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 09:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E21510E5CC;
	Wed, 21 Feb 2024 09:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="VWDvjDN/";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA35E10E5CC
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 09:56:35 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1708509378; bh=WiYuIUx209PW7tbvFonxSXNMT8x+kfcR0GWinawhwS0=;
 h=From:To:Cc:Subject:Date:From;
 b=VWDvjDN/H2VD8dcL4ReBkxEgSKNVDqDZyYOslv2QuNxYwD0MJlZXcbu6POoYXpuDB
 36qfKmjKaqx9nM8bJ/B/mYyUfYKeOqk3yvVQha2/PZcCEKQrXRpS9Hx/39LayvH7qd
 8tw5iT86xL8m2R8mh/LfywiaRpPoychOwDW6nDnNdZBpd5in4RB3mCHGAIRwcUPHOE
 OMoko4m3PHWufdkZ1N4rYk5gEpLMbZHwyvMfTO/61y4peveCwV7M5VGeactXkJkuZi
 OvbFsuq7rotN7MJH6fUZlUtZ9vVBsrMX+V0v5ch+YfarHp0tomyzLc0DNbHYnD/135
 NnF3DVYRk6mXA==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 41L9uC051635665
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 21 Feb 2024 11:56:12 +0200
Received: (from dhirschfeld@localhost)
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id
 41L9uCSh1635664; Wed, 21 Feb 2024 11:56:12 +0200
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: ogabbay@kernel.org, obitton@habana.ai, lucas.demarchi@intel.com,
 Dafna Hirschfeld <dhirschfeld@habana.ai>
Subject: [PATCH v2] drm/xe: replace 'grouped target' in Makefile with pattern
 rule
Date: Wed, 21 Feb 2024 11:55:56 +0200
Message-Id: <20240221095556.1635644-1-dhirschfeld@habana.ai>
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
v2 changes: instead of removing 'grouped target' we replace it with pattern-rule
here is v1: https://lore.kernel.org/intel-xe/20240219135845.1463992-1-dhirschfeld@habana.ai/

 drivers/gpu/drm/xe/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c531210695db..64903841fbd4 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -42,7 +42,7 @@ generated_oob := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
 quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
       cmd_wa_oob = mkdir -p $(@D); $^ $(generated_oob)
 
-$(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
+$(obj)/generated/%.c $(obj)/generated/%.h:  $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
 uses_generated_oob := \
-- 
2.34.1

