Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40FFE6781B
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 23:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A30410E075;
	Mon, 22 Dec 2025 23:03:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C6910E1BA;
 Mon, 22 Dec 2025 23:03:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Don=27t_use_abs?=
 =?utf-8?q?olute_path_in_generated_header_comment_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Calvin Owens" <calvin@wbinvd.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Dec 2025 23:03:30 -0000
Message-ID: <176644461041.112879.9526040035008059792@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251222165441.516102-2-rodrigo.vivi@intel.com>
In-Reply-To: <20251222165441.516102-2-rodrigo.vivi@intel.com>
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

Series: drm/xe: Don't use absolute path in generated header comment (rev2)
URL   : https://patchwork.freedesktop.org/series/156919/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99339247d1ae4378b24366da182e712bdc623311
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 49969c80142342f21d9c5e5e4894e6ecf303fb7c
Author: Calvin Owens <calvin@wbinvd.org>
Date:   Mon Dec 22 11:54:42 2025 -0500

    drm/xe: Don't use absolute path in generated header comment
    
    Building the XE driver through Yocto throws this QA warning:
    
        WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-stable/6.17/drivers/gpu/drm/xe/generated/xe_device_wa_oob.h in package linux-stable-src contains reference to TMPDIR [buildpaths]
        WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-stable/6.17/drivers/gpu/drm/xe/generated/xe_wa_oob.h in package linux-stable-src contains reference to TMPDIR [buildpaths]
    
    ...because the comment at the top of the generated header contains the
    absolute path to the rules file at build time:
    
        * This file was generated from rules: /home/calvinow/git/meta-house/build/tmp-house/work-shared/nuc14rvhu7/kernel-source/drivers/gpu/drm/xe/xe_device_wa_oob.rules
    
    Fix this minor annoyance by putting the basename of the rules file in
    the generated comment instead of the absolute path, so the generated
    header contents no longer depend on the location of the kernel source.
    
    Signed-off-by: Calvin Owens <calvin@wbinvd.org>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch f101d56dc32350daa45c130ff7a6d46512f614a9 drm-intel
49969c801423 drm/xe: Don't use absolute path in generated header comment
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
    * This file was generated from rules: /home/calvinow/git/meta-house/build/tmp-house/work-shared/nuc14rvhu7/kernel-source/drivers/gpu/drm/xe/xe_device_wa_oob.rules

-:14: WARNING:USE_RELATIVE_PATH: use relative pathname instead of absolute in changelog text
#14: 
    * This file was generated from rules: /home/calvinow/git/meta-house/build/tmp-house/work-shared/nuc14rvhu7/kernel-source/drivers/gpu/drm/xe/xe_device_wa_oob.rules

total: 0 errors, 2 warnings, 0 checks, 9 lines checked


