Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D65C83F26
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 16:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9AF10EA73;
	Fri, 11 Jul 2025 16:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oeKdJ0jk";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EF910EA6C
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 16:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V8GN0JashkQtWUXToy59kGU9VjVeVxhDhRuHeQvm/d8=; b=oeKdJ0jkC1Jb0rh9oB09VhmOrn
 kZW/Q3K9LJYJqtRNKB6ub9ExBlfPCjqjUGKkAeHV07xvLrubChwEJvwJ9xq9izr5w6c2AO+ZaA9Gn
 gybDt6tZdRxpbe/3WF9RH0TNNQrBAwBqk7pqqBYYmdHhcCn4xIE6vSAGFKLHNLlemSN4iUdZkllqS
 cUlmEcEUZBUmfZov5trd6WAMl6Olh2POoOjI47z86kqZ597Ek11nDBuquo4AS050Arzkp1DqX6BIa
 eEWnBQNbgoxRGbTisNb4Xgxe5FrxpEi8wbBhbS382+jYkxRxPM9sgCrRycWRZRz6MxnQHRTR6eEtf
 5JBheWXA==;
Received: from [84.65.48.237] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uaGCD-00FR68-W8; Fri, 11 Jul 2025 18:01:58 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v10 4/8] drm/xe: Track number of written dwords from
 workaround batch buffer emission
Date: Fri, 11 Jul 2025 17:01:49 +0100
Message-ID: <20250711160153.49833-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250711160153.49833-1-tvrtko.ursulin@igalia.com>
References: <20250711160153.49833-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Indirect context setup will need to get to the number of written dwords.
Lets add it as an output parameter so it can be accessed from the finish
helper regardless of whether code is writing directly or via an shadow
buffer.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 5d5b76f16829..229cfde91799 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -991,6 +991,7 @@ struct bo_setup_state {
 	/* State: */
 	u32			*buffer;
 	u32			*ptr;
+	unsigned int		written;
 };
 
 static int setup_bo(struct bo_setup_state *state)
@@ -1023,6 +1024,7 @@ static int setup_bo(struct bo_setup_state *state)
 			goto fail;
 
 		state->ptr += len;
+		state->written += len;
 	}
 
 	return 0;
@@ -1039,7 +1041,7 @@ static void finish_bo(struct bo_setup_state *state)
 
 	xe_map_memcpy_to(gt_to_xe(state->lrc->gt), &state->lrc->bo->vmap,
 			 state->offset, state->buffer,
-			 (state->ptr - state->buffer) * sizeof(u32));
+			 state->written * sizeof(u32));
 	kfree(state->buffer);
 }
 
@@ -1063,6 +1065,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 		return ret;
 
 	*state.ptr++ = MI_BATCH_BUFFER_END;
+	state.written++;
 
 	finish_bo(&state);
 
-- 
2.48.0

