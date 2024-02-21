Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98610C48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 09:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2402610E659;
	Wed, 21 Feb 2024 09:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OR8PHALc";
	dkim-atps=neutral
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1ED10E682
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 09:28:28 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-dcdc3db67f0so7868326276.1
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 01:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708507708; x=1709112508;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=l+N/x8q0XM6q/oxl++oFE/zLIduvg/H3kbNqGrSm6L0=;
 b=OR8PHALcSxYjX18FxooasIFjpGF9KP1DEBNR6CL51ztNvgJJsH2cbekPYu7taco5zI
 MzUr6oy8yVnzdv+gDFDnUSEwUdaaErm/gIq2s1fmWoAxsRQJjKJ3WUpdZ03CcZTxc7i6
 sZLcXlVB0Egw2BynmfvxlB+R0b5BSMe1JjxI/SO5SUwz7PU1n7+a0MxdDYl8mn7XbR9H
 kkyFhmOIBzhB0lrroKxmKe5gJed6A9IoH+WuwVKQEp+yTuCfbOHXuz69VGXq+MjcYYk3
 EsFSeaAL+/ky8GcGWk7hBUFxhUv8TVZn7lz0cLJKnvKBTqOpv+9uRkkW5qRmJ3DHd0Ec
 HXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708507708; x=1709112508;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l+N/x8q0XM6q/oxl++oFE/zLIduvg/H3kbNqGrSm6L0=;
 b=w6EVqeNYeZmdK4OcECBK+rWH8W4fPXPeDDE8fpDgWHqaZSlcHNZyiPdDDdrWicrMIx
 4dNZFUFhNLDBrMzUnC0PxZYrTLxDQ2p5fws7kQUL5n3StxLlo7DUIvLiC/t8BTEzMrCF
 OwFTj10BorzkSKbDXRyFx0GCIMhPQKvguND2hMPeQm7udZskNX3QyXeNj4GZ85Trr6JA
 DmKfX8ltc5IiveTJDFMn7KOlAfyUAUOdYjQ+0D0wy7kBrMiE1njp23/UXU9rhUc8WWh/
 p9ileudAffsPS1Fmr8m317wDksMc3PuTcN/AvTXGFYAhP0d5KVNwP1ELLBugtAjSburd
 meeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2zLLu2HjoysnYhopCOIRufnEqT9wE+yS8tGVEePPzR1DclEkJf+FwbatB0fsgc+aAeEpKYz+qxDnTj7SPsz08+B3Wle88J0a7PnHPHSo=
X-Gm-Message-State: AOJu0YydBaUkgygCvCefd46L2p1gNWywm6FOFIm7tmmz8zecJ0MPLWRV
 KPW6Q2uwU/f2Nv29DodhAXpluJfsVg0/majl5Isx7q9KMIZJ20bQA6kxb21TZdm5QlKc8Cywypi
 RxD/H5lvyLA==
X-Google-Smtp-Source: AGHT+IGujiTgGmrs6aB7MYtXNm4zgRA3Zr4vV9toQOw9f+upbD+oRsb+6ooQYjPHHocWRD49vELQV317edlmfg==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6902:1081:b0:dc2:2e5c:a21d with SMTP
 id v1-20020a056902108100b00dc22e5ca21dmr5584522ybu.6.1708507707855; Wed, 21
 Feb 2024 01:28:27 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:19 +0800
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Mime-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-7-davidgow@google.com>
Subject: [PATCH 6/9] net: test: Fix printf format specifier in skb_segment
 kunit test
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

KUNIT_FAIL() accepts a printf-style format string, but previously did
not let gcc validate it with the __printf() attribute. The use of %lld
for the result of PTR_ERR() is not correct.

Instead, use %pe and pass the actual error pointer. printk() will format
it correctly (and give a symbolic name rather than a number if
available, which should make the output more readable, too).

Fixes: b3098d32ed6e ("net: add skb_segment kunit test")
Signed-off-by: David Gow <davidgow@google.com>
---
 net/core/gso_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/gso_test.c b/net/core/gso_test.c
index 4c2e77bd12f4..358c44680d91 100644
--- a/net/core/gso_test.c
+++ b/net/core/gso_test.c
@@ -225,7 +225,7 @@ static void gso_test_func(struct kunit *test)
 
 	segs = skb_segment(skb, features);
 	if (IS_ERR(segs)) {
-		KUNIT_FAIL(test, "segs error %lld", PTR_ERR(segs));
+		KUNIT_FAIL(test, "segs error %pe", segs);
 		goto free_gso_skb;
 	} else if (!segs) {
 		KUNIT_FAIL(test, "no segments");
-- 
2.44.0.rc0.258.g7320e95886-goog

