Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AB4C83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 02:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F6B10E2EE;
	Tue, 22 Jul 2025 02:47:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D2810E2EE;
 Tue, 22 Jul 2025 02:47:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Add_LFD_for?=
 =?utf-8?q?mat_output_for_guc_log_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Jul 2025 02:47:52 -0000
Message-ID: <175315247215.178664.1860429310777712582@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
In-Reply-To: <20250722013553.1266218-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Add LFD format output for guc log (rev6)
URL   : https://patchwork.freedesktop.org/series/146541/
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
commit 6c5551e53e08652473533c7529a5498000927153
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Mon Jul 21 21:35:53 2025 -0400

    drm/xe/guc: Only add GuC crash dump if available
    
    Add GuC crash dump data empty check. LFD will only include crash dump
    section when data is not empty.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch 617f6e11e288a649addc9471911d29947c0996c8 drm-intel
5dfd41974ae4 drm/xe/guc: Add log init config abi definitions
-:11: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#11: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 107 lines checked
6d7de5755ee8 drm/xe/guc: Add LFD related abi definitions
-:11: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#11: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 282 lines checked
c5911f56b53f drm/xe/guc: Add new debugfs entry for lfd format output
0af8f8537bec drm/xe/guc: Add GuC log init config in LFD format
e9451021ed7a drm/xe/guc: Add GuC log event buffer output in LFD format
6c5551e53e08 drm/xe/guc: Only add GuC crash dump if available


