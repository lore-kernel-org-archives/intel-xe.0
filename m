Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E361CD8CA4
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 19:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA23D10F902;
	Mon,  8 Jun 2026 19:25:13 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AF010F902;
 Mon,  8 Jun 2026 19:25:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Recommend_G?=
 =?utf-8?q?uC_v70=2E65=2E0_for_BMG=2C_LNL=2C_PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jun 2026 19:25:13 -0000
Message-ID: <178094671334.56403.10602562574141834662@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260608191831.2337033-11-julia.filipchuk@intel.com>
In-Reply-To: <20260608191831.2337033-11-julia.filipchuk@intel.com>
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

Series: drm/xe/guc: Recommend GuC v70.65.0 for BMG, LNL, PTL
URL   : https://patchwork.freedesktop.org/series/168118/
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
commit 332fd6af5c697df7aa1c5dd0a5d6aa1601e04ad9
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Mon Jun 8 12:17:52 2026 -0700

    Reapply "topic/xe-for-CI: Define GuC firmware for NVL-P"
    
    This reverts commit 2b8d31130998ce91977cdace474490c68a3d67d5.
    
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch da64ed1114e5dad3d82db1a1925fc82c3c593745 drm-intel
25ad231937be Revert "drm/xe/pvc: Add GuC firmware definition"
94b876a9cecf Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
9a07f5e52b4c Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
49e91cf9c0f4 Revert "topic/xe-for-CI: Define GuC firmware for NVL-S"
a022310d47c2 drm/xe/guc: Recommend GuC v70.65.0 for BMG, LNL, PTL
29b9756c5ae4 Reapply "drm/xe/pvc: Add GuC firmware definition"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'e10ee038597b009b3f0e101f43aca85460b9a792', maybe rebased or not pulled?
#6: 
This reverts commit e10ee038597b009b3f0e101f43aca85460b9a792.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
484d89edd42c Reapply "topic/xe-for-CI: Define GuC firmware for NVL-S"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'bf40c39e2dbd30cbe539aa00b31c49ada2b13178', maybe rebased or not pulled?
#6: 
This reverts commit bf40c39e2dbd30cbe539aa00b31c49ada2b13178.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
2a9e8bd77d6d Reapply "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '9093a07efe5206e7d5f45238591cf88061cf566b', maybe rebased or not pulled?
#7: 
This reverts commit 9093a07efe5206e7d5f45238591cf88061cf566b.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
332fd6af5c69 Reapply "topic/xe-for-CI: Define GuC firmware for NVL-P"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '2b8d31130998ce91977cdace474490c68a3d67d5', maybe rebased or not pulled?
#6: 
This reverts commit 2b8d31130998ce91977cdace474490c68a3d67d5.

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


