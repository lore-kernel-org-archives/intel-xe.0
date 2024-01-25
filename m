Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65013C48260
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 12:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA5910E17B;
	Thu, 25 Jan 2024 12:07:59 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4E710EE76;
 Thu, 25 Jan 2024 12:07:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_xe_mocs_sus?=
 =?utf-8?q?pend_resume_kunit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janga Rahul Kumar" <janga.rahul.kumar@intel.com>
Date: Thu, 25 Jan 2024 12:07:57 -0000
Message-ID: <170618447725.709515.16884869463953146903@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240125111637.3476519-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20240125111637.3476519-1-janga.rahul.kumar@intel.com>
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

Series: drm/xe: Add xe mocs suspend resume kunit
URL   : https://patchwork.freedesktop.org/series/129161/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
b2ca823f819193c33ab811dfac08c614138d6d46
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8490d02050fb4e4287fb87163897e60019035677
Author: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Date:   Thu Jan 25 16:46:37 2024 +0530

    drm/xe: Add xe mocs suspend resume kunit
    
    This kunit verifies the mocs register content with
    the KMD programmed values before and after suspend resume.
    Add helper function to check mocs values and use it.
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
+ /mt/dim checkpatch cad255f28ccca6529104b9497a8d7302ae7eb88a drm-intel
8490d0205 drm/xe: Add xe mocs suspend resume kunit
-:25: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around mocs->table
#25: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:109:
+		read_mocs_table(gt, &(mocs->table));

-:27: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around mocs->table
#27: FILE: drivers/gpu/drm/xe/tests/xe_mocs.c:111:
+		read_l3cc_table(gt, &(mocs->table));

total: 0 errors, 0 warnings, 2 checks, 92 lines checked


