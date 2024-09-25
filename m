Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEF7CCFA06
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 23:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE01310E0D5;
	Wed, 25 Sep 2024 23:05:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C9C10E0D5;
 Wed, 25 Sep 2024 23:05:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Add_XE=5FBO=5FFLAG=5FNEEDS=5FWC=5FCPU_and_unify_m?=
 =?utf-8?q?apping_for_page_tables=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Sep 2024 23:05:38 -0000
Message-ID: <172730553868.1103289.9291060516000914261@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240920190107.156914-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240920190107.156914-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [1/2] drm/xe: Add XE_BO_FLAG_NEEDS_WC_CPU and unify mapping for page tables. (rev2)
URL   : https://patchwork.freedesktop.org/series/138932/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9a35d3468546f89aeb26a867c6125c19b95dafa4
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Fri Sep 20 21:01:07 2024 +0200

    drm/xe: Use XE_BO_FLAG_NEEDS_WC_CPU for DSB
    
    Now that we have an explicit flag, we can stop abusing the scanout flag
    for this.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 88d592f72f7bc508d6a027b1f96aa2e53f803e1b drm-intel
5b3a2429e4c7 drm/xe: Add XE_BO_FLAG_NEEDS_WC_CPU and unify mapping for page tables.
-:153: CHECK:LINE_SPACING: Please don't use multiple blank lines
#153: FILE: drivers/gpu/drm/xe/xe_pt.c:2204:
+
+

total: 0 errors, 0 warnings, 1 checks, 137 lines checked
9a35d3468546 drm/xe: Use XE_BO_FLAG_NEEDS_WC_CPU for DSB


