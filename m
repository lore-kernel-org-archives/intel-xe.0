Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99B5C87FD3
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645C110E69E;
	Wed, 30 Jul 2025 14:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="qxlyeNXj";
	dkim-atps=neutral
Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com
 [209.85.219.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DC310E299
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 19:37:25 +0000 (UTC)
Received: by mail-qv1-f73.google.com with SMTP id
 6a1803df08f44-6fe182a48acso2637396d6.1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 12:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753817845; x=1754422645;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=n1I9IAjE7arvoHRD2CPgQ4vbTvzkjQYYPvGX27voj8U=;
 b=qxlyeNXjbH0n23aEdJDQtLlEe7iaxaMKgdEcK/mXkjr0AAfizTJVaWbVdVzlFYihRi
 pmwGIAAlehXkTAxYxHnlfumCCE6bN1s4BDArh26XGnvcKyzcKiU4aJ5zc/PWIlJjq/vM
 tq8ktQg9NSrKJdcuA3lTTAJzUa5kwIagUIyOwDIwTF7lCwbJex3cc8qhSF224SEPrBua
 4eOgc00rO6wSDwhD2sxz2OtgGwVneeCoWV+NzioEl4EgfFDL9aWcYk7pmqrriKdpBb64
 D4MhWe5NlY1uZ85fXteRicKh37tuBzbS0BqPV6G63P+hmyZE8tjCwJONa0p2fX2HaZbL
 UR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753817845; x=1754422645;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n1I9IAjE7arvoHRD2CPgQ4vbTvzkjQYYPvGX27voj8U=;
 b=gWtCCfzttf1T07NnxbH2J6WJG1CjW0kiPgYfZGEMP9ELPOYf+PXgHIc4JIx3RxLTJH
 XeimgshW36QhE4gDbuoWKwXxLYev2BotzJ6ty85Z0fIE1rPQTTpspsooICsCWZCPIgcP
 h0HW6H80TVSW+6ZsyusTlOarb491lV8TEtd1Vc5C6M+9E1h5b8GDPdEVTu0MSbbP8Wtd
 Ajc6oHCdgQT+86n4/27Ry4JTDM1wZOsuue2NYiv6OMK8u6t4pvv1WZ+Ux+rdt5e/NP7I
 z1IZ+je7ucshB+sV+HTGm0AhD+IOh3OLWj62lbD59r58HhP+kCelEJRTo98nVt1kAjQ4
 n4Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWddoiLnjwxdrTvwhWWEJTLRKDa8U4LdNU/Lk28oNqizzASy17W0caMSl2N1f3uElsg228nKE+pGg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwhDEY7F0RBFXUMe86ImokcYTuPKC6i5X2P1FsOtzHd7ShEke5
 vqdeHhcM/HdcSRSS/JCG3sXAJdKJh6ni3e5QX7V/0+eaMBz1ZDitT7Sy7ItQJzWTDNOR2BmyXa1
 P9Log+/rycgMkqw==
X-Google-Smtp-Source: AGHT+IHjdJ+C/GyichRcZO1+NLmayjPtkidhop6VuzgTrGXPN/gGzMzcDS6aLlPktjDxkrir6Ko3AJkF/wLcQQ==
X-Received: from qvsw1.prod.google.com ([2002:a05:6214:121:b0:6fd:5e45:e693])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:ad4:5ecc:0:b0:707:5046:6a1e with SMTP id
 6a1803df08f44-70766139e40mr11981946d6.10.1753817844434; 
 Tue, 29 Jul 2025 12:37:24 -0700 (PDT)
Date: Tue, 29 Jul 2025 19:36:42 +0000
In-Reply-To: <20250729193647.3410634-1-marievic@google.com>
Mime-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729193647.3410634-5-marievic@google.com>
Subject: [PATCH 4/9] kcsan: test: Update parameter generator to new signature
From: Marie Zhussupova <marievic@google.com>
To: rmoar@google.com, davidgow@google.com, shuah@kernel.org, 
 brendan.higgins@linux.dev
Cc: elver@google.com, dvyukov@google.com, lucas.demarchi@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 kasan-dev@googlegroups.com, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marie Zhussupova <marievic@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 30 Jul 2025 14:02:27 +0000
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

This patch modifies `nthreads_gen_params` in kcsan_test.c
to accept an additional `struct kunit *test` argument.

Signed-off-by: Marie Zhussupova <marievic@google.com>
---
 kernel/kcsan/kcsan_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
index c2871180edcc..fc76648525ac 100644
--- a/kernel/kcsan/kcsan_test.c
+++ b/kernel/kcsan/kcsan_test.c
@@ -1383,7 +1383,7 @@ static void test_atomic_builtins_missing_barrier(struct kunit *test)
  * The thread counts are chosen to cover potentially interesting boundaries and
  * corner cases (2 to 5), and then stress the system with larger counts.
  */
-static const void *nthreads_gen_params(const void *prev, char *desc)
+static const void *nthreads_gen_params(struct kunit *test, const void *prev, char *desc)
 {
 	long nthreads = (long)prev;
 
-- 
2.50.1.552.g942d659e1b-goog

