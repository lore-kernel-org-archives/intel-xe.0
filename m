Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3FACD1292
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 19:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7440710FFBD;
	Tue,  2 Apr 2024 19:25:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95F910FFBD;
 Tue,  2 Apr 2024 19:25:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Update_xe?=
 =?utf-8?q?_hwmon_with_couple_of_fixes_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Apr 2024 19:25:28 -0000
Message-ID: <171208592875.1155664.8055438561821427510@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240402192724.673747-1-karthik.poosa@intel.com>
In-Reply-To: <20240402192724.673747-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Update xe hwmon with couple of fixes (rev4)
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
commit 0fd5c8267b628d0a2cccc9036d9a6b9e0503bc1e
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Wed Apr 3 00:57:24 2024 +0530

    drm/xe/hwmon: Update xe hwmon with couple of fixes
    
    Address potential overflows in result of multiplication of two lower
    precision (u32) operands before widening it to higher precision (u64).
    
    Initialize variables which were being used uninitialized.
    
    v2:
     - Rebase.
     - In xe_hwmon_process_reg, set argument 'value' to 0 on failure.
       With this change caller function need not initialize value to 0.
    
    v3:
     - Update commit msg as per review comments (Rodrigo, Lucas).
     - Update xe_hwmon_get_reg. Return bool from xe_hwmon_get_reg
       and output xe_reg. This is to have abstracted usage of xe_reg. (Lucas)
    
    v4:
     - Fix return of true for unsupported registers also in xe_hwmon_get_reg.
       Return false for those.
    
    Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
+ /mt/dim checkpatch 817f62236d84505e987511af22a06bb051755029 drm-intel
0fd5c8267b62 drm/xe/hwmon: Update xe hwmon with couple of fixes


