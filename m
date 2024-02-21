Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10470C48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 09:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C079610E659;
	Wed, 21 Feb 2024 09:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="wagj+oPt";
	dkim-atps=neutral
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82A810E67E
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 09:28:42 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 3f1490d57ef6-dced704f17cso2525604276.1
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 01:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708507721; x=1709112521;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=UtSX1a4twDclpP0XCHq3xRlg28EKI7v3CFBboD2ALTI=;
 b=wagj+oPtflvLmcAsPFHT/NDrblUH0vThQ0CVNzw3Ned99C3KXAkztyfIW0Foefcpex
 yePpBRMjb/k1HcS0e9tzxP6iL4CuLSsYr0n5e4qX8aDp+frha3Wb/iI7IZQqJzta3HBG
 3tVOhGD6IOauurAWXJbi5XWWpeAB0fK9mx5gr2NWc23O+Ozw4e1aew6sAj5lZ1PRl8Kh
 fkS2d0lgrCIcGY7C7PDFutvTENh1wV6tge4ZQv/bODvrPGeC+im8sx3bVkPMYdmi2r9H
 5zjC8LInztrqOpY6nVhZJllqqF5WqlbkkHovZYYmixthpv5Ds3lPbpIeoEFkaGS/0ZQk
 ipIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708507721; x=1709112521;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UtSX1a4twDclpP0XCHq3xRlg28EKI7v3CFBboD2ALTI=;
 b=mf1b7hhz8bikJFxGFZT44z73lUc23YLtcTA87nk3VFrTw9IGRaxacuMf7+Qmu9JfTZ
 is59YZNE6ajkplSqSo8b4s+HRLxSeq6mO41ANONJg7UPl7RWEYZqMBJ0xtoEUFZ1v+v1
 vW7QYfVaKTRRVBGI4VwnUjNZW9hHXrmzx0lJQXQelp8ZBemize4QYfUDujwjwblIdYwk
 5esSzbIlHfoz/v/wrhQMzREsue5xdHNoriEDyRgfjFDMYMzt6VaHL7zY7zVqN2ai+TIZ
 ltiCCc2HBBWNA4sq+Uc+cRrPKHXATISJqDioYFWzhku298p7SoDCvJWGRKcpfUB4NThN
 Ubjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5RL/3zCjsI0NjqbKHwRy0BTiECZDVc57GYiiy3Rm4HBVX+RHEAyuuvuPJ+fCCkpwfZ4BZwvQIbIXclNWtluktSoWnb4IK1SLVAfQVjdg=
X-Gm-Message-State: AOJu0Yz3+ZlqxqjPSvJLTUS1VRn+khBM+YICJOGziWEfUDlC5JeisQRl
 PBy3xywityCG9PHfSYD5J5GbOTAmzEouglHad1YnBwYyRqWJDb83pacW2kyaeHSTwAO8qnMGbYd
 SuikO2PRVVw==
X-Google-Smtp-Source: AGHT+IE+u4BHsnTY4zBV9uwlLnSALfH2VACViqUl+6ZdsI4Ll1wRpv0qUeWfBww+/YNGvG/0sUR+LBCAIAUp6Q==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6902:4ce:b0:dc7:865b:22c6 with SMTP
 id v14-20020a05690204ce00b00dc7865b22c6mr618682ybs.8.1708507721736; Wed, 21
 Feb 2024 01:28:41 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:22 +0800
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Mime-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-10-davidgow@google.com>
Subject: [PATCH 9/9] kunit: Annotate _MSG assertion variants with gnu printf
 specifiers
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

KUnit's assertion macros have variants which accept a printf format
string, to allow tests to specify a more detailed message on failure.
These (and the related KUNIT_FAIL() macro) ultimately wrap the
__kunit_do_failed_assertion() function, which accepted a printf format
specifier, but did not have the __printf attribute, so gcc couldn't warn
on incorrect agruments.

It turns out there were quite a few tests with such incorrect arguments.

Add the __printf() specifier now that we've fixed these errors, to
prevent them from recurring.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: David Gow <davidgow@google.com>
---
 include/kunit/test.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index fcb4a4940ace..61637ef32302 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -579,12 +579,12 @@ void __printf(2, 3) kunit_log_append(struct string_stream *log, const char *fmt,
 
 void __noreturn __kunit_abort(struct kunit *test);
 
-void __kunit_do_failed_assertion(struct kunit *test,
-			       const struct kunit_loc *loc,
-			       enum kunit_assert_type type,
-			       const struct kunit_assert *assert,
-			       assert_format_t assert_format,
-			       const char *fmt, ...);
+void __printf(6, 7) __kunit_do_failed_assertion(struct kunit *test,
+						const struct kunit_loc *loc,
+						enum kunit_assert_type type,
+						const struct kunit_assert *assert,
+						assert_format_t assert_format,
+						const char *fmt, ...);
 
 #define _KUNIT_FAILED(test, assert_type, assert_class, assert_format, INITIALIZER, fmt, ...) do { \
 	static const struct kunit_loc __loc = KUNIT_CURRENT_LOC;	       \
-- 
2.44.0.rc0.258.g7320e95886-goog

