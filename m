Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF14C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 23:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB5010F344;
	Fri, 22 Mar 2024 23:08:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9456110E097;
 Fri, 22 Mar 2024 23:08:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/huc=3A_Define_LNL_?=
 =?utf-8?q?HuC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Mar 2024 23:08:03 -0000
Message-ID: <171114888361.962477.2252436199048505225@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240322230040.370138-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240322230040.370138-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/huc: Define LNL HuC
URL   : https://patchwork.freedesktop.org/series/131527/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 93e5814c29fc24091c87f70d3195e61660fe346a
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Fri Mar 22 16:00:40 2024 -0700

    drm/xe/huc: Define LNL HuC
    
    First HuC release for LNL.
    
    This patch will need to stay in the xe-for-CI branch until we're
    ready to publish the HuC firmware to linux-firmware, at which point
    we can change it to use the unversioned file name and  move the it to
    drm-xe-next.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1360
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 657dd8fcd2f1d1205c6f98fdb8b60915228991d1 drm-intel
93e5814c29fc drm/xe/huc: Define LNL HuC
-:26: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#26: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:118:
+	fw_def(LUNARLAKE,	mmp_ver(intel-ci/xe, huc_gsc, lnl, 9, 4, 6))	\
 	                 	             ^

-:26: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#26: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:118:
+	fw_def(LUNARLAKE,	mmp_ver(intel-ci/xe, huc_gsc, lnl, 9, 4, 6))	\
 	                 	                ^

total: 0 errors, 0 warnings, 2 checks, 7 lines checked


