Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE09C4345F
	for <intel-xe@archiver.kernel.org>; Wed,  1 May 2024 23:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6E510F3E9;
	Wed,  1 May 2024 23:35:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E027210F3E9;
 Wed,  1 May 2024 23:35:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LNL_GSC_FW_support_=28rev?=
 =?utf-8?q?3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 May 2024 23:35:22 -0000
Message-ID: <171460652291.1841037.7351468037797355824@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240501231829.2122219-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240501231829.2122219-1-daniele.ceraolospurio@intel.com>
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

Series: LNL GSC FW support (rev3)
URL   : https://patchwork.freedesktop.org/series/132475/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c89e4dbaad76e09e02ca9406f20fae05fbb3481f
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed May 1 16:18:29 2024 -0700

    drm/xe/gsc: define GSC FW for LNL
    
    Interface and compatibility versions are the same as MTL.
    
    Note that the FW is still in development and the current release is
    for CI only. Theefore, we'll need to keep this patch in the xe-for-ci
    branch until we get the finalized FW release.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1759
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 0c418be899e4476fb09eec9f6693432bcc0c45d1 drm-intel
70fafe8ae479 mei: me: add lunar lake point M DID
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
[1] https://lore.kernel.org/all/20240421135631.223362-1-tomas.winkler@intel.com/T/

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
c89e4dbaad76 drm/xe/gsc: define GSC FW for LNL
-:23: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#23: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:130:
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe, gsc, lnl, 1, 0, 0))	\
 	                 	               ^

-:23: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#23: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:130:
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe, gsc, lnl, 1, 0, 0))	\
 	                 	                  ^

total: 0 errors, 0 warnings, 2 checks, 7 lines checked


