Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002BAC48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 09:28:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E05110E67D;
	Wed, 21 Feb 2024 09:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="cPDX3ks7";
	dkim-atps=neutral
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7922210E67D
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 09:28:24 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-6087ffdac8cso7599837b3.2
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 01:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708507703; x=1709112503;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6oh8w0yc8LvH1yvSHI8zU+2R7q+ewyvFM42Am6pdhYA=;
 b=cPDX3ks7b/yKJBo8KX35o3UB1RnqeTpaaGv1TlLxQ1pYn4USJ82e8iOSsPWO81Yb3K
 NqmPRksegPt1HnD7D5ET691TwidH61ecEvm93TNt8He1PGOk/Qf1tXB0CmX9sTX6Gq7Q
 asYeDkUXC1ypg4+VSjfb222LwmXqkGblXF4N3HI+M/Vrll81pfRcivsyQj+eqDYOqGVH
 Jo/HGDai/UsbH4lmpi/bqlLSC55q7UpBgjohiDWDbraB1ZghGddS/6WkOkY9+8CV8O5p
 xK9cMzQdWq+nTU43aO9cyprHGSaDpsZCt5qUdObjzunwGra6KHTYTe6LbQ+8FFwzTGgT
 q56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708507703; x=1709112503;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6oh8w0yc8LvH1yvSHI8zU+2R7q+ewyvFM42Am6pdhYA=;
 b=uyQx9Xqc6pLqeZ1wqUA2GvV55b9KdxsoXJ+5WhgNy5ZbxW0kPPefj/1d7KMhvqCCn3
 9uG8hoUsc9Vn3kBa5KHomWtRdQgUMLtx06GdebNxb3TXmlySoHcF+ef92w6Fm1UfoYRe
 g4NMyjMLUc0Zh86nEFV90pN6AgSsTW6bvmuNTirum8tpqcCvt67SKnJs83CtgOtxWZcd
 xHcOEfA6IA5LWkZeAnQi6F8TtCYIW89Q1Hc/mbc3CR/aALOUL0VolR/BjTqQbLXYmoIY
 r+E5sZVcj0uF9i0aIFYJULLDI8uFkLNEaHj4YelAwKOwWb0cKyG5jMVTSPFebHYEL2FT
 UbpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiPUXcnVhHLwH388X6zm3SXi7RPjXCJwMGYwKPryMn1wNUh8Mbv8JT+qbZ3cqGR11cCWW+hUXd4jMDq7Q5h8TUHLO0ALRkFZ37je9vyAI=
X-Gm-Message-State: AOJu0YxcfFQGzpViEM0vanK6Mr+gaFDrvSxw/wk5EmW5uKaOh1pAOlt9
 2vxIqWysdxU6h5m17eW4uzHwSo5pJ5twmewejSl+NbJG6l/Z0hSSeAEx7qfSqDqxx1Vi6lZvFOr
 poq6dgtl6oA==
X-Google-Smtp-Source: AGHT+IHAVxan3IBdGfT14ZlxAMIfrkzUxv01ETxOcEryam+Wji8MbAhrWelAxlNmlmHCaTgl78twQW5eAT/4hw==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a0d:e8c4:0:b0:607:cd11:5464 with SMTP id
 r187-20020a0de8c4000000b00607cd115464mr4264994ywe.9.1708507703514; Wed, 21
 Feb 2024 01:28:23 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:18 +0800
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Mime-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-6-davidgow@google.com>
Subject: [PATCH 5/9] rtc: test: Fix invalid format specifier.
From: David Gow <davidgow@google.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>, 
 "=?UTF-8?q?Ma=C3=ADra=20Canal?=" <mcanal@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Willem de Bruijn <willemb@google.com>,
 Florian Westphal <fw@strlen.de>, Cassio Neri <cassio.neri@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>
Cc: David Gow <davidgow@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 Daniel Latypov <dlatypov@google.com>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, linux-rtc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-hardening@vger.kernel.org, netdev@vger.kernel.org
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

'days' is a s64 (from div_s64), and so should use a %lld specifier.

This was found by extending KUnit's assertion macros to use gcc's
__printf attribute.

Fixes: 1d1bb12a8b18 ("rtc: Improve performance of rtc_time64_to_tm(). Add tests.")
Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/rtc/lib_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/lib_test.c
index d5caf36c56cd..225c859d6da5 100644
--- a/drivers/rtc/lib_test.c
+++ b/drivers/rtc/lib_test.c
@@ -54,7 +54,7 @@ static void rtc_time64_to_tm_test_date_range(struct kunit *test)
 
 		days = div_s64(secs, 86400);
 
-		#define FAIL_MSG "%d/%02d/%02d (%2d) : %ld", \
+		#define FAIL_MSG "%d/%02d/%02d (%2d) : %lld", \
 			year, month, mday, yday, days
 
 		KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year, FAIL_MSG);
-- 
2.44.0.rc0.258.g7320e95886-goog

