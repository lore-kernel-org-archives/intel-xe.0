Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903ADEB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 13:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B58010E689;
	Fri, 21 Jul 2023 13:34:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC87310E689;
 Fri, 21 Jul 2023 13:34:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AB1C0AADD5;
 Fri, 21 Jul 2023 13:34:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 21 Jul 2023 13:34:16 -0000
Message-ID: <168994645669.22547.3631549235767331947@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230721132030.7-1-francois.dugast@intel.com>
In-Reply-To: <20230721132030.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Re?=
 =?utf-8?q?move_uses_of_BUG=5FON?=
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

Series: Remove uses of BUG_ON
URL   : https://patchwork.freedesktop.org/series/121125/
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
commit 7cbc7520db27f221b72e59ea782b27215447b270
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Fri Jul 21 13:20:30 2023 +0000

    drm/xe: Remove uses of BUG_ON
    
    BUG_ON is for when the code should stop and not execute further because
    something went terribly wrong. This is not the case in many existing
    uses, where recovery should be intended and BUG_ON is now replaced
    with drm_err().
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 786d2a4f30e168368b4d19d3e1d2f57d18ebecf8 drm-intel
7cbc7520d drm/xe: Remove uses of BUG_ON
-:568: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 8)
#568: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:401:
+	if (!xe_engine_is_parallel(e)) {
+	drm_err(&gt_to_xe(e->gt)->drm, "!xe_engine_is_parallel(e)");

-:651: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#651: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:681:
+	if ((engine_destroyed(e) || engine_pending_disable(e)) && !engine_banned(e) && !engine_suspended(e)) {

total: 0 errors, 2 warnings, 0 checks, 1166 lines checked


