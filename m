Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F46C30653
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 16:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618A710E319;
	Wed,  3 Jul 2024 16:42:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C704B10E319;
 Wed,  3 Jul 2024 16:42:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/2=5D_drm/xe/bmg=3A_implement_Wa=5F16023588340?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Jul 2024 16:42:56 -0000
Message-ID: <172002497681.25710.2164738680764209708@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240703124338.208220-3-matthew.auld@intel.com>
In-Reply-To: <20240703124338.208220-3-matthew.auld@intel.com>
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

Series: series starting with [CI,1/2] drm/xe/bmg: implement Wa_16023588340
URL   : https://patchwork.freedesktop.org/series/135699/
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
commit e2c9beebfe5117cc37edcb72b0828bf4424b7eac
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Jul 3 13:43:39 2024 +0100

    drm/i915: disable fbc due to Wa_16023588340
    
    On BMG-G21 we need to disable fbc due to complications around the WA.
    
    v2:
     - Try to handle with i915_drv.h and compat layer. (Rodrigo)
    v3:
     - For simplicity retreat back to the original design for now.
     - Drop the extra \ from the Makefile (Jani)
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: intel-gfx@lists.freedesktop.org
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch f9bae9be5922368e36324928b898ff4de5280e30 drm-intel
2bdecae49c9f drm/xe/bmg: implement Wa_16023588340
e2c9beebfe51 drm/i915: disable fbc due to Wa_16023588340
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:39: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#39: FILE: drivers/gpu/drm/i915/display/intel_display_wa.h:16:
+static inline bool intel_display_needs_wa_16023588340(struct drm_i915_private *i915) { return false; }

-:92: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#92: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 66 lines checked


