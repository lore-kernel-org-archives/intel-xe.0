Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BA1FF6E8B
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 22:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B195410E1CA;
	Tue, 17 Mar 2026 22:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="A8dIR7Vq";
	dkim-atps=neutral
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com
 [74.125.82.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B31E10E1C6
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 22:09:30 +0000 (UTC)
Received: by mail-dy1-f201.google.com with SMTP id
 5a478bee46e88-2c0bddb9196so1434540eec.1
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 15:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773785370; x=1774390170;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=uIAN5vdsbZd5f2zOoV460Vevj8GFJfqQqiklZn/mOn0=;
 b=A8dIR7Vqyqankb473SXsFhrm82WALWHof6aNR0gQDQYr9ChPff86oWqdZDzC9oc88j
 QPg7feiTrG3RFbF4+JDCZHfcJETv+n4pso/vaaIFjqMJvfsC4rhMnnl7Zurj4b4lLrY8
 XoW7a4N9yD9KWhtQXWCeYP2UgNzYO0YeEWAcAWizw0m7GPxABtv4qeHZKPoM5LtQE6yy
 Pkn69T+Sxszd0kpfjKtU9bvAVzWoJ2TqZZc5JgYj+AaTlDvko34ivwKXNarzCEqGCUrw
 pIm2fn4taF0Yf3vnf/jDppHs6Tzn3gL5HzRhoLuebHO7ict00f3m8n8zKs0JxCgm5ni/
 n0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773785370; x=1774390170;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uIAN5vdsbZd5f2zOoV460Vevj8GFJfqQqiklZn/mOn0=;
 b=o/cCTfZJJsoppcQwY5jheFGmUHC4v41qBHGa/LEx/ujBb3CAnohb34vf99/cu66bRn
 ksDPbA1N0S0vhkdTrlwjlb2hKmvTURpYR0WBsTPs1xUdKUxirM39JRcuitmwZdpk27+Y
 ecjcp8rQnVpIMjlY66vdhCQ5YqtJ4/tBW2eL62HCyu3prZ9gRBB/+Ejt4ZohrlJtRXFC
 xyOHzua2NvaZv5s5c/8PrB9WRHRUow4Hy4EVCWspN4JzhwemFv5FYnRE3dhkrEbQG8Wx
 Xn+AfBwiJlfWKDq9LrYaTYaOnIUV2asu+T5p1wrT5QybtamVQU4kVV1ITbZcduWbbDNL
 Ophg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqZ1AVQAc9nXVPJRj1szCyu0seB+bnXkqhhVud593Z47ZVVUKweN7wfAJ113/vNMSGBBJKgMu48Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZPAbT7cwYuODzns3vx+6gFMXUuLj0AnSrcc/YUpe0YFSR6ccu
 /qr0Iin+D6OJSOB49J/Jrhc2829QQ2Asw2gbEFoFWsKm1b1BnUUG+bsSr1hmRXwCZnTJ0Wqj/fD
 gnV8Kj+GIVu26Kg==
X-Received: from dybb24.prod.google.com ([2002:a05:693c:6098:b0:2c0:ccba:438b])
 (user=jdsultan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:5722:b0:2b0:52cc:fe69 with SMTP id
 5a478bee46e88-2c0e4f79789mr617612eec.5.1773785369435; 
 Tue, 17 Mar 2026 15:09:29 -0700 (PDT)
Date: Tue, 17 Mar 2026 15:09:01 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260317220908.130968-1-jdsultan@google.com>
Subject: [PATCH v4 0/2] Enable seamless boot (fastboot) for PTL
From: Juasheem Sultan <jdsultan@google.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Manasi Navare <navaremanasi@google.com>, Drew Davenport <ddavenport@google.com>,
 Sean Paul <seanpaul@google.com>, Samuel Jacob <samjaco@google.com>, 
 Rajat Jain <rajatja@google.com>, Juasheem Sultan <jdsultan@google.com>
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

This is the fourth version of a series of patches meant to add
support for seamless framebuffer handoff within the Xe driver. 
It was tested on Panther Lake platforms.

The goal of this series is to achieve a flicker-free transition from
the bootloader (BIOS/UEFI) to the kernel driver by strictly adhering
to the hardware state established by the firmware.

With this version, I've taken the feedback that the last version was
doing too broad of a copy of the hardware crtc state into the new 
atomic state. Rather than that, we are now instead sanitizing the 
clock values and pll state. 

The BIOS appears to set a slightly different clock than the ideal value
calculated by the driver. If these are within a small tolerance of each
other then we adopt the BIOS clock values. 

The pll state that the driver reads has bytes 4 to 8 programmed to 0
in non-ssc registers. The state read from the hardware doesn't have 
this, so we adopt the hardware state if they match without those bytes.

---
Changes since v1
- v2 Complete rewrite of the code
- v3 Resending due to failure of patches to send
- v4 Switched from complete state copy to clock sanitization

Juasheem Sultan (2):
  drm/xe/display: Fix reading the framebuffer from stolen memory
  drm/i915/display: Sync state to BIOS for seamless handoff

 drivers/gpu/drm/i915/display/intel_display.c  | 67 +++++++++++++++++++
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 22 +++++-
 2 files changed, 88 insertions(+), 1 deletion(-)

-- 
2.53.0.851.ga537e3e6e9-goog

