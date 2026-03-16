Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C66F53D8B
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 19:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9877410E359;
	Mon, 16 Mar 2026 19:52:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C99210E359;
 Mon, 16 Mar 2026 19:52:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=2Cdrm/xe=3A_Relax_hel?=
 =?utf-8?q?per_module_reference_requirement?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Mar 2026 19:52:51 -0000
Message-ID: <177369077129.363819.15403306283501597667@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260316162002.13479-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260316162002.13479-1-thomas.hellstrom@linux.intel.com>
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

Series: drm,drm/xe: Relax helper module reference requirement
URL   : https://patchwork.freedesktop.org/series/163298/
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
commit 36360d20bc6cbc994a0e15d9cafda99cd6558c71
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Mar 16 17:20:02 2026 +0100

    drm/xe: Don't unload the driver until all drm devices are freed
    
    Don't unload the driver until all drm devices are freed.
    This will help ensure that helper components don't need to
    maintain a module reference while holding a drm device reference.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 973a56bafac086c4d99d530b6896875c96120e78 drm-intel
ffbba5742299 drm: Provide a drm_dev_release_barrier() function to wait for device release callbacks
-:78: CHECK:LINE_SPACING: Please don't use multiple blank lines
#78: FILE: drivers/gpu/drm/drm_drv.c:941:
+
+

total: 0 errors, 0 warnings, 1 checks, 53 lines checked
36360d20bc6c drm/xe: Don't unload the driver until all drm devices are freed


