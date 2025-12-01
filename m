Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25EAD116F5
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 12:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A36F10E3B6;
	Mon,  1 Dec 2025 12:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tp5UweLH";
	dkim-atps=neutral
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E13910E3B7
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 12:00:40 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7baf61be569so4820345b3a.3
 for <intel-xe@lists.freedesktop.org>; Mon, 01 Dec 2025 04:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764590439; x=1765195239; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lhy5A74tqtvBS5z52gcumAITRKdRTMaNhMKyqxAMeEk=;
 b=Tp5UweLHP/RU1xzba+3FqlMAD9t1qgZ1FZVl4NSDBmiA3y1Ybzc2VA2+3nFCpt3yZO
 FSPVjrMLugmMYT2ZP261U2dLdngpdWeWcygk1lQHSNf60+Bf4/jab+K8scimdYqwRzlT
 kKXwjh3iK+qiQgYfJhs9L83dYwMEj1s36sl70uSksqfqAwpsj08ygJPJBb0vBSQv3/YI
 JxbedCEHSOyBkO/oCqgHlLqnRXicxaaf9kCYSE5uQS/XuLG/NJ8akAEOdE03mta4R146
 mSALKbFyHre9DGQ5rJ8jJYAobWiCJ3VrQkHwQ1VJkoslJ3vghMMzDS8e546iDr3HrRZ/
 hAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764590439; x=1765195239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lhy5A74tqtvBS5z52gcumAITRKdRTMaNhMKyqxAMeEk=;
 b=jfH3M0JWzfWa4Vz472eMRLJGmewPM1K1yqicPp/F9EipdL+DxZ70d4LmjSsghKcNsL
 gd0I5d7gveYtw72BO60ofOCwJTz00xOdh6nVDjQnjo7p3niAOvuDl3YKqVv/kOOs6X95
 sXUHACXqaLcAuBaSn0aWpOxwXlsWFdAJym3B6SV5W+fMxnRpEVi1a2S9p5QSzDWYgJKf
 8nfprJ9bkbgVyPaT5F2dkkCNmqgG5QvZ+7/1lMtuvpJrwResmTvbO3BDdzBp1LEnAtfh
 NiWRqlVm26Q5e25bq+bD8myDTkDNOj8BG9HykWLvgZIoPv+rz8VF/CGQVwtpHZ/6Be5h
 euMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQtjSBZnJBJBDBkjl4HSh8jhmf+GSgyzPdvFuDthfxhAd0hnhLunACxgPfDqouLVKtMr86kk9DhQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywqj4TSlFJ4+HWgUZGAqgJFiUlnoW1m4SYdrHe+EYcssfqMlL4P
 YACQVTgKarXCu4NWSFOLlOLDufjwAJpaB1JKjBqh6E/2kGp7J2hLaq91jfIPoMl6
X-Gm-Gg: ASbGncubqpW0lABmhJIxEHJjeNlraCx+jifWQW2wxu4+mRg/QfK0ZK87QoeglZ4NJHs
 lvTcd3G6y+i4z59xeBtIE5xxGj+8bGslcbz7K5akyHnshaKKkYkPkivuDbOxOSq4VwIhZe+Idxh
 aqvrdg9JonwvfSB+GIQ5BtABMmXtSzaeUbS/27EqkL1qeoCDdqwfO1w6J+mEvr5FDJnL5Jm9J/H
 JGYzw+1C8qBHJHh1w+6CLEamlQCK8e2xSWQn1/uehrx2qcTA0v0mFdm64ebWlZiDFuzWuUeRIc8
 SRAwBweVXnCla6QyYq/D5e+xNB2iIdSxKUP5ypIml0tsBoCC2vPFJ0BDhqnwt+nrCecArb1ipjn
 TXovYYK7q2QMUdM7byoD5W6d3ILz9R1iNc4qH9eGeoBopw/it5xeXG5/WTCiPayvM+kDqkONCny
 ZHHdxO6nTzuawqz0ig7mGLdBoFPgaAXg0eCpEtSo0d9kDpBTUUTQ==
X-Google-Smtp-Source: AGHT+IFhJXG17VKW8RU4YER/hHhK7oxNq6ZSJSHMNLe5GdjMo1kApjL++q2vWO3gXwmu95Xzn5iQZg==
X-Received: by 2002:a05:6a20:938e:b0:35f:5fc4:d89f with SMTP id
 adf61e73a8af0-36150f048f7mr39691986637.39.1764590438993; 
 Mon, 01 Dec 2025 04:00:38 -0800 (PST)
Received: from localhost ([134.134.137.78]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7d15f26f11fsm13288431b3a.50.2025.12.01.04.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 04:00:38 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 2/2] drm/i915: Add intel_gvt_driver_remove() onto error
 cleanup path
Date: Mon,  1 Dec 2025 14:00:04 +0200
Message-ID: <20251201120004.690290-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201120004.690290-1-juhapekka.heikkila@gmail.com>
References: <20251201120004.690290-1-juhapekka.heikkila@gmail.com>
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

Add intel_gvt_driver_remove() onto error cleanup path.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 73ae3cf7f373..b2c332a589e4 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -884,6 +884,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	i915_gem_drain_freed_objects(i915);
 	i915_ggtt_driver_late_release(i915);
 out_cleanup_mmio:
+	intel_gvt_driver_remove(i915);
 	i915_driver_mmio_release(i915);
 out_runtime_pm_put:
 	enable_rpm_wakeref_asserts(&i915->runtime_pm);
-- 
2.43.0

