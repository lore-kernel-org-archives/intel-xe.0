Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC4AC71155
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 09:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C342A10EB4A;
	Fri, 20 Jun 2025 09:31:48 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55B210EB42;
 Fri, 20 Jun 2025 09:31:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/xe3lpd=3A_Prune_?=
 =?utf-8?q?modes_for_YUV420?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Jun 2025 09:31:47 -0000
Message-ID: <175041190773.97675.14292061447964701657@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250620092533.3711401-1-suraj.kandpal@intel.com>
In-Reply-To: <20250620092533.3711401-1-suraj.kandpal@intel.com>
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

Series: drm/i915/xe3lpd: Prune modes for YUV420
URL   : https://patchwork.freedesktop.org/series/150549/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e5aa00270403d0d429c7a8092be1ab5f10a692a4
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Jun 20 14:55:34 2025 +0530

    drm/i915/xe3lpd: Prune modes for YUV420
    
    We only support resolution up to 4k for single pipe when using
    YUV420 format so we prune these modes and restrict the plane size
    at src. This is because pipe scaling will not support YUV420 scaling
    for hwidth > 4096.
    
    --v2
    -Use output format to check [Ville]
    -Add Bspec references
    -Modify commit messge to point to why this is needed
    
    --v3
    -Use a function skl_scaler_mode_valid which is routed throug
    intel_pfit_mode_valid [Ville]
    -Combine the check conditons [Jonathan]
    
    --v4
    -mode_valid functions should return drm_mode_status [Jani]
    
    Bspec: 49247, 50441
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v2
+ /mt/dim checkpatch 1b4be188ae14a43b901f3005075fab3a22f77968 drm-intel
e5aa00270403 drm/i915/xe3lpd: Prune modes for YUV420
-:194: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#194: FILE: drivers/gpu/drm/i915/display/skl_scaler.h:43:
+skl_scaler_mode_valid(struct intel_display *display,
+		     const struct drm_display_mode *mode,

total: 0 errors, 0 warnings, 1 checks, 136 lines checked


