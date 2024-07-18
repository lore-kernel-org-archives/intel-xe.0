Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8413C3DA61
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 22:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7607110E253;
	Thu, 18 Jul 2024 22:37:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5816A10E253;
 Thu, 18 Jul 2024 22:37:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/huc=3A_Test_newer_?=
 =?utf-8?q?HuC_blobs_for_LNL_and_BMG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Jul 2024 22:37:46 -0000
Message-ID: <172134226635.287640.10620490850370157817@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240718205712.2862494-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240718205712.2862494-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/huc: Test newer HuC blobs for LNL and BMG
URL   : https://patchwork.freedesktop.org/series/136260/
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
commit adebc075cf48f4c0aad1d01f8db4542e16aab04f
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Thu Jul 18 13:57:12 2024 -0700

    drm/xe/huc: Test newer HuC blobs for LNL and BMG
    
    This patch is for testing only.
    
    These are the blobs that the media team wants in linux-firmware, so if
    the testing is successful we'll move them to the official branch and
    replace the CI patch in the xe-for-ci with a proper patch in
    drm-xe-next.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch fb36109fa177ba6292b97812b973482491cd1fda drm-intel
adebc075cf48 drm/xe/huc: Test newer HuC blobs for LNL and BMG
-:25: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#25: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:121:
+	fw_def(BATTLEMAGE,	no_ver(intel-ci/xe, huc_gsc, bmg))		\
 	                  	            ^

-:25: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#25: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:121:
+	fw_def(BATTLEMAGE,	no_ver(intel-ci/xe, huc_gsc, bmg))		\
 	                  	               ^

-:26: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#26: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:122:
+	fw_def(LUNARLAKE,	no_ver(intel-ci/xe, huc_gsc, lnl))		\
 	                 	            ^

-:26: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#26: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:122:
+	fw_def(LUNARLAKE,	no_ver(intel-ci/xe, huc_gsc, lnl))		\
 	                 	               ^

total: 0 errors, 0 warnings, 4 checks, 10 lines checked


