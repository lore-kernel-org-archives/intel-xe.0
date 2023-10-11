Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09407CDB465
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 23:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBADA10E260;
	Wed, 11 Oct 2023 23:01:54 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 83BFE10E260;
 Wed, 11 Oct 2023 23:01:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 81CCDA3ECB;
 Wed, 11 Oct 2023 23:01:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Wed, 11 Oct 2023 23:01:52 -0000
Message-ID: <169706531252.26515.9075209893964410277@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231011172643.826452-1-ashutosh.dixit@intel.com>
In-Reply-To: <20231011172643.826452-1-ashutosh.dixit@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Xe?=
 =?utf-8?q?_PERF_layer?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Xe PERF layer
URL   : https://patchwork.freedesktop.org/series/124994/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1c7545a30325e8238f0df0a4fdc937a8284330dd
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Wed Oct 11 10:26:42 2023 -0700

    drm/xe/uapi: Multiplex PERF ops through a single PERF ioctl
    
    Since we are already mulitplexing multiple perf counter stream types
    through the PERF layer, it seems odd to retain separate ioctls for perf
    op's (add/remove config). In fact it seems logical to also multiplex these
    ops through a single PERF ioctl. This also affords greater flexibility to
    add stream specific ops if needed for different perf stream types.
    
    v2: Add 'enum drm_xe_perf_op' previously missed out (Guy Zadicario)
        Add DRM_ prefix to perf op names and more consistent naming
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch fe4d6ceb20b5ebad356c722396c2c06d4485c359 drm-intel
1441d9fbe drm/xe/uapi: "Perf" layer to support multiple perf counter stream types
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
v3: Rename 'enum drm_xe_perf_ops' to 'enum drm_xe_perf_ioctls' (Guy Zadicario)

-:57: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#57: 
new file mode 100644

-:151: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#151: FILE: include/uapi/drm/xe_drm.h:133:
+#define DRM_IOCTL_XE_PERF_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_OPEN, struct drm_xe_perf_param)

-:152: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#152: FILE: include/uapi/drm/xe_drm.h:134:
+#define DRM_IOCTL_XE_PERF_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_ADD_CONFIG, struct drm_xe_perf_param)

-:153: WARNING:LONG_LINE: line length of 127 exceeds 100 columns
#153: FILE: include/uapi/drm/xe_drm.h:135:
+#define DRM_IOCTL_XE_PERF_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_REMOVE_CONFIG, struct drm_xe_perf_param)

total: 0 errors, 5 warnings, 0 checks, 155 lines checked
1c7545a30 drm/xe/uapi: Multiplex PERF ops through a single PERF ioctl
-:107: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#107: FILE: include/uapi/drm/xe_drm.h:131:
+#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)

total: 0 errors, 1 warnings, 0 checks, 101 lines checked


