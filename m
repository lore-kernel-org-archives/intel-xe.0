Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930E7EA3F16
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 07:34:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0DA10E4DE;
	Tue, 10 Feb 2026 07:34:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA70D10E385;
 Tue, 10 Feb 2026 07:34:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Decouple_devcoredump_from?=
 =?utf-8?q?_accessing_core_driver_structures?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Feb 2026 07:34:35 -0000
Message-ID: <177070887594.240455.9421740695169207733@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260210072942.1864182-1-shekhar.chauhan@intel.com>
In-Reply-To: <20260210072942.1864182-1-shekhar.chauhan@intel.com>
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

Series: Decouple devcoredump from accessing core driver structures
URL   : https://patchwork.freedesktop.org/series/161407/
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
commit ed9500e0ed7811d495d51f60c6906e23fb73db34
Author: Shekhar Chauhan <shekhar.chauhan@intel.com>
Date:   Tue Feb 10 12:59:42 2026 +0530

    Decouple devcoredump from accessing core driver structures
    
    During devcoredump, print should not access any live gt pointers.
    Decouple the snapshot_print from accessing gt pointer by storing the
    captured data in a separate list and then print data from that list.
    
    Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
+ /mt/dim checkpatch b20f8b5666871e489718c540f9604999e43338ac drm-intel
ed9500e0ed78 Decouple devcoredump from accessing core driver structures
-:55: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#55: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:1840:
 	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
+

-:66: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#66: FILE: drivers/gpu/drm/xe/xe_guc_capture.c:1847:
+	if (snapshot->render_compute_list) {
+

-:97: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#97: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:953:
+		snapshot->list[type] = xe_guc_capture_get_reg_desc_list(hwe->gt,
+				GUC_CAPTURE_LIST_INDEX_PF, type, capture_class, false);

-:103: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#103: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:959:
+		snapshot->render_compute_list = xe_guc_capture_get_reg_desc_list(hwe->gt,
+				GUC_CAPTURE_LIST_INDEX_PF, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,

-:107: CHECK:LINE_SPACING: Please don't use multiple blank lines
#107: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:963:
+
+

total: 0 errors, 0 warnings, 5 checks, 104 lines checked


