Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE952C7113E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 05:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DB110E070;
	Thu, 12 Jun 2025 05:45:31 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5086910E070;
 Thu, 12 Jun 2025 05:45:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_xe=5Flate=5Fbin?=
 =?utf-8?q?d_squash_for_CI_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Jun 2025 05:45:30 -0000
Message-ID: <174970713032.69947.374214972300372266@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250610185455.1612731-1-badal.nilawar@intel.com>
In-Reply-To: <20250610185455.1612731-1-badal.nilawar@intel.com>
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

Series: drm/xe: xe_late_bind squash for CI (rev2)
URL   : https://patchwork.freedesktop.org/series/150059/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 62a9c8e7538badb54ae8ac9cbc18a31c6575b67c
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Wed Jun 11 00:24:55 2025 +0530

    drm/xe: xe_late_bind squash for CI
    
    Do not review
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 03848f8a962392d602e7f2a6a22f2a7e3efa4a3b drm-intel
62a9c8e7538b drm/xe: xe_late_bind squash for CI
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

-:453: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#453: FILE: drivers/gpu/drm/xe/xe_late_bind_fw.c:268:
+
+}

-:718: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (0, 0)
#718: FILE: drivers/gpu/drm/xe/xe_pcode_fwctl.c:90:
+DEFINE_FREE(xe_pcode_fwctl, struct xe_pcode_fwctl_dev *, if (_T) fwctl_put(&_T->fwctl))
[...]
+static int xe_pcode_fwctl_uctx_open(struct fwctl_uctx *uctx)

-:957: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol with at least 4 lines
#957: FILE: drivers/misc/mei/late_bind/Kconfig:4:
+config INTEL_MEI_LATE_BIND
+	tristate "Intel late binding support on ME Interface"
+	select INTEL_MEI_ME
+	depends on DRM_XE
+	help
+	  MEI Support for Late Binding for Intel graphics card.
+
+	  Enables the ME FW interfaces for Late Binding for
+          Xe display driver of Intel.

-:1129: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'mei_late_bind_push_config', this function's name, in a string
#1129: FILE: drivers/misc/mei/late_bind/mei_late_bind.c:143:
+	dev_dbg(dev, "mei_late_bind_push_config status = %d\n", ret);

total: 0 errors, 4 warnings, 1 checks, 1261 lines checked


