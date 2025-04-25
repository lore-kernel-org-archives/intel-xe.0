Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEDEC369D3
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 17:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D1210E036;
	Fri, 25 Apr 2025 17:50:00 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659FC10E036;
 Fri, 25 Apr 2025 17:49:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Add_suppo?=
 =?utf-8?q?rt_to_manage_power_limits_using_mailbox_commands_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Apr 2025 17:49:59 -0000
Message-ID: <174560339942.11960.1900507222292919455@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250425174410.3705932-1-karthik.poosa@intel.com>
In-Reply-To: <20250425174410.3705932-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Add support to manage power limits using mailbox commands (rev2)
URL   : https://patchwork.freedesktop.org/series/148148/
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
commit 5ca59e2c1d7e2588377c9c68197ab037520a86de
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Fri Apr 25 23:14:10 2025 +0530

    drm/xe/hwmon: Add support to manage power limits using mailbox commands
    
    Add support to manage power limits using pcode mailbox commands.
    Move power_crit to card channel ie. power1_crit as it a platform attribute.
    Add PL2 support for platforms with these mailbox support.
    
    v2:
     - Fix power_max_interval store for mailbox path, rmw before write
       was missing.
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch 6e67a7af43567bb9f23fe156fde7efa3d214fd20 drm-intel
5ca59e2c1d7e drm/xe/hwmon: Add support to manage power limits using mailbox commands


