Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF838D3EE69
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 13:38:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951B310E9AE;
	Thu, 22 Jan 2026 13:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="SZfzG+rP";
	dkim-atps=neutral
Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411F010E62C
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 16:16:14 +0000 (UTC)
Received: by mail-dl1-f74.google.com with SMTP id
 a92af1059eb24-123840bf029so7525420c88.1
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 08:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768925773; x=1769530573;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=U0JstZ3U8EnaEwbbkqLAiAggjIS51Q+2B5R7r3dcgTs=;
 b=SZfzG+rPpFBgTzZ1QZ3HF8t9bAADDZF0hjhuhBO9h5AR7Rq3i78n8Hy1hGOZxZPP64
 hzMCgRPSeefT427RbM7wYYx/4l4c7/BC1TyNu2zrXxZ3JrabIoUF5tTO98YUUdDp7gz9
 U7stWtdBHALKqt6hCeQ2OshCWaj8oNyXsVEhE1KB6m7jFZzjUqwmu3vlwrIT5DfTUgey
 qcglzG/b9BrhTSOmEUkX+UeDIEYfytucnVjqlkPXUR7G0ZcJG48d9LC8496cvwUCYcXb
 O/8WMpcdBVUS/pn71BY3pNnZslwTtGfq05nTbOxRarqHpnPDib060uznmb6EWslNINhz
 +alQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768925773; x=1769530573;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U0JstZ3U8EnaEwbbkqLAiAggjIS51Q+2B5R7r3dcgTs=;
 b=IGHkPJ0M3mCGTxJCQWji6Z8uM9BrC/F/7IfFvG26qSRjphnSCji80f5LWMFBPOSKFa
 pPRAg+Nim2WlJOGw7bZTYTffQLru/FsV3YS/tLkzoPoEh2zcwAGVk80R/6UJVH/0Scjd
 zcntfi3NWJog9MWD4Auw2s8e4MLfuJeQZMbQOMWLtk/j/1sYGD+h+icRMW9Xa4tIP4Fo
 ArPKIaQAVyq9CUph7MgEIdS3PKHwUt2XGxDZi/nFyuQDDIbmbhQxk83NUyR0zt1YTchD
 89QBf0tNnuxQvKZrJ4oASYhgTagaU1sDfKrXHzr2/sQlI42bAKb0846mjg4Av49eUHqy
 VrdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzyoK4dcMSiIAPHzWjkEQyKVekWrHYqUiCKydX2ie/IiamO5PGmifKpbx5GTbKhkn+LqDGvzKsRA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznWL/vXjHdPC0ExumwmWSy0VhytyuD/2mB884RCsfdTH4VaF9d
 PgChThjFXY8tMIAStQAFeyqD7qu94nWvDDaSI2pv4TjopGxJQnbwNpqjKbgbdEfcMZK1USxXaBh
 A95cQSxTf5hkJuA==
X-Received: from dlah28.prod.google.com ([2002:a05:701b:261c:b0:11a:51f9:d69])
 (user=jdsultan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:f8b:b0:11f:3d55:ab9a with SMTP id
 a92af1059eb24-1244a70b337mr11389662c88.13.1768925773304; 
 Tue, 20 Jan 2026 08:16:13 -0800 (PST)
Date: Tue, 20 Jan 2026 08:13:38 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260120161539.3161533-1-jdsultan@google.com>
Subject: [RFC PATCH v2 0/2]  Enable seamless boot (fastboot) for PTL
From: Juasheem Sultan <jdsultan@google.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Juasheem Sultan <jdsultan@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Manasi Navare <navaremanasi@google.com>,
 Drew Davenport <ddavenport@google.com>, Sean Paul <seanpaul@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 22 Jan 2026 13:38:39 +0000
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

This patch series is the second revision of a series of patches meant
to add support for seamless framebuffer handoff within the Xe driver.
It was tested on Panther Lake platforms.

The goal of this series is to achieve a flicker-free transition from
the bootloader (BIOS/UEFI) to the kernel driver by strictly adhering
to the hardware state established by the firmware.

Thank you for the feedback on the previous revision.
  
This new patch series was created with that feedback in mind. That
revision was too rough of an implementation that had a considerable
amount of useless code and fixed problems that it unecessarily
introduced. Because of that, I completely reworked and rewrote the
solution into a much smaller, efficient version that properly makes
use of the existing infrastructure. This patch series has two specific
focal points. It enables Xe to properly adopt a framebuffer from bios
by fixing how we read stolen memory and it synchronizes an inherited
crtc state with the new state so that we can perform an initial commit.
This allows us to achieve seamless handoff between the firmware and
kernel with minimal changes required.

---
Changes since v1
- Complete rewrite of the code

Juasheem Sultan (2):
  drm/xe/display: Fix reading the framebuffer from stolen memory
  drm/i915/display: Synchronize crtc_state for initial commit

 drivers/gpu/drm/i915/display/intel_display.c  | 19 ++++++++++++++++
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 22 ++++++++++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)

-- 
2.52.0.457.g6b5491de43-goog

