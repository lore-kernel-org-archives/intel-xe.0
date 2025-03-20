Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FBCC28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 15:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18C510E637;
	Thu, 20 Mar 2025 15:35:50 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DB810E09B;
 Thu, 20 Mar 2025 15:35:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Add_LFD_for?=
 =?utf-8?q?mat_output_for_guc_log?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Mar 2025 15:35:50 -0000
Message-ID: <174248495068.58802.4401156801969332913@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250320150320.3595975-1-zhanjun.dong@intel.com>
In-Reply-To: <20250320150320.3595975-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Add LFD format output for guc log
URL   : https://patchwork.freedesktop.org/series/146541/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f85812761b97f2dafab608d0e2ad7e99187aac22
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Thu Mar 20 08:03:20 2025 -0700

    drm/xe/guc: Add LFD format output for guc log
    
    Add new debugfs entry "guc_log_lfd", which supports output guc log
    in LFD format.
    Add flag of GuC crash dump received from GuC, LFD only include crash dump
    section when this flag is set.
    
    Reference:
    https://coredocs.intel.com/InterfaceDocs/sphinx/core/debug.html#streaming-log-file-format-lfds
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch 4b4b30b32b4d8a7e6f48c0e9dd8fc29aecd39b11 drm-intel
f85812761b97 drm/xe/guc: Add LFD format output for guc log
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
https://coredocs.intel.com/InterfaceDocs/sphinx/core/debug.html#streaming-log-file-format-lfds

-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 908 lines checked


