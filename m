Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F0FC3600C
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 01:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B6110E090;
	Fri,  4 Apr 2025 01:34:43 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4653E10E090;
 Fri,  4 Apr 2025 01:34:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_w/a_16026508708?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.c.harrison@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Apr 2025 01:34:43 -0000
Message-ID: <174373048328.37103.6111114031382529680@e6b6f09ec485>
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

Series: Enable w/a 16026508708
URL   : https://patchwork.freedesktop.org/series/147235/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4e4981b2a1555829d71fda345164a93c3431a4e4
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
+ /mt/dim checkpatch bc18da45d48d337b92a7ff9546ba61da32b3b586 drm-intel
39d5d64472ed drm/xe/guc: Enable w/a 16026508708
85fd62b457fa Revert "drm/xe/ptl: Define HuC FW version for PTL"
-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:19: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 7 lines checked
038fe5058d3c Revert "drm/xe/ptl: Add GuC firmware definition"
-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:19: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 7 lines checked
d427fed36a1e Revert "drm/xe/pvc: Add GuC firmware definition"
-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:19: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 7 lines checked
57a62ae47fc1 drm/xe/guc: Bump the recommended GuC version to 70.44.1
0b13369eb5ab drm/xe/pvc: Add GuC firmware definition
9d19aaf65a0b drm/xe/ptl: Add GuC firmware definition
-:16: WARNING:BAD_SIGN_OFF: Duplicate signature
#16: 
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
4e4981b2a155 drm/xe/ptl: Define HuC FW version for PTL


