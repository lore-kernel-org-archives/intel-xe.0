Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4C4C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 15:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE5610E525;
	Mon, 28 Jul 2025 15:33:14 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3278E10E514;
 Mon, 28 Jul 2025 15:33:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Revert_=22CCS_save_restor?=
 =?utf-8?q?e_for_IGPU=22_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Jul 2025 15:33:14 -0000
Message-ID: <175371679420.193750.13369502680389739837@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250728100248.3333-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250728100248.3333-1-satyanarayana.k.v.p@intel.com>
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

Series: Revert "CCS save restore for IGPU" (rev2)
URL   : https://patchwork.freedesktop.org/series/152172/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f0e366068144e496f9fdbbe704a97a4ee3efb53a
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Mon Jul 28 15:32:48 2025 +0530

    Revert "drm/xe/vf: Create contexts for CCS read write"
    
    The VF CCS save/restore series (patchwork #149108) has a dependency
    on the migration framework. A recent migration update in commit
    d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization")
    caused a VM crash during XE driver release for iGPU devices.
    
    This reverts commit f3009272ff2ec0498426001e4dd2a12c50234e08.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Michał Winiarski <michal.winiarski@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09 drm-intel
82ffefae8b7f Revert "drm/xe/vf: Register CCS read/write contexts with Guc"
89bb3628e5e0 Revert "drm/xe/vf: Attach and detach CCS copy commands with BO"
f0e366068144 Revert "drm/xe/vf: Create contexts for CCS read write"
-:182: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#182: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 119 lines checked


