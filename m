Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39535C48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 09:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E295410E4DA;
	Wed, 21 Feb 2024 09:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="fTwg1XM1";
	dkim-atps=neutral
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C6310E675
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 09:28:01 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-dcbfe1a42a4so907683276.2
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 01:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708507680; x=1709112480;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eT/uH0qZq3eqCfd94wgAJ0+lZ7IXzMci6RxxltQCKcU=;
 b=fTwg1XM1k09NNKe1u9i1iuQmQOnuWCUQZ8m1o+3quV7q2KMRO+wtaUKF9MuXs5zsn3
 CxBCSqx4KjiiJpDURa8tbLUG66lJ/1GXjK6+Fp/rIxZOms2uRpKdPF6A6klN1F3ejnCf
 rfpOSyMSm8zA+vnukEzPEb09sfPWSsp6xZ1tzAbZjJ4sJ2YUm24PnXt74CZLF7uS0m5m
 KydUJeSP1NenIrUoyvh2G0CzO0OQulCaPoGOcuJST/QKbbZXta1fQOr0lOxB/+8BYZsN
 CtRTPH7DlvfbwRzowb6kiTgVpUf4ZfX2izrRe4DcwFZJsYjPkJPqktLwAnG5+6IX9DZE
 vaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708507680; x=1709112480;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eT/uH0qZq3eqCfd94wgAJ0+lZ7IXzMci6RxxltQCKcU=;
 b=YsC3icNZ+wCaUq/vEU2yVLMHBfsAsvfa5JZdr5IZL75LPWLM0S5fh+EdkgCTy2JWHH
 NiwfdMep0ojG+5UdulVb1u28GDCJrrcSlWUZiO1wgMvtZIGxcXGr2Mumc3zXEiHtz4TU
 bncA39Msq3fV/D6ZkggJt1WYyUPPOOrXEwXMc6VTIbbHe3XcEAzSJeTEnjzm1R4wpfmN
 7Y2Mdw1nr6nmR2ElAWAh9xOpVq9oyw+E+LtxvJiMB0m1bsAfs+63qNdjm4JybSs0QWda
 Klz5ZlPX+C22bX9XgHzU4pGquCSRNRclX0JM/W8W8nXvfD1rgALC1n86kfA9jr/FHJWz
 Bivg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0z5DrUkAMkJH+yWsUOg4s7UqQYn/M7gdSRFn+HAR04CjBZRXfu+iqYXag0RNMSUhnv2Ypvi4A17gkTFy37cjkHcTsJfLn4SDy+cEX+aw=
X-Gm-Message-State: AOJu0YzUelHjeoHiE3DfodPR2h9IWD3fNjzWU9Fi2sLWjbaXQuXmDQ79
 0Oo4ZBPz3WT23G18HLzsBNA+Q1rsUpnat1CieeJ3G/E0ZLwS3lFDAZfn3pqyeTVKWWuvqlFh/ID
 UM6xRmVBekw==
X-Google-Smtp-Source: AGHT+IGgpxMwkWEuztRpScY6gpG7tiyfC6FQuhNT36WOurGMxJcdy1PSlvVZEYKt9//gZI89E5vnji5S6AEFRQ==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6902:188f:b0:dc6:dfc6:4207 with SMTP
 id cj15-20020a056902188f00b00dc6dfc64207mr4738387ybb.10.1708507680618; Wed,
 21 Feb 2024 01:28:00 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:13 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-1-davidgow@google.com>
Subject: [PATCH 0/9] kunit: Fix printf format specifier issues in KUnit
 assertions
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

KUnit has several macros which accept a log message, which can contain
printf format specifiers. Some of these (the explicit log macros)
already use the __printf() gcc attribute to ensure the format specifiers
are valid, but those which could fail the test, and hence used
__kunit_do_failed_assertion() behind the scenes, did not.

These include:
- KUNIT_EXPECT_*_MSG()
- KUNIT_ASSERT_*_MSG()
- KUNIT_FAIL()

This series adds the __printf() attribute, and fixes all of the issues
uncovered. (Or, at least, all of those I could find with an x86_64
allyesconfig, and the default KUnit config on a number of other
architectures. Please test!)

The issues in question basically take the following forms:
- int / long / long long confusion: typically a type being updated, but
  the format string not.
- Use of integer format specifiers (%d/%u/%li/etc) for types like size_t
  or pointer differences (technically ptrdiff_t), which would only work
  on some architectures.
- Use of integer format specifiers in combination with PTR_ERR(), where
  %pe would make more sense.
- Use of empty messages which, whilst technically not incorrect, are not
  useful and trigger a gcc warning.

We'd like to get these (or equivalent) in for 6.9 if possible, so please
do take a look if possible.

Thanks,
-- David

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/linux-kselftest/CAHk-=wgJMOquDO5f8ShH1f4rzZwzApNVCw643m5-Yj+BfsFstA@mail.gmail.com/

David Gow (9):
  kunit: test: Log the correct filter string in executor_test
  lib/cmdline: Fix an invalid format specifier in an assertion msg
  lib: memcpy_kunit: Fix an invalid format specifier in an assertion msg
  time: test: Fix incorrect format specifier
  rtc: test: Fix invalid format specifier.
  net: test: Fix printf format specifier in skb_segment kunit test
  drm: tests: Fix invalid printf format specifiers in KUnit tests
  drm/xe/tests: Fix printf format specifiers in xe_migrate test
  kunit: Annotate _MSG assertion variants with gnu printf specifiers

 drivers/gpu/drm/tests/drm_buddy_test.c | 14 +++++++-------
 drivers/gpu/drm/tests/drm_mm_test.c    |  6 +++---
 drivers/gpu/drm/xe/tests/xe_migrate.c  |  8 ++++----
 drivers/rtc/lib_test.c                 |  2 +-
 include/kunit/test.h                   | 12 ++++++------
 kernel/time/time_test.c                |  2 +-
 lib/cmdline_kunit.c                    |  2 +-
 lib/kunit/executor_test.c              |  2 +-
 lib/memcpy_kunit.c                     |  4 ++--
 net/core/gso_test.c                    |  2 +-
 10 files changed, 27 insertions(+), 27 deletions(-)

-- 
2.44.0.rc0.258.g7320e95886-goog

