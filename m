Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D03AC43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 12:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BC510F010;
	Wed,  1 Jul 2026 12:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hfGmLhKu";
	dkim-atps=neutral
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7995310F5A1
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 11:58:35 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-bebb72b845aso144279366b.3
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 04:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782475114; x=1783079914; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i0Ps5tEtd22JyPLt5Txw4hpkbL4qYP5JlG6cYEFGqrA=;
 b=hfGmLhKunB8vtUk1h0a3S5JZ+XyBNkKYCxXaP84nU0kPwK+1AZ6gZA8YGcjRwU2DSi
 ldGCvKMbOKNsNKzCE7vyHGKdOcsYQPGjP4EbXkyHkDQPcp2ZAS+wotI5x41Fo3wYtras
 WJQEg5bBXD0rVGunk5XjKlTfXGAiOSGRTx6fpHzpGPsJlGxL92Y/W1TySQcnMNs1Ct3U
 ajxbgq3xH8yNN1DzEWXoKrFm6SSi7DX/sgOFyVKt+s0l5VN671b4Y7D09lN4mFCXANis
 WJnXOuvETBIWCX1wZH+xIuno5XMlEMuYCqE/1vwof4gYyAaCBRGjq+f53bKIJ2hCZ8+I
 3UsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782475114; x=1783079914;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i0Ps5tEtd22JyPLt5Txw4hpkbL4qYP5JlG6cYEFGqrA=;
 b=K0dnS/tP3mZ1dr7QW/Umy/qimQkKCxlEsDDJGaZngnRdAuhmSuqyn2ljUJdVMxFCSk
 MIYoroemD7Nl3Vs6uMkdqNxZmcEOU5EYazhhxoZJ3tRYlRfxcJEb3CaxbX+aVHg/iXfe
 ktGq+flayk3IHHxaOKPqY9dwy3B1hx4lH0OtDLDOF47zM1fi7z/+t1840LwGtAIrvAoK
 eN3MfwyWRTocYK6N8S9OhvzwQOikI/gTmnKo5TWKwxRfFDd4qS+RmKZDK9FYw/TuTLT9
 y/c/S/F1NglmbLcpxGqMW2Zf2P1QBEqxHgJOo58ZzbFm80SFi4bZp9yy3TfI8zc3pRsF
 ZGJQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq4e8saYnETp4S6FdTH6FXlccF67VCWEIiZaBFefmANKBnTCLA0HxuVueQ3jQqMmbKq1v6HLgSRQw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqSOfyPoLNIRLQEQj8Rcx+neK0ARkk4HYadR5IygFTpZ0sUUxT
 /mBkO0p/F0gd2qPO/oWq0ESkQRznClA2t+3CVCwBZDU8NG1/ul8MM3gb
X-Gm-Gg: AfdE7ckO/5Xkdmmckp81kwhH2QtUkZkVA1JOH0ASeteksdKBEgf7qqEUW4HUsS7qmgE
 eNWJl//oXkId+/OTJ0z1OT7P+iCaLMQug0Szk77erM57NGd5epDAYDDG3AO8bmBYpZRTlSvTY67
 GblvJP9mhc5SKYSTez9oNUZFksJGMxzaq6pRa5vi5Qk0o9n18eRUoHnjRxdpNS4kwjoZwhr5niH
 9hoFCA7IhnQ5UMe1rETsKmQYTNqvf7JAhlnj/pZfJY6S6gUcCCEb75mB1SWitSHX7e1PCjpqjFm
 KGc7eg0yS78EdbpZLgWSfqor5yvXnK1Xes2ZwcRV0JcVWkoAIXyEdjYwSgFs2sqQFedDHtik8+5
 kKftwwyGELKQJkxa0tXpH91DzVQTErm9HtN9p7bFdttsjP3Sv+4XnJxBCerel6NRnOJDZGTSP9J
 AiM1PH2AcEqKp8z+dAsSvWXjibS2SYYCFRGyTECIiBXZf0Wd/IC7myNC7UphmAIEe7FJZw/lEWm
 To68JIYsvww4AwCDieSE0nB6RJe7WthaA==
X-Received: by 2002:a17:907:7ba1:b0:bd0:df77:98bb with SMTP id
 a640c23a62f3a-c1205d4fd16mr415304166b.9.1782475113560; 
 Fri, 26 Jun 2026 04:58:33 -0700 (PDT)
Received: from fedora ([154.66.167.183]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c122e9ae635sm37986266b.20.2026.06.26.04.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 04:58:33 -0700 (PDT)
From: aquiles <achillezongo07@gmail.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 aquiles <achillezongo07@gmail.com>
Subject: [PATCH v2 2/2] drm/xe: skip resv fence wait in xe_svm_invalidate if
 no ranges are bound
Date: Fri, 26 Jun 2026 11:58:08 +0000
Message-ID: <20260626115808.2072258-1-achillezongo07@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 01 Jul 2026 12:56:31 +0000
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

xe_svm_invalidate() waited on the VM's reservation object fences before
processing MMU notifier events, even when no range in the affected
address region had active GPU bindings (tile_present == 0).

Add a pre-scan over the affected ranges and skip dma_resv_wait_timeout()
when no range needs invalidation and all BOOKKEEP fences are already
signaled. The fence check is necessary because tile_present is cleared
when an unbind is submitted, not when the GPU job completes — skipping
the wait without it risks unmapping DMA while an unbind is still in flight.

Signed-off-by: aquiles <achillezongo07@gmail.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e1651e70c..447c5c965 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -233,6 +233,7 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 	ktime_t start = xe_gt_stats_ktime_get();
 	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
 	u8 tile_mask = 0, id;
+	bool needs_inval = false;
 	long err;
 
 	xe_svm_assert_in_notifier(vm);
@@ -258,11 +259,22 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 	if (xe_vm_is_closed(vm))
 		goto range_notifier_event_end;
 
-	/*
-	 * XXX: Less than ideal to always wait on VM's resv slots if an
-	 * invalidation is not required. Could walk range list twice to figure
-	 * out if an invalidations is need, but also not ideal.
-	 */
+	/* Pre-scan: skip fence wait if no range has active GPU bindings. */
+
+	r = first;
+	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
+		struct xe_svm_range *range = to_xe_range(r);
+
+		if (!range->base.pages.flags.unmapped && range->tile_present) {
+			needs_inval = true;
+			break;
+		}
+
+	}
+	if (!needs_inval &&
+	    dma_resv_test_signaled(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP))
+		goto range_notifier_event_end;
+
 	err = dma_resv_wait_timeout(xe_vm_resv(vm),
 				    DMA_RESV_USAGE_BOOKKEEP,
 				    false, MAX_SCHEDULE_TIMEOUT);
-- 
2.54.0

