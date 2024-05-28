Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F5FC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 22:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B20C10EA0F;
	Tue, 28 May 2024 22:02:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3B810EA0F;
 Tue, 28 May 2024 22:02:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Test_GSC_loading_with_Wa?=
 =?utf-8?q?=5F22019338487_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 May 2024 22:02:08 -0000
Message-ID: <171693372837.2217197.5490374495153990693@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240528215523.1202083-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240528215523.1202083-1-daniele.ceraolospurio@intel.com>
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

Series: Test GSC loading with Wa_22019338487 (rev2)
URL   : https://patchwork.freedesktop.org/series/134099/
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
commit f4cb7ac90150465f79c0dbf37665b82ed83b86bd
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue May 28 14:55:23 2024 -0700

    Reapply "drm/xe/gsc: define GSC FW for LNL"
    
    This reverts commit 684685f297175fb825771a33adfbb6a293d7b614.
+ /mt/dim checkpatch 2f9ce87f366102c67ef40c8223e02c33244a60c0 drm-intel
6a84679c7bbf drm/xe/lnl: Apply Wa_22019338487
34d3f9560217 Revert "drm/xe: make gt_remove use devm"
-:6: WARNING:TYPO_SPELLING: 'explictly' may be misspelled - perhaps 'explicitly'?
#6: 
The gt_remove function was explictly added as part of the remove flow
                           ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 97 lines checked
f4cb7ac90150 Reapply "drm/xe/gsc: define GSC FW for LNL"
-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:16: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#16: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:131:
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe, gsc, lnl, 1, 0, 0))	\
 	                 	               ^

-:16: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#16: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:131:
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe, gsc, lnl, 1, 0, 0))	\
 	                 	                  ^

-:19: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 2 checks, 7 lines checked


