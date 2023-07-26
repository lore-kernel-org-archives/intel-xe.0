Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBCCC001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 12:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E9110E475;
	Wed, 26 Jul 2023 12:51:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E781310E475;
 Wed, 26 Jul 2023 12:51:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E3F18AADD7;
 Wed, 26 Jul 2023 12:51:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kumar Vodapalli" <ravi.kumar.vodapalli@intel.com>
Date: Wed, 26 Jul 2023 12:51:33 -0000
Message-ID: <169037589393.23471.14508237016298887127@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230726124916.2291245-1-ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20230726124916.2291245-1-ravi.kumar.vodapalli@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/ppgtt=3A_Add_support_for_correct_PAT_encoding_in_PTE_and_P?=
 =?utf-8?q?DE?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/ppgtt: Add support for correct PAT encoding in PTE and PDE
URL   : https://patchwork.freedesktop.org/series/121354/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 54180e22fb94b501271e5cd25f01ac79c12160c6
Author: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Date:   Wed Jul 26 18:19:16 2023 +0530

    drm/xe/ppgtt: Add support for correct PAT encoding in PTE and PDE
    
    Different platforms has different PAT encoding in PTE and PDE format, add
    correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
    
    Bspec: 45101, 71582
    Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
+ /mt/dim checkpatch 3eb59fdaff17b28970c5be4fd00dba25b3ffb3f1 drm-intel
54180e22f drm/xe/ppgtt: Add support for correct PAT encoding in PTE and PDE
-:42: CHECK:LINE_SPACING: Please don't use multiple blank lines
#42: FILE: drivers/gpu/drm/xe/xe_pt.c:76:
 
+

-:86: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#86: FILE: drivers/gpu/drm/xe/xe_pt.c:186:
+{
+

-:103: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#103: FILE: drivers/gpu/drm/xe/xe_pt.c:203:
+{
+

-:136: ERROR:ELSE_AFTER_BRACE: else should follow close brace '}'
#136: FILE: drivers/gpu/drm/xe/xe_pt.c:236:
+	}
+	else if (GRAPHICS_VERx100(xe) >= 1260) {

-:150: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#150: FILE: drivers/gpu/drm/xe/xe_pt.c:250:
+	else
+	{

-:150: ERROR:ELSE_AFTER_BRACE: else should follow close brace '}'
#150: FILE: drivers/gpu/drm/xe/xe_pt.c:250:
+	}
+	else

total: 3 errors, 0 warnings, 3 checks, 175 lines checked


