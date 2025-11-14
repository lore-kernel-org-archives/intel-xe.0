Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72338CEACD2
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3892010E26E;
	Fri, 14 Nov 2025 21:57:46 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DB010E26E;
 Fri, 14 Nov 2025 21:57:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_freq_kobjec?=
 =?utf-8?q?t_leak_on_sysfs=5Fcreate=5Ffiles_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Nov 2025 21:57:45 -0000
Message-ID: <176315746552.56641.316970416365462189@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251114205638.2184529-2-shuicheng.lin@intel.com>
In-Reply-To: <20251114205638.2184529-2-shuicheng.lin@intel.com>
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

Series: drm/xe: Fix freq kobject leak on sysfs_create_files failure
URL   : https://patchwork.freedesktop.org/series/157601/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 697762b48a9d2b6d4906ecc17ba0286f09e10762
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Fri Nov 14 20:56:39 2025 +0000

    drm/xe: Fix freq kobject leak on sysfs_create_files failure
    
    Ensure gt->freq is released when sysfs_create_files() fails
    in xe_gt_freq_init(). Without this, the kobject would leak.
    Add kobject_put() before returning the error.
    
    Fixes: fdc81c43f0c1 ("drm/xe: use devm_add_action_or_reset() helper")
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
    Reviewed-by: Alex Zuo <alex.zuo@intel.com>
    Fixes: fdc81c43f0c1 ("drm/xe: use devm_add_action_or_reset() helper")
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
    Reviewed-by: Xin Wang <x.wang@intel.com>
+ /mt/dim checkpatch 0602386d452aeaa5f0abadb7d2805ea45f97d9f6 drm-intel
697762b48a9d drm/xe: Fix freq kobject leak on sysfs_create_files failure
-:14: WARNING:BAD_SIGN_OFF: Duplicate signature
#14: 
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

total: 0 errors, 1 warnings, 0 checks, 11 lines checked


