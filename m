Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0020606A325
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 13:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZQs8See
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875C710F30A;
	Mon,  9 Nov 2026 13:57:01 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6CA10E74F
 for <intel-xe@lists.freedesktop.org>; Sun,  8 Nov 2026 06:05:19 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-33fb4680717so569038eec.1
 for <intel-xe@lists.freedesktop.org>; Sat, 07 Nov 2026 22:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794117919; x=1794722719; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6lprU6Db7+ksq8wir9YKQMNUuhRExSoqjwLJdiuYXBY=;
 b=bZQs8SeePcHSV9THcSc52j4Hkkgr+Tnq1akZeIAzWaTwHCb11E3I8D53HDHEtzW4JF
 xpCaFAqHzutMMDE6euTXEckKzkSYJrgZ4A+MDWBP523/aTuUv8p15l3TnmQ889W7EnZc
 GQwr9PxXX4hPv+cenBsV+7fbbjD4ExmWH/kRTQQ8FqCnBS2BkExBjmI8Fj3/ZWj79131
 T3X0ewCejIM6Jnz6u0h1chAFdQIz4FCDs6A/YPZrpfYYpoFhfo3DdQipeT9mRjakHjIc
 +OFbvtxEHN3G51NJR6BlvaVhHAq49Nrgs27KnwArkVAZqdoqoeBUHMaD7Aq3owe8z2QY
 22Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794117919; x=1794722719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6lprU6Db7+ksq8wir9YKQMNUuhRExSoqjwLJdiuYXBY=;
 b=ASVnlB2EW/zxDGlAvekdg5r1FFo+s886pTivFpLue/4lKPUwQ3fAKJ0KzlWl+T0TCA
 MXNKd9U0zLscOjVVVRho/OIoOdo3ZqTe03yTLF/rFjTZNFJxv8LAGG02ePxv0krsl36/
 2dcxhACHEr95UXFJFQiJLv91reaFZKI5979g1vLcRtIiQSDu55O5OZyESRNRfp0+VVm6
 bBEE+vGHNMqxDz/soadIeKqNju1nOQA+UILkAfIOXvgfVapgN1kPhcEn8CoYatmPo+R6
 vL1zoS1j7xMqBrAX45/m3NUK53GoQENY5joYZOLe8y5CtSa6otNXQ5adl1BKzOkvcTN5
 OFAg==
X-Forwarded-Encrypted: i=1;
 AL+hErHtJpEbz0Eplcw67DiKmysDekrB/UyrqFN47Si0/DwjcmsdC6Bpn1L2fWUThWyH9jIGX4EqDtKS2g==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+PKJAK20i+8xuydZQwhUg3D/FCtSNNTUgSewwxu3xD3FwQQLcu
 ymlRrFaK8YOqJLcThdm9n88vYTdSYlZAdAdWVvPrCjKgYSZ30BKavN6U
X-Gm-Gg: AYBFou0Lp3zKTvepcoLqC1gDU+mXOzH/4EWBLJJF2Om1BQPgTiyRZj3v30BYHuaR5tK
 0j0H9c6GhF2Ir2BPh5eiD+ZXRbN+AhnC1xHgqNkiI23m5pR7CYYKYS2Cls5UKxbFrwD/buQ3A0K
 43nmgLr9SWjDy5nYyH2tvjquecOk1cYkmZPSj7A+UC1HIDTCoJzT60UNj2x4LmVhJqabOLTlYhy
 wLBhzdLVVfdpGgYRNS/JfzLOfYbLPISf4eU+YY+Ufw9WrmMl/cHZ6Nfne7e2WkFUa5hHd2r4zWk
 ufzALjaV6xfHviR4Nh/EfhW2AS0YPAKwe+B6QCeklyz9cIMU73+41PjpLRAkIuDh3L0daF0AqM8
 70gng1sNNZSE9R6weo6hEo3289q/NI3vTKzmm1D0DuXLTwdTUWbf0eBE90elZrhKOfXHDLdtJ/F
 XGWvok3sTm8zWCixjGv/JfVEVlJ/U+EyLbazKvPypA1YV9oab75k2cPOhao1Eg7vIkDXgO4PySS
 DzYzkU0XqJew2OfcwrX+XwqHZkPSOBeDS8Ul5bc6ngt5Sc2F5hklPR5ninsughT7USSat5cSV/K
 GUMTaRz2a8bCBMnBmkJkHpdrCz5RvjjzKzkqVCE7rmV6ywNW+jkvOZBFi+lfiISOgUArJ5wYndF
 wvAbDAwxe1Ij2ZpF6Z7NTcOOKTw==
X-Received: by 2002:a05:7300:fe09:b0:36d:4570:a32d with SMTP id
 5a478bee46e88-37252e3a97dmr1835412eec.2.1794117918967; 
 Sat, 07 Nov 2026 22:05:18 -0800 (PST)
Received: from localhost.localdomain ([2406:b400:d4:acc8:a024:59b8:c312:eefd])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-372665db733sm2646694eec.23.2026.11.07.22.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 22:05:17 -0800 (PST)
From: Torra Sowmya <sowmyatorra@gmail.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev, rostedt@goodmis.org, julianbraha@gmail.com,
 julia.lawall@inria.fr
Subject: [PATCH v3] drm/xe: Remove unused xe_vm_restart tracepoint
Date: Sun,  8 Nov 2026 11:34:18 +0530
Message-ID: <20261108060418.4554-1-sowmyatorra@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101125808.9770-1-sowmyatorra@gmail.com>
References: <20261101125808.9770-1-sowmyatorra@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Nov 2026 13:57:00 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit f3e9b1f43458 ("drm/xe: Remove async worker and rework sync
binds") removed the call to trace_xe_vm_restart(), but left the
event definition behind.

Remove the unused definition from xe_trace_bo.h to avoid generating
code and data for an event that has no callers.

With the tested x86-64 configuration, size reports a reduction of
436 bytes in xe_trace_bo.o, from 20262 to 19826 bytes: 140 bytes
in text and 296 bytes in data.

Fixes: f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")
Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>
---
Changes in v3:
- Add the Fixes tag.

Changes in v2:
- Document the measured object-size reduction.

 drivers/gpu/drm/xe/xe_trace_bo.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 86323cf3be2c..fa91dd2b2174 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -228,11 +228,6 @@ DEFINE_EVENT(xe_vm, xe_vm_cpu_bind,
 	     TP_ARGS(vm)
 );
 
-DEFINE_EVENT(xe_vm, xe_vm_restart,
-	     TP_PROTO(struct xe_vm *vm),
-	     TP_ARGS(vm)
-);
-
 DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_enter,
 	     TP_PROTO(struct xe_vm *vm),
 	     TP_ARGS(vm)
-- 
2.47.3

