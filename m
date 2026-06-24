Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CEBCDB47F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 17:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9D810E0DF;
	Wed, 24 Jun 2026 17:58:25 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B3910E0DF;
 Wed, 24 Jun 2026 17:58:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vm=3A_Fix_BO_prefe?=
 =?utf-8?q?tch_with_CONSULT=5FMEM=5FADVISE=5FPREF=5FLOC_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Jun 2026 17:58:24 -0000
Message-ID: <178232390428.113086.11587398948359515107@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260624174943.2808767-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260624174943.2808767-2-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe/vm: Fix BO prefetch with CONSULT_MEM_ADVISE_PREF_LOC (rev2)
URL   : https://patchwork.freedesktop.org/series/168913/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c0305c7f96387180e005f6de9fdb61b9e231c1cb
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed Jun 24 23:19:44 2026 +0530

    drm/xe/vm: Fix BO prefetch with CONSULT_MEM_ADVISE_PREF_LOC
    
    When prefetch region is DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC for a BO VMA,
    the code used it as an index into region_to_mem_type[], causing an
    out-of-bounds access since the value is -1.
    
    Resolve the preferred location for BO VMAs directly: local VRAM on dGFX
    (using the BO's tile placement) or system memory on iGPU.
    
    Discovered using AI-assisted static analysis confirmed by Intel Product
    Security.
    
    v2:
    -Fix null dereference
    
    Reported-by: Martin Hodo <martin.hodo@intel.com>
    Fixes: c1bb69a2e8e2 ("drm/xe/svm: Consult madvise preferred location in prefetch")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch c04e038b8787434bf489ea6de4ab2e2d936083c7 drm-intel
c0305c7f9638 drm/xe/vm: Fix BO prefetch with CONSULT_MEM_ADVISE_PREF_LOC
-:19: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#19: 
Reported-by: Martin Hodo <martin.hodo@intel.com>
Fixes: c1bb69a2e8e2 ("drm/xe/svm: Consult madvise preferred location in prefetch")

total: 0 errors, 1 warnings, 0 checks, 31 lines checked


