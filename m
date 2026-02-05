Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED6CECD99C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 20:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8848810E02F;
	Thu,  5 Feb 2026 20:04:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2615510E02F;
 Thu,  5 Feb 2026 20:04:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Recommend_G?=
 =?utf-8?q?uC_v70=2E58=2E0_for_LNL=2C_BMG=2C_PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Feb 2026 20:04:56 -0000
Message-ID: <177032189612.228376.14338803313315013336@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260205195833.2928038-9-julia.filipchuk@intel.com>
In-Reply-To: <20260205195833.2928038-9-julia.filipchuk@intel.com>
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

Series: drm/xe/guc: Recommend GuC v70.58.0 for LNL, BMG, PTL
URL   : https://patchwork.freedesktop.org/series/161216/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 06e5cd0aa3d0421b71942d411d741346ae7c3bfd
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Thu Feb 5 11:57:54 2026 -0800

    Reapply "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
    
    This reverts commit d3040547755510012b34fc2794063ca0fe5fd9f1.
    
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch f32d8500ec1a75b4c8dd4ca75cba6ce85f525a96 drm-intel
2f958bd2a8f4 Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
f17f328c8c9b Revert "drm/xe/nvls: Define GuC firmware for NVL-S"
734a9f19962c Revert "drm/xe/pvc: Add GuC firmware definition"
68b33ba087c7 drm/xe/guc: Recommend GuC v70.58.0 for BMG, LNL, PTL
fcc65bc4b632 Reapply "drm/xe/pvc: Add GuC firmware definition"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'b23fe450714eec8959fd4b496552cf64bb66d246', maybe rebased or not pulled?
#6: 
This reverts commit b23fe450714eec8959fd4b496552cf64bb66d246.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
856b85e56c32 Reapply "drm/xe/nvls: Define GuC firmware for NVL-S"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a71f370f7f257298a4c56ccca5534289153d1e87', maybe rebased or not pulled?
#6: 
This reverts commit a71f370f7f257298a4c56ccca5534289153d1e87.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
06e5cd0aa3d0 Reapply "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'd3040547755510012b34fc2794063ca0fe5fd9f1', maybe rebased or not pulled?
#7: 
This reverts commit d3040547755510012b34fc2794063ca0fe5fd9f1.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


