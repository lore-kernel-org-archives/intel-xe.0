Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1848FEB64DC
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jul 2023 09:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42EB10E1E7;
	Mon,  3 Jul 2023 09:15:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6BA2F10E1E8;
 Mon,  3 Jul 2023 09:15:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 68D78A00CC;
 Mon,  3 Jul 2023 09:15:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Mon, 03 Jul 2023 09:15:52 -0000
Message-ID: <168837575242.4274.8922403755643920548@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230703091933.3832500-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230703091933.3832500-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/xe=3A_make_kobject_type_struct?=
 =?utf-8?q?_as_constant?=
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

Series: series starting with [1/2] drm/xe: make kobject type struct as constant
URL   : https://patchwork.freedesktop.org/series/120132/
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
commit 1baaac2f94df50397700631e7813602d02dd1706
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Mon Jul 3 14:49:33 2023 +0530

    drm/xe: make GT sysfs init return void
    
    As we dont use return from xe_gt_sysfs_init, we
    should make it return void to make it proper return
    type.
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 53bd6056f6ec9a4f6c341d4f24122ede47a43de9 drm-intel
42acafd24 drm/xe: make kobject type struct as constant
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'ee6d3dd4ed48', maybe rebased or not pulled?
#6: 
Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
1baaac2f9 drm/xe: make GT sysfs init return void


