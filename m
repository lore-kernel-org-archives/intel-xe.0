Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BD4C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 08:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C3410E6AA;
	Wed,  6 Dec 2023 08:23:43 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB73110E6AA;
 Wed,  6 Dec 2023 08:23:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E7C77AADD1;
 Wed,  6 Dec 2023 08:23:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Wed, 06 Dec 2023 08:23:41 -0000
Message-ID: <170185102194.26425.15500148607383990833@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_En?=
 =?utf-8?q?able_compression_handling_on_LNL=2E_=28rev5=29?=
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

Series: Enable compression handling on LNL. (rev5)
URL   : https://patchwork.freedesktop.org/series/126704/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 274b29788c5d60dd99959ea4ece382a4f46d4a16
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed Dec 6 10:01:26 2023 +0530

    drm/xe/xe2: Support flat ccs
    
    Enable flat ccs for XE2_GFX_FEATURES.
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 9d76164e08c68a3d5d081ff7b07c15a2cadf741a drm-intel
5e6dcb33d drm/xe/xe2: Determine bios enablement for flat ccs on igfx
fa7b5818a drm/xe/xe2: Allocate extra pages for ccs during bo create
ccab009a2 drm/xe/xe2: Updates on XY_CTRL_SURF_COPY_BLT
714521a9e drm/xe/xe_migrate: Use NULL 1G PTE mapped at 255GiB VA for ccs clear
fc39507d1 drm/xe/xe2: Update chunk size for each iteration of ccs copy
73f2bd45d drm/xe/xe2: Update emit_pte to use compression enabled PAT index
581d87c10 drm/xe/xe2: Handle flat ccs move for igfx.
6d371be54 drm/xe/xe2: Modify xe_bo_test for system memory
274b29788 drm/xe/xe2: Support flat ccs


