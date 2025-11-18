Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8383ECEE34C
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 19:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCBF10E4FF;
	Tue, 18 Nov 2025 19:14:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9EC10E508;
 Tue, 18 Nov 2025 19:14:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_and_refacto?=
 =?utf-8?q?r_CONFIG=5FDRM=5FXE=5FDEBUG=5FGUC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Nov 2025 19:14:02 -0000
Message-ID: <176349324219.6922.12000506484775633914@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251118-fix-debug-guc-v1-0-9f780c6bedf8@intel.com>
In-Reply-To: <20251118-fix-debug-guc-v1-0-9f780c6bedf8@intel.com>
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

Series: drm/xe: Fix and refactor CONFIG_DRM_XE_DEBUG_GUC
URL   : https://patchwork.freedesktop.org/series/157742/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 68bc19c9d3ada55338b349ea5064e52fdd1075cb
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Nov 18 11:08:12 2025 -0800

    drm/xe/guc_ct: Cleanup ifdef'ry
    
    Better split CONFIG_DRM_XE_DEBUG and CONFIG_DRM_XE_DEBUG_GUC optional
    parts from the main code, creating smaller ct_dead_* and fast_req_*
    interfaces.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch b603326a067916accf680fd623f4fc3c22bba487 drm-intel
b44ae4d95664 drm/xe/guc: Fix stack_depot usage
68bc19c9d3ad drm/xe/guc_ct: Cleanup ifdef'ry
-:173: CHECK:LINE_SPACING: Please don't use multiple blank lines
#173: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:286:
 
+

total: 0 errors, 0 warnings, 1 checks, 256 lines checked


