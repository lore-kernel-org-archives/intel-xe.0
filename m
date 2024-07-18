Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32479C3DA63
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 14:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30A510E076;
	Thu, 18 Jul 2024 14:06:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9847D10E076;
 Thu, 18 Jul 2024 14:06:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Reapply_=22drm/xe/gsc=3A_?=
 =?utf-8?q?define_GSC_FW_for_LNL=22_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Jul 2024 14:06:12 -0000
Message-ID: <172131157262.286319.18373041209387678402@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240702001155.2163743-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240702001155.2163743-1-daniele.ceraolospurio@intel.com>
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

Series: Reapply "drm/xe/gsc: define GSC FW for LNL" (rev3)
URL   : https://patchwork.freedesktop.org/series/135623/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 98aef6b01a9577a04d19189df22b720234b844a0
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Mon Jul 1 17:11:55 2024 -0700

    Reapply "drm/xe/gsc: define GSC FW for LNL"
    
    Wa_22019338487 is now merged, so we can re-enable the GSC now that we
    won't hit the HW issue anymore.
    
    Note that this patch is not meant to be merged, but rather the revert
    patch should be dropped from the CI topic branch. This patch is being
    sent for CI and to get an ack on dropping that patch.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch d0e3ac45f03af2770c2027a1e9799617e1186e5c drm-intel
98aef6b01a95 Reapply "drm/xe/gsc: define GSC FW for LNL"
-:25: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#25: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:132:
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe, gsc, lnl, 1, 0, 0))	\
 	                 	               ^

-:25: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#25: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:132:
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe, gsc, lnl, 1, 0, 0))	\
 	                 	                  ^

total: 0 errors, 0 warnings, 2 checks, 7 lines checked


