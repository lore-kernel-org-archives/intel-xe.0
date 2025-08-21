Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFEBCA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 13:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B21110E99D;
	Thu, 21 Aug 2025 13:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gv72UsGW";
	dkim-atps=neutral
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3A010E99D
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 13:54:53 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-3250e3b161bso38776a91.0
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755784492; x=1756389292;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6ti2fCOXYva8ZvL9CMugr5JTuNvLl5q2xqcam/kYJ5o=;
 b=gv72UsGWwZNZsK6edlDGxtiwUoQ2xtjXFH/No3Y0ohBgyDrpb3C5h/3akirhFaunfY
 D/yujkUZy+n9y0pjnsHlPWFwfHxVsfrSeDliKIlmDewAX1cXuGfeKhEyjz6CTr5tNj/v
 YTgDXCPZC6Fkfgb3U0a/UXD3n1ghkMhC16nzQdNqHAtC9QAkR1EM9KyIm1KI9zDitSIb
 4IJfJd22mQDuwxVDxFOe9Avj4vO1WJVj19muh91aPOKK/tqtjlZfq2InVhHQgrOIwVoi
 kZSZu4U0fAuJCYrOsXYPwi0OfmazbNp2/5aSqO3cOBbEuDwppBTuSqN5KG/di3fnbD3R
 nmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755784492; x=1756389292;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6ti2fCOXYva8ZvL9CMugr5JTuNvLl5q2xqcam/kYJ5o=;
 b=MZtxki3gPHalYzBkUPB1dXir6x4ZTTXLexeMt0Tc6NbdtaavbiQw+lRFCiexOCqC/C
 Knp6Q6nJUvbJehd91nOK+iFU1m/bHAyHm9P9XQibZcWBCqN0WAmipPcdpM9nzZyXQYfI
 4JpueWmsQI/bEufmN3f52du1KcQoB+srrpuqV06ZuX+GN3W/EZmI2rKyssV8K4ldUKCs
 AkKuLA8zNXRnnuo2g9BqUprtYLJ/iAnSQk0daQPx+cM0J4Mf4M8FJnEIS3d4TT3v36Qs
 c3PYcIig/BVO/qCEsjSBI8AXpTLeFHCD56PhVpwMrBdhmCXkbARAHt9RD6uEFLyQZu4P
 KZEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj43wYGbILv3iTqeCSJrYmBj2WvEtTpIHlwh3+ud+4EZw+wF9N7lJUL0tmCteJpwWLE8py6TQ1iw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi1G8NYkKLXcF5xSMqUS3qNYcJcJZk3DAUhQBckUmWQKGvNiXl
 eI4/UeIlB51RUUK05OK3ykFzjlo7Em8LtDnIhbFvOTEYr1AIE5nzQbyXmPqnGF+UqcaTmGGiz5I
 8j6/U1kmyeAeiqA==
X-Google-Smtp-Source: AGHT+IHqGRrkU47M6IM1/x2E4P3NTyZSlzj29xTt46GT3PC8wiwMDfzgWqXUh2krGXSfc6vq3VH1gAt4thuMHQ==
X-Received: from pjk4.prod.google.com ([2002:a17:90b:5584:b0:31c:2fe4:33ba])
 (user=davidgow job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3bc5:b0:324:e682:f313 with SMTP id
 98e67ed59e1d1-324ed19569dmr3747107a91.18.1755784492548; 
 Thu, 21 Aug 2025 06:54:52 -0700 (PDT)
Date: Thu, 21 Aug 2025 21:54:44 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821135447.1618942-1-davidgow@google.com>
Subject: [PATCH v2 1/2] drm/xe/tests: Fix some additional gen_params signatures
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

Sorry, the last fix here caused a warning (thanks to the test robot for
finding it).

I'm still happy to sqash and re-send the whole original series if that's
preferred.

Changes since v1:
https://lore.kernel.org/linux-kselftest/20250819073434.1411114-1-davidgow@google.com/
- Add the missing <kunit/test.h> include for struct kunit

---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 12 ++++++------
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  9 +++++----
 2 files changed, 11 insertions(+), 10 deletions(-)

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
index ce4d2b86b778..6d8bc56f7bde 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -7,6 +7,7 @@
 #define _XE_PCI_TEST_H_
 
 #include <linux/types.h>
+#include <kunit/test.h>
 
 #include "xe_platform_types.h"
 #include "xe_sriov_types.h"
@@ -25,9 +26,9 @@ struct xe_pci_fake_data {
 
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
2.51.0.rc2.233.g662b1ed5c5-goog

