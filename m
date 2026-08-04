Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A215FC55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 02:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555A010E0C6;
	Tue,  4 Aug 2026 02:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Up8VHYBp";
	dkim-atps=neutral
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4D410E0CB
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 02:14:48 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-848479c9bd5so3419850b3a.3
 for <intel-xe@lists.freedesktop.org>; Mon, 03 Aug 2026 19:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785809688; x=1786414488; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=WumQsINKEjXXwnA9droH9TmWDMYMx6AIp5LTpSxd3MI=;
 b=Up8VHYBp/SprB6xfcCsziYhkk9LO8BGTLn4sv5mLWQ0f3KRMaRnj1l//lVT43zTPn9
 kSOxb9ojt8dAeXNDiM9Ca9OdtyH7C9CjRh3wW4blYBMuGoWfolbrTts1am2WQaewuCAy
 nuV1Jb6DdUGLo4cLvGl4C2JK774vxaH39CUMF/hcL28EtG47UJHdpzpNRfIO0zQSMJuJ
 zuxO2IYGCbiDt3UJiAZlnfVNNCbKX+BNu7OuIkhwEQlfmr6GSM+f5F/hH4suUPAQKFOQ
 qZ5pXeywAObtFGcKK2bpe1h9RJKeMc7/jzi3ZQ869mTMBrTobC+bn6XtNiHJSgucYftL
 AJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785809688; x=1786414488;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WumQsINKEjXXwnA9droH9TmWDMYMx6AIp5LTpSxd3MI=;
 b=gMhGyhl9we8luPuVCiMB9YNil92+lHS949wSjHac9uAwSf285K5ISDzt1OBOM+JuZA
 ZJ3j3Wa5VWuSDILs7ehN/QcUFaImesu6OvCbnCYFDcj+O73eQQ4IF9NTHYQhAM4o/d+U
 oGIvepyfDnGsZyCENG0yylFQlTePgdBPnqh5cPInILtFeBP4N+O2N7p3axMimkFFlHh4
 ng0JldqHUwZ4PHvu6D8W8mGa6nB4QQYy6UlAB+WZkhGv+G8B+XwrKxyt/h2f7m/0jN7Y
 RnYMBPnWJik4OeTXorqOuNSGMTunoz+hJD3cZzP+byKREOHL8ohKCuJ1q0AIXARwcxoj
 9BFg==
X-Gm-Message-State: AOJu0YwBuY7dDCVQLQ4HOeI/5xcwTqjxFrAvNb/3BNQoka/R+Z+s4tS/
 //F0HbAiD/MQvtacdcYaKOMk2ENP/9JrOD0Uo1TxerJ5LuvVYtE1XINo3Bf8Rw==
X-Gm-Gg: AR+sD11Qr3QOlcSETvfUSGturhQOe/MgNHLdkK3It6PFmG9zZO8qpasqEA71FGpVtrQ
 VCJIwDZPa7XvdyQvs6KIXybsqaOja25N7ZqTajO97GWtjGcDmbBoSu0GO4r5Se6e2eU3MWyI1mu
 Q3V9aAGP47LgdC61yZyxgQj6YVnh7aWE2SRn95VSWM0+mz8/acCw6Nf0xXG9UF38HtZPc/9/aJZ
 u2jVs3TfaD4ttM1q4n2PmCUYlujEQFvuOqELLkueqH1RwG4UOfyWpXujNNA93mrdjvhIkmPAjlz
 Gf2tJEsGj3MpjK6ewmGoy2zLBhlJMWwlZvX02nKTlnFUfsaLKNoXmTx9Zrq0m19W+Ify1d/yYP8
 Z448Bv6aE+c1yvkE0beHfthcl1dw6vUyouLetFqyIDsiFg36oT7/F2I8bFEEBwbzzdntA1vfkQg
 SlJhs67iULjP4Dt9DRKFAhkaN1xOS/Itq8X/xZzSGSDbWlmiGSWrATJYmr/gMHvX+Sjw0uHtzXk
 DMFgdG1lhQfze0Q6mwU78qr6R2EkKh7A9ezBfWtv1FVha43k7Q=
X-Received: by 2002:a05:6372:a746:b0:3cb:76e6:4e19 with SMTP id
 adf61e73a8af0-3cb76e65a78mr288035637.59.1785809688250; 
 Mon, 03 Aug 2026 19:14:48 -0700 (PDT)
Received: from lord ([170.246.208.189]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3153dd4f0f0sm42267698eec.2.2026.08.03.19.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 19:14:47 -0700 (PDT)
From: =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
Subject: [RFC PATCH 0/3] drm/xe: diagnostics and workaround for GuC TLB
 invalidation ack stalls on ARL
Date: Mon,  3 Aug 2026 23:14:38 -0300
Message-ID: <20260804021441.3054424-1-talesam@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi,

This series is a follow-up to the TLB invalidation ack stall I have
been debugging on ARL, tracked in:

  https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678

Summary of the issue: with GuC 70.53.0 on ARL (reproduced on 7d51 and
7dd1 machines here, plus an independent Arc Pro 130T report on the
issue above), TLB invalidation acks intermittently stall for ~2.3s.
The H2G request is consumed from the CTB immediately and the G2H CTB
is empty the whole time - the firmware simply does not send the ack
until much later. The fence timeout fires at 2.25s and the ack lands
tens of ms after it. Userspace blocked on the invalidation (compositor
buffer unmaps etc.) hitches for the full window.

Patch 1 adds xe_devcoredump_gt() so this kind of hang - which has no
exec queue or job to blame - leaves a devcoredump with the GuC log and
CT state behind (Matt suggested capturing devcoredumps when we
discussed the issue; devcoredumps from both machines are attached to
the issue above).

Patch 2 logs when the ack for a timed out invalidation finally
arrives. This is what established that the acks are late rather than
lost.

Patch 3 is the RFC part: a delayed work that pokes the GuC (status
register read, CT flush, doorbell ring) every 250ms while an ack is
overdue. On my machines this converts the guaranteed 2.3s stall into a
sub-500ms hiccup for the majority of occurrences; a minority of severe
episodes ignore 8-9 consecutive doorbells, which points at the GuC
firmware being internally blocked for the whole window. Full data on
the issue. I am happy to rework the approach (different delay,
tying it to the G2H handler, dropping the status read, etc.) - mainly
I would like the firmware side investigated, since no host-side poke
can fix the severe cases.

Based on drm-tip. Tested for several days on both ARL machines under
desktop and VM-heavy workloads.

Thanks,
Tales

Tales A. Mendonça (3):
  drm/xe: Capture devcoredump on TLB invalidation timeout
  drm/xe: Log when a timed out TLB invalidation ack finally arrives
  drm/xe: Kick GuC while TLB invalidation acks are overdue

 drivers/gpu/drm/xe/xe_devcoredump.c     |  68 ++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump.h     |   6 ++
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 131 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_tlb_inval_types.h |  42 ++++++++
 4 files changed, 243 insertions(+), 4 deletions(-)

-- 
2.55.0

