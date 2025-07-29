Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E058CC87FCC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FAD10E370;
	Wed, 30 Jul 2025 14:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3cvNeydx";
	dkim-atps=neutral
Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com
 [209.85.222.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D9710E299
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 19:37:28 +0000 (UTC)
Received: by mail-qk1-f201.google.com with SMTP id
 af79cd13be357-7e36e4467e3so38978185a.0
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 12:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753817848; x=1754422648;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z1gbKWHstsqjpQUrskmEj35TBdlQ+Ks8m0MsBKhxomQ=;
 b=3cvNeydxrUWPDaRmGqlMDVpk0g128/3nHIXnga7JsopCWp0RFBo16AXbu7d7zsJytK
 HOiok4Mk7lMw9vzATngsL4xIsly5FLFqAw9Rzj+GsWOwHeozF1nydkGuI8oqTt0xMz4S
 naFbJthyhxxkGk9PRrTagNZC0r/iooBeIRkcKUqWv/3VyYUa1h7Op0m2pBEebPlQV8Fi
 DbpG/u835nfRIdJdTPsZYACNDERfsjHG+reo0DNmCGA3L2HiWwmRL0MAQzPuDDru7cWI
 tjb80zfPvGh8ghJkDiR/zpMbkfYGaM5wNBZ+ka3QW1Rzd+Jtlqwznl3vL8yfICXhIYgE
 QEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753817848; x=1754422648;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z1gbKWHstsqjpQUrskmEj35TBdlQ+Ks8m0MsBKhxomQ=;
 b=kwmjiGstCSf/padApOH2fw4t53AIy4NEgsXwRC3JcVqD0sNE29OgR/ohX4Nsa8Z7CC
 kWKVnDkuickHSEqtjodJMSu8My69ntioqZqHApyKjtXHPo8ii5JjplgRpkPNXj3FsTtv
 V3wfRgtCfbnOFu4EN6EkvKo9G5BVU34ZNRgT3jAbRGSzBDPNS7iMR82hTXUWeNlPB1+V
 p5/KwHUIPMP+MToOoJQsjUJcxsCH3O3brBbhhmCY9MnKbcQ5jSZ8sGfsLgt+ndNIt8uE
 JfKTbGbTPmRuztJi4RH4vNYvPGuqVaR7yXVAM7CO76H9cz2p2zPjCTHCI/oM5IQ4FzkB
 ShZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUYI7M16qITqffneAWIt1TTKjzM/T5Pf6BA8CKf+KoXPPrRgy2mueFU3D2g+xAWhKuUYTAdBbhxA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDk2NltTug/BJfyTPRtIA3sRwgcgVthJ0PLZlzQxx404e697+G
 zwnsfnGOvqn7xsNuhDaGUAuUhukdExIY0QRusDcJIXh1/rvY9dCasik4OAgKoQ5ObkaRgScCpok
 Sov2CIAOehbo01w==
X-Google-Smtp-Source: AGHT+IH49q8FwE/ekxv3FeoZfBKO45/GCZY6ANFvVAwiH31rvsPrQpAAJiadtmnkP06wHNdCbESTk/zdijXtfQ==
X-Received: from qkkh15.prod.google.com ([2002:a05:620a:10af:b0:7e6:4e45:e180])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:57d8:b0:7e6:5f1c:4d78 with SMTP id
 af79cd13be357-7e66ed5c00fmr119271185a.33.1753817847731; 
 Tue, 29 Jul 2025 12:37:27 -0700 (PDT)
Date: Tue, 29 Jul 2025 19:36:43 +0000
In-Reply-To: <20250729193647.3410634-1-marievic@google.com>
Mime-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729193647.3410634-6-marievic@google.com>
Subject: [PATCH 5/9] drm/xe: Update parameter generator to new signature
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

This patch modifies `xe_pci_live_device_gen_param`
in xe_pci.c to accept an additional `struct kunit *test`
argument.

Signed-off-by: Marie Zhussupova <marievic@google.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 1d3e2e50c355..62c016e84227 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -129,7 +129,7 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
  * Return: pointer to the next &struct xe_device ready to be used as a parameter
  *         or NULL if there are no more Xe devices on the system.
  */
-const void *xe_pci_live_device_gen_param(const void *prev, char *desc)
+const void *xe_pci_live_device_gen_param(struct kunit *test, const void *prev, char *desc)
 {
 	const struct xe_device *xe = prev;
 	struct device *dev = xe ? xe->drm.dev : NULL;
-- 
2.50.1.552.g942d659e1b-goog

