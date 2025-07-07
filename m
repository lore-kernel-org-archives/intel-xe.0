Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39C4C83030
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 20:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7732710E39B;
	Mon,  7 Jul 2025 20:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NetFmC6y";
	dkim-atps=neutral
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5CB10E06F
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 20:39:45 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-31332cff2d5so3320780a91.1
 for <intel-xe@lists.freedesktop.org>; Mon, 07 Jul 2025 13:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1751920784; x=1752525584;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mwMbCxduJvQpuL8tDph9hciu7NlgSqkUI8OIMy21Nb4=;
 b=NetFmC6yDeEaL7sjRXZzsY9jX6dSbxDssTlZL9c2Iq0En+B1Pup14BLUUtULwTO+fX
 mUfPA9IRFBjxKKG7xysyhG9zu8Nz2DMGkOTZivHOfzoLEPcI4h/bunUKMTwoxbynB1/I
 KDYBw822RcKGD3qw46RGtpm/5+exiRaRISu/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751920784; x=1752525584;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mwMbCxduJvQpuL8tDph9hciu7NlgSqkUI8OIMy21Nb4=;
 b=Ek2boEEZ7zbjXDrq3gqcaNZUTqMpZBcNv47zTzdXeP8MBJsQEZwdKpseiuIpKx0kJ1
 vzy4hxd463hDy6uM9iAtE9hL1b+D9KVWm4f/mwhyDWrVN6mX9BE1dib9gBNoEK+ezjbS
 BquBK1KGmLlepz9sTb/x+3s9ns1E2w54biJwXKhR5lSjSy6COZqCkpoNx0msDKcDAn6D
 m6m/cZmCMt9DvJuYlB7TGzvcUunF1nQJaXagcqxpcHzAZCr5I9zOSihEYuk9jlMuUIBT
 WeTwCZZ0GqalrfYcP97+haHTw7z8fl2cAwrIfZLFqd3yIUeErjgoEuCC8o+5HShylyCf
 8j0w==
X-Gm-Message-State: AOJu0Yz9sZnKsbW9I7QvKWYufLV1XX0j+ycFPKZvsTmIYCCg+kQogMqe
 zWJ94AEQ+U8998qrU9UIaBN9LWV7MUDbvWA+Zkhhhh4mIJsVWBwv2Js9ZoE5gpNs8xEvtrANISq
 TpI8M6A==
X-Gm-Gg: ASbGncua2wdTE5mmWo0TAcF/o+aFCSXAIBcPejnK+ElppUiF2n/YL2rEmiKndoMCDnF
 oaIKpt12ix9BU8onPDZ/gXqFPmRC4bLYuKUb0vHbu3WB+w8E/WGFODH56H+xtLuZLM/x3OHEICY
 pa+qLF7YobPg9NiGMiNA3N0ljHIeYQjIjyGb3/WHdaTeWtXLyRF+TY6fETgo9Fueew7bCZ68FkL
 Z6FIu1iTYsmh8JFATkuZUdG179zwKCc6ZuBJRzhbAVm5V1L57zbyq4uUsRuavIBKBX4vYkR6nbw
 8bXKRISjcmjgPZ7t06gU3e2S9Zpq+UvGfd7lSEJQ4mu2ApcN1OQsfufjArNvDsKP/E5DDuUn539
 tIj5nQKNSX077MUgbfQtfPdTXImteNRc7ST2W55Z4RL7oiv14Xn7E2LtAdgxjQPTS
X-Google-Smtp-Source: AGHT+IFjOIQs/VTfDtGbkb7vjR/A1TXOHwx3oFJa5olA1Z+oTpANUdhXg2mxAhVYP0zlSKax/DiqKg==
X-Received: by 2002:a17:90b:1b4f:b0:2fa:157e:c790 with SMTP id
 98e67ed59e1d1-31c21c92d88mr483856a91.5.1751920784393; 
 Mon, 07 Jul 2025 13:39:44 -0700 (PDT)
Received: from justonli3.c.googlers.com.com
 (206.138.168.34.bc.googleusercontent.com. [34.168.138.206])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c21eddf04sm171912a91.45.2025.07.07.13.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 13:39:43 -0700 (PDT)
From: Juston Li <justonli@chromium.org>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Yiwei Zhang <zzyiwei@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Juston Li <justonli@chromium.org>
Subject: [PATCH v5 1/2] gpu/trace: make TRACE_GPU_MEM configurable
Date: Mon,  7 Jul 2025 13:38:22 -0700
Message-ID: <20250707203849.545312-1-justonli@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
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

Move the source to a better place in Device Drivers -> Graphics support
now that its configurable.

v4:
 - Move source location (Tvrtko)

v3:
 - Patch introduced to replace per-driver config (Lucas)

Signed-off-by: Juston Li <justonli@chromium.org>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/Kconfig           |  2 --
 drivers/gpu/trace/Kconfig | 11 ++++++++++-
 drivers/video/Kconfig     |  1 +
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/Kconfig b/drivers/Kconfig
index 7c556c5ac4fdd..c5edbd2288a19 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -209,8 +209,6 @@ source "drivers/thunderbolt/Kconfig"
 
 source "drivers/android/Kconfig"
 
-source "drivers/gpu/trace/Kconfig"
-
 source "drivers/nvdimm/Kconfig"
 
 source "drivers/dax/Kconfig"
diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
index c24e9edd022e6..cd3d19c4a201c 100644
--- a/drivers/gpu/trace/Kconfig
+++ b/drivers/gpu/trace/Kconfig
@@ -1,4 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 config TRACE_GPU_MEM
-	bool
+	bool "Enable GPU memory usage tracepoints"
+	default n
+	help
+	  Choose this option to enable tracepoints for tracking
+	  global and per-process GPU memory usage. Intended for
+	  performance profiling and required for Android.
+
+	  Tracepoint availability varies by GPU driver.
+
+	  If in doubt, say "N".
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 5df981920a945..96adceab2df00 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -70,5 +70,6 @@ if FB_CORE || SGI_NEWPORT_CONSOLE
 
 endif
 
+source "drivers/gpu/trace/Kconfig"
 
 endmenu
-- 
2.50.0.727.gbf7dc18ff4-goog

