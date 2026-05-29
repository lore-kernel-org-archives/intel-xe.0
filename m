Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBCFCD6E55
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 14:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7010A113426;
	Mon,  1 Jun 2026 14:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ac6dtwSF";
	dkim-atps=neutral
Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC7210FF6F
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 13:51:00 +0000 (UTC)
Received: by mail-dl1-f66.google.com with SMTP id
 a92af1059eb24-12ddbe104ccso10219806c88.0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 06:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780062660; x=1780667460; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rqOHPyyH5EfN3wruBEgkXAHRsiGcQZOI00mYuQNCffs=;
 b=ac6dtwSFV+UiXBKNvwuOoT2I59DwNQxS/hyajsQftE5bT4yrLYZ/QhcvOpLKcX1ARH
 dkz/u3jfAiDAO50e0E8Pcg85OYMh8KwyTLxUwRsvMDpLaBmVWx/KnWpAMq1fl8p2RqKe
 pw9Q78JQl6ONgiSlUTUDicm6HECIHN2rB+WdbB2FZ9SwplS53GZxtQsgnzJK3FwqYGD5
 CU34gQZHecs4oDilPZLSg6n30R9SktN9MykK0MDgpLIed1neRrUW3Ur5y8KnD3sJEaeS
 aNlsfTM/iaKD6Yp11cCeJVxJhmJ5uuht2isWc/MHshsMG/99rPGGuXTxQ9KqHmQ2LG0X
 qs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780062660; x=1780667460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rqOHPyyH5EfN3wruBEgkXAHRsiGcQZOI00mYuQNCffs=;
 b=UBFUD5tPZv2AXmXPb1StZlQuSWeTEKcqGVy7dFfwUN2w1gpFd7Tp2HY5urw8vXg6eS
 KPj/tLVQ/xB5CRKsQnu1wx/n3VOExuo4Ez47iYm8TlLbzNVvkQTDVlUHp70xRPbzhHwa
 coP7gUrZXUr18Vmsd+y4m9VpIwhAXALGNI8K+vibIpBO5GOxa+op1n9hQbKJP+I4KTV7
 aGbfLnAFrPvYLfAhMrNwj6RbpHvENME5MmayX17mAOioL6X4k7Kv5txkeXndXwbdVF3x
 uQh1YfDLRuJKRftAEleykc+ZvcUB/FKnPLLbIHKo3ta2Z8aB4YW3CoCb73075YFVrQO9
 kH7g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8brVt/fmtVpwh7Zv/L03/r2kSkTMGIijvaL/TZRvpmcEn5mVXHQwAn9uCwQh8mFnZuZzg0bpUX5g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLxkd8J6lgMKU0O64/00qdCdb9K3QbNEQNk3vFTpC4Uw6xJBjB
 8gxX2PsKMAITmn0sePJ3AVV5sarDV2RmJRaJq5xPipe4filYHkvwXVhD
X-Gm-Gg: Acq92OHtK1qaau5dqRUx8oNuA6x1NZtAc7VMOK15QTcUScZ3n20IphKIomJDYOoMN1p
 r/UI6d3QBOyApn/72g9mxQUcqwpQvQqiOimFQYu31p0v+JF18WNvi/tgF+SdPezxGY+6bDyDgnU
 AefdI4PZz1gWketlwnRnEXZTyAcsF+ecXbdHD87hiFSwOPM3mZw5fpAMvFzmOGMSU8HgOZr4K/E
 GUE5QxSIXaGyI9RzNo7g0PsEk00RvBSieNrMv4KgBmG8j//cI1vxrXN8LFbbP7mmlgYVZznm/SD
 Zk8vFILeCjCfpwnS+9Skn2adBCrh2aDLLJnWafCGj5KbmM8ejHXD1fWEW9d59oU3D12qaKBI2Lp
 7BENPujkm42Yfx9155GetG5+F1tGM4OLdGMyBsVu/BCRMBupZu+pwmEsQK21MFp9k+IqHN/zrnA
 BULu9McbB81prdYKJin/IOAh+JX4rGOXBR
X-Received: by 2002:a05:7022:2522:b0:136:60e7:53b with SMTP id
 a92af1059eb24-137ae975179mr1065625c88.1.1780062659647; 
 Fri, 29 May 2026 06:50:59 -0700 (PDT)
