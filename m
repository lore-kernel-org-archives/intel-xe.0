Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAECEFCE4D
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 22:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B79210EAD6;
	Wed,  4 Mar 2026 22:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V/ZPEn4n";
	dkim-atps=neutral
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com
 [74.125.224.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45DA10EAD8
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 22:51:50 +0000 (UTC)
Received: by mail-yx1-f44.google.com with SMTP id
 956f58d0204a3-64c9a6d6b70so6363610d50.3
 for <intel-xe@lists.freedesktop.org>; Wed, 04 Mar 2026 14:51:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772664710; cv=none;
 d=google.com; s=arc-20240605;
 b=bNVmWGXR6IwTGkQ4V0v5wgGPn0Qwov/p7SgARoHGMjlsYf7l/R0dY3i/JiB4Ml+8Zn
 haly8iRBGHudpSwhrMCuYqy4yCoGibHNtkP9J0ZAt3IEgiIFhSG28spKMXXyNqcBwuHr
 0zY1sgcpW/qJjehDwrHO4xV2iWl4jj83ZJrq2vqSi3rCwtRCvEBUxD/5pkrnXifWbVyN
 i6y4rpW04YPB77c00yDQNbbDNjNBd9ztgrTxjN6rRkFL1hKxfVYFYTJu/eQTkkxGORM1
 BGM36f9865dfL67ElQ6v/ok4ZPX+YtyxFlbf8oP/6XHkTu/CwMPAJXQumMqIqCixR0JW
 fTJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=AZRBBVuMgMsyFlTtVgZJVCUIxol7v2VYFfBvQwr+WEs=;
 fh=qxM0sBwJE6L0exVGLUyTXybLljuta0HfX5KNeiGHunM=;
 b=FIBGc2k9mQ1U7JuFdGhp5j18Hn3KfaD3XllY8QsCVq/T/WsYJydM02fflhQXMDZxBc
 FSvRXawLTaeiH2TY7DohLYYMYH48AR/5HtOyEyYQ9L0JpYAblfcCBrQqhleK7Li3Obn8
 cwjtM6B7M8bmvCU6bP072NADs8MtQ88X6Hvg9LrGya2qIQqg4lBsb5485dLVSrNK3Xo/
 w8wWCLs/c+oe7hU6C8j9xf+AmfcScRt70eF4zSeOSi8rIpa0RiS+6o6ieiFD6ZPgUkFp
 z6X/6DyMb0Z5QVcaKpxaZbGVqLB+IqvTt4/y56ACoC3fUmFpUyCg0T2llIdlqLmbsEZF
 tP3Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772664710; x=1773269510; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AZRBBVuMgMsyFlTtVgZJVCUIxol7v2VYFfBvQwr+WEs=;
 b=V/ZPEn4nielQ5fZwpeJpJ+A65iqxlX99RomZV55EAczgWY4oD4jHWsMCE/H4jfPh+g
 /wGW32hRgq0ctoWBq99xyYZ/SFKHpbzF+6usqJHyOMjg/2K1VkNTFRusi74f/tth26ai
 fTsbUdESId88UZiqaWj7vVh4Yp2NewBEaFm9yAG53r7lJ+D+jVfCRS257l8WHuXheZ7u
 J1a2xCqwqbSSemx76v49WsETGVtEqejxUIZZHUFoQK5hHcrcKoHFXrJiCKhU012+qssg
 ERDX8pk/f8eKnmkGJV2VsqOIC8g22wAQhuV9aL0gouW9K6gZ7hdoRZYHNIuD203YzmjH
 HpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772664710; x=1773269510;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AZRBBVuMgMsyFlTtVgZJVCUIxol7v2VYFfBvQwr+WEs=;
 b=kFa9SoHXjoKDfMT67iyqLTkxC2ugarPWLuIGFAom6jaOlEuVTE9irtxbw1bswN+jDT
 RNFx4c1AHUW0DL+MJGubUyfP7HQ09NOeBWBv+I6iZwk4s/BrVSbJOKkfwkUovcGkNR4x
 YWzhEP0oCJcCCydNR4xQsSfExHvDDA/6OV/ecbbV6/Q4woSyBIm+IqTrGqMIZdwxGpVU
 /xXOq9HVONmEc9souHSNAiZkeZrwLLYVyUY8/OmLQL8iWRARA/Vapm2kssCWggPjkRil
 jdTp8HuAU0WoXvxVERDLpfKiy38k+QhNhs3MWy8bArSrLzkR8QAIQs3ttQ3nsR8Qn5xv
 ZBNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU438Yp3v5OBBtkPJ46VPUjznKvdEzTCoLLzS+8Vw+gRKJHWVNrHBzkdU5HrsiMIpINllgpcjnrJA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvQF7toiL5AbVFGIDitnCpRw+h+rAEU49sBM6GPzRBEDHn1+ss
 4/xwYIYr6l187YN1Lc/CN8ZzJJKcYFuKU8SbALXirkY9mwY+YpHofBr45v0hHLkXo5zrmUcpIGJ
 riz5Hp1zn5+zV/H7noEjuGFv6v7UlaCk=
X-Gm-Gg: ATEYQzzpsllFbTkvA/sfVirrbCZNx9nMI0kTjf4yNHrXQuxarN/OW6aRgmVjVw/w28n
 4scgKrZuTmmJbfY381ax52gY4xSaVkdFghzpbK/WVeRcOcXxQUVti3XxATBZnKTGBBN0WLfFGZv
 OfdSIw/P8KKtySQ+LRhNUnmwdc0BIv8Uli8NFK36iziIHyHMmPscVij4M6Gw9mrJ5VD8QwTQn5Z
 6WAeQ/tKmRvbjxzXpGCWWkpTIw9vMeQ1lzNU2hOHxUmTU/8cBuA/8ETNBOkZY8ZZA/xIapcvnIh
 0SnhzLddLvYPceb5O3qTrENCVNb55u/a3tP4ZeeC6JL/Ije19s9bDEepd5A1+ax+Xav9Ak16Mg=
 =
X-Received: by 2002:a53:e194:0:b0:63f:b952:dfef with SMTP id
 956f58d0204a3-64cf9a744f4mr2369613d50.0.1772664709667; Wed, 04 Mar 2026
 14:51:49 -0800 (PST)
MIME-Version: 1.0
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 4 Mar 2026 14:51:39 -0800
X-Gm-Features: AaiRm50s-gj2fSMuGOm2TLbhSzJpwZLU-fGSVWEqiKUN9ws-Ey9SPJFltDHNheQ
Message-ID: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
Subject: drm_sched run_job and scheduling latency
To: ML dri-devel <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, open list <linux-kernel@vger.kernel.org>
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

Hi,

Our system compositor (surfaceflinger on android) submits gpu jobs
from a SCHED_FIFO thread to an RT gpu queue. However, because
workqueue threads are SCHED_NORMAL, the scheduling latency from submit
to run_job can sometimes cause frame misses. We are seeing this on
panthor and xe, but the issue should be common to all drm_sched users.

Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
meet future android requirements). It seems either workqueue needs to
gain RT support, or drm_sched needs to support kthread_worker.

I know drm_sched switched from kthread_worker to workqueue for better
scaling when xe was introduced. But if drm_sched can support either
workqueue or kthread_worker during drm_sched_init, drivers can
selectively use kthread_worker only for RT gpu queues. And because
drivers require CAP_SYS_NICE for RT gpu queues, this should not cause
scaling issues.

Thoughts? Or perhaps this becomes less of an issue if all drm_sched
users have concrete plans for userspace submissions..
