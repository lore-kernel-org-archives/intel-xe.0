Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BFFEB64DA
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 11:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A8B10E07A;
	Mon, 19 Jun 2023 11:31:26 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F8B310E07A;
 Mon, 19 Jun 2023 11:31:24 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4C4C8AADE8;
 Mon, 19 Jun 2023 11:31:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 19 Jun 2023 11:31:24 -0000
Message-ID: <168717428430.16528.12678435695193267565@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230619110018.53538-8-matthew.auld@intel.com>
In-Reply-To: <20230619110018.53538-8-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_uA?=
 =?utf-8?q?PI_bits_for_small-bar_=28rev7=29?=
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

Series: uAPI bits for small-bar (rev7)
URL   : https://patchwork.freedesktop.org/series/115515/
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
commit fbf2eed72568ecadfc70146a11f87c1978d86595
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Jun 19 12:00:25 2023 +0100

    drm/xe: fully turn on small-bar support
    
    This allows vram_size > io_size, instead of just clamping the vram size
    to the BAR size, now that the driver supports it.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
    Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
+ /mt/dim checkpatch e117c7bac089bb30cebf1eb8e5031627e42555a7 drm-intel
5a3e37baa drm/xe/bo: consider bo->flags in xe_bo_migrate()
802f2fb85 drm/xe/uapi: restrict system wide accounting
-:26: WARNING:BAD_SIGN_OFF: Duplicate signature
#26: 
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
4d4da6a80 drm/xe/uapi: add some kernel-doc for region query
aa56d0d98 drm/xe/bo: support tiered vram allocation for small-bar
a152eafe7 drm/xe/uapi: add the userspace bits for small-bar
-:153: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#153: FILE: drivers/gpu/drm/xe/xe_query.c:154:
+						     &usage->regions[usage->num_regions].cpu_visible_used);

total: 0 errors, 1 warnings, 0 checks, 176 lines checked
fbf2eed72 drm/xe: fully turn on small-bar support


