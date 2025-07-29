Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBED8C83F26
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B1610E6A3;
	Wed, 30 Jul 2025 14:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fOPPzMg3";
	dkim-atps=neutral
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C89F10E061
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 11:05:38 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id
 41be03b00d2f7-af51596da56so3850142a12.0
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 04:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753787138; x=1754391938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qVjAx/GPjljGiOQfDzA/cI0gXeEo2lcWvHyzfRGgd18=;
 b=fOPPzMg3GRo28bkN43BKIdUm7H+GJKH/HLBCW39+sdjF3ByvhcmJAchPlLapmP3Sn6
 PBSf8NcKxDkct509kWCmqXbgUyfOBGkq0I20PZCvVMiS4ph3CM8+8Pk0DRRdtcqd/xiI
 xG8qyw/q0YSn91t2kKQ00q8VU7iOMJNnf11dGEyR7+BVlUr+IoFp6+HIRnL12HV998DP
 G4Xkx2kEiGCogvA8pbpgKfTtQYQNAcUI2HIDeNqZnuSwUsYF960Otsgxv46FmI/3cEcw
 bWLww+IsHPVrbwPXJN0ABz64i6MGlt0tdP4IdoBWfWqZusKpF6z3Eemaydor0XPXsC8j
 fNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753787138; x=1754391938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qVjAx/GPjljGiOQfDzA/cI0gXeEo2lcWvHyzfRGgd18=;
 b=rDZXBpsUUKMA852ODsouZY3ec83J5UFhpFHd+lTwPlhRpc6uOC0D3tvlLUC14DNjvG
 dEWZjYfuSr0XkMnjP+9qP2gditjQjixtNnK+hxFh7KEfySBJu28ZEaRzXS4JjRKxOgZL
 8imCajJ0tPXPl5rGpcoiZXST3PVriINsQzbHpBTaBytbfF8rS4ODhyhf3JYv6RVwDL03
 bgENQqkXJ8/AehIDQQclLUgy/PWm9rdXeOTHncSlWk9gwhY5d6p/Q+dA6gcvRa7QvM95
 W0LvIjJyWmQ0qXhdNXwVLWx8+BXhq56pd+344CMrwH6Do8sApPu32DS390LTLCv21yXX
 JOYw==
X-Gm-Message-State: AOJu0Yxy5w7QXqErut+Y+f75Mk4RTbWMZJuODHG7RknhT58Ef1V/AeU1
 2AiCf44RhuwvjZQbKzA/P9BHk+JBKtS6VXRXzcCme9C3daWlSRAqu7svi+OjmPLNHQ==
X-Gm-Gg: ASbGncs4iMdWSIbrnqRfEAcrsKGB4IrkJsd4XQbmhkJSBSB5Xxn5dbXqAxqYwYsEWyg
 iEvlgZJYCG+nfIz+fjA5Zlyih5YmXKhuibxJf1qZU+SoiSQQRtfIVOHWConl7xTyDo6vvV7PTpS
 JG0y82vl+I/F6sSlR9eOUMhBRxt88AC88Y5PE+bOB0cmMwudWc9p0XyAxBY/I6mEi1GqhiclISr
 gisZT57gDLGW7BlT5r8E+KjNhQz2O9g6V3ET9h5f/dnwDhnduIcA+/pW8x1bGsNyj1Cg1xuVZn1
 wn1HdgRRfPawILArfF5gdZn96ear3mKOUWdjd/tpGrHXVT4u8WjTHqMaSzEtGwq4VE5hEuY7v3o
 oNt20w58kB3wBhWBBG9tySP/pGMpcmjauyxW3+bCb/wfB4M/B3A==
X-Google-Smtp-Source: AGHT+IF1ELZzJKdpQslsUHi7FZQ5vUSYWawTXVGHtqhOkWX4nj43CqxoSKZ3XPID7VpCyiElBn61Iw==
X-Received: by 2002:a17:903:15c8:b0:23f:f071:1069 with SMTP id
 d9443c01a7336-23ff0711244mr131983075ad.16.1753787137829; 
 Tue, 29 Jul 2025 04:05:37 -0700 (PDT)
Received: from git-send-email.moeko.lan ([139.227.17.83])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe30bc1fsm75929025ad.5.2025.07.29.04.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 04:05:37 -0700 (PDT)
From: Tomita Moeko <tomitamoeko@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org,
 Tomita Moeko <tomitamoeko@gmail.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 6.12 0/4] drm/xe: Fix xe_force_wake_get return handling
Date: Tue, 29 Jul 2025 19:05:21 +0800
Message-ID: <20250729110525.49838-1-tomitamoeko@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Jul 2025 14:02:27 +0000
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

This patchset fixes the xe driver probe fail with -ETIMEDOUT issue in
linux 6.12.35 and later version. The failure is caused by commit
d42b44736ea2 ("drm/xe/gt: Update handling of xe_force_wake_get return"),
which  incorrectly handles the return value of xe_force_wake_get as
"refcounted domain mask" (as introduced in 6.13), rather than status
code (as used in 6.12).

In 6.12 stable kernel, xe_force_wake_get still returns a status code.
The update incorrectly treats the return value as a mask, causing the
return value of 0 to be misinterpreted as an error. As a result, the
driver probe fails with -ETIMEDOUT in xe_pci_probe -> xe_device_probe
-> xe_gt_init_hwconfig -> xe_force_wake_get.

[ 1254.323172] xe 0000:00:02.0: [drm] Found ALDERLAKE_P (device ID 46a6) display version 13.00 stepping D0
[ 1254.323175] xe 0000:00:02.0: [drm:xe_pci_probe [xe]] ALDERLAKE_P  46a6:000c dgfx:0 gfx:Xe_LP (12.00) media:Xe_M (12.00) display:yes dma_m_s:39 tc:1 gscfi:0 cscfi:0
[ 1254.323275] xe 0000:00:02.0: [drm:xe_pci_probe [xe]] Stepping = (G:C0, M:C0, B:**)
[ 1254.323328] xe 0000:00:02.0: [drm:xe_pci_probe [xe]] SR-IOV support: no (mode: none)
[ 1254.323379] xe 0000:00:02.0: [drm:intel_pch_type [xe]] Found Alder Lake PCH
[ 1254.323475] xe 0000:00:02.0: probe with driver xe failed with error -110

Similar return handling issue cause by API mismatch are also found in:
Commit 95a75ed2b005 ("drm/xe/tests/mocs: Update xe_force_wake_get() return handling")
Commit 9ffd6ec2de08 ("drm/xe/devcoredump: Update handling of xe_force_wake_get return")

This patchset fixes them by reverting them all.

Additionally, commit deb05f8431f3 ("drm/xe/forcewake: Add a helper
xe_force_wake_ref_has_domain()") is also reverted as it is not needed in
6.12.


Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5373
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>


Tomita Moeko (4):
  Revert "drm/xe/gt: Update handling of xe_force_wake_get return"
  Revert "drm/xe/tests/mocs: Update xe_force_wake_get() return handling"
  Revert "drm/xe/devcoredump: Update handling of xe_force_wake_get
    return"
  Revert "drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()"

 drivers/gpu/drm/xe/tests/xe_mocs.c  |  21 +++---
 drivers/gpu/drm/xe/xe_devcoredump.c |  14 ++--
 drivers/gpu/drm/xe/xe_force_wake.h  |  16 -----
 drivers/gpu/drm/xe/xe_gt.c          | 105 +++++++++++++---------------
 4 files changed, 63 insertions(+), 93 deletions(-)

-- 
2.47.2

