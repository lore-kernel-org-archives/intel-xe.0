Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0951AC77B73
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 15:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD1D10E371;
	Tue,  6 Jun 2023 15:28:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3534D10E371;
 Tue,  6 Jun 2023 15:28:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7C23CAADD6;
 Tue,  6 Jun 2023 15:28:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 06 Jun 2023 15:28:06 -0000
Message-ID: <168606528650.22671.6544949470727167932@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230606152420.172591-1-matthew.auld@intel.com>
In-Reply-To: <20230606152420.172591-1-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_uA?=
 =?utf-8?q?PI_bits_for_small-bar_=28rev6=29?=
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

Series: uAPI bits for small-bar (rev6)
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
commit 872c1b8cb5832c9edcc26a498f8116de1566d26a
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Tue Jun 6 16:24:20 2023 +0100

    drm/xe: fully turn on small-bar support
    
    This allows vram_size > io_size, instead of just clamping the vram size
    to the BAR size, now that the driver supports it.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
    Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
+ /mt/dim checkpatch a17ea8317b0260a1230cedb0469d4ba0cec0f4f2 drm-intel
073b39e39 drm/xe/uapi: restrict system wide accounting
-:21: WARNING:BAD_SIGN_OFF: Duplicate signature
#21: 
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

total: 0 errors, 1 warnings, 0 checks, 29 lines checked
66c5d42c5 drm/xe/uapi: add some kernel-doc for region query
275fe3dd1 drm/xe/bo: support tiered vram allocation for small-bar
207bfe843 drm/xe/uapi: add the userspace bits for small-bar
-:143: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#143: FILE: drivers/gpu/drm/xe/xe_query.c:156:
+						     &usage->regions[usage->num_regions].cpu_visible_used);

total: 0 errors, 1 warnings, 0 checks, 178 lines checked
872c1b8cb drm/xe: fully turn on small-bar support


