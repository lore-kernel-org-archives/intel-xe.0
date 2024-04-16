Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210FFC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 22:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D002D10E424;
	Tue, 16 Apr 2024 22:27:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DDA10ED84;
 Tue, 16 Apr 2024 22:27:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LNL_GSC_FW_support_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 22:27:47 -0000
Message-ID: <171330646786.1454245.13626019274386190653@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240416222159.1332619-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240416222159.1332619-1-daniele.ceraolospurio@intel.com>
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

Series: LNL GSC FW support (rev2)
URL   : https://patchwork.freedesktop.org/series/132475/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fae1e565f2e5fbb878df0dbfb24f3f7fc481a38f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4c276e8ebf71e8ea4ee56595e384f0df283ddfc6
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Apr 16 15:21:59 2024 -0700

    drm/xe/gsc: define GSC FW for LNL
    
    Interface and compatibility versions are the same as MTL.
    
    Note that the FW is still in development and the current release is
    for CI only. Theefore, we'll need to keep this patch in the xe-for-ci
    branch until we get the finalized FW release.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 6eb009a883a7ae925b3b0f0363b64a026bb4333a drm-intel
9a4484050515 drm/xe/gsc: define GSCCS for LNL
863578f8a287 drm/xe/gsc: Skip GSC proxy init
4c276e8ebf71 drm/xe/gsc: define GSC FW for LNL
-:22: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#22: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:129:
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe, gsc, lnl, 1, 0, 0))	\
 	                 	               ^

-:22: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#22: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:129:
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe, gsc, lnl, 1, 0, 0))	\
 	                 	                  ^

total: 0 errors, 0 warnings, 2 checks, 7 lines checked


