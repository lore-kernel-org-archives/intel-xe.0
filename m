Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEE4C001DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 20:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC2D10E047;
	Fri, 21 Jul 2023 20:45:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A354310E6F4;
 Fri, 21 Jul 2023 20:45:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9154DAADDA;
 Fri, 21 Jul 2023 20:45:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 21 Jul 2023 20:45:01 -0000
Message-ID: <168997230159.22547.17362863362018157215@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230721202144.269837-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230721202144.269837-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Gu?=
 =?utf-8?q?C_vs_Execlist?=
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

Series: GuC vs Execlist
URL   : https://patchwork.freedesktop.org/series/121163/
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
commit 25f751bcf2e8472373f83e6c0a87f459b8c86d81
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Jul 21 16:19:14 2023 -0400

    drm/xe: Kill execlist support.
    
    This submission backend is incomplete and unsupported.
    It was left there only for some initial bring-up for comparison
    and experiments. But most of Xe driver and its features rely
    entirely on the GuC submission.
    
    If this code is not entirely broken yet, it is likely just a matter
    of time.
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 786d2a4f30e168368b4d19d3e1d2f57d18ebecf8 drm-intel
a0aa8d870 drm/xe/uapi: Remove XE_QUERY_CONFIG_FLAGS_USE_GUC
98baa451a drm/xe: Invert guc vs execlists parameters and info.
-:85: ERROR:GLOBAL_INITIALISERS: do not initialise globals to false
#85: FILE: drivers/gpu/drm/xe/xe_module.c:17:
+bool force_execlist = false;

total: 1 errors, 0 warnings, 0 checks, 59 lines checked
25f751bcf drm/xe: Kill execlist support.
-:130: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#130: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 307 lines checked


