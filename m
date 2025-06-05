Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74400C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 05:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2658C10E7B2;
	Thu,  5 Jun 2025 05:21:55 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E30610E25F;
 Thu,  5 Jun 2025 05:21:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Fix_xe=5F?=
 =?utf-8?q?hwmon=5Fpower=5Fmax=5Fwrite_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 05:21:54 -0000
Message-ID: <174910091418.50766.3748229050674364352@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250604020520.2627638-1-karthik.poosa@intel.com>
In-Reply-To: <20250604020520.2627638-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Fix xe_hwmon_power_max_write (rev2)
URL   : https://patchwork.freedesktop.org/series/149816/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 035ccfa6864492429c8ff6b79cfe2f955114f62e
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Wed Jun 4 07:35:20 2025 +0530

    drm/xe/hwmon: Fix xe_hwmon_power_max_write
    
    Avoid power limit time interval overwrite in xe_hwmon_power_max_write.
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
+ /mt/dim checkpatch d527f1a12f1a9cb4fbc43288c4e41a6f3c7c08cd drm-intel
035ccfa68644 drm/xe/hwmon: Fix xe_hwmon_power_max_write


