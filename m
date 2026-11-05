Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1B0606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 23:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B11112BA2;
	Thu,  5 Nov 2026 23:39:10 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88ACE112B9A;
 Thu,  5 Nov 2026 23:39:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Clean_up_adjust?=
 =?utf-8?q?=5Fidledly=28=29_and_implement_Wa=5F16031259911_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Nov 2026 23:39:09 -0000
Message-ID: <179392194955.129391.5834159825095728646@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
In-Reply-To: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/xe: Clean up adjust_idledly() and implement Wa_16031259911 (rev3)
URL   : https://patchwork.freedesktop.org/series/176761/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3f56a3028fa575712fa11f7c8e8e3ce3ad32b8f6
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Thu Nov 5 20:31:57 2026 -0300

    drm/xe: Implement Wa_16031259911
    
    Implement Wa_16031259911, which applies to graphics version 35.10 and
    35.11.  The workaround definition instructs us to set the minimum idle
    delay value to 2 times the memory read delay, and tells that using 1
    unit of the IDLE_DELAY field covers that minimum.
    
    Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch c699f5bed9689510eaca4ba2f72fc3f803660aaa drm-intel
987b9baff50a drm/xe: Bail from adjust_idledly() if in VF mode
9f4d042ac0d3 drm/xe: Sync Wa_16023105232 in xe_was to match OOB rule
5b1ff70bc2dd drm/xe: Use picosecond as common unit in adjust_idledly()
1d62d8a264bb drm/xe: Factor out {min,max}_idledly_ps in adjust_idledly()
-:98: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#98: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:634:
+					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);

total: 0 errors, 1 warnings, 0 checks, 140 lines checked
a4f9bda1161c drm/xe: Bail from adjust_idledly() if no applicable workaround
0890a95f8afc drm/xe: Drop early and redundant workaround checks in adjust_idledly()
2597eb621a38 drm/xe: Replace MAXCNT comment with a comment on adjust_idledly()
2dbe58c1d3bc drm/xe/guc: Increment regset size for Wa_1607983814 inside hwe loop
c46fb99dde04 drm/xe/guc: Increment regset size for RING_IDLEDLY workarounds
3f56a3028fa5 drm/xe: Implement Wa_16031259911
-:24: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#24: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:231:
+		    (XE_GT_WA(hwe->gt, 16031259911) && xe_gt_supports_multi_queue(hwe->gt, hwe->class)))

total: 0 errors, 1 warnings, 0 checks, 31 lines checked


