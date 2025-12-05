Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C51D3B7E2
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 13:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E3B8911F;
	Mon,  8 Dec 2025 13:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AFeB7Zec";
	dkim-atps=neutral
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F2D10EA9D
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 09:51:07 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-298287a26c3so23356025ad.0
 for <intel-xe@lists.freedesktop.org>; Fri, 05 Dec 2025 01:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764928267; x=1765533067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pQHlN9s+cYnmqoJVTe/GHpxEa3f0xltw6fYoFi6tjRc=;
 b=AFeB7ZecR2oTB4hI6FnL/TcdxFgykyhyu4lpG92uoEvaJ5Jpq6yzL0Hy175L+xQDoU
 jbh+41e0FEvtTwlTTJ12xfYQMZBRKW1F67xduDFu4bJvAskaH05G63U6nyQFvo6mTFP4
 27io4/j3AQY7l+6qd6eCWueu5XhiEawKYZazK8U4o5ON+l5vQU0YAzzd7ycxPf9T7oKS
 gt2puGanWSvQ8DToDBBz8BwM5Uc+JkeiqEyBq5AevLq1Os8AcFX1u/+TqKwyHux2ZEro
 zeNq21L10lZn9y8O/g3NjucdmGyB4EyM5452hClvcBX/ikLgvoSqLCbiyFiqRER0S8Zd
 TQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764928267; x=1765533067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQHlN9s+cYnmqoJVTe/GHpxEa3f0xltw6fYoFi6tjRc=;
 b=YnDROnWHVSOWM3dVPur4t26UaAD1C4gMZqkImPLbj3GXFwBWEAb6+2Mw+jFuMWvV+J
 G98IyVCbJqfjI7e2gWJ4BhFmXflVtLH808Do1HQRWbIIdapXhug5W4krZ1+/r2rfE5L4
 nQ8MXm/MULVIDjiBLKtKyFjFIk4KIOmlULWXvQA2pgHABoRk6FZbgEYEYtmuM/+2WBWY
 jCMuCY6NPUfRgfTBIub4fHo9Xe3oQi9TYJf5CXJNumHsLPmmRv28wHI/X0Zqd7Druynz
 QpbKcf21tzNXVPdAdlD92JCvxaVGTgc14hj9sSVBmOBxaV8asJpfmuVBj6BRCmyGZV+M
 UJZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP8CPcehPo4/3Nh6EnSsAtS8GFNtGi5n2FRcpBrTF58Zc3+gv953OqK0ZWoyvUXH9fH/f5lc0Mpw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9i6QLkRb0dhGgpGliDKzSbeXks674jDUbt69/lJ9echmDd6ol
 x5xA4GIZPDcco7folthNmBeeTINL5Sq/VpAPLsxBMslwI/GsF9TlQazT
X-Gm-Gg: ASbGncs+XnoR8AvNl3xtze4vMdB+0KGMl4Q7ndRNgsXoXqGbv1EnQe/EWTxE2YjFPGV
 /qZmHFcrWzPVYaya+aJudn9L1e9KAxBUp/p4ogm+quMCR9iWqG38rvgUvDfVMYSGrEQgZCoRoRd
 7C6IaeA3ymtDfBwLAz90Mhnw9YqEIRUF4LjA4sEUglZOQ0eOcpo75sy+vSouQ4JUYkAw/qZvuEp
 Bj1GNUV9xWTKmTIfhmVDkRjAAggl6a1a9ZA/xALz+oiscG3vz1TmxCh1onv/WHW8qeOq3qzh8mP
 ho9W3/vC+8h1oPB7xSue5bEAsRcKQc7svEcyDZlKs1uIUpuBdVDvJ43d51Vu0rGONirfrLc4kZP
 WrO1cYYTEzWp00E0XpUMTtzI9EpQtTMnDPBvNM/XnBG044m3AfIRMWso+tmz/lD1BfZ1Ef/+ASi
 XmMNj0tgzTQbxoS4Qf
X-Google-Smtp-Source: AGHT+IE6UDzJ4K0qWbbZExV4Pib6HqpqfH478ATbU2gNSVjEFAMSvfaiCsZ7zaEbNCvotPtH/SqWgg==
X-Received: by 2002:a17:903:3d0e:b0:299:dea1:e791 with SMTP id
 d9443c01a7336-29d6833c4c5mr110080585ad.12.1764928267448; 
 Fri, 05 Dec 2025 01:51:07 -0800 (PST)
Received: from archlinux ([205.254.184.182]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae4cf863sm44562235ad.38.2025.12.05.01.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 01:51:07 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH] drm: xe: Replace sprintf() with sysfs_emit()
Date: Fri,  5 Dec 2025 15:21:00 +0530
Message-ID: <20251205095100.355503-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Dec 2025 13:25:37 +0000
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

Replace sprintf() calls with sysfs_emit() to follow current kernel
coding standards.

sysfs_emit() is the preferred method for formatting sysfs output as it
provides better bounds checking and is more secure.

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index cab51d826345..f016459c9904 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -425,7 +425,7 @@ static ssize_t event_attr_show(struct device *dev,
 	struct perf_pmu_events_attr *pmu_attr =
 		container_of(attr, struct perf_pmu_events_attr, attr);
 
-	return sprintf(buf, "event=%#04llx\n", pmu_attr->id);
+	return sysfs_emit(buf, "event=%#04llx\n", pmu_attr->id);
 }
 
 #define XE_EVENT_ATTR(name_, v_, id_)					\
-- 
2.52.0

