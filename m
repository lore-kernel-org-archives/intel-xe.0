Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A8CC88E50
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 21:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E44910E57A;
	Fri, 11 Sep 2026 21:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="dEZ8uZxs";
	dkim-atps=neutral
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com
 [74.125.225.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10BC10F665
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 15:05:10 +0000 (UTC)
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843cedd129so637852f8f.0
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 08:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1789139109; x=1789743909; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=KmDwdyq9Q0uxbSq8SDMOz/Ug4vndqaUQy+VL3xEV3E0=;
 b=dEZ8uZxs249XdRbgQv1/dP8lLP3TbJbzf3Vg0MEnMjzeFSwCDM9qednXZHo1Qu002Q
 r1V4cbUiV1ECQ6LOLJ93jwaYRKapaoSWjsfhW5sO7RQgDJwkj0Zc8CiAAZ8rWDNRc8b4
 PdCPqSIkEBkmjQkkZxEcpe5NtQ7gLbbyYRBlb09GCGlzoOzO2yM6OmzO1/NkLK35XebC
 UVUbnEG+tLkTaDO3dbrIVo6PLiLXRAMx6I+Px+19K+MnfTtm5alPjzyQsRD/K838YZM9
 rFVAOa2NqNo9KuyYbWCCKJGf/GUvaICDj5ukI1jt5f8+AABukBFjwSMYXYzknhlyxpUc
 DKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789139109; x=1789743909;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KmDwdyq9Q0uxbSq8SDMOz/Ug4vndqaUQy+VL3xEV3E0=;
 b=ngbUz7I6bNfGA8hKFxNU5OfTlLEeADWCz/bqW+3MkIVb47oNPiZvlyQKdoH96RxTb3
 N6clWrsvjw28NWeONRZemNxFoDFCvn0wxwpjC+oA0HB5NdmsLwDzrMaIzV5rRyouW1ec
 QsQK5nfgRlyxYVA4nUi5Cx6jIA7Ve/AdRhnJwHb1P6KLM8wx/tMO9pXDuVYOSKtiMjKd
 6HnSXDGIcFlQEVfC4uLAe5A8DEkTxBB6Gfb3MSUZ+DLz7hBHMe5TdX233f86Ub8mCuUH
 lSredMBizucJYGMhIIFxE5mEB5yDKHs32HITQ759KR6DQG5xVdzwa48QbYk40hkkcAAX
 dRKg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxeqzMy6G07gkdI0VSNLPbIN7ZTF9XxuRhGtkxjH5flfrB9wE3QlhQouomYQqMmLIyk20LrXt/FdA==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mb2wiZWCXZvyOEd8sPvO/8emFK3HDIts1c+zlXtoXzO3csM96x
 ASshTiFtX4lN4L9ABU05rytr9BjZgnKJvVR/giPodW4twrRLEIPHwMErzWOnZUD5J6U=
X-Gm-Gg: AYBFou2kl4iwxaJzMUvVmZAl00bpt3HgcaYIVEh6Pibprft8XzUaQOdMZ9p5/o/F+4l
 VZYTCOWMuQA+SW1v24VDHOxlesDy2G9Oz33J5U0plvRjMynzNmSrbrCVz4rOFX7V/NdNl5qXTm5
 0elbQ9BkGoeLfOKh92MhlCt0wjm8P5jIozg93AH4wMkTp0om5vw+++f+ya3IhXGJ67rgy8tuXrS
 s8HWbdov7DZIqC96FLl19+Jb+HScHBmXfOtF+5OW6/z/ME9jAJEDUux/CO/uC1s5tzXAYz0lESt
 e6G9wRan1MfEaaZ5UoqTn8iEu/X0ZPbbeSiMnubEF9DpPtO0xxAn7ka9uTCE2QXRiiaXQaMCoTj
 CDWUH3cO5xYcp2Vbt+f5FLAPfEZ+EgtCL1I0QeavAECrJOXbffYvU28fj3LAr2XtfjvSQ3rABnQ
 TLeDSm1iKCbGujy4OPd0s8+lSP6V4fohSNbBZro6UYUpGVeHWQPrV3cQkpkc8s+swbtEArwIFjE
 tScgQ==
X-Received: by 2002:a05:6000:29d8:b0:486:f4b1:8c4a with SMTP id
 ffacd0b85a97d-486f4b18d31mr887113f8f.10.1789139109105; 
 Fri, 11 Sep 2026 08:05:09 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb350686sm6853579f8f.27.2026.09.11.08.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 08:05:08 -0700 (PDT)
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
Subject: [PATCH 1/6] block: Include error-injection.h for
 ALLOW_ERROR_INJECTION()
Date: Fri, 11 Sep 2026 17:04:01 +0200
Message-ID: <20260911-module-include-error_injection-v1-1-5da895d8c84d@suse.com>
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

block/blk-core.c uses ALLOW_ERROR_INJECTION(), which is defined in
asm-generic/error-injection.h. It currently relies on this header being
included indirectly through linux/module.h -> linux/error-injection.h.

Add the missing include in preparation for removing the
linux/error-injection.h include from linux/module.h.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 block/blk-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/blk-core.c b/block/blk-core.c
index 196bccf27f58..324a2d1bb727 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -40,6 +40,7 @@
 #include <linux/part_stat.h>
 #include <linux/sched/sysctl.h>
 #include <linux/blk-crypto.h>
+#include <linux/error-injection.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/block.h>

-- 
2.55.0
