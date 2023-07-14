Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B01FEB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 14:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7742710E8A9;
	Fri, 14 Jul 2023 14:50:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6ABC010E0D5;
 Fri, 14 Jul 2023 14:50:36 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 67A18A0093;
 Fri, 14 Jul 2023 14:50:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Fri, 14 Jul 2023 14:50:36 -0000
Message-ID: <168934623642.13874.10345438080040697691@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230714144814.574873-5-matthew.auld@intel.com>
In-Reply-To: <20230714144814.574873-5-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_uA?=
 =?utf-8?q?PI_bits_for_small-bar_=28rev8=29?=
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

Series: uAPI bits for small-bar (rev8)
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
commit 6f9bfe644525e074d9c815c533e5a46f5feccd98
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Jul 14 15:48:18 2023 +0100

    drm/xe: fully turn on small-bar support
    
    This allows vram_size > io_size, instead of just clamping the vram size
    to the BAR size, now that the driver supports it.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
    Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
+ /mt/dim checkpatch 17d3e3fbeb4ee15f7b89cedff2d1f2662dffbf97 drm-intel
f4ed93ef5 drm/xe/bo: support tiered vram allocation for small-bar
92de8ba55 drm/xe/uapi: add the userspace bits for small-bar
-:153: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#153: FILE: drivers/gpu/drm/xe/xe_query.c:154:
+						     &usage->regions[usage->num_regions].cpu_visible_used);

total: 0 errors, 1 warnings, 0 checks, 173 lines checked
6f9bfe644 drm/xe: fully turn on small-bar support


