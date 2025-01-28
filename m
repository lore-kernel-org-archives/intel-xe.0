Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1166C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 21:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6F110E105;
	Tue, 28 Jan 2025 21:21:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C2410E02E;
 Tue, 28 Jan 2025 21:21:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Maintenence_of_devcoredum?=
 =?utf-8?q?p_=3C-=3E_GuC-Err-Capture_plumbing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Jan 2025 21:21:27 -0000
Message-ID: <173809928705.2100814.5558984047421706871@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/144050/
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
commit 973a31a3458dad5d7c3338ec44298fcadee410a2
Author: Alan Previn <alan.previn.teres.alexis@intel.com>
Date:   Tue Jan 28 10:36:52 2025 -0800

    drm/xe/guc: Update comments on GuC-Err-Capture flows
    
    Update the comments on GuC-Err-Capture flows with the
    updated function names.
    
    Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
+ /mt/dim checkpatch 20759526c04a7f776f477bee66300dae33b51872 drm-intel
c6395974a545 drm/xe/guc: Rename __guc_capture_parsed_output
-:277: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#277: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 301 lines checked
5e3ad91fb7ff drm/xe/guc: Don't store capture nodes in xe_devcoredump_snapshot
-:425: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#425: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:874:
+		snapshot->matched_node = xe_guc_capture_get_matching_and_lock(q, XE_ENGINE_CAPTURE_SOURCE_GUC);

total: 0 errors, 1 warnings, 0 checks, 411 lines checked
bcb2d1bf467c drm/xe/guc: Split engine state print between xe_hw_engine vs xe_guc_capture
e6ad9b302799 drm/xe/guc: Move xe_hw_engine_snapshot creation back to xe_hw_engine.c
6fb8636286f8 drm/xe/xe_hw_engine: Update hw_engine_snapshot_capture for debugfs
973a31a3458d drm/xe/guc: Update comments on GuC-Err-Capture flows


