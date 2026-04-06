Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA4EFB5166
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 21:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A057E10E0D0;
	Mon,  6 Apr 2026 21:24:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9673510E0D0;
 Mon,  6 Apr 2026 21:24:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Recommend_G?=
 =?utf-8?q?uC_v70=2E60=2E0_for_LNL=2C_BMG=2C_PTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Apr 2026 21:24:09 -0000
Message-ID: <177551064960.435220.17490293956470093382@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260406211759.817577-9-julia.filipchuk@intel.com>
In-Reply-To: <20260406211759.817577-9-julia.filipchuk@intel.com>
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

Series: drm/xe/guc: Recommend GuC v70.60.0 for LNL, BMG, PTL (rev2)
URL   : https://patchwork.freedesktop.org/series/164323/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f1807860e951831e20e50294c4cdecb62d7eb348
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Mon Apr 6 14:17:31 2026 -0700

    Reapply "drm/xe/nvlp: Define GuC firmware for NVL-P"
    
    This reverts commit ce673fc8386895a32d4f9584d1a38252ea7d1aef.
    
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 7b7217a9e27a82ef10be22ab3a55ad5bbc849688 drm-intel
285e5ad4d074 Revert "drm/xe/nvlp: Define GuC firmware for NVL-P"
b7a112e5403f Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
a64f8fb0894a Revert "drm/xe/nvls: Define GuC firmware for NVL-S"
47fbd9288ba9 drm/xe/guc: Recommend GuC v70.60.0 for BMG, LNL, PTL
68c501e50769 Reapply "drm/xe/nvls: Define GuC firmware for NVL-S"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '24f261475da5fb747640e9cc801b336f5e623611', maybe rebased or not pulled?
#6: 
This reverts commit 24f261475da5fb747640e9cc801b336f5e623611.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
12306aa3f11e Reapply "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '865c5dca8ec799e62aafeb3be27d87a37f8cf06e', maybe rebased or not pulled?
#7: 
This reverts commit 865c5dca8ec799e62aafeb3be27d87a37f8cf06e.

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
f1807860e951 Reapply "drm/xe/nvlp: Define GuC firmware for NVL-P"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'ce673fc8386895a32d4f9584d1a38252ea7d1aef', maybe rebased or not pulled?
#6: 
This reverts commit ce673fc8386895a32d4f9584d1a38252ea7d1aef.

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


