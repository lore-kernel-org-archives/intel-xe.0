Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7B9FD5F6B
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 08:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B5C10E599;
	Wed,  8 Apr 2026 08:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ch1ehORK";
	dkim-atps=neutral
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E828E10E598
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 08:45:17 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-89fc4147f2eso74895176d6.3
 for <intel-xe@lists.freedesktop.org>; Wed, 08 Apr 2026 01:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775637917; x=1776242717; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=3lr+SQhutbSWGABS7oQ2OjJMnCc+Y1xCXHP8EbLYn64=;
 b=Ch1ehORKhIcyC14cSR/WO7bL4FBH6PadmhAIO3BLfGMf8X8r58JJY8F6idH4paX2VU
 lpESWUfZBDdWjNmD9segymcehWLh6CexXRAkTxSIlKPINC0xtJYaQBvKb02GqJwZHGUB
 jdhMD2b/jmx5fp0ycdB2CrWUnKWtuwo2Ds2+pkjSMvQ9h8Fam3NlnzcNciSCibRT/HU8
 dv3CHp3sfsBx0LOtpep0vvqP3eyRqAkjgjohbytfZUYfTHM6ATetiYTa/Cz7ZX4Cvtbt
 H79aWDJK8qim53pmZDYDSdPQbkka9Mv735tdKddA8ELMq/vIGe89INytrV2asmcANH/2
 km8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775637917; x=1776242717;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3lr+SQhutbSWGABS7oQ2OjJMnCc+Y1xCXHP8EbLYn64=;
 b=Hn6fLF0IaFQx2bNRfyGe9XKgChO9lD7R8em/eUeTla4rVn03+bhEaAt7HfF58Ot1Tf
 52p/FL92pMEY+2aXBVfFKVUn/23kWj0MPLkSRmAe63Yf3dPKCFS31q9YKlazPQ90s/RI
 rxgKmxoIc8xfergJzYf1C4iOt4s6clAQ12lE4s6csm2OXMjO9uarG3lceItRzGW8IyoJ
 K30v5tdDTBSkqwVajDpiVOR1jxnMQO53a6a6srAEUMYO5MbDy1nXz69v2nv6zqsw0CDt
 iadBapkrYqIyEowCV7Qok1yg8W95OWwD76Y3yTyYu1sfMQyJiSKWDo4EMtJO0cx0RZNx
 Bqqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFP9bPFmGe1SvMHj34KAC05RZbTVSD/Aefp8ec9MZRgcuedt4Awwn6kaJVeb8+xFaN2SPwj5dRaw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyT6eNPDJ8Ltk4NiR5bwMe7B5iteVjv+qsDOjrQ7I7YI49Av6Zu
 +9382MEhK2LBOvGGi3noAibvNTFvcWuXAyeYWpJU0jyNffDBluyKZjAB
X-Gm-Gg: AeBDies8CY2pRTN5P1O9/jVuw0J/AitbBbUSsR/Nn7sA/5Yk8jXRtAQ6bjC8ncYdySt
 gH6ONfjm6SoO0KvYYfqrlJ8EBJIoVOGNrIS/kKpmXwzEqaGtNI5F6bKvhJqo1BSajdgddqk4r6x
 ESZltfM1bmrcTqqNWENwPiReh6cuF1P8VvRTUAIvGDvZWGTiOr7nWA1jhR4fzEd8x8ECcwHKaOQ
 uOuWEFKxat3lcyLwKtYPhpZ6vx8/EViLnFIVZrLDFIUdwGLaBGjBGJdBhimq/dxTI25x1VoKI+d
 ISdC8VEkZcgXUGkW/xXA+NaJ9tHrBWgDTM5P0jsav4/CKLHJZH4/CQPmG6WwWtTWZb0oLHHIDHZ
 RDtJXcX9bEes12tV25OfL1U1mo/ZQuyRRbfusTgH7ryKSi/c30UTaUaOKSvieiiBjYN4vg85MhA
 jIuzjXKnQ0szTK5EGR
X-Received: by 2002:a05:6214:468c:b0:89c:e4c3:dc2d with SMTP id
 6a1803df08f44-8a7022bbe6amr337024886d6.2.1775637916961; 
 Wed, 08 Apr 2026 01:45:16 -0700 (PDT)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ac56e3a898sm39028506d6.38.2026.04.08.01.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2026 01:45:16 -0700 (PDT)
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/dp: Clear accumulated HPD events after link training
Date: Wed,  8 Apr 2026 16:45:09 +0800
Message-ID: <20260408084509.555045-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
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

After link training completes, intel_dp_stop_link_train() calls
intel_hpd_unblock() which fires all HPD events that accumulated
during training via queue_work_for_missed_irqs(). On MST hubs that
generate rapid short HPD pulses (observed at 5-55ms intervals on
Dell U2721DE with Realtek MST hub), this creates a burst of stale
ESI processing that races with the ongoing modeset pipeline enabling
the 2nd MST stream, resulting in a GPU hard lockup.

Use intel_hpd_clear_and_unblock() instead, which clears the
accumulated HPD events before unblocking. These events are stale
since they reflect link status before the successful retrain. Any
new HPD events arriving after the unblock will be processed normally,
and the scheduled link check (intel_encoder_link_check_queue_work)
provides a safety net for detecting legitimate link issues.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index a26094223f780..4de2b3d3ea21c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1267,7 +1267,7 @@ void intel_dp_stop_link_train(struct intel_dp *intel_dp,
 			lt_dbg(intel_dp, DP_PHY_DPRX, "128b/132b intra-hop not clearing\n");
 	}
 
-	intel_hpd_unblock(encoder);
+	intel_hpd_clear_and_unblock(encoder);
 
 	if (!display->hotplug.ignore_long_hpd &&
 	    intel_dp->link.seq_train_failures < MAX_SEQ_TRAIN_FAILURES) {
-- 
2.53.0

