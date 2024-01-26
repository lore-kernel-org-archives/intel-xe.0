Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C495C47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 07:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBEB10F045;
	Fri, 26 Jan 2024 07:43:36 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF7B10F178;
 Fri, 26 Jan 2024 07:43:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/hwmon=3A_Refactor_?=
 =?utf-8?q?xe_hwmon?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Date: Fri, 26 Jan 2024 07:43:35 -0000
Message-ID: <170625501544.727999.8020873836303187137@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240126074819.3851075-1-karthik.poosa@intel.com>
In-Reply-To: <20240126074819.3851075-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Refactor xe hwmon
URL   : https://patchwork.freedesktop.org/series/129187/
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
commit 20d9878923627aa14c233b7fc4035fec0695980a
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Fri Jan 26 13:18:19 2024 +0530

    drm/xe/hwmon: Refactor xe hwmon
    
    Check latest platform first in xe_hwmon_get_reg.
    Move PVC registers to xe_mchbar_regs.h.
    
    Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
    Suggested-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch 246d92693aa04ab89430fc3b028ed9b0b7e8a0c8 drm-intel
20d987892 drm/xe/hwmon: Refactor xe hwmon
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'fb1b70607f73', maybe rebased or not pulled?
#9: 
Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")

total: 0 errors, 1 warnings, 0 checks, 64 lines checked


