Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B91D5B840
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 15:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05E010E608;
	Mon, 15 Dec 2025 15:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FInnLV+O";
	dkim-atps=neutral
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB2F10E045
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Dec 2025 08:37:08 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2a07fac8aa1so14049335ad.1
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Dec 2025 00:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765701428; x=1766306228; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pQHlN9s+cYnmqoJVTe/GHpxEa3f0xltw6fYoFi6tjRc=;
 b=FInnLV+OMr9zSt2jgKg4cheDiH/mCGqCWsVw7LUgbxMcgWiR7i8e0zpWNVHi+yY3vb
 pn0xHfsC3SX/CNehZfVVk5o8WJeS8oozGShR72+/pfZqOYwcxMCc69zCupt5VrWSp/O/
 9/PO2stA58pYbgVlUK0T3Nkr5Bwi+/4YmZzzI7kOhj14R2QtUAuuBzGxvowzolsKhUUi
 VeSpodiKtfhLe92gugxSbnBVVjaP7mOHfpmQsh4BFfgV4uqs9EhVZPcY4BevZWS3EYX9
 daYlpHnLQkfVs8WkX2TnU3HomdSA27cWc919cuDbKIC8po5OYby+ApuQreswt2ThZhVK
 TOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765701428; x=1766306228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQHlN9s+cYnmqoJVTe/GHpxEa3f0xltw6fYoFi6tjRc=;
 b=lAJtM60C5Zhq0NgkWv9PS4XelRbUgXdzuuSKHZVIWkRhbuIvTKcG/tC3MgZdcoPm0B
 ifpKtlT0w146D8EMpN7PKEJl0E7M59w2/9rofQDfZdgdyzUxIJ39MKQegN3dWcWYeit0
 M487meOowm7o3i4RFG3nVScE+P38atd/WPlF+12qBq1fuQpFvR8qn3izbeg+BU2s09Ux
 xqYimWDkVVi992RzpIZnhi2I3g1MkVoX64zk+ndUjGqUp+uY0+DtLT67pFRytyqVd2oG
 2u902rrGYEzSCwGgRTB6Z5h2VPPXuwOosSjBIwwooBv6iqRBZAD/DITBnbAHZnn3uLdR
 2PHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvpOwcerWmUJtbLH+qWcTrKGA+3u6fnELMd0yUJ9UjfXYRrAEcefrbgp/BtF5rf+Ytldq9QmoJ4w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLroKigx/QV0xTa5Hhj6BPhAjgNuIH42ptzNNJIER0Obtbus9Q
 ohofdL5Jo+aL724bqDHrW1om4eB4szP6hNGDF1B54+sOxieBNPaPxgXW
X-Gm-Gg: AY/fxX4m3aVtWg9vi3cVDos5nZDBLomzz9l9E+ESzq9wNtsKs+V0ex8GQ3RJ0d57Lfm
 p/nK0x6saT9qUvzlcW0KZO18kVU5AJvGmBYv4Qlz4SMXOfXlOzJQZKZY1jPelVJd5Tz9o8EwB7c
 uJhknwQ5UclGdGXoApCvYIp8RVnBeZkaf5Q+vCIu1GFFGnv+5k7HsPXPcr7ZwBbO1ccTNzJLyZc
 juZGhVlQ9NmCZXNnmQ8t20b4CJJc+mhkK6FZojF5PHa1CqW86an78BLBoZUPrCZ0Q+Bt5LMea8X
 DawoQ1QrhKvQYSYiK0NEi7nJ2YZqzpwrePOBEMTUXoHzcQBoLGNf7Tdjf2aUb/riDoJSctBMgul
 g2MXbvLivkzV+j1Q3uG/rlfph7c8xHlfq3PZPYpiyf6ale+th6TL4sk8ova3gu+ZiZIRmA4SIQp
 77XRkd/rs6WpfP
X-Google-Smtp-Source: AGHT+IEEYTb86N3Tgh0fbglFIuVjiuLsWOpx7kNxjyqwevTEnja/cXyx327cwjodPgKKjLz6PEe4YQ==
X-Received: by 2002:a17:902:dac8:b0:2a0:34ee:3725 with SMTP id
 d9443c01a7336-2a034ee381dmr61482095ad.14.1765701428430; 
 Sun, 14 Dec 2025 00:37:08 -0800 (PST)
Received: from archlinux ([36.255.84.61]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29eea04cd14sm98244455ad.86.2025.12.14.00.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 00:37:08 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH RESEND] drm: xe: Replace sprintf() with sysfs_emit()
Date: Sun, 14 Dec 2025 14:06:59 +0530
Message-ID: <20251214083659.2412218-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Dec 2025 15:30:56 +0000
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

