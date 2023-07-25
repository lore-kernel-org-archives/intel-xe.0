Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA2DC001DE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 12:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C541C10E3C4;
	Tue, 25 Jul 2023 12:17:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB5AC10E3C7;
 Tue, 25 Jul 2023 12:17:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E7FB3A47E9;
 Tue, 25 Jul 2023 12:17:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Tue, 25 Jul 2023 12:17:49 -0000
Message-ID: <169028746994.27663.16078533193902590617@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230725122022.3749616-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230725122022.3749616-1-himal.prasad.ghimiray@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/121310/
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
commit f08753f027a4899122485a36bc84da20c4bb47a8
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue Jul 25 17:50:22 2023 +0530

    drm/xe: Introduce fault injection for gt reset
    
    To trigger gt reset failure:
     echo 100 >  /sys/kernel/debug/dri/<cardX>/fail_gt_reset/probability
     echo 2 >  /sys/kernel/debug/dri/<cardX>/fail_gt_reset/times
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 9698525fb32efb5a5a439bc34b4735e0fdfafdae drm-intel
b5f699ae9 drm/xe: Notify Userspace when gt reset fails
f08753f02 drm/xe: Introduce fault injection for gt reset
-:95: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (16, 0)
#95: FILE: drivers/gpu/drm/xe/xe_gt.h:17:
 		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
[...]
+extern struct fault_attr gt_reset_failure;

total: 0 errors, 1 warnings, 0 checks, 78 lines checked


