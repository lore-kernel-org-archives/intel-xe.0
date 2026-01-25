Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8878D13C15
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 13:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD8310E439;
	Mon, 26 Jan 2026 13:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bz7FAYJO";
	dkim-atps=neutral
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBA910E34A
 for <intel-xe@lists.freedesktop.org>; Sun, 25 Jan 2026 00:12:03 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-823075fed75so1782330b3a.1
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Jan 2026 16:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769299923; x=1769904723; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S13bvTkOJ8+hfUIaAAD5yR0hRksywvnKTFVvNAS0+Hk=;
 b=Bz7FAYJOTmt0HtG4PmWKeATFDjEHAzoAO6mIA7OiazEsFPGQ1d1f+NsX91gf5oDF+B
 cx52uMnNC0ZAUshp/2DPKiKKsPlYnh67nc4rOTRRoOlFBL+qSIWI11Flpa45EpRt3zu7
 IHTKx4hS+d/WS3EHebFkB9zvSnqTPe9RMlHqPBPJdZmh+Kqa+wJCeCE0edKXFBsyZSij
 V6Wic8T8GzstB5VgurulG0/TiCTqU9rX20AhENZAtX/9p7fLgsc+/YPsDXsFJYEuPPsr
 Iih42AtdB6dSQfSen+ed9zqoLLeLZVRGT5pXfklQp+yM8cRZ7R3pgCHvoWB0gwj21iUJ
 sJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769299923; x=1769904723;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S13bvTkOJ8+hfUIaAAD5yR0hRksywvnKTFVvNAS0+Hk=;
 b=dSoUTS1q0dqKsAN4ASKP6NXopBa5lnsKpxDe4y/D1Nb0ADWnlJbH+i0RKdejiaJ+F+
 RjxDPbBbm4H8lkLUdsU+fM/HCPRMu7OX9XReCj6cuqmSEtwBlqdWpWH1ZyFY43B/Xy8E
 1gpkbQZoGiLjEjuAROczaWAYO2t/lJoyifd6mxG9k1P7FP/0ROcmoaTsvOaAd/Zv31Q9
 KnvzE2Rzn2SCr72UsPTku3ia/qCAm6eK6bJsNE+hDODCRMJ2axEJpkuZqtAvopFL6qb8
 RYEHq++sa620OgGh/i0k5Eng4XWFaqN1v2dGxMQ1fJq43bgbehIWwkW0YPvuw3aGpGpU
 VNiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkrSVHQvnIjR/x0YmkhFQF6w9eozuPnQFtVkbkpLoK1/hU07eae/lSUIdrFTwfSs9OVo6EtvYU6g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYu4SHatL+nSHRqGc/QVskaqYxq2AcnLi8lEATIzb7891GZlI3
 zujdURnSgzuW2jZlyomjweXIkRD+4nsmm9DR6n/bGPBDtgGijHk9Ajo=
X-Gm-Gg: AZuq6aIDAl9YyHCsBTFsQKiJJ6H4m1dYjNupVjYiTXwbhhc0q/NzzoHk65jAMykrUYf
 ndt779aQVArC1mSabrix+gb/4PXzkMmKVGiLJOd24dvErweZVdbpamNAhcZ2/iN1fvQUUzIRa1C
 jQYh3GYtshhU4s9Tq7ZDyj6e3LuAXJH9PoU/TxM5Kx/TvTyARz/5xeZ1ysii2rlsToAbyZ5yl/T
 Ktjvaowk09c7B+DpCTb9xBEUW94wfdgwW37surYV/eiY+0g1Q8MjMZZbcewexu7HftltoGcSarp
 YK8UGIegB8fd9sSxnGP7Re7oaFZCOdRg9XnfgKxyPFZoKd7IujW69CQ5UCtJI972ZaMzTEVBP6I
 3baOiwbqVZtLtq/Kn2bu+mUytx/nCSsYtakgheLSKWIZYSNXz5HEgMlGxTPqTxfNnGfwfBh5H55
 ClROEdRI7392t08Q0=
X-Received: by 2002:a05:6a00:4091:b0:823:1444:7873 with SMTP id
 d2e1a72fcca58-823412bf321mr213136b3a.32.1769299922979; 
 Sat, 24 Jan 2026 16:12:02 -0800 (PST)
Received: from at.. ([171.61.161.234]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8231876e5d0sm5608273b3a.61.2026.01.24.16.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 16:12:02 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add support for eGPUs on Apple Products
Date: Sun, 25 Jan 2026 00:10:59 +0000
Message-ID: <20260125001111.1269-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 26 Jan 2026 13:55:32 +0000
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

This series adds support for eGPUs on Apple products, by
enabling apple-set-os on all apple devices.

A side effect of this patch is that the iGPU becomes enabled on iMacs.
However, iMacs can’t use the iGPU for rendering (They can't link-train
the internal display), so displays must be disabled on iMacs.


Atharva Tiwari (2):
  efi/libstub: enable apple-set-os for all apple devices
  drm/i915/display: Disable display for iMac's

 drivers/firmware/efi/libstub/x86-stub.c       | 22 +++++--------------
 .../drm/i915/display/intel_display_device.c   |  7 ++++++
 2 files changed, 12 insertions(+), 17 deletions(-)

-- 
2.43.0

