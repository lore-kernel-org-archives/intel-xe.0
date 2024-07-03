Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814FEC2BD09
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 12:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E59610E04C;
	Wed,  3 Jul 2024 12:17:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760FD10E04C;
 Wed,  3 Jul 2024 12:17:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/obsrv=3A_Rename_xe?=
 =?utf-8?q?_perf_layer_as_xe_observability_layer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Jul 2024 12:17:36 -0000
Message-ID: <172000905647.24496.5732669516616869684@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240702160740.2487279-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240702160740.2487279-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/obsrv: Rename xe perf layer as xe observability layer
URL   : https://patchwork.freedesktop.org/series/135658/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2d6a3681b02bc2a8c0bbf6c4c31bc6ab67ab31e8
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Tue Jul 2 09:07:40 2024 -0700

    drm/xe/obsrv: Rename xe perf layer as xe observability layer
    
    In Xe, the perf layer allows capture of HW counter streams. These HW
    counters are generally performance related but don't have to be necessarily
    so. Also, the name "perf" is a carryover from i915 and is not preferred.
    
    In this patch we propose the name "observability" for this common layer
    which allows capture of different types of these counter streams.
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 5ca7296d32d5ea4fd002b6adfe05ffda6d654993 drm-intel
2d6a3681b02b drm/xe/obsrv: Rename xe perf layer as xe observability layer
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:227: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#227: 
new file mode 100644

-:502: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#502: FILE: include/uapi/drm/xe_drm.h:119:
+#define DRM_IOCTL_XE_OBSRV			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSRV, struct drm_xe_obsrv_param)

total: 0 errors, 2 warnings, 0 checks, 473 lines checked


