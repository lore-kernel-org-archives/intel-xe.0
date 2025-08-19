Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3C0CA0EED
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 07:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D837310E063;
	Tue, 19 Aug 2025 07:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ItshhlnD";
	dkim-atps=neutral
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF4710E063
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 07:34:37 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-76e2e60221fso11488489b3a.0
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 00:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755588877; x=1756193677;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0gjQmJyLWyyM34EUsK6b+yflZfBy/ykkULtt1gmp0aw=;
 b=ItshhlnDw9wRWcOETCsoEAV2/fNYPyEN7koq9gWWY1uwlLLf3FZjL+dIATP7ZK/Llt
 ZDnO07O0xY8nJw6UpOVxRXRPX2v3jAyV89ZnRyVVHWIaKJEyQ75InBvDSysOhTSBh7wH
 stIRaGzkiPEbjD884q7zHsgeAgsn0HoIu5zowxBLWOgtzWhiV/J1ZHd1ZjXHX6Y4GGec
 yPsYbkUVt6P+lFjWb0rTGrX371a/PGAbajprsM52c1qNPsJFCo2Lh2ByDVOgn6oMRCLv
 bY5jIfTRokwA3SFUSMMgFQkSPx7PK1w3eI0pGhCzCNIMwYG0HdcYCLMEaXAPu6NR77Ne
 lo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755588877; x=1756193677;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0gjQmJyLWyyM34EUsK6b+yflZfBy/ykkULtt1gmp0aw=;
 b=ooRuOYyeszBMGSbwI/rqAeJfWJBZgiWPFlygVXBCPT6rDmRJyWBmNT6Fbgp2EFpOjH
 L/9A3/0h/U2iAxFJA3wbfGq3D1Q1DCq543dFuLmOQ1p7xt+GdZVlm8k19Olyf8WzJM1R
 sLUjsxeKUZBpZEDhAw7YcZHsFDc1Hh4mhfGLaLn1hmJc5gCY/J+ZVWEjiuarcryzIQau
 L2sQQ+pclwkF7kQaWxFyG50/+a7Iz8+n8OYAAGMUGFk/OSdneupGr54Zlt4Bf6KdEffO
 rGWd6NH6wPmnzKfy4z0n6LRs6yBJfipDEcP/VJGTLFBarrKBjmos9LVyCQ4opjykSiN1
 OnPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5+kFwNgijEUFRSo8USHoYqUy9EakNxErYX1pR74+o0+dIsymJmndLYokljw1m5s2gtsOrPS/d7g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNsZ3p9Cn4b1SqclcPn5fLsdV8O3KvM1bRXzwFMwR33sYSdBOL
 2whdhokvqLCmYHo41+Mklqf3UFfF8YGCAppg/qCcW8Cko/YcAoxFBS4OhvFFPsysH8WmY7bpprZ
 Qu2ywQR2ZeWtC5w==
X-Google-Smtp-Source: AGHT+IEQNZ2+f6e9TNwetvOQ+hPmPxwMV2Wzkl2ILCeYpSP1rxXPD78DlfuwZr89GPZOqtlPyVjHcqV/V+GqUA==
X-Received: from pfbfy8.prod.google.com ([2002:a05:6a00:8288:b0:768:7cb5:740a])
 (user=davidgow job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2184:b0:76e:7ae5:ec90 with SMTP id
 d2e1a72fcca58-76e8111212emr1805413b3a.26.1755588876576; 
 Tue, 19 Aug 2025 00:34:36 -0700 (PDT)
Date: Tue, 19 Aug 2025 15:34:32 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819073434.1411114-1-davidgow@google.com>
Subject: [PATCH 1/2] drm/xe/tests: Fix some additional gen_params signatures
From: David Gow <davidgow@google.com>
To: Rae Moar <rmoar@google.com>, Marie Zhussupova <marievic@google.com>,
 marievictoria875@gmail.com, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <davidgow@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 intel-xe@lists.freedesktop.org, 
 kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

In 444be9072fca ("kunit: Pass parameterized test context to generate_params()")
prototype used for gen_params functions was changed to add a struct
kunit parameter. However, a few of these used in xe were not updated.

Update these so that the xe_pci tests build and run again.

Fixes: 444be9072fca ("kunit: Pass parameterized test context to generate_params()")
Signed-off-by: David Gow <davidgow@google.com>
---

This should fix the issues found with the linux-next merge:
https://lore.kernel.org/linux-next/20250818120846.347d64b1@canb.auug.org.au/

The following should reproduce them:
./tools/testing/kunit/kunit.py run --arch x86_64 --kunitconfig drivers/gpu/drm/xe

Ideally, these should be squashed into the corresponding commits: let me
know if you'd like me to re-send out the whole series with these fixes
applied.

Cheers,
-- David

---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 12 ++++++------
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index a65705814b9a..f707e0a54295 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -44,9 +44,9 @@ KUNIT_ARRAY_PARAM(pci_id, pciidlist, xe_pci_id_kunit_desc);
  *
  * Return: pointer to the next parameter or NULL if no more parameters
  */
-const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc)
+const void *xe_pci_graphics_ip_gen_param(struct kunit *test, const void *prev, char *desc)
 {
-	return graphics_ip_gen_params(prev, desc);
+	return graphics_ip_gen_params(test, prev, desc);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
 
@@ -61,9 +61,9 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
  *
  * Return: pointer to the next parameter or NULL if no more parameters
  */
-const void *xe_pci_media_ip_gen_param(const void *prev, char *desc)
+const void *xe_pci_media_ip_gen_param(struct kunit *test, const void *prev, char *desc)
 {
-	return media_ip_gen_params(prev, desc);
+	return media_ip_gen_params(test, prev, desc);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
 
@@ -78,9 +78,9 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
  *
  * Return: pointer to the next parameter or NULL if no more parameters
  */
-const void *xe_pci_id_gen_param(const void *prev, char *desc)
+const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc)
 {
-	const struct pci_device_id *pci = pci_id_gen_params(prev, desc);
+	const struct pci_device_id *pci = pci_id_gen_params(test, prev, desc);
 
 	return pci->driver_data ? pci : NULL;
 }
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index ce4d2b86b778..690b36e6500c 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -25,9 +25,9 @@ struct xe_pci_fake_data {
 
 int xe_pci_fake_device_init(struct xe_device *xe);
 
-const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc);
-const void *xe_pci_media_ip_gen_param(const void *prev, char *desc);
-const void *xe_pci_id_gen_param(const void *prev, char *desc);
-const void *xe_pci_live_device_gen_param(const void *prev, char *desc);
+const void *xe_pci_graphics_ip_gen_param(struct kunit *test, const void *prev, char *desc);
+const void *xe_pci_media_ip_gen_param(struct kunit *test, const void *prev, char *desc);
+const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc);
+const void *xe_pci_live_device_gen_param(struct kunit *test, const void *prev, char *desc);
 
 #endif
-- 
2.51.0.rc1.167.g924127e9c0-goog

