Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D42C61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 17:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1BC10E2D6;
	Wed, 26 Aug 2026 17:18:21 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93BB10E2D6;
 Wed, 26 Aug 2026 17:18:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Prepare_for_WCL_GSC_FW_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Aug 2026 17:18:19 -0000
Message-ID: <178776469988.87286.3884843702377588471@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
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

Series: Prepare for WCL GSC FW (rev2)
URL   : https://patchwork.freedesktop.org/series/172761/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f2b09ec582fb0d2f7534d81d88dbf5f035bef831
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Aug 26 17:11:49 2026 +0000

    DO NOT MERGE: drm/xe/guc: add a mock newer GuC file for LNL
    
    This is for testing only, to have CI do a full run when FW fall-back
    happens.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 4a47d4b5bf957bd7e34d8d3ab7096c42161892c6 drm-intel
ef46d7612fad drm/xe: Define WCL as a PTL subplatform
11edd1178ba3 drm/xe/uc: Add FW file fallback support
-:76: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "uc_fw->path"
#76: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:306:
+	return uc_fw->path != NULL;

total: 0 errors, 0 warnings, 1 checks, 149 lines checked
aa852b17e05c drm/xe/uc: mark HuC and GSC as only available on the media GT
574ead1d80b1 drm/xe/uc: Support fetching different FW files per-subplatform
-:46: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#46: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:150:
+	fw_def(PANTHERLAKE,	SUBPLATFORM_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\

-:47: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#47: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:151:
+	fw_def(LUNARLAKE,	SUBPLATFORM_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\

total: 0 errors, 2 warnings, 0 checks, 63 lines checked
19b2bcab8c2d DO NOT MERGE: drm/xe/gsc: define GSC for WCL
-:18: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#18: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:150:
+	fw_def(PANTHERLAKE,	SUBPLATFORM_WILDCATLAKE,major_ver(xe,	gsc,	wcl,	105, 1, 0))	\

-:18: ERROR:SPACING: space required after that ',' (ctx:VxV)
#18: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:150:
+	fw_def(PANTHERLAKE,	SUBPLATFORM_WILDCATLAKE,major_ver(xe,	gsc,	wcl,	105, 1, 0))	\
 	                   	                       ^

total: 1 errors, 1 warnings, 0 checks, 7 lines checked
f2b09ec582fb DO NOT MERGE: drm/xe/guc: add a mock newer GuC file for LNL


