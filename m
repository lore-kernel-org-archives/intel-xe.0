Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9197FC87FCE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 19:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA77310EA0A;
	Fri, 25 Jul 2025 19:33:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00D410EA0A;
 Fri, 25 Jul 2025 19:33:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fguc=5Fads=3A_?=
 =?utf-8?q?Consolidate_guc=5Fwaklv=5Fenable_functions_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Jul 2025 19:33:56 -0000
Message-ID: <175347203678.191141.1651323991085191856@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250725185444.81164-2-jonathan.cavitt@intel.com>
In-Reply-To: <20250725185444.81164-2-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_guc_ads: Consolidate guc_waklv_enable functions (rev3)
URL   : https://patchwork.freedesktop.org/series/152099/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63535c743231a7497a612c53f6edbb8a7d14412d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 68eab6b00240dc781cffa8ce57bc71f90152494f
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Fri Jul 25 18:54:45 2025 +0000

    drm/xe/xe_guc_ads: Consolidate guc_waklv_enable functions
    
    Presently, multiple versions of the guc_waklv_enable_.* function exist,
    all with different numbers of dwords added to the klv_entry array.  This
    is not extensible, and more duplicates of the function will need to be
    created if it ever becomes necessary to support 3 or more dwords per wa
    in the future.
    
    Consolidate the disparate guc_waklv_enable functions into a single
    guc_waklv_enable function that can take an arbitrary number of dword
    values.
    
    v2:
    - Update length value properly (Shuicheng)
    
    v3: (Harrison)
    - Use data as a term instead of dwords or arr
    - Reformat warning message to use hex values
    - Eliminate need for kzalloc and klv_entry array
    - Reorder function parameters to fix line wrapping
    
    Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Cc: Lucas De Marchi <lucas.demarch@intel.com>
    Cc: Shuicheng Lin <shuicheng.lin@intel.com>
    Cc: John Harrison <john.c.harrison@intel.com>
+ /mt/dim checkpatch 11e629e8c02307977802ba0ea8c60ddb15b17d04 drm-intel
68eab6b00240 drm/xe/xe_guc_ads: Consolidate guc_waklv_enable functions
-:169: WARNING:LINE_SPACING: Missing a blank line after declarations
#169: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:339:
+		u32 data = 0xC40;
+		guc_waklv_enable(ads, &data, sizeof(data)/sizeof(u32), &offset, &remain,

-:169: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#169: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:339:
+		guc_waklv_enable(ads, &data, sizeof(data)/sizeof(u32), &offset, &remain,
 		                                         ^

-:197: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#197: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:355:
+		guc_waklv_enable(ads, data, sizeof(data)/sizeof(u32), &offset, &remain,
 		                                        ^

total: 0 errors, 1 warnings, 2 checks, 166 lines checked


