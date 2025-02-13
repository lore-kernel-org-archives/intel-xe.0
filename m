Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D53AC021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 20:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367D910EB8B;
	Thu, 13 Feb 2025 20:21:37 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4933A10EB8B;
 Thu, 13 Feb 2025 20:21:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Maintenence_of_devcoredum?=
 =?utf-8?q?p_=3C-=3E_GuC-Err-Capture_plumbing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Feb 2025 20:21:36 -0000
Message-ID: <173947809629.1721127.7339329930187641919@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213195139.3396082-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20250213195139.3396082-1-alan.previn.teres.alexis@intel.com>
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

Series: Maintenence of devcoredump <-> GuC-Err-Capture plumbing
URL   : https://patchwork.freedesktop.org/series/144822/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 281d76290d112c555249332e5347e4c7d688875b
Author: Alan Previn <alan.previn.teres.alexis@intel.com>
Date:   Thu Feb 13 11:51:39 2025 -0800

    drm/xe/guc: Update comments on GuC-Err-Capture flows
    
    Update the comments on GuC-Err-Capture flows with the
    updated function names.
    
    Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
    Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch 4570ecc1f49b000dbba61bb05e22ef5db89382b7 drm-intel
c7cd32b42bc5 drm/xe/guc: Rename __guc_capture_parsed_output
-:282: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#282: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 301 lines checked
3703ee83c3b1 drm/xe/guc: Don't store capture nodes in xe_devcoredump_snapshot
-:440: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#440: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:874:
+		snapshot->matched_node = xe_guc_capture_get_matching_and_lock(q, XE_ENGINE_CAPTURE_SOURCE_GUC);

total: 0 errors, 1 warnings, 0 checks, 415 lines checked
73c97de37c6f drm/xe/guc: Split engine state print between xe_hw_engine vs xe_guc_capture
acce19fc347c drm/xe/guc: Move xe_hw_engine_snapshot creation back to xe_hw_engine.c
66dd390993aa drm/xe/xe_hw_engine: Update xe_hw_engine capture for debugfs/gt_reset
281d76290d11 drm/xe/guc: Update comments on GuC-Err-Capture flows


