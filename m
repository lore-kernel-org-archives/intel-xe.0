Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2D1E66886
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 04:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F391E10E0EF;
	Tue, 23 Dec 2025 04:14:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391C210E047;
 Tue, 23 Dec 2025 04:14:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_SoC_remapper_support_?=
 =?utf-8?q?for_system_controller_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Dec 2025 04:14:10 -0000
Message-ID: <176646325022.113517.9935210546269729303@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251222231755.3131809-5-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20251222231755.3131809-5-umesh.nerlige.ramappa@intel.com>
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

Series: Add SoC remapper support for system controller (rev7)
URL   : https://patchwork.freedesktop.org/series/157103/
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
commit 940b53625c07e0281d424fa0cd61b77644c250ec
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Mon Dec 22 15:17:59 2025 -0800

    drm/xe/soc_remapper: Add system controller config for SoC remapper
    
    Define system controller config bits and helpers for SoC remapper.
    
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch f101d56dc32350daa45c130ff7a6d46512f614a9 drm-intel
66d7ea345e8d drm/xe/soc_remapper: Initialize SoC remapper during Xe probe
-:65: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#65: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 70 lines checked
421050cdc512 drm/xe/soc_remapper: Use SoC remapper helper from VSEC code
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 118 lines checked
940b53625c07 drm/xe/soc_remapper: Add system controller config for SoC remapper