Received: from zhanwei.. ([192.227.223.214]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137b3c69c0asm1169747c88.11.2026.05.29.06.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 06:50:59 -0700 (PDT)
From: Zhan Wei <zhanwei919@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhan Wei <zhanwei919@gmail.com>
Subject: [PATCH v2] drm/xe/hwmon: document DG2 fan speed reporting quirk
Date: Fri, 29 May 2026 21:50:28 +0800
Message-ID: <20260529135028.20763-1-zhanwei919@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527115311.13398-1-zhanwei919@gmail.com>
References: <20260527115311.13398-1-zhanwei919@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Jun 2026 14:40:04 +0000
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

The number of fanN_input attributes on DG2 is hardcoded to two because
FSC_READ_NUM_FANS returns an incorrect value on some boards. How the
physical fans map onto the tach channels is left to the board vendor:
some OEMs route multiple physical fans through a single shared tach
line, in which case the unwired channel's pulse counter never
accumulates and fanN_input reads a constant 0 RPM.

This is expected behaviour for such boards rather than a driver fault,
and the driver has no reliable way to distinguish a shared-tach layout
from a genuinely silent fan. Document this so the flat DG2 fan count is
not mistaken for a bug and "fixed" by lowering it, which would hide a
working fan2 on boards that do wire two tach lines.

Signed-off-by: Zhan Wei <zhanwei919@gmail.com>
---
v1 -> v2: Drop the code change. As pointed out in review, the same PCI
  device ID ships with both shared-tach (multiple physical fans on one
  channel) and 1:1 fan wiring, and FSC_READ_NUM_FANS is unreliable on
  some boards, so the DG2 fan count cannot be lowered without hiding a
  working fan2 on boards that do wire two tach lines. Document the
  behaviour instead of changing the reported fan count.

v1: https://lore.kernel.org/intel-xe/20260527115311.13398-1-zhanwei919@gmail.com/

 Documentation/gpu/xe/index.rst    |  1 +
 Documentation/gpu/xe/xe_hwmon.rst | 48 +++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_hwmon.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 874ffcb6da3a..3c14cdcaa8a6 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -30,3 +30,4 @@ DG2, etc is provided to prototype the driver.
    xe-drm-usage-stats.rst
    xe_configfs
    xe_gt_stats
+   xe_hwmon
diff --git a/Documentation/gpu/xe/xe_hwmon.rst b/Documentation/gpu/xe/xe_hwmon.rst
new file mode 100644
index 000000000000..8cd48df59386
--- /dev/null
+++ b/Documentation/gpu/xe/xe_hwmon.rst
@@ -0,0 +1,48 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=================
+Xe HWMON support
+=================
+
+The xe driver exposes hardware monitoring sensors (power, energy,
+temperature, voltage and fan speed) through the kernel hwmon subsystem,
+typically consumed via ``/sys/class/hwmon/hwmonX/`` or tools such as
+``sensors``.
+
+Fan speed reporting
+===================
+
+Fan speed (``fanN_input``) is reported in RPM and computed from a tach
+pulse counter: the driver reads an accumulating pulse register, divides
+the delta between two subsequent readings by two pulses per rotation,
+and time-averages the result.
+
+Number of fan channels
+-----------------------
+
+The number of ``fanN_input`` attributes exposed in sysfs is the fan
+count returned by the ``FSC_READ_NUM_FANS`` pcode command. On DG2 this
+command has been found to return an incorrect value on some boards, so
+the driver hardcodes a fan count of two there. As a result up to
+``fan1_input`` and ``fan2_input`` are always exposed on DG2 regardless
+of how many tach lines are actually wired.
+
+Zero RPM on DG2 is not necessarily a bug
+----------------------------------------
+
+How physical fans map onto the tach channels is left to the board
+vendor. Some OEMs route several physical fans through a single shared
+tach line, while others wire each fan to its own channel 1:1. The
+driver has no reliable way to tell these layouts apart, and the same PCI
+device ID can ship in either configuration.
+
+When a channel has no tach line driving it, its pulse counter never
+accumulates, so the corresponding ``fanN_input`` reads a constant 0 RPM.
+On DG2 this is most often seen on ``fan2_input`` for boards that drive
+both physical fans from a single tach line. This is expected behaviour
+for such boards, not a driver fault, and reflects the board wiring
+rather than a missing or stalled fan.
+
+For this reason the fan count on DG2 is intentionally left at a flat
+value rather than tracked per board: there is no driver-visible signal
+that distinguishes a shared-tach layout from a genuinely silent fan.
-- 
2.43.0

