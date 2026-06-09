Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFBCCD98C6
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 14:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425AA10E9F3;
	Wed, 10 Jun 2026 14:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W/07LLuU";
	dkim-atps=neutral
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A716F10E508
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 16:21:04 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-36baeec21dcso3691257a91.3
 for <intel-xe@lists.freedesktop.org>; Tue, 09 Jun 2026 09:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781022064; x=1781626864; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W/o6xoNweapTrriRmAST3RoLSBcjrFwLozoiHNOF/xU=;
 b=W/07LLuUTQThFQC97nZNMVNus22JlroYxR94EVkPcPapK5WsTudPUSSGzh5EcqAv4o
 kQK+zWNNqWpQxYLXK+6NVR5bGC8pwI3OzSWl8bzFn3dPA+C74Q20ApRccp61VGla/Jua
 EUiEBBE4zZOGydC/kxsR5/2Rr9xSQ5QUnFTFLpcIMSjVaczZIkPlkB0yqzlDtbvEScOM
 Z0kA97x5iUEYvxsk2KmttrAv8HTd8PN2SwfHDlBIkLpwIRKE5eNdK4xpg58G1N+4Lddh
 oh3aWxtH1Vr11tNWfx160TDr+YawcZ/1XNtcnj036ccVYWyV0jX64ewSc+yNBpdnoXN6
 PJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781022064; x=1781626864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/o6xoNweapTrriRmAST3RoLSBcjrFwLozoiHNOF/xU=;
 b=fvdSFupbLUyy34kgUXQp4ko3BmwxemTbjAdxhO9/jk2WC6u2KfraZLz5ErRHSg+QHK
 a2MRRcXl56ZLuqCpznmMyzcWAsYQ1GNiT/tEteuzzFdzeCieflz1TLk5YBPj+U0pyMsw
 kgHbF7vMhY/OXrX2lL3P21buC99sMJJAScLxjTQ0B5iGYo4FcLXht3tbU4ZtFwulEcuT
 aZayuI+Co21+PDKTH6beEaK6qyAgfW9jTq3wGtftWTlFF8cirv/yrPFwFon5POjp2QDn
 Ux8BRE8Zr0rHRg3DFl318P5SRfL7ZUHPAD44nnm+jV2pauRGL2w0gRoYb4spW9xxe/6U
 HycA==
X-Gm-Message-State: AOJu0Yxy6IqO0Zv7H3gw0vqSJN2xFTs+fmwcNc9v8lEYgHAUeaaNMhx1
 wKlxD/jwR2/6VVp+F7/JdCM3g4pAGS3f1QuGJW17sE0kO809Kbfifcyk
X-Gm-Gg: Acq92OGbOEgTv2X0hHj6XAoNzMeNXmGl63yVpoRwVL2Nq7v5cmOBeaNq4lK5DKsDPIl
 aRICX++aK9DoqItEIsZIY7YwogHCeKTgI2e5/2GslfbT6o2t9gI1zyRE7f8DQ3Op6NUZfSle323
 XK3kOdFCY3oZZpk0HtEgMCG8QkXNxCDDkbfZPjqaQVTH9Y8WFBwqKpICWSCV0h5cx+aSDHXyFLe
 KAJwBwi5DcdWYLfbjU8DEIAnMY4qFlfabQtZ2wUVSPqCA21zaP2OEXVe0w/6cob3Ed+Z3m5be33
 xCYZbesXsM7ZGGvIyAIj0YTVIqBhBmvmUO2S8D0tYJIjokdTRzybBoBtC1z+e6z1KTwwv1JlUXL
 uaq7Hdc95nIczeAN/dOjnB24Y7BedBh6htTIx/z3rW2uTNRRTGSGibMOtr1I1Qpx7bYaIHs/ZP4
 gRoJWk+wClwwMcT01TtBf+1IbBX28YHJ7W+iM8REdxM7XMc2cSYd+I7mD6COXjryxU
X-Received: by 2002:a17:90b:57c4:b0:369:a9e8:dbf5 with SMTP id
 98e67ed59e1d1-370ee643748mr22119245a91.3.1781022064062; 
 Tue, 09 Jun 2026 09:21:04 -0700 (PDT)
Received: from haichao.tail057a43.ts.net
 ([2001:da8:e000:1206:37c9:44fa:729b:6aaa])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36f6bf830b2sm18366170a91.4.2026.06.09.09.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 09:21:03 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] drm/xe: keep process name fallback for diagnostics
Date: Wed, 10 Jun 2026 00:20:57 +0800
Message-ID: <20260609162057.5-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 10 Jun 2026 14:42:31 +0000
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

xe_file_open() stores task->comm in xef->process_name with kstrdup(),
but this diagnostic string is optional and the file open continues if
the allocation fails.

The timeout and devcoredump paths initialize process_name to the safe
"no process" fallback, then overwrite it whenever q->vm->xef exists. If
the kstrdup() failed, the fallback is replaced with NULL and the NULL
pointer is passed to string handling in diagnostic paths.

Keep the fallback process name unless xef->process_name was actually
allocated. Still report the stored pid when the xe file is available.

Fixes: 8af13c3fc125 ("drm/xe: Store process name and pid in xe file")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 3 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 11e60d6..fbe1fba 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -343,7 +343,8 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	ss->boot_time = ktime_get_boottime();
 
 	if (q->vm && q->vm->xef) {
-		process_name = q->vm->xef->process_name;
+		if (q->vm->xef->process_name)
+			process_name = q->vm->xef->process_name;
 		ss->pid = q->vm->xef->pid;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 2ac87ff..0892400 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1189,7 +1189,8 @@ trigger_reset:
 	}
 
 	if (q->vm && q->vm->xef) {
-		process_name = q->vm->xef->process_name;
+		if (q->vm->xef->process_name)
+			process_name = q->vm->xef->process_name;
 		pid = q->vm->xef->pid;
 	}
 
-- 
2.51.0

