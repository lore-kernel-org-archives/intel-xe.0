Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F450C001DF
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 17:53:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEB810E194;
	Tue, 25 Jul 2023 17:53:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8DC5810E132;
 Tue, 25 Jul 2023 17:53:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8A449AADE0;
 Tue, 25 Jul 2023 17:53:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 25 Jul 2023 17:53:21 -0000
Message-ID: <169030760156.27663.4623771499680239937@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230725173245.159053-5-matthew.auld@intel.com>
In-Reply-To: <20230725173245.159053-5-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5BCI=2C1/4=5D_drm/xe/bo=3A_support_tiered_v?=
 =?utf-8?q?ram_allocation_for_small-bar?=
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

Series: series starting with [CI,1/4] drm/xe/bo: support tiered vram allocation for small-bar
URL   : https://patchwork.freedesktop.org/series/121327/
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
commit 40bbeec8e7c05c809f7887923258cf23bf88983b
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Tue Jul 25 18:32:49 2023 +0100

    HAX: force small-bar
    
    Just for CI.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch c7ed768399f6a4769bc4c18f92605d14201b0793 drm-intel
31616b748 drm/xe/bo: support tiered vram allocation for small-bar
5f04afe5a drm/xe/uapi: add the userspace bits for small-bar
-:153: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#153: FILE: drivers/gpu/drm/xe/xe_query.c:154:
+						     &usage->regions[usage->num_regions].cpu_visible_used);

total: 0 errors, 1 warnings, 0 checks, 173 lines checked
181819f8b drm/xe: fully turn on small-bar support
40bbeec8e HAX: force small-bar


