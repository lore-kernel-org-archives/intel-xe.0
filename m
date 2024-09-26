Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3703CDE024
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 16:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918DE10EBAC;
	Thu, 26 Sep 2024 16:57:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AD810E037;
 Thu, 26 Sep 2024 16:57:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pmu=3A_PMU_interfa?=
 =?utf-8?q?ce_for_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 16:57:33 -0000
Message-ID: <172736985398.1108182.3089282458685243828@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240925232159.2057581-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240925232159.2057581-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/pmu: PMU interface for Xe
URL   : https://patchwork.freedesktop.org/series/139121/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 46e86fb616b4ed19df1aa1fca442e4efe8e13fdf
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Wed Sep 25 16:21:59 2024 -0700

    drm/xe/pmu: Add GT frequency events
    
    Define PMU events for GT frequency (actual and requested). This is
    a port from the i915 driver implementation.
    
    Following PMU events are being added-
    
      xe_0000_00_02.0/actual-frequency-gt0/              [Kernel PMU event]
      xe_0000_00_02.0/actual-frequency-gt1/              [Kernel PMU event]
      xe_0000_00_02.0/requested-frequency-gt0/           [Kernel PMU event]
      xe_0000_00_02.0/requested-frequency-gt1/           [Kernel PMU event]
    
    v2: Checkpatch fix, moved timer code to this patch
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch ec87b409d3a9358c9a079186d528fad3f7d64334 drm-intel
f7ad341df96e drm/xe/pmu: Enable PMU interface
-:107: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#107: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 732 lines checked
e389fe0f889d drm/xe/pmu: Add GT C6 events
46e86fb616b4 drm/xe/pmu: Add GT frequency events
-:62: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#62: FILE: drivers/gpu/drm/xe/xe_pmu.c:95:
+			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
+					   enable)) - 1);

total: 0 errors, 0 warnings, 1 checks, 364 lines checked


