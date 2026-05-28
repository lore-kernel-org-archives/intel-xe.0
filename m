Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E173DCD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 22:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47D710F654;
	Thu, 28 May 2026 22:00:07 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACBD10F654;
 Thu, 28 May 2026 22:00:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_GuC_v70=2E6?=
 =?utf-8?q?5=2E0_for_BMG=2C_LNL=2C_PTL=2C_NVL-S=2C_CRI=2C_NVL-P?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 May 2026 22:00:06 -0000
Message-ID: <178000560656.21918.11407609063493297713@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260528215227.1282471-12-julia.filipchuk@intel.com>
In-Reply-To: <20260528215227.1282471-12-julia.filipchuk@intel.com>
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

Series: drm/xe/guc: GuC v70.65.0 for BMG, LNL, PTL, NVL-S, CRI, NVL-P
URL   : https://patchwork.freedesktop.org/series/167491/
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
commit faf1d943dd7bcae9367637269d08a44934609052
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Thu May 28 14:51:37 2026 -0700

    fixup! drm/xe/nvlp: Define GuC firmware for NVL-P
    
    Bump used GuC firmware version for NVL-P.
    
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 0b49edabf6b8a97a2b6bfa350422b856e83d3eb6 drm-intel
d0a14efb2fd7 Revert "drm/xe/nvlp: Define GuC firmware for NVL-P"
c4196393d89f Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
ac40c6caad91 Revert "drm/xe/pvc: Add GuC firmware definition"
0a353a6b3521 drm/xe/guc: Recommend GuC v70.65.0 for BMG, LNL, PTL
180b297b577f drm/xe/guc: Use GuC v70.65.0 for NVL-S
c166f07e289a Reapply "drm/xe/pvc: Add GuC firmware definition"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '970ed6f09d5bf13235b41daaa828ec666e1681e2', maybe rebased or not pulled?
#6: 
This reverts commit 970ed6f09d5bf13235b41daaa828ec666e1681e2.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
915c86483600 Reapply "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '51e94c566cad63181fe22946995ca2c4abfb8c68', maybe rebased or not pulled?
#7: 
This reverts commit 51e94c566cad63181fe22946995ca2c4abfb8c68.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
009cb55dc3da Reapply "drm/xe/nvlp: Define GuC firmware for NVL-P"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '677c65ce31a35cb5a702fd0020f978e024a90b62', maybe rebased or not pulled?
#6: 
This reverts commit 677c65ce31a35cb5a702fd0020f978e024a90b62.

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
20e3498d8fe7 fixup! topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI
faf1d943dd7b fixup! drm/xe/nvlp: Define GuC firmware for NVL-P


