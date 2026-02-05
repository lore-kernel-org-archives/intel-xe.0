Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00490EA7966
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 04:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B185310E04E;
	Thu,  5 Feb 2026 04:47:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2602910E04E;
 Thu,  5 Feb 2026 04:47:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_more_info_t?=
 =?utf-8?q?o_powergate=5Finfo_debugfs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Feb 2026 04:47:34 -0000
Message-ID: <177026685411.226816.6545378810360529888@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260204190314.2904009-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260204190314.2904009-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe: Add more info to powergate_info debugfs (rev2)
URL   : https://patchwork.freedesktop.org/series/160164/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9aa29789970e037f1154c9c210b4839d974ce690
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Wed Feb 4 11:03:14 2026 -0800

    drm/xe: Add forcewake status to powergate_info
    
    Dump forcewake status and ref counts for all domains as part
    of this debugfs. This is the sample output from gt1-
    
    $ cat /sys/kernel/debug/dri//0/gt1/powergate_info
    Media Power Gating Enabled: yes
    Media Slice0 Power Gate Status: down
    GSC Power Gate Status: down
    GT.ref_count=0, GT.forcewake=0x10000
    VDBox0.ref_count=0, VDBox0.forcewake=0x10000
    VEBox0.ref_count=0, VEBox0.forcewake=0x10000
    GSC.ref_count=0, GSC.forcewake=0x10000
    
    v2: Fix checkpatch issues
    
    Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
    Signed-off-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 8883ec84c85819dacca94997b60371c3ed57ee29 drm-intel
b3b85df1db07 drm/xe: Add GSC to powergate_info
9aa29789970e drm/xe: Add forcewake status to powergate_info
-:94: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'domain__' - possible side-effects?
#94: FILE: drivers/gpu/drm/xe/xe_force_wake.h:24:
+#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
+	for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
+		for_each_if(((domain__) = ((fw__)->domains + \
+					 (ffs(tmp__) - 1))) && \
+					 (domain__)->reg_ctl.addr)

-:94: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tmp__' - possible side-effects?
#94: FILE: drivers/gpu/drm/xe/xe_force_wake.h:24:
+#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
+	for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
+		for_each_if(((domain__) = ((fw__)->domains + \
+					 (ffs(tmp__) - 1))) && \
+					 (domain__)->reg_ctl.addr)

-:100: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fw__' - possible side-effects?
#100: FILE: drivers/gpu/drm/xe/xe_force_wake.h:30:
+#define for_each_fw_domain(domain__, fw__, tmp__) \
+	for_each_fw_domain_masked((domain__), (fw__)->initialized_domains, (fw__), (tmp__))

total: 0 errors, 0 warnings, 3 checks, 104 lines checked


