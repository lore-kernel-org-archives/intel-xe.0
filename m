Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A77EB64DA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 15:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0FC10E376;
	Tue, 18 Jul 2023 15:52:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E80F410E374;
 Tue, 18 Jul 2023 15:52:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E4DADAADE0;
 Tue, 18 Jul 2023 15:52:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Tue, 18 Jul 2023 15:52:34 -0000
Message-ID: <168969555493.22203.2822105540648669574@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230718133216.3079521-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230718133216.3079521-1-himal.prasad.ghimiray@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/120919/
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
commit 0165f5d1bb25154886381f0b2c996c37a9ad73a8
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue Jul 18 19:02:16 2023 +0530

    drm/xe: Introduce fault injection for gt reset
    
    To trigger gt reset failure:
     echo 100 >  /sys/kernel/debug/dri/<cardX>/fail_gt_reset/probability
     echo 2 >  /sys/kernel/debug/dri/<cardX>/fail_gt_reset/times
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch a43fd52b7ab2009631518ead5ca0afe9bc44515a drm-intel
ce6aaa08f drm/xe: Notify Userspace when gt reset fails
-:27: WARNING:BAD_SIGN_OFF: Duplicate signature
#27: 
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

total: 0 errors, 1 warnings, 0 checks, 50 lines checked
0165f5d1b drm/xe: Introduce fault injection for gt reset
-:93: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (16, 0)
#93: FILE: drivers/gpu/drm/xe/xe_gt.h:17:
 		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
[...]
+extern struct fault_attr gt_reset_failure;

total: 0 errors, 1 warnings, 0 checks, 78 lines checked


