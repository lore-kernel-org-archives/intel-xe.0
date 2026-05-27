Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F68CD6E44
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 13:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F2B10F1D3;
	Thu, 28 May 2026 13:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ieEv6UB7";
	dkim-atps=neutral
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com
 [74.125.82.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3988E10E782
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 11:54:03 +0000 (UTC)
Received: by mail-dy1-f196.google.com with SMTP id
 5a478bee46e88-3045c195251so4995519eec.1
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 04:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779882842; x=1780487642; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aunltCQrVILEaQ+TbdbV0mNvTCr1h5KSg1QSOe5Corg=;
 b=ieEv6UB75B+kQDnrthbzHW6GJsL10T0zyb77cdrsFmPMS1IpsfTPMsR4mvlvynfzdm
 g0eYcjQtyLigAJqCZSX3Bmvtg6Ef+EIKEtPpa9kDak8aPrbKnVjvnWnmac95ycBF0z5R
 gm2/PHY9vDqHT9yeM4xzIKtyjUE20bnfj0CscUpqPQzsApZJ43vlm/cs/Az9MFy/Ss+3
 m2AN2WUAoAOX0cKb+uvOlPXn2PQ6IITsWxOy09EYosXHd8SfJ/FaymGY4CTpj77UIP+U
 /GJc2JVZLjfC0dFd7NzqF+Ui8BZIsuxN++efl80csURB2RXWiEBBj/Wfs/u9/DxxODqN
 D4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779882842; x=1780487642;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aunltCQrVILEaQ+TbdbV0mNvTCr1h5KSg1QSOe5Corg=;
 b=GT3O0S7tvsz+IuFKjBI3Rj7JulMjwWL5knXDt66x6XMmZaPsmVdw7oz4zwK8EzuxJj
 7oqix30+q1/9WJuGQ2yL3hnw7K1d9za4/3CtXOKhqIscA17wxOuBzfUYQqFgOX0D6f/3
 wzOfFM5vpYiRXyh7gnvxz7+0dHAcyUeOXkGMODH+4aAGdZvwuVqNRQ2Fn2V05Meo/IbC
 vHc7IwbbYQK8P5Gf8djR2AtOrGcXWrasi/WG+pWRIWn7n1gpguP/Ragfr8X7TDitDh79
 gvTuDSScnPTabBDdYJ1XxziM3zwd931cK+yBHgjCd102ZgGDxuCZUOWZappjuP0pSjuS
 TCYA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8cccD4RDiKEAxyqElZDw9mjQM/5/K3t5xU2qrtkV4WFSjPrVOVohxnFhIDc76WPamQ6ZAaENOQ8A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySeYwWlMC1wPfqaEfcUdJKZfHWJYtTPQ1nnfvdQz2qHgCtwrAb
 hAlDHob7pKsvwaehdYmjnHhEYaxrkL2YyRz43hZGwdtY4S/DLLSk+SOd
X-Gm-Gg: Acq92OHzTEWNcSEoDv9Xd4QgnRxRgBdIdVoUM8C4yjS33ssFY4sdTfqFPd49CgyCU/n
 H0TQL3Jl2khfgGurbsWbjZYp2FY+iUYjNm6pabks58A0zm15TAevJkga3l1irnoep+qrJBQkfSM
 Nt1fdDv8NQ9Rx2kMQ3B0laXm2mJStvtrzFNbJD5faL4YkzKwoIGWH0qKRwKcWUIDTbIDiTH+aSb
 +PdS7umvueCsA/+MlRxj35KQFWZn8aCiFuFehF/AVo5c2IwPZnlDVJtio9QHb/KhNYdeMMVp9xT
 O7/Gf1hoyK3v5LRpL49dz89aAGB2lXQIMDOIw86FmGi3+IMssadce9h5Oj/F3iebCW6au7B9h13
 uSFgVE1pZjKhL/M2SVk4MzLz6cYMklU0dAy/jim2rvwtOPUvMFtY3j67RnStFC5Zrhh/wPedgdd
 YOzj+hksnMMRHI3aps+zWZoA==
X-Received: by 2002:a05:7300:8607:b0:2ed:935:aa33 with SMTP id
 5a478bee46e88-30448fd64b5mr11992768eec.5.1779882842238; 
 Wed, 27 May 2026 04:54:02 -0700 (PDT)
Received: from zhanwei.. ([192.227.223.214]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304cb5c381asm216045eec.8.2026.05.27.04.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 04:54:01 -0700 (PDT)
From: Zhan Wei <zhanwei919@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Guenter Roeck <linux@roeck-us.net>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zhan Wei <zhanwei919@gmail.com>
Subject: [RFC PATCH] drm/xe/hwmon: report a single fan for DG2 instead of two
Date: Wed, 27 May 2026 19:53:11 +0800
Message-ID: <20260527115311.13398-1-zhanwei919@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 May 2026 13:46:27 +0000
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

xe_hwmon_pcode_read_fan_control() currently hardcodes *uval = 2 when
queried with FSC_READ_NUM_FANS on DG2. This causes fan2_input to be
exposed via sysfs, but on the tested Arc A750 LE (DG2 G10, PCI ID
0x56a1) fan2_input reads 0 RPM permanently while fan1_input correctly
reports ~800 RPM with both physical fan physically spinning.

The RPM is calculated delta-based from a tach pulse counter:

    rotations = (reg_val - fi->reg_val_prev) / 2;

so a constant-zero RPM means the register at offset 0x138170
(BMG_FAN_2_SPEED) simply does not accumulate pulses on DG2 silicon.
The i915 driver does not expose fan2 on DG2 at all -- it only maps
PCU_PWM_FAN_SPEED (0x138140, identical to BMG_FAN_1_SPEED), consistent
with the observation that only one fan tach register is wired on DG2.

Report a single fan for DG2 to keep the phantom fan2_input out of
sysfs.  Battlemage paths are unchanged.

Tested on Arc A750 LE (DG2 G10): with this patch applied, fan2_input
no longer appears in /sys/class/hwmon/hwmonX/ and `sensors xe-pci-0300`
shows fan1 only.

Fixes: 28f79ac609de ("drm/xe/hwmon: expose fan speed")
Signed-off-by: Zhan Wei <zhanwei919@gmail.com>
---
Open questions for reviewers: this is verified only on DG2 G10. Owners
of G11 (e.g. ASRock Challenger A750) and G12 (e.g. Sparkle Titan A750
with three physical fans) -- does fan2_input or fan3_input ever read
non-zero in your setup? If so, the right fix is a per-subplatform
table rather than a flat 1.

 drivers/gpu/drm/xe/xe_hwmon.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index de3f2aeffc3f..2a60a76b1971 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -860,9 +860,15 @@ static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 sub
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 
-	/* Platforms that don't return correct value */
+	/*
+	 * The PCODE FAN_SPEED_CONTROL subcommands return an error on DG2, so we
+	 * answer the FSC_READ_NUM_FANS query here. DG2 only wires a single fan
+	 * tachometer register (BMG_FAN_1_SPEED == 0x138140, shared with i915's
+	 * PCU_PWM_FAN_SPEED); BMG_FAN_2/3_SPEED read 0 on DG2 silicon. Reporting
+	 * one fan keeps a phantom fan2_input that always reads 0 out of sysfs.
+	 */
 	if (hwmon->xe->info.platform == XE_DG2 && subcmd == FSC_READ_NUM_FANS) {
-		*uval = 2;
+		*uval = 1;
 		return 0;
 	}
 
-- 
2.43.0

