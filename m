Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FCFC25B67
	for <intel-xe@archiver.kernel.org>; Sat, 28 Oct 2023 03:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF9B10EAA9;
	Sat, 28 Oct 2023 03:41:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D72B710EAA9;
 Sat, 28 Oct 2023 03:41:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D2CC1AADF4;
 Sat, 28 Oct 2023 03:41:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Sat, 28 Oct 2023 03:41:27 -0000
Message-ID: <169846448785.21161.1320798545042928305@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231028033910.2479157-1-ashutosh.dixit@intel.com>
In-Reply-To: <20231028033910.2479157-1-ashutosh.dixit@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/125724/
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
commit e2ff9f145598babf4088bd0fedb7e20565a176b0
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Fri Oct 27 20:39:10 2023 -0700

    drm/xe/uapi: "Perf" layer to support multiple perf counter stream types
    
    In Xe, the plan is to support multiple types of perf counter streams (OA is
    only one type of these streams). Rather than introduce NxM ioctls for
    these (N perf streams with M ioctl's per perf stream), we decide to
    multiplex these (N different stream types and the M ops for each of these
    stream types) through a single PERF ioctl. This multiplexing is the purpose
    of the PERF layer.
    
    In addition to PERF DRM ioctl's, another set of ioctl's on the PERF fd are
    defined. These are expected to be common to different PERF stream types and
    therefore defined at the PERF layer itself.
    
    v2: Add param_size to 'struct drm_xe_perf_param' (Umesh)
    v3: Rename 'enum drm_xe_perf_ops' to
        'enum drm_xe_perf_ioctls' (Guy Zadicario)
        Add DRM_ prefix to ioctl names to indicate uapi names
    v4: Add 'enum drm_xe_perf_op' previously missed out (Guy Zadicario)
    v5: Squash the ops and PERF layer patches into a single patch (Umesh)
        Remove param_size from struct 'drm_xe_perf_param' (Umesh)
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch f24c46200dc8fad700f51106e678d68d38496860 drm-intel
e2ff9f145 drm/xe/uapi: "Perf" layer to support multiple perf counter stream types
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:61: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#61: 
new file mode 100644

-:125: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#125: FILE: include/uapi/drm/xe_drm.h:129:
+#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)

total: 0 errors, 2 warnings, 0 checks, 135 lines checked


