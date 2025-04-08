Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF6AC36010
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 19:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504E110E724;
	Tue,  8 Apr 2025 19:35:25 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD87F10E724;
 Tue,  8 Apr 2025 19:35:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_w/a_16026508708_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.c.harrison@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Apr 2025 19:35:24 -0000
Message-ID: <174414092483.49424.3811863499169975264@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
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

Series: Enable w/a 16026508708 (rev2)
URL   : https://patchwork.freedesktop.org/series/147235/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 929d73d3dee5564113cda8e1915f4135cfd55925
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Thu Apr 3 11:56:18 2025 -0700

    drm/xe/ptl: Define HuC FW version for PTL
    
    First HuC release for PTL. Note that the HuC team now only releases
    GSC-enabled blobs, so we don't need the "_gsc" postfix to identify
    the variant anymore. The driver can identify the type of binary at
    runtime no matter the name.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
    Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20241011163612.6558-1-matthew.s.atwood@intel.com
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 1951437999630d299a063863fb92d235dd8dc3d1 drm-intel
db6e86306182 drm/xe/guc: Enable w/a 16026508708
643910b32f9d Revert "drm/xe/ptl: Define HuC FW version for PTL"
-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:19: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 7 lines checked
4c8a87ac3203 Revert "drm/xe/ptl: Add GuC firmware definition"
-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:19: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 7 lines checked
cd1e46c7bf8d Revert "drm/xe/pvc: Add GuC firmware definition"
-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:19: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 7 lines checked
6b950c401e78 drm/xe/guc: Bump the recommended GuC version to 70.44.1
24da3de0bfd6 drm/xe/pvc: Add GuC firmware definition
9db1a090d598 drm/xe/ptl: Add GuC firmware definition
-:16: WARNING:BAD_SIGN_OFF: Duplicate signature
#16: 
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
929d73d3dee5 drm/xe/ptl: Define HuC FW version for PTL


