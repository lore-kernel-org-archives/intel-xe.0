Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF19C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 22:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9EC10E126;
	Tue,  3 Jun 2025 22:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IFBHVtDf";
	dkim-atps=neutral
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6542710E126
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 22:51:48 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2347012f81fso76496465ad.2
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Jun 2025 15:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1748991108; x=1749595908;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0gJ7JY1EkW7vzQ7yl4ShfN9IWzhP2LQP72RJoFIeBZY=;
 b=IFBHVtDf0V0cFL0eOrTD5xidBUqFCjrz615QBY7IA9wKFukKLi/s4QyG9x5fWmgRJ6
 usr9YQXIo3w6vqs8al7X5MMV31gWINF9KbknUenFjlKOlyiWEcink17PUyr5BB16a1M7
 e3SWeAP7CjfIZWPBglrs38DKG3r7nPQTK1uBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748991108; x=1749595908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0gJ7JY1EkW7vzQ7yl4ShfN9IWzhP2LQP72RJoFIeBZY=;
 b=T9n0souNkdTPO7PElM9RciDmnDAnmCA3ePytokj/o/raehs3aYQ8Ywd34dSu4ulsEm
 KLxpo6vw/jtkJP+zQtgtuKA4T+Paxes3BXC17Z7DOmV1DoS9lyiUerYnmkOLUCeyiIDj
 GlxBM0qxgDRfmzyef7OQcLejZwV62zJqRTr6Ibl8wbaqfLMCRoIX+LJce4oIQFavgTOn
 irU8pjzQ6XT8r5ZFm/zS8s3lWjvuaoqQo4SaFXqFjmalBKQyCsEQWxNSIVpC5jY/BUGn
 B312VlIkaPuB+nu63wwPrvEEbTlEFqunBxImSANj2Fa7mi+bI5OzuNZ05sK18f8oeth7
 SVfA==
X-Gm-Message-State: AOJu0YziHXqF+g8rKoKubq0QyGdaqKzqJTOArhqWWrLhWIG98TrCbN1m
 ieQSn1XoL06hCdbWqd2v9b87jLbDU+rLFr0q6zZTtpjxMg/PKZp0I6FWx8pAycEgfmUml0ZHKQN
 9GRo=
X-Gm-Gg: ASbGncsTgsSK0QAE+msD5lV/VulWIIm8lICM7UkLojxB82bxeQK+I8KXTBEzMx7I5e+
 y4cGfXpwlPl2uzZqsbs0m0K/Do8K9a9FRW8+DfTKQVbeusRGrUEoCTW3umQVk1Eaq2uCogJmqRO
 /1BkOrK5BrI+BZgIe34UTugdvmfuCZd6aQot+vEO8QXtgDrpfEKRX49A78lB+l83qNv4vwHidV1
 DY99s+gK+xmoiOo95kKIL/Y7oUt6xN4dTAa4onE+4EdbajZAYZHDT+nnuXITBvQsrjpJbJo5K3B
 ZPSmZAiB6RFRl/+Z0Hn615p4QsUa/E4W8tEyM00kGT9w2A4j0nI5T8KIH83eBwuocEvy/01Snpk
 EMC+c2NXoO+tN1su8S58y7WnahcsTb5+ZeclQZANp
X-Google-Smtp-Source: AGHT+IH4KC1KJBjNWaXUmbk8Aa4L/R0c3HrEm5SIM98g9zp54fpdSzRr3AdhlZHZaehucukEo91Dbw==
X-Received: by 2002:a17:903:1245:b0:234:9fea:ec5f with SMTP id
 d9443c01a7336-235e11291e8mr7039745ad.1.1748991108024; 
 Tue, 03 Jun 2025 15:51:48 -0700 (PDT)
Received: from justonli3.c.googlers.com.com
 (11.103.168.34.bc.googleusercontent.com. [34.168.103.11])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e29fcecsm7723706a91.4.2025.06.03.15.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 15:51:47 -0700 (PDT)
From: Juston Li <justonli@chromium.org>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Yiwei Zhang <zzyiwei@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Juston Li <justonli@chromium.org>
Subject: [PATCH v3 1/2] gpu/trace: make TRACE_GPU_MEM configurable
Date: Tue,  3 Jun 2025 15:50:06 -0700
Message-ID: <20250603225123.2535767-1-justonli@chromium.org>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
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

v3:
 - Patch introduced to replace per-driver config (Lucas)

Signed-off-by: Juston Li <justonli@chromium.org>
---
 drivers/gpu/trace/Kconfig | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

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
-- 
2.49.0.1204.g71687c7c1d-goog

