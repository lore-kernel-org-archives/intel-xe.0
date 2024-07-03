Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0A7C30653
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 17:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A201210E984;
	Wed,  3 Jul 2024 17:41:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CB410E984;
 Wed,  3 Jul 2024 17:41:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/uapi=3A_Rename_xe_?=
 =?utf-8?q?perf_layer_as_xe_observation_layer_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Jul 2024 17:41:44 -0000
Message-ID: <172002850458.26992.8989391360737527143@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240703164801.2561423-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240703164801.2561423-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/uapi: Rename xe perf layer as xe observation layer (rev5)
URL   : https://patchwork.freedesktop.org/series/135667/
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
commit 11a1290b2a784b0c68893d58078603e9fbe42bc3
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Wed Jul 3 09:48:01 2024 -0700

    drm/xe/uapi: Rename xe perf layer as xe observation layer
    
    In Xe, the perf layer allows capture of HW counter streams. These HW
    counters are generally performance related but don't have to be necessarily
    so. Also, the name "perf" is a carryover from i915 and is not preferred.
    
    Here we propose the name "observation" for this common layer which allows
    capture of different types of these counter streams.
    
    v2: Rename observability layer to observation layer and in code
        s/obsrv/observation/ (Lucas/Rodrigo)
    v3: Rename sysctl file to "observation_paranoid" (from
        "xe_observation_paranoid") (Jose)
    
    Fixes: 52c2e956dceb ("drm/xe/perf/uapi: "Perf" layer to support multiple
           perf counter stream types")
    Fixes: fe8929bdf835 ("drm/xe/perf/uapi: Add perf_stream_paranoid sysctl")
    Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Acked-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch f9bae9be5922368e36324928b898ff4de5280e30 drm-intel
11a1290b2a78 drm/xe/uapi: Rename xe perf layer as xe observation layer
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:21: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: 11a1290b2a78 ("drm/xe/uapi: Rename xe perf layer as xe observation layer")'
#21: 
Fixes: 52c2e956dceb ("drm/xe/perf/uapi: "Perf" layer to support multiple

-:240: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#240: 
new file mode 100644

-:515: WARNING:LONG_LINE: line length of 127 exceeds 100 columns
#515: FILE: include/uapi/drm/xe_drm.h:119:
+#define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)

total: 0 errors, 3 warnings, 0 checks, 477 lines checked


