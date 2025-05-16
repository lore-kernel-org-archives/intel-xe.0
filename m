Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6DAC3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 10:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F5A10EA2C;
	Fri, 16 May 2025 10:13:20 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7E010EA2C;
 Fri, 16 May 2025 10:13:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display=3A_drop_du?=
 =?utf-8?q?plicate_display-=3Efb=5Ftracking=2Elock_init?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 May 2025 10:13:19 -0000
Message-ID: <174739039950.87068.15809216714471929598@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250516095514.398320-1-jani.nikula@intel.com>
In-Reply-To: <20250516095514.398320-1-jani.nikula@intel.com>
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

Series: drm/xe/display: drop duplicate display->fb_tracking.lock init
URL   : https://patchwork.freedesktop.org/series/149105/
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
commit 3e0bbe671bd36245a54c50d4d30934aca1c7b163
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri May 16 12:55:14 2025 +0300

    drm/xe/display: drop duplicate display->fb_tracking.lock init
    
    The spinlock is initialized in intel_display_driver_early_probe(). Drop
    the extra init.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 3e12fd2f2885242aa951ffc05c3c7bbb63e20d8e drm-intel
3e0bbe671bd3 drm/xe/display: drop duplicate display->fb_tracking.lock init


