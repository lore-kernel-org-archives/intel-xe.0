Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10F7C021A0
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 14:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B994810E8B1;
	Wed, 12 Feb 2025 14:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel-corp-partner-google-com.20230601.gappssmtp.com header.i=@intel-corp-partner-google-com.20230601.gappssmtp.com header.b="XbWBq1VX";
	dkim-atps=neutral
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6087810E0F7
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 02:20:31 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e5b1837d182so4971601276.0
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 18:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1739240429; x=1739845229; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5krqRsRklmKPi61zTVQYxGCr8MXOV+zY9OBurxwygOM=;
 b=XbWBq1VX0h8yw/H0VJ5g61ZXSF+aBHPPDqysqswkWTTrEoM+Jjl5sOjjCH6eKZ+2w8
 IiC8XRvs+S+LH7aWgWpTTlpc4m9qRTCMXURx3lIdA80fSABh2X8QZsTCC26pPeznh3Cs
 ODDW+yskw1cTzxrPN7EpZ7AAxCLKoqwHpx+P82j0PC0uwwdZK1oyaqpxAR6v3XQX5lM9
 z0JW2H7wkJRyGkURFbFUYf8sJWUwJ1yfks6CXCtna+O473J+rM7mhhHGe+DLaHHNq0Li
 /mcAWyR95YYJfOR0pwG/N1L/4/++176TVPEV37AwwfIZ95uJSWTOwXI98SFU6M5NtHSu
 lb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739240429; x=1739845229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5krqRsRklmKPi61zTVQYxGCr8MXOV+zY9OBurxwygOM=;
 b=cH8lxfjGp9fSH24R7DCzH7bjAUinzRk8GTCIXAuAy6odXSFjcHcYfVa0g2KWrzuEsf
 yX/ZwteOqI5+AgRAgqXCLNO9vn8kcswLo6jVZVVnckENHjT8b710ub/DoHsxrShT888q
 znwYh2MP57KSwkBAc/QZJRD+lPuKL4dW1zaIb5p7mM+42WwOBsF4hh1iPiEupYmwnV7d
 1XAWrj8hbZMPsuqAU8KKB6oyfZuJXbcWF0p1iXhZ2lQfJTi2VrFUJvhymP00hxm35Z71
 kxmFa2M+bV+dVApvOHhQzw8yUXGuSFY8BCyHvpJMfR4p7xSpDDHiXRTnguJ36WsdLajN
 a8Gg==
X-Gm-Message-State: AOJu0YxsNwiYdM1MDqUzBL1hBWyQJ0eK5hS0FTQ82yH3v0AIz3IrXBKF
 RQ21y89+ThygxAdR0VjsmrrJhN5+s9BFcxShk3n4XxoHl9NdeVdkxabW1G8/jQ5rphKeH+Pw6lv
 NFtt9pw==
X-Gm-Gg: ASbGncseSG5LVZNC7ae6VoDoRXYZvMQLbTJvHvu1QIokW0yuB2W+t1SnXSvcFvFxR9+
 Wjt3DFe10K0J3E1MlnMgSOI4KpeIpT9LWqqKaggrK9WQWdoZWAk7zcrNSICWCWsQtFBo6DMYEWW
 HZm6SaW+301TQ1/cHo9RFWngQhk5ruEUeDGdwhOkyoesQltjfOL6adniE3bIm5IOBrCSdGHS+FC
 EUjOwkbscbwVmJLkPfyGWnUnnOqLs0eMrMu2bKDCQanUHZg2A/g0qkN+Af2RqVrSEqsQSz1LlXv
 Jzd65A2D4SWvDMKjSMKxqiJKYgZZHnkStIeuu75p9k+CFRG/
X-Google-Smtp-Source: AGHT+IG+sD5QlVCjPriXv7beEr3kAFgCL0q5m78a2qAqOsYmyT4MaSyqMS0KNVsxPO3DeKQ9qOyyCQ==
X-Received: by 2002:a05:6902:118e:b0:e58:2a5:241a with SMTP id
 3f1490d57ef6-e5d944affc4mr2630730276.9.1739240429542; 
 Mon, 10 Feb 2025 18:20:29 -0800 (PST)
Received: from nucskully.lan ([192.254.97.188])
 by smtp.googlemail.com with ESMTPSA id
 3f1490d57ef6-e5b3a203ef8sm2860928276.13.2025.02.10.18.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 18:20:29 -0800 (PST)
From: Carlos Santa <carlos.santa@intel.corp-partner.google.com>
X-Google-Original-From: Carlos Santa
 <carlos.santa@intel-corp-partner.google.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, lionel.g.landwerlin@intel.com,
 rodrigo.vivi@intel.com, carlos.santa@intel.com,
 Carlos Santa <carlos.santa@intel-corp-partner.google.com>
Subject: [RFC v2 0/6] Add support for Mesa GPU hang replay tool
Date: Mon, 10 Feb 2025 18:20:00 -0800
Message-ID: <20250211022006.23234-1-carlos.santa@intel-corp-partner.google.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Feb 2025 14:09:49 +0000
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

Add support for the Mesa GPU hang replay tool, which exists in the i915.

The main changes are as follows:

- Update devcoredump to include additional information, allowing the
  Mesa tool to extract everything it needs to replay a GPU hang. These
  updates are designed to remain compatible with the existing Mesa
  devcoredump parser.
- Introduce the DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE extension, which
  enables setting the execution queue state to the hung execution queue
  state.

V2
- Enable the flag DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
- Fix the page math to avoid a crash

This is being sent as an RFC, as the Mesa uAPI tool has yet to be developed. The tool is a prerequisite for merging this change.

Matt

Matthew Brost (6):
  drm/xe: Add properties line to VM snapshot capture
  drm/xe: Add "null_sparse" type to VM snap properties
  drm/xe: Add mem_region to properties line in VM snapshot capture
  drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
  drm/xe: Add replay_offset and replay_length lines to LRC HWCTX
    snapshot
  drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE

 drivers/gpu/drm/xe/xe_exec_queue.c       | 32 +++++++++++++++--
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
 drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 44 +++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_lrc.h              |  4 ++-
 drivers/gpu/drm/xe/xe_lrc_types.h        |  3 ++
 drivers/gpu/drm/xe/xe_vm.c               | 42 +++++++++++++++++++++-
 include/uapi/drm/xe_drm.h                |  9 +++--
 8 files changed, 124 insertions(+), 15 deletions(-)

-- 
2.43.0

