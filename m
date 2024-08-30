Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A15DCA0FFB
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 14:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C9010EAA1;
	Fri, 30 Aug 2024 14:20:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B92B10EAA1;
 Fri, 30 Aug 2024 14:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PF=3A_threshold_config_fi?=
 =?utf-8?q?xes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Aug 2024 14:20:32 -0000
Message-ID: <172502763243.854866.9279605004808596273@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240830132100.1704-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240830132100.1704-1-michal.wajdeczko@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: PF: threshold config fixes
URL   : https://patchwork.freedesktop.org/series/138023/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d6e8d8f18dcd580e0e0897eba5e359fe2dc11ef0
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Aug 30 15:21:00 2024 +0200

    drm/xe/pf: Reset thresholds when releasing a VF config
    
    As part of the VF config release, we should reset all parameters,
    including thresholds, to always start with the clean VF config.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 876db6b8ef45d285316cc53b5cf44cbc39aa8758 drm-intel
05d508ba75e3 drm/xe/pf: Add thresholds to the VF KLV config
-:21: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#21: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:280:
+#define encode_threshold_config(TAG, ...) ({					\
+	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
+	cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+});

total: 0 errors, 1 warnings, 0 checks, 14 lines checked
d6e8d8f18dcd drm/xe/pf: Reset thresholds when releasing a VF config
-:23: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#23: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:1849:
+#define reset_threshold_config(TAG, ...) ({				\
+	config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)] = 0;	\
+});

total: 0 errors, 1 warnings, 0 checks, 25 lines checked


