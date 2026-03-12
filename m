Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21204FED2FF
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 10:27:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D455710E9CF;
	Thu, 12 Mar 2026 10:27:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB13310E9CF;
 Thu, 12 Mar 2026 10:27:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_Xe_Correctable_?=
 =?utf-8?q?Error_Handling_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Mar 2026 10:27:31 -0000
Message-ID: <177331125181.349937.15116888279576246769@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260312090657.4026013-1-raag.jadav@intel.com>
In-Reply-To: <20260312090657.4026013-1-raag.jadav@intel.com>
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

Series: Introduce Xe Correctable Error Handling (rev3)
URL   : https://patchwork.freedesktop.org/series/160184/
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
commit 7f5afc3640464ff04b27d2ae1ee2635021c317b3
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Thu Mar 12 14:36:57 2026 +0530

    drm/xe/ras: Introduce correctable error handling
    
    Add initial support for correctable error handling which is serviced
    using system controller event. Currently we only log the errors in
    dmesg but this serves as a foundation for RAS infrastructure and will
    be further extended to facilitate other RAS features.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch a0e231ebb0df84f6febf147ee5fcaafd40c2dafe drm-intel
e888fb13cfad drm/xe/sysctrl: Add System Controller
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

-:537: WARNING:LINE_SPACING: Missing a blank line after declarations
#537: FILE: drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:227:
+	size_t remain = sizeof(*schi_hdr) + data_out_len;
+	u8 *buffer __free(kfree) = kzalloc(remain, GFP_KERNEL);

-:790: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Anoop Vijay <anoop.c.vijay@intel.com>'

total: 1 errors, 2 warnings, 0 checks, 704 lines checked
faccaf4f539a drm/xe/sysctrl: Add system controller interrupt handler
5a9a480770d6 drm/xe/sysctrl: Add system controller event support
-:51: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#51: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 173 lines checked
7f5afc364046 drm/xe/ras: Introduce correctable error handling
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

-:70: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#70: FILE: drivers/gpu/drm/xe/xe_ras.c:40:
+};
+static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);

-:81: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#81: FILE: drivers/gpu/drm/xe/xe_ras.c:51:
+};
+static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);

total: 0 errors, 1 warnings, 2 checks, 198 lines checked


