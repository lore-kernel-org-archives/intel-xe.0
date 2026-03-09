Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5C3EA8559
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 05:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0395B10E488;
	Mon,  9 Mar 2026 05:28:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2369110E488;
 Mon,  9 Mar 2026 05:28:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_support_for?=
 =?utf-8?q?_GPU_health_indicator?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Mar 2026 05:28:54 -0000
Message-ID: <177303413409.332072.13952476955389316528@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260309051705.980155-1-soham.purkait@intel.com>
In-Reply-To: <20260309051705.980155-1-soham.purkait@intel.com>
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

Series: drm/xe: Add support for GPU health indicator
URL   : https://patchwork.freedesktop.org/series/162833/
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
commit 85b1d770b5fefe6560e9ce13faf15880a8b9543b
Author: Soham Purkait <soham.purkait@intel.com>
Date:   Mon Mar 9 10:47:05 2026 +0530

    drm/xe/xe_ras: Add RAS support for GPU health indicator
    
    GPU health indicator exposes a single sysfs interface (gpu_health),
    placed in the device level that allows administrators and user-space
    tools to both query and modify the GPU health status.
    
    Signed-off-by: Soham Purkait <soham.purkait@intel.com>
+ /mt/dim checkpatch 6884fe03ff2bc5a2f501ba4710f950dd4933ac84 drm-intel
a93b57538eb4 From: Anoop Vijay <anoop.c.vijay@intel.com>
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

-:792: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Anoop Vijay <anoop.c.vijay@intel.com>'

total: 1 errors, 1 warnings, 0 checks, 704 lines checked
ed6e45e0f24d drm/xe/xe_ras: Add structures and commands for RAS GPU health indicator
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 86 lines checked
85b1d770b5fe drm/xe/xe_ras: Add RAS support for GPU health indicator
-:46: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#46: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 201 lines checked


