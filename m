Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DE7D46634
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 22:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F0E10E7D6;
	Thu, 15 Jan 2026 22:48:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D7110E0CA;
 Thu, 15 Jan 2026 22:48:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_more_info_t?=
 =?utf-8?q?o_powergate=5Finfo_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Jan 2026 22:48:50 -0000
Message-ID: <176851733033.159980.2015996143400222992@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260115224040.2668209-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260115224040.2668209-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe: Add more info to powergate_info debugfs
URL   : https://patchwork.freedesktop.org/series/160164/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
ee83616c430ce70bd254bd2774d143a5733c8666
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fc5e0236ae9126fa6fa670538cfc54b9fd5c2e49
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Thu Jan 15 14:40:40 2026 -0800

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
    
    Signed-off-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 7488f4d19288e0919c24ffc8b2c375e8b7c8a823 drm-intel
535ce2a4aae5 drm/xe: Add GSC to powergate_info
fc5e0236ae91 drm/xe: Add forcewake status to powergate_info
-:91: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'domain__' - possible side-effects?
#91: FILE: drivers/gpu/drm/xe/xe_force_wake.h:24:
+#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
+	for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
+		for_each_if((domain__ = ((fw__)->domains + \
+					 (ffs(tmp__) - 1))) && \
+					 domain__->reg_ctl.addr)

-:91: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tmp__' - possible side-effects?
#91: FILE: drivers/gpu/drm/xe/xe_force_wake.h:24:
+#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
+	for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
+		for_each_if((domain__ = ((fw__)->domains + \
+					 (ffs(tmp__) - 1))) && \
+					 domain__->reg_ctl.addr)

-:97: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fw__' - possible side-effects?
#97: FILE: drivers/gpu/drm/xe/xe_force_wake.h:30:
+#define for_each_fw_domain(domain__, fw__, tmp__) \
+	for_each_fw_domain_masked(domain__, fw__->initialized_domains, fw__, tmp__)

-:97: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'fw__' may be better as '(fw__)' to avoid precedence issues
#97: FILE: drivers/gpu/drm/xe/xe_force_wake.h:30:
+#define for_each_fw_domain(domain__, fw__, tmp__) \
+	for_each_fw_domain_masked(domain__, fw__->initialized_domains, fw__, tmp__)

-:121: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#121: FILE: drivers/gpu/drm/xe/xe_gt_idle.c:181:
+		drm_printf(p, "%s.ref_count=%u, %s.fwake=0x%x\n",
+			       xe_force_wake_domain_to_str(domain->id),

total: 0 errors, 0 warnings, 5 checks, 104 lines checked


