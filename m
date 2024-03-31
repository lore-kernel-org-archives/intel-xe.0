Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F77CD1284
	for <intel-xe@archiver.kernel.org>; Sun, 31 Mar 2024 14:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C4A10E4D0;
	Sun, 31 Mar 2024 14:49:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335D010EA52;
 Sun, 31 Mar 2024 14:49:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Update_xe?=
 =?utf-8?q?_hwmon_with_couple_of_fixes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 31 Mar 2024 14:49:23 -0000
Message-ID: <171189656321.1097566.9519602218537543990@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240331145340.4065125-1-karthik.poosa@intel.com>
In-Reply-To: <20240331145340.4065125-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Update xe hwmon with couple of fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/131765/
State : success

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
commit 26abc4b63aad11c11ea199989e868ee49979d976
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Sun Mar 31 20:23:40 2024 +0530

    drm/xe/hwmon: Update xe hwmon with couple of fixes
    
    Fix potential overflows with upcasting.
    Initialize variables which were being used uninitialized.
    
    v2:
     - Rebase.
     - In xe_hwmon_process_reg, set argument 'value' to 0 on failure.
       With this change caller function need not initialize value to 0.
    
    Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
+ /mt/dim checkpatch b334e21cd00347d48ee5e8e8ab0a69c91f97b036 drm-intel
26abc4b63aad drm/xe/hwmon: Update xe hwmon with couple of fixes


