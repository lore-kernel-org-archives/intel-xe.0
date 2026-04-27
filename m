Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679E7CD13D3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 16:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFEDC10E466;
	Thu, 30 Apr 2026 16:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="aUCkBSHw";
	dkim-atps=neutral
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE6210E04D
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 16:09:19 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso146614325e9.3
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 09:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777306158; x=1777910958;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wmeTZSqYAfsukWTScmRCQsjfxaSwX1dxCUKEsS3UJO4=;
 b=aUCkBSHwM78zVfSdtSI3Ghs23Mn/vhvvc1oVDFRuCrb4R4rrUE1chz4Lp9YLn7FiAV
 nMLZb+J95D4gN5t/rG6fsRyCXj0/xSL8Y1vWR1i/ZhE+5xNgQF+Znqv3BSKO3k+ujMOa
 ix6SZSyNi708DE94J4NxgK9UZhO8HjKWFDmfKBVXg3k4XaIE8JnjR7Wtz6zuZg7fBMa2
 wgCKpsheTq55W01FuKfUHTnM0qMx6yJt0KZql5BmUvS/K4qNDioDQWymxR2OJhGOcHYh
 oGAITIypDrCxptRuuBFQZojVcc6EUM2ReBD8Ac8DMhp4rLkcQDUWB1givfFmq/ycsmJu
 PRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777306158; x=1777910958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmeTZSqYAfsukWTScmRCQsjfxaSwX1dxCUKEsS3UJO4=;
 b=h2rOczLvWL5dj8tUUhoqliddRpgeWjCn/2W4EOwowEcSw1O8HWKloNTM2uVqOzShM6
 wLkQEpnojDQ+IKGm1DvjMCpRzQ0kU5HO2LHlJWOj3rCPORd702sxEQkTbsp7xfd0pckc
 dzbd4VFU8pjZi8MY0E2YuSiW2ySDs6h5fDS2kklCwVcBvdl8Jce1NMdvI3RurILvAF0B
 k55XWyakoKfuPYw3FUvEg8UC+qMk/ffNhMR1sulfM3OXG+yhjOV+hW36FNRQiWto+unS
 fr5Jf8w+szFRV5g74qEcPdUWP3o1bXCS3lEg/VsJeAHYxaYyaUo3s5ed+zZoSxvfUzqA
 Tdpg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/N8XJ4jb6HnjIXP+kbyNGh3T2KCcGyLrq1xd+a37+41iaPnAnxyIdbC3m7gBXlrKdIOrDX8JVf6A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwUTcw7RSOm/z78FP+J7pr9Y9G9Mz1UqjVGTZDZKuRIOk9sC9m
 MEm79Q0vljaYk0Z1k8Op+O0RLxxyI5syr2my7jwjHpEcNbSieyGLX3PPdWATvn2XPNx6bTZCpVD
 k6g+g
X-Gm-Gg: AeBDievOglfuPV4YYPriQE30ZwUSK6tMVvnmW1gNKA/toobQk6bDTP+Im4mlxT8Lbpv
 oUQShBsveWbVC4j5m9efjWHWJhsB44EfCWhGoiQW0HqyjvGC2GprvN7WpcK+NlkzZyWbJmodrxE
 adTd7pbR3YG1/0TM/3SvblBmnnl3z3r+78wwynSW6gZDx2KiKm2MDYLYcHW4cOHZpugazo+otIp
 qCdQGmbZNOyxKP7M7f+GdHjH1vXgTrospc1c5Xw8bPs+MYVqQqmuI7getCIIXvpVcbpBmf6cVsJ
 rb55GRyftLRDx/opOZvyIgr35BO9AGyUUZxevR5mGsCBsYbhDu8gah4KGyYgBEqzaFgXZ1U78jY
 7NW+mtHr8O/YXn3VjPTK9WmwYv28P+B4U/Sig8e+2Vp8+Fl07J6iFFuYnmyodRYrgVRJ6qjARGF
 mFJl2g5p6OwPdiP6EPEaaIztF4lJU1Z6DePG4Dzf3RfCr3FSPWhOjBDsU6OPwlIDrAyjEK72lC2
 A1y1Ac5zq3SD8ZAq4ktMspwxA==
