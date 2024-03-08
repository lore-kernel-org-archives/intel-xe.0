Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDB0C54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 14:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7279710E6D0;
	Fri,  8 Mar 2024 14:43:41 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F244210E6D0;
 Fri,  8 Mar 2024 14:43:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pvc=3A_fix_CI_GuC_?=
 =?utf-8?q?FW_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Mar 2024 14:43:39 -0000
Message-ID: <170990901999.629227.11873921688369651177@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240308134202.901394-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240308134202.901394-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/pvc: fix CI GuC FW path
URL   : https://patchwork.freedesktop.org/series/130919/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9bb2a8a17457065eb398a81e8fd9aec2b519fd6
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b9fc57bef4e00e48c7bebbab6dd29bb89af6afc9
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Fri Mar 8 05:42:02 2024 -0800

    drm/xe/pvc: fix CI GuC FW path
    
    The new repo flow has the CI firmwares located under the intel-ci/
    folder, so we need to update the path in the driver. This messes a bit
    with the formatting, but since this is a CI-only patch it doesn't really
    matter.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Gustavo Sousa <gustavo.sousa@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 024301d28b0b2cf492ffdb3ce688044cd9923f38 drm-intel
b9fc57bef4e0 drm/xe/pvc: fix CI GuC FW path
-:27: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#27: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:108:
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 20, 0))	\
 	           		             ^

-:27: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#27: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:108:
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 20, 0))	\
 	           		                ^

total: 0 errors, 0 warnings, 2 checks, 8 lines checked


