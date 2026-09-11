Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483F4C88E4D
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 21:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946CE10E597;
	Fri, 11 Sep 2026 21:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="UV/uHAvo";
	dkim-atps=neutral
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E5C10F66E
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 15:05:17 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-485850cf499so831819f8f.3
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1789139116; x=1789743916; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=a258DNEK6aR0v+xDimWu2caaAUdwCvMljBObmnBjN5k=;
 b=UV/uHAvowqaPOP/yltYPgD6G7/52L93IXQWZ1gWg9DdYCUFHxm32mFE4FCBMO1QR6X
 z2V24Xq7aysMfqTsIbqJod0nDJ0xs29IHne1Qdfii/1KimKSaF3KZrt0veE5/gwgeV6u
 VTvXEE+/t7Cc0VwNzGsH2MeC+AcS44l7UkMW3d3QL5RaGmqP2yUNfkP5aMT8XP0Jy4ZG
 Y2hiQt5xAEOOHVFOORwxr6lzwdqwZQkx++VkmwcC/Djx+tS/vJrmJEJkxW2cFoE+b2OF
 nmKM9Jgr0Bg7wyGz/Go+6MMw/JfMyKYQeW5I8tKb/XmXmRlUeO2LGhfB6iaAbnolpyyS
 BDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789139116; x=1789743916;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=a258DNEK6aR0v+xDimWu2caaAUdwCvMljBObmnBjN5k=;
 b=XeI7kFdIfzF5Ea+5bF8nMr61d+K0ug1cUpBBO+aVSS74kZlAaS68UUAu56OctFKrHK
 TCi4TYU8S0quG3DukAwD4rveJTz7tIn4iwtVCyWbr3zABGEtAO+yaphQKXEhrReDSDIC
 8bctyKsqYgYx3r+Y/GXjXEUO42nCRyGier+iOv54cKdnXO8P0CJk3d8YZzV6mBDI9UwL
 0IujwVvzPBmSk+hdKG3jsH7y33uMgx5cLqx9/yogp9n7G36SpALQCFHAK/VHsIuoAple
 6Ti0Q2a37QMYzGjcmW5y0H72KgEWs7yojgBdtm8bL8mRtxstDiy5OMVOiNW3e3nPm7/H
 QK1Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBwRUJ8Xlkl/s5WRrVxdp0aL1moRn+R56qD3xh3QUwou+6U/NIVnFXFYAW7rl5iehHHweSwMromA4w==@lists.freedesktop.org
X-Gm-Message-State: AFuF++lMkoVr/Wv+idAwwTIdgAgx1Cm8onLbFeAhmswLK64y5fSwarOb
 BMk1eYdJj5q7CUNKLeWCc2x0LxWmF97f6O2y11DQOj1L7MQok/F5cV1Zfy+n4pYVD5o=
X-Gm-Gg: AYBFou06fIJDfngUyvcoWBvwFBDWOGgxTcGzQq9ngmQmsv9Q5VtikiDOeTYeYMCqpyq
 NEt2IjX0y6yzuiSChE9an1+ud0+q51p/bDaPmRdG9e42i3daHMVV57DQroap9UkGOqAMvEE9rLG
 0Buoxqa6jqNBu3OJSgEtWFkTE8+D7dLpqYGsZhDKbgxnYnehfVqP4ZHwaTmMsauI3QqcLxCdMSk
 nut+cvDTrFns807SPfIZ8s09M6mQRecn3LxuwNUMJK4jlquXVl74U20MC7OXyb61DxCl1IM1X7r
 31XOOPXQWc4vdUACOwN22f3IsmExIDoAUnTeUB2efUkUdfVvdf+gcfaBOM+mG9MVA5pRs8BSzHW
 3v8eMdSLoU/FK4lrRckKQzewgKKSd2dI3IlJIXttoSlSq7EIzxkOjPkiG4ihIv8DsEEaYudIIfb
 aOnN40wqlIJ45zY7rEvQMRCeVcuExW0ldm0PwKVLjhoQtHTEqCC8FLqtFqrDeIHUreoPuY6mCo7
 92VdYY=
X-Received: by 2002:a05:6000:491e:b0:486:f4b6:3bce with SMTP id
 ffacd0b85a97d-486f4b63c4fmr559176f8f.24.1789139115924; 
 Fri, 11 Sep 2026 08:05:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb350686sm6853579f8f.27.2026.09.11.08.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 08:05:15 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Jens Axboe <axboe@kernel.dk>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Simon Horman <horms@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Francois Dugast <francois.dugast@intel.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, linux-block@vger.kernel.org,
 netdev@vger.kernel.org, linux-api@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] module: Remove the error-injection.h include from
 linux/module.h
Date: Fri, 11 Sep 2026 17:04:06 +0200
Message-ID: <20260911-module-include-error_injection-v1-6-5da895d8c84d@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911-module-include-error_injection-v1-0-5da895d8c84d@suse.com>
References: <20260911-module-include-error_injection-v1-0-5da895d8c84d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Sep 2026 21:45:10 +0000
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

linux/module.h appears in roughly 15k #include directives across the
kernel. This makes it a "hot" header, so it should avoid pulling in
unnecessary definitions.

The header currently includes linux/error-injection.h to obtain the
definition of `struct error_injection_entry`. However, this is unnecessary
because the type is only referenced in the file as a pointer, for which an
incomplete type is sufficient.

Remove the linux/error-injection.h include from linux/module.h and add it
to kernel/module/main.c instead, where
`sizeof(struct error_injection_entry)` is actually needed.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/module.h | 1 -
 kernel/module/main.c   | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 96cc98568eea..b3a3d5827384 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -24,7 +24,6 @@
 #include <linux/jump_label.h>
 #include <linux/export.h>
 #include <linux/rbtree_latch.h>
-#include <linux/error-injection.h>
 #include <linux/tracepoint-defs.h>
 #include <linux/srcu.h>
 #include <linux/static_call_types.h>
diff --git a/kernel/module/main.c b/kernel/module/main.c
index d0e1e0bd2ad0..f1392c10907a 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -60,6 +60,7 @@
 #include <linux/codetag.h>
 #include <linux/debugfs.h>
 #include <linux/execmem.h>
+#include <linux/error-injection.h>
 #include <uapi/linux/module.h>
 #include "internal.h"
 

-- 
2.55.0
