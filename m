Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE307CD1288
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 20:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331B91134B0;
	Thu,  4 Apr 2024 20:05:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E41E1134B1;
 Thu,  4 Apr 2024 20:05:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe/guc=3A_Prefer_GT_oriented_logs_in_GuC_CTB_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Apr 2024 20:05:56 -0000
Message-ID: <171226115625.1211620.9567608889407994500@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240404193647.759-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240404193647.759-1-michal.wajdeczko@intel.com>
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

Series: series starting with [1/3] drm/xe/guc: Prefer GT oriented logs in GuC CTB code
URL   : https://patchwork.freedesktop.org/series/132049/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b4538216706d6d85dbcda6c848d0a908408d6f27
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Apr 4 21:36:47 2024 +0200

    drm/xe/guc: Don't overuse ct_to_xe()
    
    Pointer to xe_device might be already available or could be added.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 7392b2b6f33eb4d279abf14e33e73f491f7f9191 drm-intel
052cc8fe77ed drm/xe/guc: Prefer GT oriented logs in GuC CTB code
36fc699c239a drm/xe/guc: Prefer GT oriented asserts in CTB code
b4538216706d drm/xe/guc: Don't overuse ct_to_xe()
-:21: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!xe_pm_read_callback_task"
#21: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1214:
+	if (!ongoing && xe_pm_read_callback_task(xe) == NULL)

-:40: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!xe_pm_read_callback_task"
#40: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1286:
+	if (!ongoing && xe_pm_read_callback_task(xe) == NULL)

total: 0 errors, 0 warnings, 2 checks, 35 lines checked