X-Received: by 2002:a05:600c:444a:b0:487:1520:d107 with SMTP id
 5b1f17b1804b1-488fb793580mr586443345e9.31.1777306157742; 
 Mon, 27 Apr 2026 09:09:17 -0700 (PDT)
Received: from localhost
 (p200300f65f114e08ec76e48b71c06d70.dip0.t-ipconnect.de.
 [2003:f6:5f11:4e08:ec76:e48b:71c0:6d70])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4891c08faffsm1060922375e9.1.2026.04.27.09.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 09:09:17 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe: Don't emit UTS_RELEASE as part of device coredump
Date: Mon, 27 Apr 2026 18:09:03 +0200
Message-ID: <20260427160902.1126027-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=7ULxmc7hUYR1S4INLwOW5K0zoG4kmsPVAlhrpgL4LYE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp74oelWjG3La0DzZWsmKHlMT5sRuwk2gejY5io
 fQFBGkJCjKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCae+KHgAKCRCPgPtYfRL+
 TnwDB/4m7AsHvYLAqulgtTAdaJFC1fPzTZiVIhtMG9GuQwzAxfx6PhQSBrNFftEA4NiV398Zz4p
 Ee867km6Wp3+qwvaS9G3CXnpcVIG3xDj+pw4I9gNgcnkRny7EEtD191fpjOVoLbLVbknMfDuBzi
 X/k3IQX/2CuEcpdrikcoKUA97fLoqGFnZgvdDIneVj+2OvLDwe4hVjLP4EbdoLNxMCpnJxkakuQ
 PMe5/o6rMRz/ij8/hgn1yS/BdUVjDxFrASzeR7g3xm3aOzYKzpRAsBxVldaI7D4RNu/p1rweXcn
 KiRLgv8/nuGnQPVNwKEjnLxyW8ZzrTdEIo1U4WISiqo0+XHN
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Apr 2026 16:39:35 +0000
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

UTS_RELEASE changes quite easily (e.g. uncommitted changes in the source
tree or new commits). So when checking if a patch introduces changes to the
resulting binary each usage of UTS_RELEASE is a source of annoyance as
it introduces changes not caused by the change under test.

It's little helpful to emit the kernel version in the device coredump, so
drop the kernel version line from it.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

I'm not really sure if my assertion above that the kernel version isn't
helpful is actually true.

If yes, there are a few more very similar changes to make:

	$ git grep -E 'drm_p.*UTS_RELEASE' v7.1-rc1 drivers/gpu/
	v7.1-rc1:drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:      drm_printf(&p, "kernel: " UTS_RELEASE "\n");
	v7.1-rc1:drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:     drm_printf(p, "kernel: " UTS_RELEASE "\n");
	v7.1-rc1:drivers/gpu/drm/msm/msm_gpu.c: drm_printf(&p, "kernel: " UTS_RELEASE "\n");
	v7.1-rc1:drivers/gpu/drm/xe/xe_devcoredump.c:   drm_puts(&p, "kernel: " UTS_RELEASE "\n");

Best regards
Uwe

 drivers/gpu/drm/xe/xe_devcoredump.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 558a1a9841a0..260e3f19286b 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -101,7 +101,6 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 
 	drm_puts(&p, "**** Xe Device Coredump ****\n");
 	drm_printf(&p, "Reason: %s\n", ss->reason);
-	drm_puts(&p, "kernel: " UTS_RELEASE "\n");
 	drm_puts(&p, "module: " KBUILD_MODNAME "\n");
 
 	ts = ktime_to_timespec64(ss->snapshot_time);

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3

