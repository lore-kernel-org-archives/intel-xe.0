Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BE4C001DF
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 15:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570C110E0EC;
	Tue, 25 Jul 2023 15:17:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A7C3710E140;
 Tue, 25 Jul 2023 15:17:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A4337AADDA;
 Tue, 25 Jul 2023 15:17:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Date: Tue, 25 Jul 2023 15:17:34 -0000
Message-ID: <169029825466.27668.13698796661835541499@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230725150951.3757483-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230725150951.3757483-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_No?=
 =?utf-8?q?tify_userspace_about_uevent_failure?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Notify userspace about uevent failure
URL   : https://patchwork.freedesktop.org/series/121320/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 87d96af6e891c4f0b34986434ed56871dff858fc
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue Jul 25 20:39:51 2023 +0530

    fault-inject: Include linux/types.h by default.
    
    Functions should_fail_alloc_page, should_failslab, and __should_failslab
    are declared irrespective of CONFIG_FAULT_INJECTION. These functions use
    bool and gfp_t types, which are treated as unknown when CONFIG_FAULT_INJECTION
    is disabled because the inclusion of linux/types.h is missing.
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch c7ed768399f6a4769bc4c18f92605d14201b0793 drm-intel
6b2f7bdcc drm/xe: Notify Userspace when gt reset fails
bcd4c8a42 drm/xe: Introduce fault injection for gt reset
-:95: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (16, 0)
#95: FILE: drivers/gpu/drm/xe/xe_gt.h:17:
 		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
[...]
+extern struct fault_attr gt_reset_failure;

total: 0 errors, 1 warnings, 0 checks, 78 lines checked
87d96af6e fault-inject: Include linux/types.h by default.
-:8: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#8: 
bool and gfp_t types, which are treated as unknown when CONFIG_FAULT_INJECTION

total: 0 errors, 1 warnings, 0 checks, 11 lines checked


