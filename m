Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B933BC48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 09:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D3E10E4F7;
	Wed, 21 Feb 2024 09:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="UB906qPN";
	dkim-atps=neutral
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25AE10E67B
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 09:28:19 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 3f1490d57ef6-dc657e9bdc4so8158138276.0
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 01:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708507699; x=1709112499;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9U7+OVqCU0rhDEd8d2z0lAB4Gret4PnmLwRYwmvgX8=;
 b=UB906qPNLh2MnJA0IPbLDtC0BD1D4tf2t3U3koPtMXrigrFYhoj6KDn032UXm8L9hA
 6+ayGOl7O0JIANaIBH/7jygd/a0vbgHudRHAh74qreNBhrtldPI2DCRItSE/xSmMkXhr
 KB2D4yUPO52K4P+mx7PJ2lRneVp5sQhYqirTh6ZAiSJAn08ygOAyERgsoAIVVIv0a7MH
 wL/jgLOXs0NnzE5QUNYFF1R7b3XnnjyamHXXsMM5yl1wjZpYEe99DLl2llX7S4bJV25u
 JfQcrha3F5SlpgkM3G3WVqIct7mn9Q1FUvMPYFwGUIddJZAVCY5QSjVnnYzLVBNmrnHu
 QLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708507699; x=1709112499;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9U7+OVqCU0rhDEd8d2z0lAB4Gret4PnmLwRYwmvgX8=;
 b=ocYr4ILBcnnu8LgXcMcO5RnE9DO4D6aWHuGCOTSxU+x8s0429vkgiDe3leIOO0yMb0
 2KEYsLT4fPYXm2ywoXXFu4wfG9ugf0amKdf0sY+KX9x4cS1x6dcfHbbhd+x8yOk007b5
 0dmkmEaMr++vGhsE5adkqJI9JOFrOI4a8/tWOGLR7tVJlUxwxhpbYrSWWpN/J1TIhGf6
 YH3WhlDWeXpqUBO32GQCjG9Ah3E3OfZSzNLy14siiPVXjkJUIprD9ap52FEOgxYtz8Wo
 hi74CbxzxAF8hsu6iQzN1AyuAnj76/4e2cISoICw/+sR7zXcvtS7fE66R37x0MDqs19c
 Gtgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe6rwao3Jh6+ui/8/cMCd/oxVEE1RKw/WPjgvhudK1ZnvBXynyX/IfoT2QaAgmFy4J+5QmQu1CXWiIortXi3l5zPGLCLs+dSEyzDUdqW0=
X-Gm-Message-State: AOJu0YxgeQpshCVPv9e0qF3Z68Nj3x2VVpMQsasRTnjUbYO4tzyOX/xv
 gKszgg2dLcoTwroSLxzpKYspj0DWJ+uZMe46ubSLd9iJMzcyyhFPEpPrXzGcysbjAkqvKc6KZHH
 xB2uUQ7kBzA==
X-Google-Smtp-Source: AGHT+IHQmEZgvDehwTVbCeyhhzp67M3ZAq3QtZNAjC+xaNviI3L4AtsF+O/jA3jQTZUOnw086+ZCDp3kuUdK4Q==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:69c4:0:b0:dcc:9f24:692b with SMTP id
 e187-20020a2569c4000000b00dcc9f24692bmr1016456ybc.13.1708507698808; Wed, 21
 Feb 2024 01:28:18 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:17 +0800
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Mime-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-5-davidgow@google.com>
Subject: [PATCH 4/9] time: test: Fix incorrect format specifier
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

Fixes: 276010551664 ("time: Improve performance of time64_to_tm()")
Signed-off-by: David Gow <davidgow@google.com>
---
 kernel/time/time_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/time_test.c b/kernel/time/time_test.c
index ca058c8af6ba..3e5d422dd15c 100644
--- a/kernel/time/time_test.c
+++ b/kernel/time/time_test.c
@@ -73,7 +73,7 @@ static void time64_to_tm_test_date_range(struct kunit *test)
 
 		days = div_s64(secs, 86400);
 
-		#define FAIL_MSG "%05ld/%02d/%02d (%2d) : %ld", \
+		#define FAIL_MSG "%05ld/%02d/%02d (%2d) : %lld", \
 			year, month, mdday, yday, days
 
 		KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year, FAIL_MSG);
-- 
2.44.0.rc0.258.g7320e95886-goog

