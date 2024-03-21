Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EB0C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 13:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DCD10EA8D;
	Thu, 21 Mar 2024 13:50:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E1010EA9A;
 Thu, 21 Mar 2024 13:50:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/mocs=3A_Add_debugf?=
 =?utf-8?q?s_node_to_dump_mocs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janga Rahul Kumar" <janga.rahul.kumar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 13:50:22 -0000
Message-ID: <171102902222.940727.16623903640385980367@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321130739.3311199-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20240321130739.3311199-1-janga.rahul.kumar@intel.com>
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

Series: drm/xe/mocs: Add debugfs node to dump mocs
URL   : https://patchwork.freedesktop.org/series/131425/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4a6de80f73bc1a7c58abc591dafcd3e5aabac095
Author: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Date:   Thu Mar 21 18:37:39 2024 +0530

    drm/xe/mocs: Add debugfs node to dump mocs
    
    This is useful to check mocs configuration. Tests/Tools can use
    this debugfs entry to get mocs info.
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
+ /mt/dim checkpatch 9ae91289c9ed219b53a3fbd25be9f414651ce4f2 drm-intel
4a6de80f73bc drm/xe/mocs: Add debugfs node to dump mocs
-:81: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#81: FILE: drivers/gpu/drm/xe/xe_mocs.c:600:
+			drm_printf(p, "GLOB_MOCS[%d] 0x%x 0x%x\n", i, XELP_GLOBAL_MOCS(i).addr, reg_val);

-:86: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#86: FILE: drivers/gpu/drm/xe/xe_mocs.c:605:
+		for (i = 0; i < (table.n_entries + 1)/2 ; i++) {
 		                                     ^

-:92: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#92: FILE: drivers/gpu/drm/xe/xe_mocs.c:611:
+			drm_printf(p, "LNCFCMOCS[%d] 0x%x 0x%x\n", i, XELP_LNCFCMOCS(i).addr, reg_val);

total: 0 errors, 2 warnings, 1 checks, 98 lines checked


