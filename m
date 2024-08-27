Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADEEC54731
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 17:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBEA10E3C6;
	Tue, 27 Aug 2024 17:10:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2819510E3C6;
 Tue, 27 Aug 2024 17:10:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pmu=3A_Enable_PMU_?=
 =?utf-8?q?interface_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Aug 2024 17:10:06 -0000
Message-ID: <172477860615.807405.4882785896630340606@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/pmu: Enable PMU interface (rev10)
URL   : https://patchwork.freedesktop.org/series/119504/
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
commit 6cc8b540143aed3e575ef1f1799705ab74833e84
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Tue Aug 27 09:41:07 2024 -0700

    drm/xe/pmu: Add GT frequency events
    
    Define PMU events for GT freq (actual and requested).
    PMU events being added -
    
      xe_0000_00_02.0/actual-frequency-gt0/              [Kernel PMU event]
      xe_0000_00_02.0/actual-frequency-gt1/              [Kernel PMU event]
      xe_0000_00_02.0/requested-frequency-gt0/           [Kernel PMU event]
      xe_0000_00_02.0/requested-frequency-gt1/           [Kernel PMU event]
    
    These events will aggregate freq in Mhz just like sysfs. The
    implementation has been borrowed from i915 driver.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 2c3fbd94c8b2eda2275211dfa8ead639a4e3e161 drm-intel
1357293da832 drm/xe/pmu: Enable PMU interface
-:129: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#129: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 742 lines checked
3cd1f6698be8 drm/xe/pmu: Define and init a timer
-:131: ERROR:CODE_INDENT: code indent should use tabs where possible
#131: FILE: drivers/gpu/drm/xe/xe_pmu.c:189:
+        if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {$

-:131: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#131: FILE: drivers/gpu/drm/xe/xe_pmu.c:189:
+        if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {$

-:137: ERROR:CODE_INDENT: code indent should use tabs where possible
#137: FILE: drivers/gpu/drm/xe/xe_pmu.c:195:
+        }$

-:137: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#137: FILE: drivers/gpu/drm/xe/xe_pmu.c:195:
+        }$

-:256: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>' != 'Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@ntel.com>'

total: 2 errors, 3 warnings, 0 checks, 216 lines checked
1e0c7640fafe drm/xe/pmu: Add GT C6 events
-:258: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#258: FILE: drivers/gpu/drm/xe/xe_pmu.c:694:
+		store_sample(pmu, j, __XE_SAMPLE_RC6_LAST_REPORTED,
+				     val);

total: 0 errors, 0 warnings, 1 checks, 292 lines checked
6cc8b540143a drm/xe/pmu: Add GT frequency events
-:48: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#48: FILE: drivers/gpu/drm/xe/xe_pmu.c:76:
+			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
+						 enable)) - 1);

total: 0 errors, 0 warnings, 1 checks, 245 lines checked


