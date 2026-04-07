Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC0DFF512E
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 18:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC6E10E493;
	Tue,  7 Apr 2026 18:48:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E7610E493;
 Tue,  7 Apr 2026 18:48:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fsysctrl=3A_Fi?=
 =?utf-8?q?x_sparse_endian_warnings_in_mailbox_header_macros?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Apr 2026 18:48:55 -0000
Message-ID: <177558773559.438154.4130666133560667525@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260407180339.794310-2-anoop.c.vijay@intel.com>
In-Reply-To: <20260407180339.794310-2-anoop.c.vijay@intel.com>
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

Series: drm/xe/xe_sysctrl: Fix sparse endian warnings in mailbox header macros
URL   : https://patchwork.freedesktop.org/series/164466/
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
commit a7d54c232d5664b0620207e9763eccf7264bd124
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Tue Apr 7 11:03:40 2026 -0700

    drm/xe/xe_sysctrl: Fix sparse endian warnings in mailbox header macros
    
    Remove unnecessary le32_to_cpu() conversions from XE_SYSCTRL_APP_HDR_*
    macros.
    
    Fixes: 37ace5254a2b ("drm/xe/xe_sysctrl: Add ABI and mailbox interface headers")
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202604010228.Z20DhK4g-lkp@intel.com/
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 9e217a8df7b2f298a2fd850e29f970b7360dc77b drm-intel
a7d54c232d56 drm/xe/xe_sysctrl: Fix sparse endian warnings in mailbox header macros
-:4: WARNING:EMAIL_SUBJECT: A patch subject line should describe the change not the tool that found it
#4: 
Subject: [PATCH] drm/xe/xe_sysctrl: Fix sparse endian warnings in mailbox

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


