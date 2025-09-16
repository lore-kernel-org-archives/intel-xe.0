Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E757CAC599
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 14:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDC810E0F7;
	Tue, 16 Sep 2025 14:14:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF7110E377;
 Tue, 16 Sep 2025 14:14:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=5Fpc=3A_Add_ig?=
 =?utf-8?q?nore_efficient_frequency_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Sep 2025 14:14:07 -0000
Message-ID: <175803204745.338390.8349814755455663169@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250916140543.3055778-2-sk.anirban@intel.com>
In-Reply-To: <20250916140543.3055778-2-sk.anirban@intel.com>
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

Series: drm/xe/guc_pc: Add ignore efficient frequency support (rev2)
URL   : https://patchwork.freedesktop.org/series/154566/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dc7d6359fccb880f08157c45c75b02b839bcf3af
Author: Sk Anirban <sk.anirban@intel.com>
Date:   Tue Sep 16 19:35:44 2025 +0530

    drm/xe/guc_pc: Add ignore efficient frequency support
    
    When setting the minimum frequency, GuC automatically adjusts it to
    efficient levels, potentially overriding user requests.
    This patch adds the slpc_ignore_eff_freq sysfs interface to disable
    this behavior, allowing users to enforce their exact minimum frequency
    settings.
    
    Signed-off-by: Sk Anirban <sk.anirban@intel.com>
+ /mt/dim checkpatch f1f30aaf088e869cc54a081cd875fa8446b886e5 drm-intel
dc7d6359fccb drm/xe/guc_pc: Add ignore efficient frequency support
-:55: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#55: FILE: drivers/gpu/drm/xe/xe_gt_freq.c:263:
+}
+static struct kobj_attribute attr_slpc_ignore_eff_freq = __ATTR_RW(slpc_ignore_eff_freq);

total: 0 errors, 0 warnings, 1 checks, 136 lines checked


