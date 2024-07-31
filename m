Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B1AC3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 15:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708A910E66A;
	Wed, 31 Jul 2024 15:49:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DF610E66B;
 Wed, 31 Jul 2024 15:49:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Export_xe=5Fhw?=
 =?utf-8?q?=5Fengine=27s_mmio_accessors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 31 Jul 2024 15:49:03 -0000
Message-ID: <172244094314.468481.1019169910365313190@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731153422.401458-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20240731153422.401458-1-mika.kuoppala@linux.intel.com>
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

Series: drm/xe: Export xe_hw_engine's mmio accessors
URL   : https://patchwork.freedesktop.org/series/136755/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7b537a014c4c1a32250e342541870b03977fa7a4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7f0e90b1b7878b1d31c0a8fdc6d69cf14e175ea5
Author: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date:   Wed Jul 31 18:34:22 2024 +0300

    drm/xe: Export xe_hw_engine's mmio accessors
    
    Declare hw engine's mmio accessors in header file.
    This is in preparation to use these from eudebug code.
    
    v2: s/hw_engine_mmio/xe_hw_engine_mmio (Matthew)
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
+ /mt/dim checkpatch 2a74e6714291a2c9cf26c08f729d5feb203e8338 drm-intel
7f0e90b1b787 drm/xe: Export xe_hw_engine's mmio accessors
-:47: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#47: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:312:
+	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
 			       xe_bo_ggtt_addr(hwe->hwsp));

-:50: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#50: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:314:
+	xe_hw_engine_mmio_write32(hwe, RING_MODE(0),
 			       _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));

-:53: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#53: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:316:
+	xe_hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
 			       _MASKED_BIT_DISABLE(STOP_RING));

total: 0 errors, 0 warnings, 3 checks, 130 lines checked


