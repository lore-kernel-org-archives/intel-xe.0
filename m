Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179D4D41D55
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 15:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEAA10E6CB;
	Thu, 11 Dec 2025 15:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nd6JIE83";
	dkim-atps=neutral
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553AE10E1AE
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 04:19:16 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7bb710d1d1dso8211673b3a.1
 for <intel-xe@lists.freedesktop.org>; Mon, 08 Dec 2025 20:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765253956; x=1765858756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uL3PBPq7RkNTAScaowDd6fA2ENpQo9+KapbIhKmLuW4=;
 b=Nd6JIE83xMsCywYPvRflpavZHzBsKfhtv4/0uP4T9u0UM/+lIuITKS39FLPtyN5x/t
 Ey9pzdvRLRAvfZMqRydCBPCxue9UR3D7L84JK5ubIHkP9b5256MZiJXMPcA2VG0J197e
 /m0l+Z1BffUqMTR3Nh/YzjRMMnbaIBPAWqkUErr7Uff4QU7BKqKMfg2sJ6o4H6euwPKW
 9btUDqaYlsMAfw2jq/sZotdcDcjj2VmudAgvQxinPRoGITNTEAU3Oq7HIWxFvU7GCLlt
 M+xKIxuibQm5A8U1dvukaUYiOkhPbAPbAVoDkVxJNf4yZAUvGdekV41fwQlAtUBGQ2gC
 k4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765253956; x=1765858756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uL3PBPq7RkNTAScaowDd6fA2ENpQo9+KapbIhKmLuW4=;
 b=nKCoAusQUNFHYs6jhjmLNrzgYu5/qbqiTa+yr8OghouJuzYor/uzRzl/8dMdPGTkEi
 OM5W+JMv75O4V87YLlWdoJ77opQWTdM/2oL0WCIIZ76aJL11heuCLQT2sQnewNS9d7O1
 +J5FCKnqJf232AisXUbjWvNHtyQ/eBCRIeBlZIGrkOT5JQYgXoUBFZ4H8ovNy6Wwx/r6
 fyCdQFJZ3nMTKniyjDPn3GU94ch87oQtRZwSAy4VkPyYzhuxIxzCc11e6wtMHMqSJTOJ
 NIxF798bqPW3KljtEavvOptTPs3yZHUC9pimZGYo5l2Ca9qeIG72tM5MoKektTQE1wOD
 9zJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOREU3ngKAiSm9TTg4PxfyPSz9F/JbPq/a7Dglz+TGKH7gg7WU9xLtXTf8a7H1J5M18pddInUbRg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJcuEx21qLAUYY0JgYXgoNLLFqTU+UqiS9S8qB5SDAkTXtcKBW
 2FYN8Pmz4za7rLzfFbSVI1TADRWdTSWpfFXhQ6hUjTuAddNOuByMfSqf
X-Gm-Gg: ASbGncu4FBSN0p/duYCbbQD5ffhwvdeb+lx9E0bKbk+/TpDqymop5Nf0LvjUgCdI1AB
 jd1iHOJCs1s1OU3SbDkF5DvK1o8wDKERQp7tf35xPL0h14Hi7y09OB0ZAbdAkOosxELOVUw3ab1
 NCZSroqdAhwVY8+u+VxLLcsmUxKxrRcUao4Mxx6vZiZWKY0n1dAHYOCCK2AZ6btmC4csO1JBGIv
 a9cMlSaoGVkmDmoHVVj5ol5iKiQRpVY8KFlcIoYmdUQwDE6uDFAi/3C5KePeVRYKeohWLyFMfDG
 xePycuYaa9mEwjytdYyB/mVW5d3VyLT1UHNqVRhQn6O50q4c4VXdxOAqJ851yzFMH+sbgLuceBX
 kmqWbQlrVKaTUx7IEfSJWtC3iV8Jbb74yxZrzjwRJc2R/8X/DVj2CGDxbnlc6H9WGD0FRMzOGzS
 v+bFE1KA2T5BymCjgV3Fs=
X-Google-Smtp-Source: AGHT+IFA6g7T48LQbI3hczCmaUs0oEUcK8BRWG8fK0e1FDdILvB3K+H1Zd36jdCvFsWkAUtViDHF7Q==
X-Received: by 2002:a05:6a00:3d4f:b0:7e8:450c:618e with SMTP id
 d2e1a72fcca58-7e8c6da9f94mr8854188b3a.37.1765253955703; 
 Mon, 08 Dec 2025 20:19:15 -0800 (PST)
Received: from LilGuy ([2409:40c2:1049:337c:5ab7:d5cc:37be:2a0d])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7e2af09446asm14491276b3a.58.2025.12.08.20.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 20:19:15 -0800 (PST)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org (open list:INTEL DRM XE DRIVER (Lunar Lake and
 newer)), dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Subject: [PATCH] drm/xe: Fix documentation heading levels in xe_guc_pc.c
Date: Tue,  9 Dec 2025 09:48:36 +0000
Message-ID: <20251209094836.18589-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 11 Dec 2025 15:12:50 +0000
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

Sphinx reports htmldocs warnings:

  Documentation/gpu/xe/xe_firmware:31: ./drivers/gpu/drm/xe/xe_guc_pc.c:76: ERROR: A level 2 section cannot be used here.
  Documentation/gpu/xe/xe_firmware:31: ./drivers/gpu/drm/xe/xe_guc_pc.c:87: ERROR: A level 2 section cannot be used here.

The xe_guc_pc.c documentation is included inside xe_firmware.rst.
The headers in the C file currently use '=' underlines, which conflict with
the parent document's section levels.

Fix this by demoting "Frequency management" and "Render-C States" headers
from '=' to '-' to correctly nest them as subsections.

Build environment: Python 3.13.7 Sphinx 8.2.3 docutils 0.22.3

Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 951a49fb1d3e..a114f0d8592c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -76,7 +76,7 @@
  * exposes a programming interface to the host for the control of SLPC.
  *
  * Frequency management:
- * =====================
+ * ---------------------
  *
  * Xe driver enables SLPC with all of its defaults features and frequency
  * selection, which varies per platform.
@@ -87,7 +87,7 @@
  * for any workload.
  *
  * Render-C States:
- * ================
+ * ----------------
  *
  * Render-C states is also a GuC PC feature that is now enabled in Xe for
  * all platforms.

base-commit: cfd4039213e7b5a828c5b78e1b5235cac91af53d
-- 
2.52.0

